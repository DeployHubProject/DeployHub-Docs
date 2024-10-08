---
title: "Single Sign On using Okta and SAML"
linkTitle: "Single Sign On using Okta and SAML"
weight: 20
description: >
  Enabling SSO
---

The following steps will help you enable SSO

### Step 1 - Login into Okta

Login into your Okta Dashboard - <https://www.okta.com/>

### Step 2 - Create an Okta Application for DeployHub Pro

![Alt text](/DeployHub Pro-okta-app.png "DeployHub Pro Okta Application")

### Step 3 - Configure the SAML Settings

- Single Sign On URL - <https://<DeployHub Pro> Server>/dmadminweb/sso
- Recipient URL - <https://<DeployHub Pro> Server>/dmadminweb/sso/finish
- Destination URL - <https://<DeployHub Pro> Server>/dmadminweb/sso/finish
- Audience Restriction - <https://<DeployHub Pro> Server>/dmadminweb/sso/finish

  ![Alt text](/DeployHub Pro-okta-saml.png "DeployHub Pro Okta SAML")

### Step 4 - View SAML setup instructions

- On the Sign On tab - `View SAML setup instructions` to obtain the SAML XML file needed to enable SSO on the DeployHub Pro side.

  ![Alt text](/DeployHub Pro-okta-saml-view.png "DeployHub Pro Okta Sign On")

### Step 5 - Download the SAML XML data

- Copy the contents of the `IDP Metadata` from the **Optional** section into a file called `idp-metadata.xml`.

  ![Alt text](/DeployHub Pro-okta-saml-xml.png "DeployHub Pro Okta Sign On")
  
### Step 6 - Convert `idp-metadata.xml` to base64 environment variable

- `export IDP_METADATA=$(base64 -w 0 idp-metadata.xml)`

### Step 7 - Convert logout url to base64 environment variable

- `export SAML_LOGOUT=$(echo -n https://sso.example.com | base64)`

### Step 8 - Apply the SAML Configuration to the Kubernetes Cluster using Helm

- `helm upgrade my-release DeployHub Pro/DeployHub Pro --install --version 10.0.105 --set dh-ms-general.dbhost=db.example.com --set dh-ms-general.dbpass=changeme --set-string dh-ms-general.dbport=5432 --set dh-ms-nginx.ingress.type=glb --set dh-ms-general.SamlIdpMetadata=${IDP_METADATA} --set dh-ms-general.SamlLogoutRedirect=${SAML_LOGOUT}`

  > Note:  The `dh-ms-general.SamlIdpMetadata` is the base64 encoded string of the IDP Metadata and `dh-ms-general.SamlLogoutRedirect` is the redirect used when someone logs out of DeployHub Pro.
