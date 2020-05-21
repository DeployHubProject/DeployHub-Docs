---
title: "Executing Deployments"
linkTitle: "Executing Deployments"
weight: 1
description: >
  Deploying Applications and Components.
---
## Executing Deployments

DeployHub deploys _Applications_ which are a collection of _Components_, and it does so incrementally. If a _Component_ is already running in an Environment, it is not re-released. This is how DeployHub independently deploys microservices to clusters. When DeployHub executes a deployment, it delivers the  _Application's Components_ to an _Environment_ associated with one or more _Endpoints._ These _Endpoints_ represent the actual, container, physical, or virtual servers within an enterprise's data center.

Deployment processing defaults to the configuration of the _Component_. This is the source location where the files and scripts reside, and the target _Endpoint_ to which the files will be deployed. When you execute a deployment, DeployHub will move the files within _Component_ from the source location to the target _Endpoint_. Default processing can be enhanced by _Actions_ that allow you to refine the way the deployment will occur. _Actions_ themselves contain _Procedures_, _Functions,_ and other _Actions_ which allow you to develop highly functioning and re-useable processes that can be shared across the _Domain to which they belong.

## Executing Deployments with an External Script

You can choose to bypass DeployHub's deployment processing using a _Custom Actions_. This can be used to call other tools such as Helm or a custom script to manage the deployment logic. A _Custom Action_ will call these types of external scripts. A _Custom Action_ is defined by placing the name of a DeployHub _Function, Procedure,_ or _Action_ with the name and location of the external script in the _Custom Action_ field of a _Component_ or _Application_.

A _Custom Action_ is used within _Applications_ and _Components_ to take over the normal process of a part of a deployment. When a _Custom Action_ is designated within an _Application_ or _Component_, any designated Pre or Post-Action is ignored and not executed during the deployment. Any file(s) designated within _Component_ belonging to the _Component_ are not deployed as they normally would be. When a _Custom Action_ is used, all deployment processing is handed over to the _Custom Action_. If a DeployHub _Procedure_ or _Action_ is used, the _Procedure_ or _Action_ is called, and control is then returned to DeployHub. If an _Action_ is used, it can use one or more DeployHub _Procedures_, _Functions_, and _Actions_, in a predetermined order.

A good use for a _Custom Action_ would be the installation of a commercially available or in-house software package that has been around for a while within the I.T. infrastructure, and the installation has been fine tuned to the point that a single executable can be called in order to install it. In this case, a DeployHub _Application_ could contain a _Component_ with a _Custom Action_ that calls the executable at the correct point within the deployment. The _Application_ itself could also contain the _Custom Action_, with no need to involve _Components_. It all depends on the approach taken to perform a given deployment. An _Action_ can contain all the logic to remain within a loop and check for the presence of a condition that signals the installation is complete (i.e., a file exists within a given directory) before moving on the next step of the deployment.

NOTE: Custom Actions allow you to execute the existing one-off deployment scripts and can support an easy transition to using DeployHub.

## Deployment Engines and Domains

Deployment engines do the heavy lifting of transferring files to _Endpoints_ and performing the installation logic.

- For On-Premises Users - The _Engine Hostname_ field defaults to 'Default Engine', which tells DeployHub to use that deployment engine for that _Domain_ and _Sub-Domain_, unless defined at the _Sub-Domain_ level. The name can be changed to a different deployment engine.
- For SaaS users - your reverse proxy runs your deployment engine. If you need multiple deployment engines, contact support for the installers.

Multiple deployment engines can be used to distribute the deployment processing for large data centers with hundreds of _Endpoints._ Each _Domain_ can be assigned a unique deployment engine. From the _Domain__General_ tab, the _Engine Host Location_ refers to the location of the process that executes the deployment's installation activities_._ You can install the deployment engineon separate host servers to distribute the workload across multiple host locations, and the high-level _Domains_ and child _Sub-Domains_ can all have unique engines. All deployments to the _Environments_ defined to the _Domain_ and its _Sub-Domains_ will be processed by the host engine defined at that level.
