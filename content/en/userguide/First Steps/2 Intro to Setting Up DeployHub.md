---
title: "Setting Up DeployHub Via the CLI or Dashboard"
linkTitle: "Setting Up DeployHub Via the CLI or Dashboard"
weight: 2
description: >
  Setting Up DeployHub Via the CLI or Dashboard
---

## Set Up DeployHub via the Dashboard

| Step | Description |
| --- | --- |
**Create a _Domain_** | Define your catalog by creating a [_Domain_](/userguide/first-steps/2-defining-domains/) hierarchy for sharing. For SaaS user, your Company _Domain_ and your Project _Domain_ are automatically created. With an on-premise version, you will see only a Global _Domain_. You will need to create your _Domains_ to get started.
|**Define your _Environment_ and _Endpoints_** | Next, identify your deployment landscape before you execute a deployment. You will deploy to an [_Environment_](/userguide/first-steps/2-define-environments/) which is a collection of [_Endpoints_](/userguide/first-steps/2-define-endpoints/).
|**Publish your _Components_**| Publish your collection of [_Components_](/userguide/publishing-components/) before you create your _Application_.|
|**Package Your _Application_** | Create an [_Application_](/userguide/packaging-applications/) Base line to track, version and map your _Components_ overtime.

Once this basic setup is complete, integrate DeployHub into your [CI/CD](/userguide/integrations/ci-cd_integrations/) process to automatically track, version and deploy your _Application_ and _Components_.

If you want to customize how DeployHub manages deployments - you will do this using [_Actions_](/userguide/customizations/2-define-your-actions/), [_Functions_ & _Procedures_](/userguide/customizations/2-define-your-functions-and-procedures/).

## Setup DeployHub via Pipeline Automation and the CLI

The fastest way to setup DeployHub is to use the Ortelius Command Line Interface to automate DeployHub via your CI/CD Pipeline.

{{% include "/userguide/reusable/CommandLine.md/" %}}


