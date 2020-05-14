---
title: "DeployHub Architecture"
linkTitle: "DeployHub Architecture"
weight: 6
---

## DeployHub Architecture

DeployHub includes a central engine that can be installed locally or accessed via the SaaS offering via a reverse proxy. The central engine connects to external repositories, CD engines, DevOps tools, data sources, transfer protocols and notification tools. DeployHub&#39;s open architecture allows you to plug-in the tool set you use to define your release configurations.

![Architecture](/userguide/concepts/Architecture.png)

## Reverse Proxy and SaaS

If you are a SaaS customer, a &#39;one-way&#39; reverse proxy is used on your side of the firewall. The reverse proxy can be timed to submit request for deployments based on the installation parameters.

![SaaS Architecture](/userguide/concepts/ReverseProxy.png)

## Deployments with Custom Actions for Cloud Native Releases

DeployHub integrates with external deployment solutions such as Helm to perform the actual movement of containers to a cluster. When a _Custom Action_ is used, the internal deployment engine is bypassed. This is the easiest way to perform an update to your cluster.

## The DeployHub Engine for Monolithic Releases and Database Updates

DeployHub includes its own deployment engine for managing monolithic deployments and database updates. The DeployHub engines moves files and scripts from source _Repositories_ to a target _Environment_ which contains one or more _Endpoints_. This is performed via _Releases_ or _Applications_, which contain _Components_. _Components_ each reference a Repository, whose files and scripts are placed into a Dropzone. Customized _Actions_ can be used to manipulate the files (edit, delete, etc.) within the Dropzone before being deployed, in a predetermined order, to every _Endpoint_ within the _Environment_. A _Release_ is a collection of _Applications._

DeployHub performs all deployments in an Agentless mode. No remote agents need be installed on the target _Endpoint_ to execute deployments.

A _DropZone_ is created for each _Component_ during a deployment. Files from the various _Component Items_ within the _Component_ are placed into the _DropZone_. After all of the _Component Items_ have been processed for the _Component_, the files within the _DropZone_ are deployed to the _Endpoints_ within the selected _Environment_. The _DropZone_ is then deleted. Another _DropZone_ is created for the next _Component_, until all _Components_ have been deployed for the _Application_. The next _Application_ version is deployed, and the process starts all over again.

DeployHub uses ftp, ftps, sftp, or Windows protocol to transfer files. When a deployment is executed, DeployHub performs the following steps:

1. The first _Application_ is moved onto the stack. Any Pre-Action for the _Application_ will be executed at this point.

1. The first _Component_ is moved onto the stack.

1. A _DropZone_ is created for the Component.

1. The first _Component Item_ for the current _Component_ is processed. Files from the _Repository_ referenced by the _Component Item_ are placed into the _DropZone_. This continues until all the files from all the _Component Items_ are placed there.

1. A Pre-Action for the _Component_ is performed with usually one or more scripts to manipulate files within the _DropZone_ before deploying them.

1. The _DropZone_ files are placed into every _Endpoint_ within the _Environment_ where the _Endpoint_ type is the same as the _Component_ type. Keep in mind that a _Component_ can have only one type and an _Endpoint_ can have many types.

1. A Post-Action for the _Component_ is performed for cleanup or additional manipulation of files. It is run against every _Endpoint_ with the same _Component Type_ as the _Component_.

1. If there are more _Components_, steps 2 through 7 are performed again after a new _DropZone_ is created.

1. Pre and Post processing _Actions_ defined in the _Application_ or _Release_ are performed on each of the target _Endpoints_ in the _Environments_. Any errors found at the delivery level are logged and may fail the deployment. All logs are reported back to DeployHub and recorded in the History Tab for each _Application_ or _Release_.

NOTE: A successful Deployment email template will notify recipients when the deployment proceeds normally. Exceptions cause the deployment to be marked as 'failed.' The Failed Deployment Email Template assigned to the _Application_ will notify recipients of that failure. Various problems, such as a missing directory on a filesystem _Repository_ type, or an operating system error which prevents the creation of a _DropZone_ directory, will result in a failure. Missing files, conversely, would not necessarily cause a failure since DeployHub has no way of knowing whether the files are supposed to be there or not. Under these circumstances, Post-Actions that have been assigned to the _Components_ could be designed, among other things, to verify what has been deployed. An Abort could be issued from within a Post-Action, which would cause the deployment to be marked as &#39;failed&#39;.

NOTE: The Base Directory for a _Component_ can either be absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., in which case it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory,

For example: &#39;c:\main\SomeFiles\SomeMoreFiles&#39;. If the _Component_ Target Directory has a value, it is always appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_.

The following diagram shows how the deployment process within DeployHub works:

![Deployment Process](/userguide/concepts/ProcessFlow.jpg)
