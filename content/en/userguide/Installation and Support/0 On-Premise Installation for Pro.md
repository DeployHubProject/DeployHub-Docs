---
title: "DeployHub On-Prem Installation"
linkTitle: "DeployHub On-Prem Installation"
weight: 3
description: >
  Installing DeployHub On-premise
---

## On Premise Installation Prerequisites

DeployHub runs in a Docker Container with all required dependencies, such as Postgresql.  Docker is the only prerequisite for your on premise installation of DeployHub.  If you do not have Docker, below are steps for building a Docker environment. 

### Docker Installation Guides

- [Docker for CentOS](https://docs.docker.com/engine/install/centos/)
- [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Docker for Fedora](https://docs.docker.com/engine/install/fedora/)
- [Docker for RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index)
- [Docker for OS/X](https://docs.docker.com/docker-for-mac/install/)

### Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your DeployHub Pro Docker Image

The DeployHub Pro Docker Image is found on the Redhat Quay Docker Registry. Follow the steps below to install the DeployHub into your Docker installation.

**Step 1 - Pull DeployHub Pro from Redhat Quay Registry**

Run:

~~~bash
docker pull quay.io/deployhub/deployhub-pro:v9.0.0
~~~

**Step 2 - Create a directory to persist the Postgres database**

Run:

~~~bash
mkdir -p ~/deployhub/data
~~~

**Step 3 - Find your image SHA**

Run: 

~~~bash
docker images | grep deployhub-pro | grep v9.0.0
~~~

Find the image SHA from the third column in the output.

~~~
quay.io/deployhub/deployhub-pro          v9.0.0          0114088b0b44        6 days ago          3.32GB
~~~
The SHA in the above example is 0114088b0b44.

**Step 4 - Start the container for Linux and OS/X**

Use the image SHA from Step 3 as the last parameter to the docker run.

~~~bash
docker run -v ~/deployhub/data:/var/lib/pgsql/data:Z -v ~/deployhub/logs:/opt/deployhub/logs:Z -p 7171:8080 -d –hostname docker_dh -v ~/.ssh:/keys:Z 0114088b0b44
~~~

**Step 5 - Access DeployHub from your browser**

 DeployHub is accessible through the following url:

Your DeployHub DNS name is the server where you installed DeployHub. 

```bash
http://<DeployHub DNS name>:7171/dmadminweb/Home
```
As the first user to use the new install, you will be prompted to setup the administrator user id and password.

## The Hipster Store Tutorial

The Hipster Store Tutorial is not available in the on-premise installation.  If you would like to go through the Hipster Store Tutorial, you should [sign up](/userguide/installation-and-support/0-saas-and-reverse-proxy/) for the SaaS environment. This example gives you a review of _Domains_, _Components_, and _Applications_ and will help you understand DeployHub basic concepts. 




