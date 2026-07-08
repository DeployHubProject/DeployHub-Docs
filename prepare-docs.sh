#!/usr/bin/env bash

set -euo pipefail

# -----------------------------------------------------------------------------
# DeployHub branded docs preparation
# -----------------------------------------------------------------------------
# Safely replaces this Hugo docs site with a DeployHub-branded copy of the
# upstream Ortelius docs SOURCE tree.
#
# Safety guarantees:
#   - Never rsyncs over the repository root.
#   - Never deletes or modifies .git/.
#   - Never deletes or modifies .github/.
#   - Never commits Hugo build output such as public/.
#   - Replaces only known Hugo source directories and source/config files.
#   - Mirrors the ortelius-docs content tree as-is (it is the single source of
#     truth and is already structured and complete for DeployHub's docs site).
# -----------------------------------------------------------------------------

SOURCE_REPO="${SOURCE_REPO:-https://github.com/ortelius/ortelius-docs.git}"
SOURCE_REF="${SOURCE_REF:-main}"

SOURCE_NAME="${SOURCE_NAME:-Ortelius}"
BRAND_NAME="${BRAND_NAME:-DeployHub}"
BRAND_NAME_UPPER="${BRAND_NAME_UPPER:-DEPLOYHUB}"

SOURCE_DOCS_URL="${SOURCE_DOCS_URL:-https://docs.ortelius.io}"
BRAND_DOCS_URL="${BRAND_DOCS_URL:-https://docs.deployhub.com}"

SOURCE_SITE_URL="${SOURCE_SITE_URL:-https://ortelius.io}"
BRAND_SITE_URL="${BRAND_SITE_URL:-https://www.deployhub.com}"

# DeployHub logo source. Defaults to the DeployHub website logo CDN URL.
# Override BRAND_LOGO_URL if the website logo changes.
BRAND_LOGO_PAGE_URL="${BRAND_LOGO_PAGE_URL:-https://www.deployhub.com/}"
BRAND_LOGO_URL="${BRAND_LOGO_URL:-https://spcdn.shortpixel.ai/spio/ret_img,q_cdnize,to_webp,s_webp/www.deployhub.com/wp-content/uploads/2024/09/DeployHub-website-loog.png}"

SOURCE_DOCS_REPO_SLUG="${SOURCE_DOCS_REPO_SLUG:-ortelius/ortelius-docs}"
BRAND_DOCS_REPO_SLUG="${BRAND_DOCS_REPO_SLUG:-DeployHubProject/DeployHub-Docs}"

# By default, brand prose, titles, config, docs domains, and docs repo references,
# but do not blindly rewrite lowercase technical identifiers such as Kubernetes
# namespaces, image paths, helm release names, or GitHub org/package names.
REWRITE_LOWERCASE_TECHNICAL="${REWRITE_LOWERCASE_TECHNICAL:-false}"

# Resolve the repository root without ever deleting relative to an unknown path.
ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$ROOT_DIR" ]]; then
  echo "❌ This script must be run inside a Git working tree. Refusing to continue."
  echo "   This protects repository metadata such as .git/."
  exit 1
fi

if [[ ! -d "$ROOT_DIR/.git" ]]; then
  echo "❌ $ROOT_DIR/.git is missing. Refusing to continue."
  echo "   Re-clone DeployHub-Docs before running this script."
  exit 1
fi

WORK_DIR="$(mktemp -d)"
SOURCE_DIR="$WORK_DIR/source"

cleanup() {
  rm -rf "$WORK_DIR"
}
trap cleanup EXIT

cd "$ROOT_DIR"

before_git_inode="$(stat -c '%d:%i' "$ROOT_DIR/.git" 2>/dev/null || true)"

# Only generated output is removed from the repo root.
echo "👉 Removing stale Hugo build output..."
rm -rf "$ROOT_DIR/public" "$ROOT_DIR/.hugo_build.lock"

echo "👉 Cloning $SOURCE_REPO@$SOURCE_REF..."
git clone --depth 1 --branch "$SOURCE_REF" "$SOURCE_REPO" "$SOURCE_DIR"
SOURCE_SHA="$(git -C "$SOURCE_DIR" rev-parse HEAD)"
SHORT_SHA="$(git -C "$SOURCE_DIR" rev-parse --short HEAD)"

# Verify we are mirroring source content, not generated HTML output.
if [[ ! -d "$SOURCE_DIR/content" ]]; then
  echo "❌ Upstream docs repo does not contain a content/ directory. Refusing to continue."
  exit 1
fi

