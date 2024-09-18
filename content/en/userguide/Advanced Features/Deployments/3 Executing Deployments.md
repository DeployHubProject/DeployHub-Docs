---
title: "Executing Deployments"
linkTitle: "Executing Deployments"
weight: 20
description: >
  Deploying _Applications_ and _Components_.
---

## The DeployHub Pro Deployment Engine and Incremental Processing

DeployHub Pro uses a deployment engine to perform the push of deployments across your [_Environments_](/userguide/2-define-environments/).  For SaaS users, your reverse proxy is your deployment engine.  For on premise installations, your deployment engine is installed as part of your DeployHub Pro installation. The deployment engine is called when a deployment is initiated. The job of the deployment engine is to do the decision making about what [_Components_](/userguide/2-define-components/) need to be released, and what processing logic is required.  Deployment processing is based on the deployment configuration of the _Component_. DeployHub Pro deploys _Applications_ which are a collection of _Components_, on an increment basis. If a _Component_ is already running in an _Environment_, it is not re-released. This is how DeployHub Pro independently deploys microservices, and handles roll forward or rollback logic.  DeployHub Pro uses a backend version control engine to achieve incremental deployments, forward or backward.  

### Roll Forward or Rollback

Whenever a deployment has a problem, DeployHub Pro can provide a fast and safe repair with Roll Forward and Rollback of an _Application_ using _Components_. Roll Forward or Rollback allows DeployHub Pro to apply _Components_ to _Endpoints_ incrementally and in order. As DeployHub Pro interrogates its versioning engine for each _Application Version_, the associated _Components_ are advanced to a new version, or replaced with a previous version to handle the Roll Forward or Rollback conditions.

### Configuring Deployment Logic

DeployHub Pro uses either the default [_Action_](/userguide/advanced-features/deployments/2-define-your-actions/) or _Custom Actions_ (i.e., Helm, Ansible, external script) to handle the deployment processing of your _Application_ and _Components_.  For most deployments, no customization is required and is easily supported with the default _Actions_. When a _Custom Action_ is used, it relys on an external process to manage the deployment processing.

**Executing Deployments with the Default _Actions_**

 When you execute a deployment, DeployHub Pro will call a default _Action_ to push the _Component_ from the source location to the target _Endpoint_. You can customize the deployment process by writing your own _Actions_ that allow you to refine the way the deployment processing will occur. _Actions_ themselves contain [_Procedures_, _Functions,_](/userguide/advanced-features/deployments/2-define-your-functions-and-procedures/) and other _Actions_ which allow you to develop highly functioning and re-useable processes that can be shared across the _Domain_ to which they belong. For most users, no modifications to the default _Actions_ are required. For your microservice _Components_ you will use a _Custom Action_ that calls your Helm chart.

**Executing Deployments with _Custom Actions_**

_Custom Actions_ allow you to execute existing one-off deployment scripts and can support an easy transition to using DeployHub Pro. You can choose to bypass DeployHub Pro's default _Actions_ using a pre-defined our newly created [_Custom Action_](/userguide/advanced-features/deployments/2-define-your-actions/). This can be used to call other tools such as Helm, Ansible or a homegrown deploy script that does the heavy lifting of managing deployment logic. To use a _Custom Action_ you will [define your _Component_](/userguide/2-define-components/#viewing-and-editing-_components_-with-the-dashboard) with the _Custom Action_ that will take over the normal deployment processing. When a _Custom Action_ is designated within an _Application_ or _Component_, any default Pre or Post _Action_ is ignored and not executed during the deployment. If a _Custom Action_ is used, it can use one or more DeployHub Pro _Procedures_, _Functions_, and _Actions_, in a predetermined order.

### Distributed Deployments for Traditional Data Centers

For large distributed traditional data centers you can install multiple deployment engines and assign them to specific Project _Domains_ to handle large 'fan out' deployment processing. Multiple deployment engines can be used to distribute the deployment processing for large data centers with thousands of physical _Endpoints_, but is not required for a modern Kubernetes architecture. You can change the deployment engine at the [_Domain_ Details section](/userguide/2-defining-domains/#_domain_-details) using the _Engine Hostname_ Detail field. This field tells DeployHub Pro which engine to use for deployments in that _Domain_. If you need to implement multiple deployment engines for large distributed deployments, contact our [Support Team](/userguide/installation-and-support/0-contactsupport/). They can provide you a link to download an installer that includes only the deployment engine and not the full DeployHub Pro install. You would use this installer to build out separate deployment engines that are then defined to the _Domain_ allowing each _Application_ to have its own engine.

## Executing Deployments

Deployments can be executed:

- On Demand
- With Roll Forward or Rollback
- Scheduled via the Calendar
- Automated from Continuous Delivery

### Executing Deployments On-demand

An on-demand deployment can be initiated for an _Application_ or _Release_ using a _Deploy Task_. Once the _Deploy Task_ has been defined in the _Domain_, it will be available from the [_Application_ List View](/userguide/2-defining-applications/#the-_application_-list-view-for-adding-or-deleting).  By selecting the _Application Version_ and going to the Task drop down, you can push a deployment on-demand.

### Roll Forward Incremental Deployments

You execute a roll forward or rollback deployment on-demand. To roll forward or rollback, go to the  [_Application_ List View](/userguide/2-defining-applications/#the-_application_-list-view-for-adding-or-deleting), select the new or older _Application Version_ you wish to deploy and use the _Deploy Task_ available from the Task Tab. This will push the selected version to the cluster incrementally.

## DeployHub Pro and Your Continuous Delivery (CD) Pipeline

DeployHub Pro is added to your CD pipeline to perform continuous configuration management of your _Applications_ and _Components_, and to push them to runtime _Environments_ across your defined pipeline. Learn more by reading the [CI/CD Chapter](/userguide/integrations/ci-cd_integrations/)


