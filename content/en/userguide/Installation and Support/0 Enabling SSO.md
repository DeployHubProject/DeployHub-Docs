---
title: "Single Sign On using Okta and SAML"
linkTitle: "Single Sign On using Okta and SAML"
weight: 4
description: >
  Enabling SSO
---

## Step 1 - Login into Okta

Login into your Okta Dashboard - <https://www.okta.com/>

## Step 2 - Create an Okta Application for DeployHub

![Alt text](/deployhub-okta-app.png "DeployHub Okta Application")

## Step 3 - Configure the SAML Settings

- Single Sign On URL - <https://<DeployHub> Server>/dmadminweb/sso
- Recipient URL - <https://<DeployHub> Server>/dmadminweb/sso/finish
- Destination URL - <https://<DeployHub> Server>/dmadminweb/sso/finish
- Audience Restriction - <https://<DeployHub> Server>/dmadminweb/sso/finish

  ![Alt text](/deployhub-okta-saml.png "DeployHub Okta SAML")

## Step 4 - View SAML setup instructions

- On the Sign On tab - `View SAML setup instructions` to obtain the SAML XML file needed to enable SSO on the DeployHub side.

  ![Alt text](/deployhub-okta-saml-view.png "DeployHub Okta Sign On")

## Step 5 - Download the SAML XML data

- Copy the contents of the `IDP Metadata` section into a file called `idp-metadata.xml`.
  
## Step 5 - Convert `idp-metadata.xml` to base64 environment variable

- `export IDP_METADATA=$(cat idp-metadata.xml > base64)`

  ![Alt text](/deployhub-okta-saml-xml.png "DeployHub Okta Sign On")

## Step 6 - Apply the SAML Configuration to the Kubernetes Cluster using Helm

- `helm upgrade my-release deployhub/deployhub --install --version 10.0.105 --set dh-ms-general.dbhost=db.example.com --set dh-ms-general.dbpass=changeme --set-string dh-ms-general.dbport=5432 --set dh-ms-nginx.ingress.type=glb --set dh-ms-general.SamlIdpMetadata=${IDP_METADATA} --set dh-ms-general.SamlLogoutRedirect=$(echo -n https://sso.example.com | base64)`

  > Note:  The `dh-ms-general.SamlIdpMetadata` is the base64 encoded string of the IDP Metadata and `dh-ms-general.SamlLogoutRedirect` is the redirect used when someone logs out of DeployHub.
