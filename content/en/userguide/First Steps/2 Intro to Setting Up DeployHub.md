---
title: "Setting up DeployHub"
linkTitle: "Setting up DeployHub"
weight: 1
description: >
  How to setup DeployHub. 
---

Following are the items you must define to DeployHub to get started:

| Step | Description |
| --- | --- |
**Create a _Domain_** | Define your catalog by creating a [_Domain_](/userguide/first-steps/2-defining-domains/) hierarchy for sharing. As a SaaS user, your high-level _Domain_, and your _Pipeline Stages_, are automatically created. If you are using an on-premise version, you need to first create your _Domain_, and define your _Pipeline Stages_. To get started, you only need one Life Cycle _Stage_ in your _Pipeline_.
|**Add your _Credentials_** | If you are going to access a _Repository_ or _Data Source_, you need to specify the [_Credentials_](/userguide/first-steps/2-define-your-credentials/). In addition, the recipient _Endpoints_ will need security _Credentials_.
|**Add your _Repositories_** | DeployHub needs to be told where to pull files and containers. It is best to add your [_Repository_](/userguide/first-steps/2-define-repositories/) before you begin defining your _Components_ as you will need to specify a _Repository_ for your _Component_.|
|**Define your _Environment_ and _Endpoints_** | You will deploy to an [_Environment_](/userguide/first-steps/2-define-environments/) which is a collection of [_Endpoints_](/userguide/first-steps/2-define-endpoints/). You will need to identify your deployment landscape before you execute a deployment.
|**Publish your _Components_**| Your software solution is a collection of [_Components_](/userguide/publishing-components/).  You will need to publish them before you create your _Application_.|
|**Package Your _Application_** | Create your [_Application_](/userguide/packaging-applications/) Base line to get started with tracking, versioning and mapping your _Components_ overtime.

Once you have completed your basic setup, you can integrate DeployHub into your CI/CD process to automatically track, version and deploy your Application and Components.

If you want to customize how DeployHub manages deployments - you will do this using [_Actions_](/userguide/customizations/2-define-your-actions/), [_Functions_ & _Procedures_](/userguide/customizations/2-define-your-functions-and-procedures/).
