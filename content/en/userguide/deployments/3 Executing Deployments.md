---
title: "Executing Deployments"
linkTitle: "Executing Deployments"
weight: 1
---
## Executing Deployments

Deployments deliver _Applications_ to an _Environment_ associated with one or more _Endpoints._ These _Endpoints_ represent the actual, container, physical, or virtual servers within an enterprise&#39;s data center. There are four objects deployed to an _Environment:_

- **Application Base Version:** A collection of _Component Versions_. These are collections of _Component Items_, referencing files within a _Repository_ copied to an _Endpoint_ or are the scripts copied to an _Endpoint_ and/or executed against an _Endpoint&#39;s_ operating system or database.

- **Application Version:** This is when the original has been changed by adding, removing, and/or changing _Component Versions_.

- **Release Base Version** : (Only available in DeployHub Pro) A collection of _Application Base Versions_ and/or _Application Versions_. This provides a way to organize and deploy several different _Application Versions_ into an _Environment_.

- **Release Version:** (Only available in DeployHub Pro) This is a copy of a _Release Base Version_ which has been changed by adding, removing, and/or changing an _Application Base Version_ or _Application Versions_ from the original.

For the sake of simplicity, these objects are _Component Base Versions_ and _Component Versions_, without the words &#39;Base Version&#39; or &#39;Version&#39;, since they all behave the same and have the same attributes.

Deployment processing defaults to the configuration of the _Component Item_. This is the source location where the files and scripts reside, and the target _Endpoint_ to which the files will be deployed. When you execute a deployment, DeployHub will move the files within _Component Items_ from the source location to the target _Endpoint_. Default processing can be enhanced by _Actions_ that allow you to refine the way the deployment will occur. _Actions_ themselves contain _Procedures_, _Functions,_ and other _Actions_ which allow you to develop highly functioning and re-useable processes that can be shared across the _Domain (or Life Cycle Sub-Domain_) to which they belong.

## Executing Deployments with an External Script

You can choose to bypass DeployHub&#39;s deployment processing using a _Custom Action_. This can be used to call other tools such as Chef or Puppet to manage infrastructure updates. A _Custom Action_ will call these types of external scripts. A _Custom Action_ is defined by placing the name of a DeployHub _Function, Procedure,_ or _Action_ with the name and location of the external script in the _Custom Action_ field of a _Component_ or _Application_.

A _Custom Action_ is used within _Applications_ and _Components_ to take over the normal process of a part of a deployment. When a _Custom Action_ is designated within an _Application_ or _Component_, any designated Pre or Post-Action is ignored and not executed during the deployment. Any file(s) designated within _Component Items_ belonging to the _Component_ are not deployed as they normally would be. When a _Custom Action_ is used, all deployment processing is handed over to the _Custom Action_. If a DeployHub _Procedure_ or _Action_ is used, the _Procedure_ or _Action_ is called, and control is then returned to DeployHub. If an _Action_ is used, it can use one or more DeployHub _Procedures_, _Functions_, and _Actions_, in a predetermined order.

A good use for a _Custom Action_ would be the installation of a commercially available or in-house software package that has been around for a while within the I.T. infrastructure, and the installation has been fine tuned to the point that a single executable can be called in order to install it. In this case, a DeployHub _Application_ could contain a _Component_ with a _Custom Action_ that calls the executable at the correct point within the deployment. The _Application_ itself could also contain the _Custom Action_, with no need to involve _Components_. It all depends on the approach taken to perform a given deployment. An _Action_ can contain all the logic to remain within a loop and check for the presence of a condition that signals the installation is complete (i.e., a file exists within a given directory) before moving on the next step of the deployment.

NOTE: Custom Actions allow you to execute the existing one-off deployment scripts and can support an easy transition to using DeployHub.

DeployHub supports on-demand deployments and scheduled deployments using the _Environment&#39;s_ Calendar. You can also perform a pre-flight check of each deployment.
