---
title: "WebSphere"
linkTitle: "WebSphere"
weight: 78
description: >
  Executing deployments requiring a WebSphere Server.
---

A DeployHub deployment can point to one or more _Repositories_ which contain the artifacts (.ear, .jar, and .war files) that make up a WebSphere application. These are referenced in DeployHub by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. A _Post Action_ is then executed which deploys these artifacts into WebSphere. The user creates the _Action_, which itself contains _Procedures_. The Procedure defined to the _Action_ for a WebSphere deployment is called "WebSphereDeploy."

## Creating the WebSphere Action

## New Action for the WebSphere

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "WebSphereDeployAction" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the Procedures. Drag them onto the area under _Start._

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Post Action field_ of a _Component_ as part of an _Application_ deployed to a WebSphere region.

### _WebSphereDeploy_ Parameters

| Argument | Description |
|--- | --- |s
| AppName | Application name |
| EarFile | Name of the ear file |
| ServerName | Server name in the node |
| ContextRoot | Context Root for the application |
| NodeName | Name of the Node |
| CellName | Name of the Cell |
| ValidateInstall | Validate after deployment |
| PrecompileJsps | Precompile JSPs |
| MapToVirtualHost | Map application to virtual host |
| DistributeApp  | Distribute application to all nodes |
| UseMetadataFromBinary | Use metadata from archive |
| DeployEjb | Deploy the EJB |
| CreateMbeansForResource | Create the mbeans for the EJB |
| ReloadEnabled | Reload the application |
| DeployWs | Deploy WS |
| ProcessEmbeddedConfig | Process the config in archive |
| AllowDispatchRemoteInclude | Enable dispatch of remote include |
| AllowServiceRemoteInclude | Enable service to remove include |
| UseAutoLink | Use auto link |
| Tasks | Admin tasks to perform |

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