SOURCE_MD_COUNT="$(find "$SOURCE_DIR/content" -type f -name '*.md' | wc -l | tr -d ' ')"
if [[ "$SOURCE_MD_COUNT" -eq 0 ]]; then
  echo "❌ Upstream content/ has no Markdown files. Refusing to mirror likely build output."
  exit 1
fi

# Never mirror the root with --delete. Delete and replace only source-controlled
# Hugo site paths that are intended to match upstream.
SYNC_DIRS=(
  archetypes
  assets
  content
  data
  i18n
  layouts
  resources
  static
  themes
)

SYNC_FILES=(
  config.toml
  hugo.toml
  hugo.yaml
  hugo.yml
  go.mod
  go.sum
  package.json
  package-lock.json
  yarn.lock
  pnpm-lock.yaml
  netlify.toml
  postcss.config.js
  babel.config.js
  README.md
  LICENSE
  .gitignore
  .npmrc
  .nvmrc
)

echo "👉 Removing existing content/ so files deleted upstream aren't left behind..."
rm -rf "$ROOT_DIR/content"

echo "👉 Replacing Hugo source directories only..."
for dir in "${SYNC_DIRS[@]}"; do
  # Guard against accidental unsafe values.
  case "$dir" in
    .|..|.git|.github|public|/*|*/*)
      echo "❌ Unsafe sync directory: $dir"
      exit 1
      ;;
  esac

  rm -rf "$ROOT_DIR/$dir"
  if [[ -d "$SOURCE_DIR/$dir" ]]; then
    mkdir -p "$ROOT_DIR/$dir"
    rsync -a \
      --exclude 'public/' \
      --exclude '.hugo_build.lock' \
      --exclude 'node_modules/' \
      --exclude '.DS_Store' \
      "$SOURCE_DIR/$dir/" "$ROOT_DIR/$dir/"
  fi
done

echo "👉 Replacing Hugo source/config files only..."
for file in "${SYNC_FILES[@]}"; do
  case "$file" in
    .git|.github|prepare-docs.sh|public|/*|*/*)
      echo "❌ Unsafe sync file: $file"
      exit 1
      ;;
  esac

  rm -f "$ROOT_DIR/$file"
  if [[ -f "$SOURCE_DIR/$file" ]]; then
    cp "$SOURCE_DIR/$file" "$ROOT_DIR/$file"
  fi
done

# Re-assert: no generated output should be left from upstream or local builds.
rm -rf "$ROOT_DIR/public" "$ROOT_DIR/.hugo_build.lock"

# Make sure public/ stays out even if someone builds locally. If upstream's
# .gitignore was copied, append DeployHub-specific generated-output ignores.
touch "$ROOT_DIR/.gitignore"
if ! grep -qxF 'public/' "$ROOT_DIR/.gitignore"; then
  printf '\n# Hugo build output\npublic/\n' >> "$ROOT_DIR/.gitignore"
fi
if ! grep -qxF '.hugo_build.lock' "$ROOT_DIR/.gitignore"; then
  printf '.hugo_build.lock\n' >> "$ROOT_DIR/.gitignore"
fi

after_git_inode="$(stat -c '%d:%i' "$ROOT_DIR/.git" 2>/dev/null || true)"
if [[ -z "$after_git_inode" || "$before_git_inode" != "$after_git_inode" ]]; then
  echo "❌ .git/ changed or disappeared during sync. Refusing to continue."
  exit 1
fi

if [[ -d "$ROOT_DIR/.github" ]]; then
  echo "👉 Leaving existing .github/ directory untouched."
fi

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
    ".github",
    "node_modules",
    "public",
}

text_suffixes = {
    ".adoc", ".css", ".html", ".js", ".json", ".md", ".scss",
    ".toml", ".txt", ".yaml", ".yml",
}

def is_skipped(path: Path) -> bool:
    return any(part in skip_dirs for part in path.parts)

for path in sorted(root.rglob("*")):
    rel = path.relative_to(root)
    if not path.is_file() or is_skipped(rel):
        continue

    if path.suffix.lower() not in text_suffixes and path.name not in {"LICENSE", "Dockerfile", "Makefile"}:
        continue

    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        continue

    original = text
    for old, new in replacements:
        text = text.replace(old, new)

    if rewrite_lowercase_technical:
        text = re.sub(r"\bortelius\b", "deployhub", text)

    # Preserve historical name when prose says Abraham Ortelius.
    text = text.replace("Abraham DeployHub", "Abraham Ortelius")

    if path.name == "README.md" and path.parent == root:
        text = re.sub(r"^#\s+.*$", f"# {brand_name} documentation", text, count=1, flags=re.MULTILINE)

    if path.name in {"config.toml", "hugo.toml"} and path.parent == root:
        text = re.sub(r'^baseURL\s*=\s*"[^"]*"', f'baseURL = "{brand_docs_url}/"', text, flags=re.MULTILINE)
        text = re.sub(r'^title\s*=\s*"[^"]*"', f'title = "{brand_name} Documentation"', text, flags=re.MULTILINE)

    if text != original:
        path.write_text(text, encoding="utf-8")
