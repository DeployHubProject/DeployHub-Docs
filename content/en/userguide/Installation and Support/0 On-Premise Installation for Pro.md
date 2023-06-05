---
title: "DeployHub On-Prem Installation"
linkTitle: "DeployHub On-Prem Installation"
weight: 3
description: >
  Installing DeployHub On-premise
---

## On Premise Installation Using the DeployHub Helm Chart

DeployHub can be installed into your own cloud environment, or onto a hosted cloud environment.  DeployHub uses Helm to manage and perform the installation. The process includes the installation of multiple containers.

### Step 1 - Download and Run Helm
The DeployHub on-premise Helm chart and instructions can be found at [ArtifactHub](https://artifacthub.io/packages/helm/deployhub/deployhub). This is the location for the most up to date instructions for downloading and running the Ortelius Helm chart.    (<https://artifacthub.io/packages/helm/deployhub/deployhub>)

### Step 2 - Access DeployHub from your browser

Run the following command to find your IP address for the DeployHub URL.

```
kubectl get svc -n deployhub ms.nginx 
```
This will display the external IP address you need to run the URL.

### Step 3 - Access the DeployHub URL and Login
Access the URL from the following address:
```
http://<External IP Address from above step>/dmadminweb/Home
```
To log in please use userId: admin and password: admin.

**Note:**
You can create your own Administrator UserID and remove the default userid and password.

## Next Steps

Once you have completed your installation, you can take the next step and complete a [Proof of Concept](/userguide/integrations/ci-cd_integrations/) integrated into your CI/CD pipeline with the Command Line Interface.
