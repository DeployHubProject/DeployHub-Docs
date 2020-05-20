---
title: "GitHub"
linkTitle: "GitHub"
weight: 62
---
## GitHub

DeployHub supports GitHub in three ways.

1. Repository for artifacts which can be any type of object such as binaries or Python scripts.
2. GitHub Issue Tracking for **DeployHub Pro**. A bridge connects a GitHub issue with a DeployHub Change Request.
3. Wiki updates for collaborating DeployHub output.

## GitHub Repository Connection

GitHub can store any type of object in its Repository. These objects are referenced through Git Commits, Tags, and Branches. DeployHub performs a check-out of these objects as part of the Pre-Actions to a Component Version or Application Version. This Git Check-out places the files into the DropZone for pre-processing prior to the deployment.

Using the GitHub Repository requires a two-step process. First is the Git checkout to the file system and second references the checked-out files using the _File System Repository_. The git checkout is done using the GitCheckOutAction as a Pre-Action to the Component. This then places the files so that the File System Repository will reference them for deployment.

## GitCheckOutAction Properties

| Field | Description |
| --- | --- |
| Git Repo | URL to the Git Repo. |
| Git Commit | Git Commit to be checked out. |
| To Dir | Directory where the files will be checked out to. |

## Connecting GitHub to DeployHub Pro

**DeployHub Pro** can reference the GitHub issues for a particular GitHub _Repository_. Typically, a _Component_ can only be associated to a single GitHub _Repository_. In **DeployHub Pro,** you can associate issues to a Component Version or Application Version. This enables the GitHub issues to be viewed from a Component or Application using the **DeployHub Pro** Change Request tab. If you have a Release defined, these GitHub issues will be rolled up from the Component and Application to the Release.

To associate your GitHub Repository with **DeployHub Pro** you need to define a _Data Source_ connection with the _Type_ of "GitHub." This is done from the _Connections_ Menu under the _Data Source_ tab. Right click on your Domain name and select "New Data Source in this Domain." Complete the following fields:

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

From the _Deploy_ Menu, select the Component or Application from the selection tree on the left side. Go the _Change Request_ tab and use the plus (+) on the upper right-hand corner to bring up a list of all open GitHub issues for the associated GitHub Repository. Select the issues to be assigned to your Component or Application and select OK.

## GitHub Wiki and DeployHub

The GitHub Wiki page can be used to consolidate deployment output using both DeployHub Team and Pro. The GitHub Wiki is implemented as a Git Repository. Because of this, DeployHub can check-out the Wiki, update the contents, and commit the changes. The Wiki is processed as part of the deployment Workflow. To add the Wiki updates, you define a Post Action to the Application. Your Post Action calls an external script that updates and commits the Wiki. You will need to create the external script.
