---
title: "DeployHub Pro On-Prem Installation"
linkTitle: "DeployHub Pro On-Prem Installation"
weight: 3
description: >
  Installing DeployHub Pro On-premise
---

## Docker Installation

Installation is done locally using a Docker Image that includes all the necessary prerequisites. You will need to have Docker installed in order to run do this.

Docker installation:

[Docker for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)

Requires CentOS 64-bit 7.1 and higher on x86\_64

[Docker for RedHat](https://docs.docker.com/install/linux/docker-ee/rhel/)

Require RHEL 64-bit 7.1 and higher on x86\_64, s390x, or ppc64le (not ppc64)

[Docker for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

Requires 64-bit version of one of these Ubuntu versions:

Bionic 18.04 (LTS)

Artful 17.10

Xenial 16.04 (LTS)

Trusty 14.04 (LTS)

[Docker for OS/X](https://docs.docker.com/docker-for-mac/install/)

Requires macOS El Capitan 10.11 and newer macOS releases are supported. We recommend upgrading to the latest version of macOS.

### Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Downloading and Installing DeployHub Pro

## Pull image from Redhat Quay Registry

docker pull quay.io/deployhub/deployhub-rproxy:latest

## Start the container

### Linux and OS/X
~~~bash
docker run -v ~/deployhub/data:/var/lib/pgsql/data:Z -v ~/deployhub/logs:/opt/deployhub/logs:Z -p 7171:8080 -d –hostname docker_dh -v ~/.ssh:/keys:Z ${IMAGE}
~~~

**~/deployhub/data** is the location in which the Postgres database will be persisted.
