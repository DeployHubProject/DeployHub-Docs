---
title: "Executing Deployments"
linkTitle: "Executing Deployments"
weight: 1
description: >
  Deploying Applications and Components.
---
## Executing Deployments

Deployments can be executed in the following ways with DeployHub:
- Calling the Deployment Engine
- Calling a _Custom Action_


## DeployHub Incremental Deployment Processing Overview
DeployHub deploys _Applications_ which are a collection of _Components_, and it does so incrementally. If a _Component_ is already running in an _Environment_, it is not re-released. This is how DeployHub independently deploys microservices. When DeployHub executes a deployment, it delivers the _Application's Components_ to an _Environment_ associated with one or more _Endpoints._ These _Endpoints_ represent the actual, container, physical, or virtual servers within an enterprise's data center.

Deployment processing is based on the deployment configuration of the _Component_.  When you execute a deployment, DeployHub will move the _Component_ from the source location to the target _Endpoint_. Default processing can be enhanced by _Actions_ that allow you to refine the way the deployment will occur. _Actions_ themselves contain _Procedures_, _Functions,_ and other _Actions_ which allow you to develop highly functioning and re-useable processes that can be shared across the _Domain_ to which they belong. For your microservice _Components_, you will use a _Custom Action_ that calls your Helm chart. 

## The Deployment Engines and Domains

The DeployHub Deployment engine does the heavy lifting of transferring _Components_ to _Endpoints_ and performing the installation logic.  The _Engine Hostname_ defaults to 'Default Engine', which tells DeployHub to use that deployment engine for that _Domain_ and _Sub-Domains_. The name can be changed to a different deployment engine if you want to use a unique deployment engine for large distributed deployments.  Multiple deployment engines can be used to distribute the deployment processing for large data centers with hundreds of physical _Endpoints._ 

Each _Domain_ can be assigned a unique deployment engine. From the [_Domain_ Details section](/userguide/first-steps/2-defining-domains/#_domain_-details) the _Engine Host Location_ refers to the engine to be used by the _Domain_.  You can install the deployment engine on separate host servers to distribute the workload across multiple host locations, and the high-level _Domains_ and child _Sub-domains_ can all have unique engines. For SaaS users  your reverse proxy is your deployment engine. 

## Executing Deployments with _Custom Actions_

You can choose to bypass DeployHub's deployment engine using a [_Custom Actions_](/userguide/customizations/2-define-your-actions/). This can be used to call other tools such as Helm, Ansible or a homegrown deploy script that does the heavy lifting of managing deployment logic. To use a _Custom Action_ you will [define your _Component_](/userguide/publishing-components/2-define-components/#viewing-and-editing-_components_-with-the-dashboard) to use a _Custom Action_. A _Custom Action_ is used by _Components_ to take over the normal process of a part of a deployment. When a _Custom Action_ is designated within an _Application_ or _Component_, any default Pre or Post-Action is ignored and not executed during the deployment. If a _Custom Action_ is used, it can use one or more DeployHub _Procedures_, _Functions_, and _Actions_, in a predetermined order.

NOTE: Custom Actions allow you to execute the existing one-off deployment scripts and can support an easy transition to using DeployHub.

{{% include "userguide/reusable/Tasks.md" %}}