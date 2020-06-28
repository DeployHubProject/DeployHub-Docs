---
title: "Executing Deployments"
linkTitle: "Executing Deployments"
weight: 6
description: >
  Deploying _Applications_ and _Components_.
---

## The DeployHub Deployment Engine and Incremental Processing

DeployHub uses a deployment engine to perform the push of deployments across your [_Environments_](/userguide/first-steps/2-define-environments/).  For SaaS users, your reverse proxy is your deployment engine.  For on premise installations, your deployment engine is installed as part of your DeployHub installation. The deployment engine is called when a deployment is initiated. The job of the deployment engine is to do the decision making about what [_Components_](/userguide/publishing-components/intro-to-components/) need to be released, and what processing logic is required.  Deployment processing is based on the deployment configuration of the _Component_. DeployHub deploys _Applications_ which are a collection of _Components_, on an increment basis. If a _Component_ is already running in an _Environment_, it is not re-released. This is how DeployHub independently deploys microservices, and handles roll forward or rollback logic.  DeployHub uses a backend version control engine to achieve incremental deployments, forward or backward.  

### Roll Forward or Rollback

Whenever a deployment has a problem, DeployHub can provide a fast and safe repair with Roll Forward and Rollback of an _Application_ using _Components_. Roll Forward or Rollback allows DeployHub to apply _Components_ to _Endpoints_ incrementally and in order. As DeployHub interrogates its versioning engine for each _Application Version_, the associated _Components_ are advanced to a new version, or replaced with a previous version to handle the Roll Forward or Rollback conditions.

### Configuring Deployment Logic

DeployHub uses either the default [_Action_](/userguide/customizations/2-define-your-actions/) or _Custom Actions_ (i.e., Helm, Ansible, external script) to handle the deployment processing of your _Application_ and _Components_.  For most deployments, no customization is required and is easily supported with the default _Actions_. When a _Custom Action_ is used, it relys on an external process to manage the deployment processing.

**Executing Deployments with the Default _Actions_**

 When you execute a deployment, DeployHub will call a default _Action_ to push the _Component_ from the source location to the target _Endpoint_. You can customize the deployment process by writing your own _Actions_ that allow you to refine the way the deployment processing will occur. _Actions_ themselves contain [_Procedures_, _Functions,_](/userguide/customizations/2-define-your-functions-and-procedures/) and other _Actions_ which allow you to develop highly functioning and re-useable processes that can be shared across the _Domain_ to which they belong. For most users, no modifications to the default _Actions_ are required. For your microservice _Components_ you will use a _Custom Action_ that calls your Helm chart.

**Executing Deployments with _Custom Actions_**

_Custom Actions_ allow you to execute existing one-off deployment scripts and can support an easy transition to using DeployHub. You can choose to bypass DeployHub's default _Actions_ using a pre-defined our newly created [_Custom Action_](/userguide/customizations/2-define-your-actions/). This can be used to call other tools such as Helm, Ansible or a homegrown deploy script that does the heavy lifting of managing deployment logic. To use a _Custom Action_ you will [define your _Component_](/userguide/publishing-components/2-define-components/#viewing-and-editing-_components_-with-the-dashboard) with the _Custom Action_ that will take over the normal deployment processing. When a _Custom Action_ is designated within an _Application_ or _Component_, any default Pre or Post _Action_ is ignored and not executed during the deployment. If a _Custom Action_ is used, it can use one or more DeployHub _Procedures_, _Functions_, and _Actions_, in a predetermined order.

### Distributed Deployments for Traditional Data Centers

