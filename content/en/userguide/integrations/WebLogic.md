---
title: "Weblogic"
linkTitle: "Weblogic"
weight: 76
description: >
  Executing deployments requiring a Weblogic Server.
---

## Introduction to the WebLogic DeployHub Integration

The DeployHub WebLogic integration supports a WebLogic deployment using a _Post Action_ at the _Component_ level. This _Post Action_  installs your WebLogic solution binaries (.ear, .jar, and .war files) by loading them into the correct WebLogic target.  The process will first send your solution binaries to the the WebLogic Server. The _Post Action_ performs the load into the target.

## Creating the Weblogic Action

This process involves the creation of custom _Procedures_ and a _Post Action_.  For more information on creating _Procedures_ and _Actions_ see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)



Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.




**Step 1 - Download and Import the WebLogic scripts as _Procedures_**

Download the the most current DeployHub WebLogic Procedures from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). There will be two:

- **WeblogicCredential.re** - This _Procedure_ exposes the credential for the Weblogic Deploy _Procedure_.

- **WeblogicDeploy.re** - This Procedure executes Ant against a dynamically created build.xml file to upload the classes to Weblogic.

**Step 2 - Create your WebLogic _Procedures_**

Once downloaded, you will need to Import the scripts into DeployHub as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the DeployHub Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the WeblogicCredential.re and WeblogicDeploy.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into DeployHub. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

**Step 3 - Create your _Action_ for the WebLogic _Procedure_**

Once you have imported your WeblogicCredential.re and WeblogicDeploy.re files as _Procedures_, you can define your WebLogic _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the DeployHub Main Menu panel.  

Use the +Add option to create your new _Action_.  In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new Action "WeblogicDeployAction" (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the WeblogicCredential.re and WeblogicDeploy.re imported _Procedures_.  Drag them onto the area under "Start". When you drag the WeblogicCredential.re and WeblogicDeploy.re  _Procedures_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters. 

The order should be _WeblogicCredential_, and then _WeblogicDeploy_.



At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Post Action field_ of a _Component_ as part of an _Application_ deployed to a Weblogic region.

### _WeblogicCredential_ Parameters

| Argument | Description |
|--- | --- |
| **Credential Name** | Name of the Credential to use for the Weblogic Deployment |

### _WeblogicDeploy_ Parameters

| Argument | Description |
|--- | --- |
| **AdminUrl** | Admin url for performing deployment on|
| **WeblogicHome** | Home directory for Weblogic |
| **UserName** | Weblogic user name |
| **Password** | Weblogic password |
| **Id** | Task identifier of a running deployment task |
| **UserConfigFile** | Config file to use |
| **Action** | Action to perform |
| **Name** | Name of the application |
| **Targets** | Targets to perform deployment on |
| **Plan** | Deployment plan to use |
| **Library** | dentifies the deployment as a shared J2EE library or optional package |
| Source | Archive to deploy |

Note: the WeblogicCredential _Procedure_ can be left out of the Workspace if the WeblogicDeploy _Procedure's_ username and password fields will be used to access the Weblogic server. Otherwise the selected Credential within the WeblogicCredential Procedure should contain the appropriate username and password.

Place the _Action_ within the _Application's Post Action_ field. The _Application_ should contain one or more _Components_ that have one or more _Component__Items_ that reference the artifacts that make up the Weblogic application. The _Application_ deploys its artifacts to the Weblogic server, and the Post _Action_ performs the installation.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
