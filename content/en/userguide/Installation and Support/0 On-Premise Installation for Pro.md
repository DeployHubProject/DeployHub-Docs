---
title: "DeployHub Pro On-Prem Installation"
linkTitle: "DeployHub Pro On-Prem Installation"
weight: 12
description: >
  Installing DeployHub Pro On-premise
---

## On Premise Installation Using the DeployHub Pro Helm Chart

DeployHub Pro can be installed into your own cloud environment, or onto a hosted cloud environment.  DeployHub Pro uses Helm to manage and perform the installation. The process includes the installation of multiple containers. The Helm chart and instructions can be found at [ArtifactHub](https://artifacthub.io/packages/helm/DeployHub Pro/DeployHub Pro). This is the location for the most up to date instructions for downloading and running the DeployHub Pro Helm chart.

## Next Steps


### Access the Ortelius URL and Login
Access the URL from the following address:
```
http://<External IP Address from above step>/dmadminweb/Home
```
To log in please use userId: admin and password: admin. 

**Note:**
You can create your own Administrator UserID and remove the default userid and password.

Once you have completed your installation, you can take the next step and complete a [Proof of Concept](https://www.DeployHub Pro.com/docs/DeployHub Pro-General-POC.pdf) integrated into your CI/CD pipeline with the Command Line Interface.
