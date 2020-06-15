---
title: "GitHub"
linkTitle: "GitHub"
weight: 62
description: >
  Integrating GitHub repository and issues with DeployHub Pro.
---

DeployHub supports GitHub in three ways.

1. Repository for artifacts which can be any type of object such as binaries or Python scripts.
2. GitHub Issue Tracking for **DeployHub Pro**. A bridge connects a GitHub issue with a DeployHub Change Request.
3. Wiki updates for collaborating DeployHub output.

## GitHub Repository Connection

GitHub can store any type of object in its Repository. These objects are referenced through Git Commits, Tags, and Branches. DeployHub performs a check-out of these objects as part of the Pre-Actions to a Component Version or Application Version. This Git Check-out places the files into the DropZone for pre-processing prior to the deployment.

Using the GitHub Repository requires a two-step process. First is the Git checkout to the file system and second references the checked-out files using the _File System Repository_. The git checkout is done using the GitCheckOutAction as a Pre-Action to the Component. This then places the files so that the File System Repository will reference them for deployment.

## Creating the GitHub Checkout Action

### Importing the Procedures

 You will need to import the most current Git Procedure from GitHub.

- **GitCheckout.re** - This _Procedure_ clones the repo to the _Dropzone_ and then checks out the commit, branch or tag specified.

Download them from:

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.

## New Action for the GitHub Checkout

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "GitCheckAction" (no spaces).

Now we are going to customize this _Action_. You will see the 'Activity Hub' on the Righthand side of your screen. Navigate to your Domain to find the _Procedures_. Drag them onto the area under _Start._

### _GitCheckout_ Parameters

| _**Field**_ | Value | Description |
| --- | --- | --- |
| _**Title**_ | Not Required |
 |
| _**Summary**_ | Not Required |
 |
| _**Git Repo**_ | $GIT_URL| Repo containing the Playbook |
| _**Git Commit**_ | $GIT_COMMIT | The commit, tag or branch to checkout |
| _**To Dir**_ | $GIT_DIR | The directory to checkout into.  Use "." for the default directory |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values. Because this new Action is reusable, no Component variables are defined.

### Assign the _GitCheckoutAction_ to a Component

For each _File Component_ you will need to define the variable values. These values will override those defined at the _Application_ or _Environment_ level. The values from DeployHub will be passed along to the GitCheckoutAction__ at execution time.

## GitHub Issues in DeployHub Pro

DeployHub Pro can reference the GitHub issues for a particular GitHub _Repository_. _Components_ can only be associated to a single GitHub _Repository_. In DeployHub Pro, you can associate issues to a _Component Version_ or _Application Version_. This enables the GitHub issues to be viewed from a _Component_ or _Application_ using the DeployHub Pro _Change Request_ tab. If you have a _Release_ defined, these GitHub issues will be rolled up from the _Component_ and _Application_ to the _Release_.

To associate your GitHub Repository with DeployHub Pro you need to define a _Data Source_ connection with the _Type_ of "GitHub." This is done from the _Connections_ Menu under the _Data Source_ tab. Right click on your Domain name and select "New Data Source in this Domain." Complete the following fields:

## GitHub Data Source Connection General Tab

| Field | Description |
| --- | --- |
| Name | Enter a unique name for the Data Source. |
| Type | Select "GitHub. |
| Owner Type | Select User or Group who will be the owner of the Data Source (Group Ownership or User Ownership). |
| Users/Group | Select the Group or Users that will be the owner. |
| Summary | Describe the Data Source. |
| Credentials | Select the Credentials needed for accessing the GitHub Repository. NOTE: You must create your Credentials from the Credentials tab under the Connections menu.
 |

Once completed, you need to select the Properties tab and click on the Plus (+) sign to add the following properties:

## GitHub Data Source Properties

| Field | Description |
| --- | --- |
| Product | The name of your Repository. |
| Repository | The name of your Repository Owner. |

You are now ready to associate your GitHub issues with your DeployHub Pro Components and/or Applications.

## Selecting a GitHub Issue to a Component or Application

Use the _Change Request_ section at the bottom of a _Component_ or _Application_ details screen to add and delete GitHub issues.

## GitHub Wiki and DeployHub

The GitHub Wiki page can be used to consolidate deployment output using both DeployHub Team and Pro. The GitHub Wiki is implemented as a Git Repository. Because of this, DeployHub can check-out the Wiki, update the contents, and commit the changes. The Wiki is processed as part of the deployment Workflow. To add the Wiki updates, you define a Post Action to the Application. Your Post Action calls an external script that updates and commits the Wiki. You will need to create the external script.

For more information:

- [Managing DataSorces](userguide/customizations/2-data-sources/)
- [Connect Your Repositories](userguide/first-steps/2-define-repositories/)
