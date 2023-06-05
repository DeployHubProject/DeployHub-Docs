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
The DeployHub on-premise Helm chart and instructions can be found at [ArtifactHub](https://artifacthub.io/packages/helm/deployhub/deployhub). This is the location for the most up to date instructions for downloading and running the Ortelius Helm chart.    (https://artifacthub.io/packages/helm/deployhub/deployhub)

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

## Single Sign On using Okta and SAML

### Step 1 - Login into Okta

Login into your Okta Dashboard - https://www.okta.com/

### Step 2 - Create an Okta Application for DeployHub

![Alt text](/deployhub-okta-app.png "DeployHub Okta Application")


### Step 3 - Configure the SAML Settings

  - Single Sign On URL - https://<DeployHub Server>/dmadminweb/sso
  - Recipient URL - https://<DeployHub Server>/dmadminweb/sso/finish
  - Destination URL - https://<DeployHub Server>/dmadminweb/sso/finish
  - Audience Restriction - https://<DeployHub Server>/dmadminweb/sso/finish

  ![Alt text](/deployhub-okta-saml.png "DeployHub Okta SAML")

### Step 4 - View SAML setup instructions

  - On the Sign On tab - `View SAML setup instructions` to obtain the SAML XML file needed to enable SSO on the DeployHub side.

  ![Alt text](/deployhub-okta-saml-view.png "DeployHub Okta Sign On")

### Step 5 - Download the SAML XML data

  - Copy the contents of the `IDP Metadata` section into a file called `idp-metadata.xml`. 
  
### Step 5 - Convert `idp-metadata.xml` to base64 environment variable
 
  - `export IDP_METADATA=$(cat idp-metadata.xml > base64)`

### Step 6 - Apply the SAML Configuration to the Kubernetes Cluster using Helm

  - `helm upgrade my-release deployhub/deployhub --install --version 10.0.105 --set dh-ms-general.dbhost=db.example.com --set dh-ms-general.dbpass=changeme --set-string dh-ms-general.dbport=5432 --set dh-ms-nginx.ingress.type=glb --set dh-ms-general.SamlIdpMetadata=${IDP_METADATA} --set dh-ms-general.SamlLogoutRedirect=$(echo -n https://sso.example.com | base64)`

  > Note:  The `dh-ms-general.SamlIdpMetadata` is the base64 encoded string of the IDP Metadata and `dh-ms-general.SamlLogoutRedirect` is the redirect used when someone logs out of DeployHub.
