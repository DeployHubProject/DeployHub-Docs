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

A Reverse Proxy queries the DeployHub SaaS every minute to determine if a deployment is needed. For SaaS users, it provides a security layer, preventing you from opening a port to the outside world. It uses standard HTTPS requests to communicate to the DeployHub SaaS on the Google GKE environment. Nothing from the external Google side of the firewall is pushed to the local DeployHub Reverse Proxy. 

Once the Reverse Proxy determines that a deployment is needed, it executes the deployment using all files on the inside of the firewall. The one-way communication initiates the deployment but all work is done local to your network. On completion of the deployment, the logs are pushed back up to the DeployHub SaaS for viewing and audit.

![DeployHub Architecture](/userguide/images/ReverseProxy.png)


## Reverse Proxy Installation

The Reverse Proxy runs as docker container. In order to install it, you need to install Docker.

## Docker Installation Guides

- [Docker for CentOS](https://docs.docker.com/engine/install/centos/)
- [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Docker for Fedora](https://docs.docker.com/engine/install/fedora/)
- [Docker for RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index)
- [Docker for OS/X](https://docs.docker.com/docker-for-mac/install/)

### Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your DeployHub Reverse Proxy Docker Image

The DeployHub Reverse Proxy Docker Image is found on the Redhat Quay Docker Registry. Follow the steps below to install the Reverse Proxy into your Docker installation.

## Step 1 - Set your CLIENTID as environment variable

```bash
export CLIENTID="Client ID sent in welcome email"
```

## Step 2 - Pull Reverse Proxy from Redhat Quay Registry

```bash
docker pull quay.io/deployhub/deployhub-rproxy:latest
```

## Step 3 - Find your image SHA

Find find image SHA from the third column in the output.

```bash
docker images | grep deployhub-rproxy | grep latest
```

## Step 4 - Start the container for Linux and OS/X

Use the image SHA from Step 4 as the last parameter <image SHA> to the docker run.

```bash
docker run -d --hostname `hostname` -e CLIENTID=$CLIENTID -v ~/.ssh:/keys:Z <image SHA>
```