For large distributed traditional data centers you can install multiple deployment engines and assign them to specific Project _Domains_ to handle large 'fan out' deployment processing. Multiple deployment engines can be used to distribute the deployment processing for large data centers with thousands of physical _Endpoints_, but is not required for a modern Kubernetes architecture. You can change the deployment engine at the [_Domain_ Details section](/userguide/first-steps/2-defining-domains/#_domain_-details) using the _Engine Hostname_ Detail field. This field tells DeployHub which engine to use for deployments in that _Domain_. If you need to implement multiple deployment engines for large distributed deployments, contact our [Support Team](/userguide/installation-and-support/0-contactsupport/). They can provide you a link to download an installer that includes only the deployment engine and not the full DeployHub install. You would use this installer to build out separate deployment engines that are then defined to the _Domain_ allowing each _Application_ to have its own engine.

## Executing Deployments

Deployments can be executed:

- On Demand
- With Roll Forward or Rollback
- Scheduled via the Calendar
- Automated from Continuous Delivery

### Executing Deployments On-demand

An on-demand deployment can be initiated for an _Application_ or _Release_ using a _Deploy Task_. Once the _Deploy Task_ has been defined in the _Domain_, it will be available from the [_Application_ List View](/userguide/packaging-applications/2-defining-applications/#the-_application_-list-view-for-adding-or-deleting).  By selecting the _Application Version_ and going to the Task drop down, you can push a deployment on-demand.

### Roll Forward Incremental Deployments

You execute a roll forward or rollback deployment on-demand. To roll forward or rollback, go to the  [_Application_ List View](/userguide/packaging-applications/2-defining-applications/#the-_application_-list-view-for-adding-or-deleting), select the new or older _Application Version_ you wish to deploy and use the _Deploy Task_ available from the Task Tab. This will push the selected version to the cluster incrementally.

## DeployHub and Your Continuous Delivery (CD) Pipeline

DeployHub is added to your CD pipeline to perform continuous configuration management of your _Applications_ and _Components_, and to push them to runtime _Environments_ across your defined lifecycle.

DeployHub uses a built-in deployment pipeline for tracking an _Application's_ journey across a software delivery lifecycle, i.e. Dev, Test, Production. However, it is important to understand that a DeployHub Lifecycle _Subdomain_ is not intended to replace your CD orchestration solution. DeployHub integrates with your CD pipeline becoming a part of your overall ecosystem for versioning, tracking and deploying software to clusters, cloud environments and physical data centers.

DeployHub tracks an _Application's_ configuration including where it is in the lifecycle in terms of _Environments_.  An _Environment_ is assigned to a lifecycle _Subdomain_. Therefore, we can track where a _Component_ or _Application_ is in the lifecycle based on where it has been installed. Each Lifecycle _Subdomain_ can contain multiple _Environments_. Regardless of what _Environment_ an _Application_ is running in, DeployHub can still track where it is in the Lifecycle process based on the Lifecycle _Subdomain_. This is the core function of Lifecycle _Subdomains_.

A Lifecycle _Subdomain_ is the lowest level _Domain_.  You can not create a _Subdomain_ off of a Lifecycle _Subdomain_.  

### Using a Lifecycle Subdomain

When you create a Lifecycle Subdomain, you provide a means to include lifecycle state information as part of your _Application's_ configuration. For each state of your software delivery lifecycle, you create an associated Lifecycle _Subdomain_ for your _Application_. You do this by using the _Domain_ Dashboard. Navigate to your _Application's_ _Domain_, select the  "All _Subdomains_ are Lifecycles" checkbox, and then add your child _Subdomains_.  All _Subdomains_ will represent your Lifecycle process. You will need to navigate to the _Environment_ Dashboard to add the _Environments_ to your Lifecycle _Subdomains_.

### Establishing the Progression Order of Your Lifecycle

You can force the progression of your lifecycle process by adding a "Move" Task to the lifecycle _Subdomain_.  At the "Move" Task level, you define what Lifecycle _Subdomain_ will be the next state (the "move to _Domain_). This is how DeployHub clearly defines the order of how an _Application_ should progress through the lifecycle, i.e. first development, then test, and finally production. A "Move" Task does not perform a deployment, it just stages the _Application_ for a deployment into the _Environments_ associated with that Lifecycle _Subdomain.

To deploy an _Application_ into an _Environment_ make sure that the Deploy Task is assigned to the _Domain_.  The Deploy Task is the default Task for all newly created _Domains.  

### Your Lifecycle _Subdomains_ and your Continuous Delivery Engine

Your continuous delivery (CD) engine will define your lifecycle progression.  When you integrate DeployHub into your existing CD Pipeline, you will need to define your Lifecycle _Subdomains_ to mimic your CD Workflow progression. You can then associate integration of each of your CD Workflows directly to a DeployHub Lifecycle _Subdomain_. You can perform calls to DeployHub to both "Move" and "Deploy" _Applications_ into _Environments_.  If you are a DeployHub Pro users, you can also call "Request" and "Approve" Tasks as part of your integration. These Tasks interact with DeployHub Pro "Smart" calendars, not available in DeployHub Team. See [Using DeployHub with CI/CD](/userguide/integrations/CI-CD_Integrations.md) for more information on connecting your CI/CD solution to DeployHub.

{{% include "userguide/reusable/Tasks.md" %}}