PY

echo "👉 Replacing Ortelius logo with DeployHub logo..."
LOGO_WORK_DIR="$WORK_DIR/logo"
LOGO_HTML="$LOGO_WORK_DIR/deployhub-home.html"
LOGO_BIN="$LOGO_WORK_DIR/deployhub-logo.bin"
LOGO_URL_FILE="$LOGO_WORK_DIR/deployhub-logo-url.txt"
mkdir -p "$LOGO_WORK_DIR"

RESOLVED_BRAND_LOGO_URL="$BRAND_LOGO_URL"
if [[ -z "$RESOLVED_BRAND_LOGO_URL" ]]; then
  curl -fsSL --retry 3 --retry-delay 2 \
    -H 'User-Agent: DeployHub-Docs-Branding/1.0' \
    "$BRAND_LOGO_PAGE_URL" \
    -o "$LOGO_HTML"

  export BRAND_LOGO_PAGE_URL LOGO_HTML LOGO_URL_FILE
  python3 <<'PY'
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urljoin
import os
import re

page_url = os.environ["BRAND_LOGO_PAGE_URL"]
html = Path(os.environ["LOGO_HTML"]).read_text(encoding="utf-8", errors="ignore")

srcset_split = re.compile(r"\s*,\s*")

class DeployHubLogoParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.images = []
        self.icons = []
        self.meta_images = []

    def handle_starttag(self, tag, attrs):
        attrs = {k.lower(): (v or "") for k, v in attrs}
        tag = tag.lower()

        if tag == "img":
            urls = []
            for key in ("src", "data-src", "data-lazy-src", "data-original", "data-o_src"):
                if attrs.get(key):
                    urls.append(attrs[key])
            for key in ("srcset", "data-srcset", "data-lazy-srcset"):
                if attrs.get(key):
                    for item in srcset_split.split(attrs[key].strip()):
                        if not item:
                            continue
                        urls.append(item.split()[0])
            text = " ".join(attrs.get(k, "") for k in ("alt", "title", "class", "id", "aria-label"))
            for url in urls:
                self.images.append((urljoin(page_url, url), text))

        elif tag == "link":
            rel = attrs.get("rel", "").lower()
            href = attrs.get("href", "")
            if href and ("icon" in rel or "apple-touch-icon" in rel or "mask-icon" in rel):
                self.icons.append((urljoin(page_url, href), rel))

        elif tag == "meta":
            prop = (attrs.get("property") or attrs.get("name") or "").lower()
            content = attrs.get("content", "")
            if content and prop in {"og:image", "og:image:url", "twitter:image", "twitter:image:src"}:
                self.meta_images.append((urljoin(page_url, content), prop))

parser = DeployHubLogoParser()
parser.feed(html)

def score(url: str, text: str, fallback: bool = False) -> int:
    haystack = f"{url} {text}".lower()
    value = 0
    if "ortelius" in haystack:
        value -= 1000
    if "deployhub" in haystack:
        value += 120
    if "logo" in haystack:
        value += 80
    if "site-logo" in haystack or "custom-logo" in haystack:
        value += 70
    if "header" in haystack or "navbar" in haystack:
        value += 25
    if "favicon" in haystack or "cropped" in haystack or "apple-touch-icon" in haystack:
        value += 20
    if any(ext in haystack for ext in (".svg", ".png", ".webp", ".jpg", ".jpeg")):
        value += 10
    if fallback:
        value -= 50
    return value

candidates = []
for url, text in parser.images:
    candidates.append((score(url, text), url, text))
for url, text in parser.icons:
    candidates.append((score(url, text, fallback=True), url, text))
for url, text in parser.meta_images:
    candidates.append((score(url, text, fallback=True), url, text))

