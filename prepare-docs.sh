#!/usr/bin/env bash

set -euo pipefail

# -----------------------------------------------------------------------------
# DeployHub branded docs preparation
# -----------------------------------------------------------------------------
# Mirrors the DeployHub Hugo/Docsy docs site into this repository, then applies
# DeployHub branding. This is intentionally a site-level mirror, not a
# content-only sync, because DeployHub-Docs is being refreshed from the current
# ortelius-docs Hugo site.
#
# Protected in this repo:
#   - .git/
#   - prepare-docs.sh
#   - .github/workflows/prepare-docs.yml
#   - .github/workflows/prepare-docs.yaml
# -----------------------------------------------------------------------------

SOURCE_REPO="${SOURCE_REPO:-https://github.com/DeployHubProject/DeployHub-Docs.git}"
SOURCE_REF="${SOURCE_REF:-main}"

SOURCE_NAME="${SOURCE_NAME:-DeployHub}"
BRAND_NAME="${BRAND_NAME:-DeployHub}"
BRAND_NAME_UPPER="${BRAND_NAME_UPPER:-DEPLOYHUB}"

SOURCE_DOCS_URL="${SOURCE_DOCS_URL:-https://docs.deployhub.com}"
BRAND_DOCS_URL="${BRAND_DOCS_URL:-https://docs.deployhub.com}"

SOURCE_SITE_URL="${SOURCE_SITE_URL:-https://www.deployhub.com}"
BRAND_SITE_URL="${BRAND_SITE_URL:-https://www.deployhub.com}"

SOURCE_DOCS_REPO_SLUG="${SOURCE_DOCS_REPO_SLUG:-DeployHubProject/DeployHub-Docs}"
BRAND_DOCS_REPO_SLUG="${BRAND_DOCS_REPO_SLUG:-DeployHubProject/DeployHub-Docs}"

# By default, this script brands prose, titles, config, docs domains, and docs
# repo references, but it does not blindly rewrite lowercase technical tokens
# such as Kubernetes namespaces, image paths, helm release names, or GitHub orgs
# that may still be DeployHub upstream identifiers.
# Set REWRITE_LOWERCASE_TECHNICAL=true only when you are ready to rewrite those.
REWRITE_LOWERCASE_TECHNICAL="${REWRITE_LOWERCASE_TECHNICAL:-false}"

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
WORK_DIR="$(mktemp -d)"
SOURCE_DIR="$WORK_DIR/source"

cleanup() {
  rm -rf "$WORK_DIR"
}
trap cleanup EXIT

echo "👉 Cloning $SOURCE_REPO@$SOURCE_REF..."
git clone --depth 1 --branch "$SOURCE_REF" "$SOURCE_REPO" "$SOURCE_DIR"
SOURCE_SHA="$(git -C "$SOURCE_DIR" rev-parse HEAD)"
SHORT_SHA="$(git -C "$SOURCE_DIR" rev-parse --short HEAD)"

echo "👉 Mirroring DeployHub Hugo site into DeployHub-Docs..."
rsync -a --delete \
  --exclude '.git/' \
  --exclude 'prepare-docs.sh' \
  --exclude '.github/workflows/prepare-docs.yml' \
  --exclude '.github/workflows/prepare-docs.yaml' \
  "$SOURCE_DIR/" "$ROOT_DIR/"

echo "👉 Applying DeployHub branding..."
export SOURCE_NAME BRAND_NAME BRAND_NAME_UPPER
export SOURCE_DOCS_URL BRAND_DOCS_URL SOURCE_SITE_URL BRAND_SITE_URL
export SOURCE_DOCS_REPO_SLUG BRAND_DOCS_REPO_SLUG REWRITE_LOWERCASE_TECHNICAL

python3 <<'PY'
from pathlib import Path
from urllib.parse import urlparse
import os
import re

root = Path.cwd()
source_name = os.environ["SOURCE_NAME"]
brand_name = os.environ["BRAND_NAME"]
brand_name_upper = os.environ["BRAND_NAME_UPPER"]

source_docs_url = os.environ["SOURCE_DOCS_URL"].rstrip("/")
brand_docs_url = os.environ["BRAND_DOCS_URL"].rstrip("/")
source_site_url = os.environ["SOURCE_SITE_URL"].rstrip("/")
brand_site_url = os.environ["BRAND_SITE_URL"].rstrip("/")

