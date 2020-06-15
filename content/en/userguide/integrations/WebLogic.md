---
title: "Weblogic"
linkTitle: "Weblogic"
weight: 76
description: >
  Executing deployments requiring a Weblogic Server.
---

A DeployHub deployment can point to one or more _Repositories_ with artifacts (.ear, .jar, and .war files) making up a Weblogic application. These are referenced by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. These are deployed into a Weblogic server domain. A (Post) _Action_ is then executed which installs these artifacts into the Weblogic server.

## Creating the Weblogic Action

### Importing the Procedures

 You will need to import the most current WeblogicCredential and WeblogicDeploy _Procedures_ from GitHub.

- **WeblogicCredential.re** - This _Procedure_ exposes the credential for the Weblogic Deploy _Procedure_

- **WeblogicDeploy.re** - This Procedure executes Ant against a dymanically created build.xml file to upload the classes to Weblogic.

Download them from:

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.

## New Action for the Weblogic

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "WeblogicDeployAction" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the two Procedures. Drag them onto the area under _Start._   The order should be _WeblogicCredential_, and _WeblogicDeploy_.

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Post Action field_ of a _Component_ as part of an _Application_ deployed to a Weblogic region.

### _WeblogicCredential_ Parameters

| Argument | Description |
|--- | --- |
| Credential Name | Name of the Credential to use for the Weblogic Deployment |

### _WeblogicDeploy_ Parameters

| Argument | Description |
|--- | --- |
| AdminUrl | Admin url for performing deployment on|
| WeblogicHome | Home directory for Weblogic |
| UserName | Weblogic user name |
| Password | Weblogic password |
| Id | Task identifier of a running deployment task |
| UserConfigFile | Config file to use |
| Action | Action to perform |
| Name | Name of the application |
| Targets | Targets to perform deployment on |
| Plan | Deployment plan to use |
| Library | dentifies the deployment as a shared J2EE library or optional package |
| Source | Archive to deploy |

Note: the WeblogicCredential _Procedure_ can be left out of the Workspace if the WeblogicDeploy _Procedure's_ username and password fields will be used to access the Weblogic server. Otherwise the selected Credential within the WeblogicCredential Procedure should contain the appropriate username and password.

Place the _Action_ within the _Application's Post Action_ field. The _Application_ should contain one or more _Components_ that have one or more _Component__Items_ that reference the artifacts that make up the Weblogic application. The _Application_ deploys its artifacts to the Weblogic server, and the Post _Action_ performs the installation.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