# Prefer an actual DeployHub/logo image. If the site only exposes a favicon, use it
# as the fallback rather than leaving the upstream Ortelius logo in the docs.
candidates = [c for c in candidates if c[0] > -500]
candidates.sort(reverse=True)
selected = candidates[0][1] if candidates else ""
Path(os.environ["LOGO_URL_FILE"]).write_text(selected, encoding="utf-8")
PY

  RESOLVED_BRAND_LOGO_URL="$(cat "$LOGO_URL_FILE")"
fi

if [[ -z "$RESOLVED_BRAND_LOGO_URL" ]]; then
  echo "❌ Could not discover a DeployHub logo from $BRAND_LOGO_PAGE_URL."
  echo "   Set BRAND_LOGO_URL to a concrete DeployHub logo URL and rerun."
  exit 1
fi

case "$RESOLVED_BRAND_LOGO_URL" in
  https://www.deployhub.com/*|https://deployhub.com/*|https://spcdn.shortpixel.ai/*deployhub.com/*)
    ;;
  *)
    echo "❌ Refusing to use logo from non-DeployHub URL: $RESOLVED_BRAND_LOGO_URL"
    echo "   Set BRAND_LOGO_URL to a DeployHub logo URL."
    exit 1
    ;;
esac

echo "  → $RESOLVED_BRAND_LOGO_URL"
curl -fL --retry 3 --retry-delay 2 \
  -H 'User-Agent: DeployHub-Docs-Branding/1.0' \
  -H 'Accept: image/svg+xml,image/png,image/jpeg,image/webp,image/*;q=0.8,*/*;q=0.5' \
  "$RESOLVED_BRAND_LOGO_URL" \
  -o "$LOGO_BIN"

export ROOT_DIR LOGO_BIN RESOLVED_BRAND_LOGO_URL BRAND_NAME
python3 <<'PY'
from pathlib import Path
import base64
import os
import re
import struct

root = Path(os.environ["ROOT_DIR"])
logo_bin = Path(os.environ["LOGO_BIN"])
brand_name = os.environ.get("BRAND_NAME", "DeployHub")
source_url = os.environ["RESOLVED_BRAND_LOGO_URL"]
blob = logo_bin.read_bytes()

if not blob:
    raise SystemExit("Downloaded logo is empty")

def sniff_image(data: bytes, url: str):
    lower_url = url.lower().split("?", 1)[0]
    if data.startswith(b"\x89PNG\r\n\x1a\n") and len(data) >= 24:
        w, h = struct.unpack(">II", data[16:24])
        return "png", "image/png", w, h
    if data.startswith(b"\xff\xd8"):
        i = 2
        while i + 9 < len(data):
            if data[i] != 0xFF:
                i += 1
                continue
            marker = data[i + 1]
            i += 2
            if marker in (0xD8, 0xD9):
                continue
            if i + 2 > len(data):
                break
            seg_len = struct.unpack(">H", data[i:i+2])[0]
            if marker in {0xC0, 0xC1, 0xC2, 0xC3, 0xC5, 0xC6, 0xC7, 0xC9, 0xCA, 0xCB, 0xCD, 0xCE, 0xCF} and i + 7 < len(data):
                h, w = struct.unpack(">HH", data[i+3:i+7])
                return "jpg", "image/jpeg", w, h
            i += seg_len
        return "jpg", "image/jpeg", 512, 512
    if data.startswith(b"RIFF") and data[8:12] == b"WEBP":
        w = h = 512
        chunk = data[12:16]
        if chunk == b"VP8X" and len(data) >= 30:
            w = 1 + int.from_bytes(data[24:27], "little")
            h = 1 + int.from_bytes(data[27:30], "little")
        return "webp", "image/webp", w, h
    stripped = data[:512].lstrip().lower()
    if stripped.startswith(b"<svg") or b"<svg" in stripped:
        return "svg", "image/svg+xml", None, None
    if lower_url.endswith(".svg"):
        return "svg", "image/svg+xml", None, None
    if lower_url.endswith(".png"):
        return "png", "image/png", 512, 512
    if lower_url.endswith((".jpg", ".jpeg")):
        return "jpg", "image/jpeg", 512, 512
    if lower_url.endswith(".webp"):
        return "webp", "image/webp", 512, 512
    raise SystemExit(f"Downloaded logo does not look like a supported image: {source_url}")

ext, mime, width, height = sniff_image(blob, source_url)

static_dir = root / "static" / "images"
static_dir.mkdir(parents=True, exist_ok=True)
stable_logo = static_dir / f"deployhub-logo.{ext}"
stable_logo.write_bytes(blob)

assets_icons = root / "assets" / "icons"
assets_icons.mkdir(parents=True, exist_ok=True)
main_logo_svg = assets_icons / "logo.svg"

