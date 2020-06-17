---
title: "SaaS Sign-up and Reverse Proxy"
linkTitle: "SaaS Sign-up and Reverse Proxy"
weight: 1
description: >
  How to Sign up 
---
## SaaS Sign-up Process and the Reverse Proxy

When you [Sign-up to use the SaaS](https://www.deployhub.com/register-for-team/?) version, you will be asked for basic information. Your company and project names are unique 'Domain' and 'Project' identifiers. If someone else from your organization signs up, they will need to create another Project Name.

A high level 'Domain' comes after your Project name, for example "Teller." 
An assigned Pipeline will be called "MyPipeline" that includes 'Dev", "Test", and "Production" stages. 
Then you define your Credentials, Repositories, and the Components of your Application.

You can change the name of your Application or reconfigure your Pipeline in any way needed to reflect your own life cycle process.

To begin deploying, you first install a Reverse Proxy inside your firewall. This contacts DeployHub in our SaaS environment to receive deployment requests.

## What is the Reverse Proxy

A Reverse Proxy queries the DeployHub SaaS every minute to determine if a deployment is needed. For SaaS users, it provides a security layer, preventing you from opening a port to the outside world. It uses standard HTTPS request on the Google GKE environment. Nothing from the external Google side of the firewall is pushed to the local DeployHub Reverse Proxy.

Once the Reverse Proxy determines that a deployment is needed, it executes the deployment using all files on the inside of the firewall. The one-way communication initiates the deployment but all work is done local to your network. On completion of the deployment, the logs are pushed back up to the DeployHub SaaS for viewing and audit.

![DeployHub Architecture](/userguide/gettingstarted/reverseproxy.png)

## Reverse Proxy Installation

The Reverse Proxy runs as docker container. In order to install it, you need to install Docker. 

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

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your Docker Reverse Proxy

The DeployHub Reverse Proxy Docker Image is found on the DockerHub Container Catalog and the RedHat Certified Container Catalog. Follow the steps below to install the Reverse Proxy into your Docker installation.

## Pull Reverse Proxy from Redhat Quay Registry

docker pull quay.io/deployhub/deployhub-rproxy:latest

## Set your CLIENTID as environment variable

### Linux and OS/X

export CLIENTID="Client ID sent in welcome email"

## Start the container

### Linux and OS/X

docker run -d --hostname `hostname` -e CLIENTID=$CLIENTID -v ~/.ssh:/keys:Z ${IMAGE}

## Notes

- $​CLIENTID = client id assigned to your user id from the deployhub.com website or welcome email
- ${IMAGE} = image id from the docker pull
- DeployHub will see the ssh keys as /keys
