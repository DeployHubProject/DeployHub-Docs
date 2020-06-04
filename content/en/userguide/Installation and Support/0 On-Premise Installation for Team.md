---
title: "DeployHub Team On-Premise Installation"
linkTitle: "DeployHub Team On-Premise Installation"
weight: 2
description: >
  Installing DeployHub Team on-premise.
---

DeployHub Team is installed locally using a Docker Image that includes all the necessary prerequisites. In other words, you need Docker installed.

## Docker Installation

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

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions.

## Downloading and Installing DeployHub Team

Once you have downloaded and tested your Docker installation, you are ready for DeployHub Team. To download and run the container follow [the online instructions](https://www.deployhub.com/deployhub-oss-on-prem-installation/).

## Using Multiple Deployment Engines

Multiple deployment engines can be used to distribute large deployments which you can add as you expand the number of endpoints used. Multiple deployment engines can distribute simultaneous deployment to multiple locations, making it faster. Additional deployment engines can only be installed on Linux.

Download the deployment engine RPM from the DeployHub website. Install the RPM on the Linux server that will be an additional deployment engine host. Update the _Domain_ entries to point to the new deployment engine for that _Domain_.