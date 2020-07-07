---
title: "DeployHub Pro On-Prem Installation"
linkTitle: "DeployHub Pro On-Prem Installation"
weight: 3
description: >
  Installing DeployHub Pro On-premise
---



## Docker Installation Guides

- [Docker for CentOS](https://docs.docker.com/engine/install/centos/)
- [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Docker for Fedora](https://docs.docker.com/engine/install/fedora/)
- [Docker for RedHat](https://docs.docker.com/install/linux/docker-ee/rhel/)
- [Docker for OS/X](https://docs.docker.com/docker-for-mac/install/)

### Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your DeployHub Team Docker Image

The DeployHub Reverse Proxy Docker Image is found on the Redhat Quay Docker Registry. Follow the steps below to install the DeployHub into your Docker installation.

## Step 1 - Pull DeployHub Pro from Redhat Quay Registry

```bash
docker pull quay.io/deployhub/deployhub-pro:v9.0.0
```

## Step 2 - Create a directory to persist the Postgres database

```bash
mkdir -p ~/deployhub/data
```

## Step 3 - Find your image SHA

Find find image SHA from the third column in the output.

```bash
docker images | grep deployhub-pro | grep latest
```

## Step 4 - Start the container for Linux and OS/X

Use the image SHA from Step 4 as the last parameter <image SHA> to the docker run.

```bash
docker run -v ~/deployhub/data:/var/lib/pgsql/data:Z -v ~/deployhub/logs:/opt/deployhub/logs:Z -p 7171:8080 -d –hostname docker_dh -v ~/.ssh:/keys:Z <image SHA>
```

## Step 5 - Access DeployHub from your browser

As the first user to use the new install, you will be prompted to setup the administrator user id and password. DeployHub is accessible through the following url:

```bash
http://<DeployHub DNS name>:7171/dmadminweb/Home
```
