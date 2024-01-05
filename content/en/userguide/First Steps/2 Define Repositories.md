---
title: "Connect Your Repositories"
linkTitle: "Connect Your Repositories"
weight: 5
description: >
  How to Connect _Repositories_ to retrieve artifacts. 
---

## Intro to Repositories

A _Repository_ is used by a _Component_. A _Repository_ acts as a source location for artifacts that will be deployed as _Components_. Each _Component_ contains a pointer to where an artifact is stored in a _Repository_ or on a file system. When DeployHub performs the pre-deployment steps, it retrieves the artifact from any location you specify. It pulls it from the _Repository_ and creates a deployment package at deployment run time. For this reason, it does not need to store the actual artifact in the DeployHub versioning engine. Each _Component_ is defined with a _Repository_ reference. Your _Repository_ can point to any type of repository such  as Git, GitHub, Quay or binary repository such as Maven. A _Repository_ can also reference a file system.

## Container Repositories

You do not need to define a _Repository_ if you only deploy containers. Containers are managed in "registries" which are handled differently than source code and file repositories. If you use a Container registry, DeployHub references this from within your Container _Component_ definition.  When you define your _Component_ as a "Container" _Component_ Type, you will enter the following container details:  

- container registry
- container image
- container digest
- container tag  

## Use the Repository List View for Adding and Deleting

The _Repository_ menu option is in the Setup menu on the left of the DeployHub main panel. Select the _Repository_ menu for a list of all _Repositories_ to which you have access. The Search bar, represented by a funnel icon, filters _Repositories_ based on Name or Domain.

The _Repository_ List View has the following Tabs:

| Tab     | Description                                                                                                                                              |
|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Refresh | Refreshes the browser.                                                                                                                                   |
| Add     | Allows you to Add a new _Repository_. Select from various pre-configured _Repository_ Types. Each Type will determine the Details for that _Repository_. |
| Delete  | Deletes the selected item.                                                                                                                               |

Double click on an item in the list to get the _Dashboard_ view.

## Use the Repository Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Repository_ Type.  Following are the _Repository_ Types supported out-of-the-box:

- HTTP
- File System (included as a default with override and append options enabled)
- OpenMake Meister (Build system with a binary repository)
- SVN
- Git (git repositories are treated as File System repositories). See [Git Repository](/userguide/first-steps/2-define-repositories/#git-_repository_-details) and [GitHub](/userguide/integrations/github/) for configuration steps.

### Common Details of all _Repositories_ Types

| Field                | Description                                                                     |
|----------------------|---------------------------------------------------------------------------------|
| **Full Domain Name** | The fully qualified name of the _Domain_ to which the _Repository_ was defined. |
| **Name**             | The Name of the _Repository_.                                                   |
| **Type**             | The _Repository_ Type chosen when you performed the Add.                        |
| **Owner Type**       | User or Group.                                                                  |
| **Owner**            | Name of the Owner.                                                              |
| **Summary**          | A description of the _Repository_.                                              |
| **Created**          | Auto-generated date when the _Repository_ was added.                            |
| **Modified**         | Auto-generated date when the _Repository_ was updated.                          |
| **Credential**       | The _Credential_ used to access the _Repository_ if required.                   |

## HTTP _Repository_ Details

| Field             | Description                                                              |
|-------------------|--------------------------------------------------------------------------|
| **URL**           | The Universal Resource Locator used to locate the HTTP repository.       |
| **URL Encrypted** | Select the box to indicate the URL should be hidden in the database.     |
| **URL Override**  | Select the box if the URL can be replaced at the _Component_ definition. |
| **Log File**|  The fully qualified file name to the logs from the HTTP get.
| **Log File Encrypted** | Select the box to indicate the Log File name should be hidden in the database.|
| **Log File Override** | Select the box if the Log File can be replaced at the _Component_ definition. |
|**Params** | Parameters used to invoke a RESTful API, allowing more detailed interaction with the HTTP Endpoint.|
| **Params Encrypted** | Select the box to indicate the Parameters should be hidden in the database.|
| **Params Override** | Select the box if the Parameters can be replaced at the _Component_ definition. |
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Port** | The port used to connect to the HTTP Endpoint.|
|**Port Encrypted** | Select the box to indicate the Port should be hidden in the database.|
|**Port Override** |Select the box if the Port can be replaced at the _Component_ definition.|
|**Endpoint** | The hostname of the HTTP Endpoint.|
|**Endpoint Encrypted** | Select the box to indicate the Endpoint should be hidden in the database.|
|**Endpoint Override** |Select the box if the Endpoint can be replaced at the _Component_ definition.|
|**Version** | Value optional. DeployHub will generate a Version number for the files extracted if no Version is entered. |
|**Version Encrypted** | Select the box to indicate the Version should be hidden in the database.|
|**Version Override** |Select the box if the Version can be replaced at the _Component_ definition.|

## File System _Repository_ Details

| Field                  | Description                                                                                                                                                                                                                                        |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Filepath**           | The fully qualified directory name to the files that will need to be deployed. These files must be on a file system that the DeployHub deployment engine has access to.                                                                            |
| **Filepath Encrypted** | Select the box to indicate the Filepath name should be hidden in the database.                                                                                                                                                                     |
| **Filepath Override**  | Select the box if the Filepath can be replaced at the _Component_ definition.                                                                                                                                                                      |
| **Pattern**            | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war.                                                                                                                                                |
| **Pattern Encrypted**  | Select the box to indicate the Pattern should be hidden in the database.                                                                                                                                                                           |
| **Pattern Override**   | Select the box if the Pattern can be replaced at the _Component_ definition.                                                                                                                                                                       |
| **Recursive**          | Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath.                                                                                                                  |
| **Recursive Override** | Select the box if the Recursive option can be replaced at the _Component_ definition.                                                                                                                                                              |
| **Version**            | Allows for the auto generation of a version number based on a template that you define. Enter the template with variables, such as V${buildnumber} to create your unique version number upon deployment. This is most commonly used with DMScript. |
| **Version Encrypted**  | Select the box to indicate the Version should be hidden in the database.                                                                                                                                                                           |
| **Version Override**   | Select the box if the Version can be replaced at the _Component_ definition.                                                                                                                                                                       |

## Git _Repository_ Details

You can configure DeployHub to call out to a Git Repo to pull deployable artifacts (binaries, scripts, etc.) as part of your deployment.  The process will check out your deployable artifacts based on commit, branch or tag specified. You will need to configure DeployHub with a file system DeployHub _Repository_ that will pull the files need for the deployment.  You will also need to create a "Git Checkout" _Procedure_ and _Action_.  

**Step 1 - Create a DeployHub File System _Repository_**

DeployHub can use Git as a binary repository for retrieving deployable objects as part of the deployment process.  To do this you will first need to define Git as a connected _Repository_ Object from within DeployHub. This connection will be used by as part of the deployment process using a _Procedure_ and a _Action_. For information on setting up File System as a binary repository see [Connect Your Repositories](/userguide/first-steps/2-define-repositories/).

Once you have completed this step, you are ready to create a new _Procedure_ that performs the check out from the Git repository.

**Step 2 - Create your Git Checkout _Procedure_ for your _Action_**

_Procedures_ are called by _Actions_ to execute deployment logic. A pre-defined DeployHub _Procedure__is available from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). This where you will find the most current version of this _Procedure_. For more information on creating_Procedures see [Functions and Procedures](/userguide/customizations/2-define-your-functions-and-procedures/).

