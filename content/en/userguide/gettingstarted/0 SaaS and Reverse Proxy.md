---
title: "SaaS Sign-up and Reverse Proxy"
linkTitle: "SaaS Sign-up and Reverse Proxy"
weight: 2
description: >
  Signing up for DeployHub SaaS and the Reverse Proxy for Deployments.
---
## SaaS Sign-up Process and the Reverse Proxy

[Sign-up to use the SaaS](https://www.deployhub.com/register-for-team/?) version of DeployHub and start managing microservices immediately. When you sign-up, you will be asked for basic information, such as company and project names to provide you with a unique &#39;Domain&#39; and &#39;Project&#39; identifier. If someone else from your organization signs up to DeployHub, they will need to create another Project Name.

Once you sign-up, you will see a high level &#39;Domain&#39; named after your Project name, for example &quot;Teller.&quot; In addition, you will be assigned a Pipeline called &quot;MyPipeline&quot; that includes &#39;Dev&quot;, &quot;Test&quot; and &quot;Production&quot; stages. At this point you will be ready to begin defining Credentials, Repositories, and the Components of your Application.

You can change the name of your Application or reconfigure your Pipeline in any way needed to reflect your own life cycle process.

To begin deploying you will need to install a Reverse Proxy inside your firewall. The Reverse Proxy contacts DeployHub running in our SaaS environment to receive deployment requests.


## What is the Reverse Proxy?

For SaaS users, the Reverse Proxy provides a security layer to prevent you from opening a port to the outside world. The Reverse Proxy uses standard HTTPS request to the DeployHub SaaS  running on the Google GKE environment.  Nothing from the external Google side of the firewall is pushed to the local DeployHub Reverse Proxy. Instead the Reverse Proxy queries the DeployHub SaaS every minute to determine if a deployment is needed.

Once the Reverse Proxy determines that a deployment is needed, the Reverse Proxy will execute the deployment using all files on the inside of the firewall. The one-way communication is needed only to initiate the deployment, but all work is done local to your network.  On completion of the deployment, the logs are pushed back up to the DeployHub SaaS for viewing and audit.

![DeployHub Architecture](/userguide/gettingstarted/reverseproxy.png)



## Reverse Proxy Installation

The Reverse Proxy runs as docker container. In order to install it you need to have Docker up and running.

## Docker Installation

[Docker for Windows​](https://docs.docker.com/docker-for-windows/install/)

Requires Microsoft Windows 10 Professional or Enterprise 64-bit

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

## Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your Docker Reverse Proxy

The DeployHub Reverse Proxy Docker Image is found on the DockerHub Container Catalog and the RedHat Certified Container Catalog. Follow the steps below to install the Reverse Proxy into your Docker installation.

## Pull DockerHub

$docker login registry.hub.docker.com

$docker pull registry.hub.docker.com/deployhub/deployhub-rproxy

## Pull RedHat

$ docker login registry.connect.redhat.com

$ docker pull registry.connect.redhat.com/deployhub/deployhub-rproxy

## Volume to access Jenkins build results

## Linux and OS/X

$ docker volume create --name jenkinsfs --opt type=nfs --opt device=:/var/jenkins/jobs --opt o=addr=192.168.0.101

## Windows

$ docker volume create --name jenkinsfs

--driver local --opt type=cifs

--opt device=//server/path/to/share

--opt=username=myuser,password=mypw,

file\_mode=0777,dir\_mode=0777

## Set your CLIENTID as environment variable

## Linux and OS/X

$ export CLIENTID=&quot;Client ID sent in welcome email&quot;

Windows

$ set CLIENTID=&quot;Client ID sent in welcome email&quot;

## Start the container

## Linux and OS/X

$ docker run -d --hostname `hostname` -e CLIENTID=$CLIENTID -v jenkinsfs:/jenkins -v ~/.ssh:/keys:Z ${IMAGE}

## Windows

$ docker run -d --hostname %COMPUTERNAME•% -e CLIENTID=%CLIENTID% -v jenkinsfs:/jenkins -v ~/.ssh:/keys:Z ${IMAGE}

## Volumes Used

jenkinsnfs:/jenkins is the Jenkins build results

~/.ssh:/keys:Z users ssh keys made visible to the container for credentials

## Notes

- ${​CLIENTID} = client id assigned to your user id from the deployhub.com website or welcome email
- ${IMAGE} = image id from the docker pull
- NFS is share Jenkins Jobs directory
- DeployHub will see the Jenkins File System Repository as /jenkins
- DeployHub will see the ssh keys as /keys

## Using Multiple Deployment Engines

Multiple deployment engines can distribute large deployments and can be added as you expand the number of endpoints used. Multiple deployment engines can distribute simultaneous deployments to multiple locations, making it faster. Additional deployment engines can only be installed on Linux.

Download the deployment engine RPM from the DeployHub website. Install the RPM on the Linux server that will be an additional deployment engine host. Update the _Domain_ entries to point to the new deployment engine for that _Domain_.

## More Help

[DeployHub Tutorials](https://www.deployhub.com/continuous-deployment-resources/)

[Support Questions and Issues](https://github.com/DeployHubProject/DeployHub/issues)

[Demos, Tips and Tricks](https://www.deployhub.com/continuous-deployment-resources/)
