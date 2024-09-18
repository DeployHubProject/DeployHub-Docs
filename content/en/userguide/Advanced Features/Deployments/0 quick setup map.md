---
title: "Quick Setup Map"
linkTitle: "Quick Setup Map"
weight: 2
description: >
  Quick Setup Guide - What You Need to Know
---


## Getting Started with the DeployHub Pro Internal Deployment Engine

DeployHub Pro includes a deployment engine that can be used to deploy your _Applications_. You will need to setup:

- _Credentials_ for accessing repositories and endpoints.
- _Domains_ for defining relationship hierarchy. If you are using DeployHub Pro for monitoring security posture, your _Domains_ will already be defined.
- _Repositories_ such as GitHub or Quay for accessing artifacts.
- _Endpoints_ define where the deployed object will be placed such as VM images, Clusters, etc.
- _Environments_ is defined as a collection of _Endpoints_ and often represents Development, Testing, or Production. If you are using DeployHub Pro to manage security postures, you may have previously defined these objects.  
- _Components and Applications_ added via the CI/CD pipeline. If you are using DeployHub Pro to monitor security postures, this step will already be completed.
- _Deployment Actions_ to execute the deployment process.
- _Schedule or deploy on demand_ or via the CI/CD Pipeline. 

You will also need to configure your [reverse proxy](/userguide/advanced-features/deployments/0-saas-and-reverse-proxy/) used to push deployment results with the Command Line Interface.

## Quick Info Map

![DeployHub Pro Architecture](/userguide/images/setuporder.png)