source_docs_host = urlparse(source_docs_url).netloc
brand_docs_host = urlparse(brand_docs_url).netloc
source_site_host = urlparse(source_site_url).netloc
brand_site_host = urlparse(brand_site_url).netloc

source_docs_repo_slug = os.environ["SOURCE_DOCS_REPO_SLUG"]
brand_docs_repo_slug = os.environ["BRAND_DOCS_REPO_SLUG"]
rewrite_lowercase_technical = os.environ.get("REWRITE_LOWERCASE_TECHNICAL", "false").lower() == "true"

# Exact replacements first. These are safe for config, markdown, HTML, YAML, JSON, etc.
replacements = [
    (source_docs_url, brand_docs_url),
    (source_docs_url.replace("https://", "http://"), brand_docs_url),
    (source_docs_host, brand_docs_host),
    (source_site_url, brand_site_url),
    (source_site_url.replace("https://", "http://"), brand_site_url),
    (f"https://www.{source_site_host}", brand_site_url),
    (f"http://www.{source_site_host}", brand_site_url),
    (f"www.{source_site_host}", brand_site_host),
    (source_site_host, brand_site_host),
    (f"github.com/{source_docs_repo_slug}", f"github.com/{brand_docs_repo_slug}"),
    (source_docs_repo_slug, brand_docs_repo_slug),
    (source_docs_repo_slug.replace("/", "-"), brand_docs_repo_slug.split("/")[-1].lower()),
    (f"{source_name} documentation", f"{brand_name} documentation"),
    (f"{source_name} Documentation", f"{brand_name} Documentation"),
    (f"Documentation for {source_name} Open Source Project", f"Documentation for {brand_name}"),
    (source_name.upper(), brand_name_upper),
    (source_name, brand_name),
]

skip_dirs = {
    ".git",
    "node_modules",
    "public",
    ".hugo_build.lock",
}

# Process any UTF-8 text file. Binary and non-UTF-8 files are skipped.
def is_skipped(path: Path) -> bool:
    return any(part in skip_dirs for part in path.parts)

for path in sorted(root.rglob("*")):
    if not path.is_file() or is_skipped(path.relative_to(root)):
        continue

    try:
        data = path.read_bytes()
        text = data.decode("utf-8")
    except UnicodeDecodeError:
        continue

    original = text
    for old, new in replacements:
        text = text.replace(old, new)

    if rewrite_lowercase_technical:
        # This intentionally rewrites standalone lowercase product tokens only.
        # It avoids replacing substrings inside longer identifiers.
        text = re.sub(r"\bortelius\b", "deployhub", text)

    # Make the root README clearly branded after the mirror.
    if path.name == "README.md" and path.parent == root:
        text = re.sub(r"^#\s+.*$", f"# {brand_name} documentation", text, count=1, flags=re.MULTILINE)

    # Force the Hugo site title/baseURL even if upstream config changes format.
    if path.name == "config.toml" and path.parent == root:
        text = re.sub(r'^baseURL\s*=\s*"[^"]*"', f'baseURL = "{brand_docs_url}/"', text, flags=re.MULTILINE)
        text = re.sub(r'^title\s*=\s*"[^"]*"', f'title = "{brand_name} Documentation"', text, flags=re.MULTILINE)

    if text != original:
        path.write_text(text, encoding="utf-8")
PY

echo "👉 Recording upstream source revision..."
cat > "$ROOT_DIR/UPSTREAM-DEPLOYHUB-DOCS.md" <<EOF2
# Upstream docs source

This repository is generated as a DeployHub-branded mirror of DeployHub docs.

- Source repository: $SOURCE_REPO
- Source ref: $SOURCE_REF
- Source commit: $SOURCE_SHA
- Generated by: prepare-docs.sh

Do not manually edit mirrored/generated documentation files unless the change is
intended to override upstream. Prefer fixing upstream docs or updating the
branding script.
EOF2

# Avoid committing local Hugo build output if someone ran the script after a build.
rm -rf "$ROOT_DIR/public"

echo "✅ DeployHub branded docs prepared from DeployHub docs commit $SHORT_SHA"