def svg_wrapper_for_raster(data: bytes, image_mime: str, w: int | None, h: int | None) -> str:
    w = w or 512
    h = h or 512
    encoded = base64.b64encode(data).decode("ascii")
    return f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {w} {h}" role="img" aria-label="{brand_name}">
  <title>{brand_name}</title>
  <image href="data:{image_mime};base64,{encoded}" width="{w}" height="{h}" preserveAspectRatio="xMidYMid meet"/>
</svg>
'''

if ext == "svg":
    main_logo_svg.write_bytes(blob)
    svg_text = blob.decode("utf-8", errors="ignore")
else:
    svg_text = svg_wrapper_for_raster(blob, mime, width, height)
    main_logo_svg.write_text(svg_text, encoding="utf-8")

image_suffixes = {".svg", ".png", ".jpg", ".jpeg", ".webp"}
search_roots = [root / "assets", root / "static", root / "content"]
updated = {main_logo_svg, stable_logo}
for search_root in search_roots:
    if not search_root.exists():
        continue
    for path in search_root.rglob("*"):
        if not path.is_file() or path in updated:
            continue
        rel_parts = set(path.relative_to(root).parts)
        if {".git", ".github", "public", "node_modules"} & rel_parts:
            continue
        name = path.name.lower()
        if not ("ortelius" in name or "logo" in name):
            continue
        suffix = path.suffix.lower()
        if suffix not in image_suffixes:
            continue
        if suffix == ".svg":
            path.write_text(svg_text, encoding="utf-8")
            updated.add(path)
        elif suffix == f".{ext}" or (suffix in {".jpg", ".jpeg"} and ext == "jpg"):
            path.write_bytes(blob)
            updated.add(path)

for config_name in ("config.toml", "hugo.toml"):
    config_path = root / config_name
    if not config_path.exists():
        continue
    text = config_path.read_text(encoding="utf-8", errors="ignore")
    original = text
    if "navbar_logo" in text:
        text = re.sub(r'(?m)^(\s*navbar_logo\s*=\s*).+$', r'\1true', text)
    if "logo" in text:
        text = re.sub(r'(?m)^(\s*logo\s*=\s*)"[^"]*"', r'\1"/images/deployhub-logo.' + ext + '"', text)
    if text != original:
        config_path.write_text(text, encoding="utf-8")

print(f"Downloaded DeployHub logo from {source_url}")
print(f"Wrote {stable_logo.relative_to(root)}")
print(f"Wrote {main_logo_svg.relative_to(root)}")
print("Replaced logo assets:")
for path in sorted(updated):
    print(f"  - {path.relative_to(root)}")
PY

if [[ ! -s "$ROOT_DIR/assets/icons/logo.svg" ]]; then
  echo "❌ DeployHub logo replacement failed; assets/icons/logo.svg is missing or empty."
  exit 1
fi

echo "👉 Verifying mirrored Markdown content and protected paths..."
DEST_MD_COUNT="$(find "$ROOT_DIR/content" -type f -name '*.md' | wc -l | tr -d ' ')"
if [[ "$DEST_MD_COUNT" -eq 0 ]]; then
  echo "❌ No Markdown files found under $ROOT_DIR/content after sync."
  exit 1
fi

if [[ -d "$ROOT_DIR/public" ]]; then
  echo "❌ public/ exists after prepare-docs.sh. This script must not commit Hugo build output."
  exit 1
fi

if [[ ! -d "$ROOT_DIR/.git" ]]; then
  echo "❌ .git/ is missing after prepare-docs.sh. Refusing to continue."
  exit 1
fi

echo "👉 Recording upstream source revision..."
cat > "$ROOT_DIR/UPSTREAM-ORTELIUS-DOCS.md" <<EOF2
# Upstream docs source

This repository is generated as a DeployHub-branded mirror of Ortelius docs.

- Source repository: $SOURCE_REPO
- Source ref: $SOURCE_REF
- Source commit: $SOURCE_SHA
- Source Markdown files copied: $DEST_MD_COUNT
- DeployHub logo source: ${RESOLVED_BRAND_LOGO_URL:-$BRAND_LOGO_URL}
- Generated by: prepare-docs.sh

Do not manually edit mirrored/generated documentation files unless the change is
intended to override upstream. Prefer fixing upstream docs or updating the
branding script.
EOF2

echo "✅ DeployHub branded docs prepared from Ortelius docs commit $SHORT_SHA with $DEST_MD_COUNT Markdown files"