From the Ortelius Git Repo, pull the file named **GitCheckout.re**

Once downloaded, you will need to Import it into DeployHub from the Func/Procs List View. Navigate to the List View by selecting the Func/Procs menu option on the left hand side of the DeployHub main panel. From the Func/Procs List view select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the GitCheckout.re file.  Next, select your _Domain_ and upload the _Procedure_ into the DeployHub. You are now ready to create your _Action_.

**Step 3 - Create your _Action_ for the GitHub Checkout _Procedure_**

Once you have imported your GitCheckout.re _Procedure_, you can define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the DeployHub main panel. Use the +Add option to create a new _Action_ for you _Procedure_. Name the new _Action_ **GitCheckAction** (no spaces). See [Customize Your Actions](/userguide/customizations/2-define-your-actions/) for more information on creating _Actions_.

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the GitCheckOut _Procedure_. Drag it onto the area under _Start._ A pop-up dialog box will open for you to complete the following parameters:

_GitCheckout_ Parameters

| **Field**      | Value        | Description                                                                                                                                                                                     |
|----------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Title**      | Not Required | Name of the step in your deployment workflow. Use "Git Checkout."                                                                                                                               |
| **Summary**    | Not Required | Enter a summary of this step.                                                                                                                                                                   |
| **Git Repo**   | $GIT_URL     | This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level.                                                                    |
| **Git Commit** | $GIT_COMMIT  | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.                                                                       |
| **To Dir**     | $GIT_DIR     | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

At this point the _Action_ is ready to be used by anyone with access (based on _Domain_ and _Group_ options).
Note: Because this _Action_ is reusable, no _Component_ variables are defined. This is performed at the _Component_ level.

**Step 4 - Assign the GitCheckoutAction to your _Component_ to be deployed**

For each _Component_ you will need to define the variable values for $GIT_URL, $GIT_COMMIT and $GIT_DIR that the GitCheckoutAction will use at the_Component_ level. The values will be passed to the GitCheckoutAction at deploy time. See [Defining _Components_](/userguide/publishing-components/2-define-components/) for more information.

**Step 5 - Set Your _Component_ Attributes_**

The following variables must be added to the Attributes Section for all  _Components_ using the GitCheckoutAction _Pre Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name  | Value Description                                                                                                                                                                               |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GIT_URL**    | This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level.                                                                    |
| **GIT_COMMIT** | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.                                                                       |
| **GIT_DIR**    | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

{{% include "/userguide/reusable/OpenMake Meister.md/" %}}

{{% include "/userguide/reusable/SVN.md/" %}}

## Repository Access Controls

The Access Section allows _Users_ within designated _Groups_ to update the _Repository_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Repository_ in the following ways:

| Access               | Description                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| **View**             | If a _User_ belongs to a _UserGroup_ in the View Access list for the this _Repository_, the _Repository_ will be visible. |
| **Change**           | This allows a _User_ who belongs to any _UserGroup_ in the list to change the attributes of the _Repository_.             |
| **Check-out Access** | Allows Users to check out files from the _Repository_. This is inherited from the Read Access of the parent _Domain_.     |
| **Check-in Access**  | Allows Users to check in files to the _Repository_. This is inherited from the Write Access of the parent _Domain_.       |

{{% include "userguide/reusable/AuditTrail.md" %}}
