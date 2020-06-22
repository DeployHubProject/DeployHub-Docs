---
title: "Defining Components"
linkTitle: "Defining Components"
weight: 2
description: >
  Publishing Components to Domains.
---

## The _Component_ List View for Adding or Deleting

Manage your _Components Base Version_ and _Component Versions_ to which you have access using the _Component_ List View accessible from the left hand _Component_ menu option.  There is a row for every _Environment_ where the _Component Base Version_ or _Component Version_ has been deployed.  For this reason, you will see multiple entries for the same _Component_ if it has been deployed to multiple _Environments_. You will be provided a list of all _Components_ organized by the following:

| List Column | Description|
|---|---|
|**Version**|  The _Component Base Version_ or _Component Version_ number. |
|**Domain**| The _Domain_ to which the _Component_ belongs.|
|**Parent**| The _Component Base Version_ from which the _Component Version_ was created. This will be empty for the _Component Base Version_.|
|**Environment**| The _Environment_ to which the _Component_ has been deployed. Each _Environment_ will represent a different row in the List View table.|
|**Last Deployment to Environment**| The Deployment Log number.|
|**Completed**|The date and time of the last deployment to the listed _Environment_.|
|**Results**| Success or Fail.|

Note: If you have not defined any _Components_ to DeployHub, you will see only the sample data.

You can also use the Filter bar, represented by a funnel icon, to reorder your _Component_ List View.  You can filter on:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

## Additional Tabs from the _Component_ List View

The _Component_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| +Add Base | Allows you to Add a new _Component Base Version_. You will select from one of three types: Container, Application File, Database |
| +Add Version | Creates a copy of the selected _Component_ in the list creating a new _Component Version_.  |
| Delete | Deletes the selected item. However, you must delete the _Components_ starting from the newest to the oldest.  The _Component Base Version_ would be deleted last. Sorting by "Version" gives you the order.  |
| List | Takes you back to the List View if you have been in the Map View. |
| Map | Displays a global Map of all _Component_ versions, with their _Application_ relationships.  |

## _Component_ Types

When adding new _Components_ you will select the type of _Component_ you want to create.  Select the _Component_ Type from the drop down list.  Options include:

| **Type** | **Description** |
| --- | --- |
| Container | For Containers such as Docker.  |
| Application File | For binary files such as .jar, .war, .ear, .exe, .dll, Linux executable files, Oracle Forms, or similar artifacts.   |
| Database | For SQL files such as .ddl or other database update scripts. |


## Viewing and Editing _Components_ with the Dashboard

_Components_ are defined as Container, Application File or Database.  These three definition types will address all of the different types of _Components_ you may need from microservices to binaries and DB updates. The Dashboard view displays all information related to a specific _Component Base Version_ or _Component Version_. Depending on what type of _Component_ you are defining, you will be presented with different data definition fields.

The following fields are common to all _Components_:

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified path of the _Domain_ that the _Component_ is to be associated, showing all parent _Domains_. |
| **Name** | The name of the _Component._ |
| **Owner Type** | Owned by a User or Group. |
| **Owner** | The owner of the _Component_, whose default value is the creator of the _Component_.  
| **Summary** | A short text field with a description of the _Component_. |
| **Created** | The date and time that the _Component_ was created. |
| **Modified** | The date and time of the last time the _Component_ was changed. |
| **Kind**| Populated based on the Type you selected, i.e. Container, Application File, Database.|
|**Endpoint Type** | Used to map the _Component_ to _Endpoints_ within an _Environment_ at deployment.  This allows DeployHub to map the _Component_ to the correct _Endpoint_ when moving across different environments. For example a database update is mapped to an _Endpoint_ with a database, or a container is mapped to an _Endpoint_ in Kubernetes. You can add your own _Endpoint_ Types from the Customize Types menu or select from the default options.|
| **Change Request Data Source** | This _Data Source_ assigned to the _Component_ for tracking Change Request. A Change Request Data Source must be pre-defined for this field to be used. |
| **Category** | Categories allow the selection of different Objects in an orderly manner. Assigning a Category to an Object allows lists of Objects based on Categories to be used throughout DeployHub. You can add a new Category by simply typing it into the entry field or use an existing Category displayed in the drop down. Categories are most commonly associated with _Actions_, _Functions_ and _Procedures_. Pre-defined Categories include: <li>Build - _Actions_, _Functions_ and _Procedures_ for calling ANT (SalesForce integration).</li><li>Database - _Actions_, _Functions_ and _Procedures_ for database updates.</li><li>Deploy-_Actions_, _Functions_ and _Procedures_ for Deployments.</li><li>Dropzone- _Actions_, _Functions_ and _Procedures_ for interacting with the Dropzone.</li><li>File Logic-_Actions_, _Functions_ and _Procedures_ related to File manipulation.</li><li>Flow Logic-_Actions_, _Functions_ and _Procedures_ for if then else in DMScrit.</li><li>Loops-_Actions_, _Functions_ and _Procedures_ for file looping.</li><li>General-Non-categorized Objects (default).</li><li>WebLogic-_Actions_, _Functions_ and _Procedures_ for deploying to WebLogic.</li><li>WebSphere-_Actions_, _Functions_ and _Procedures_ for deploying to WebSphere.</li><li>Windows-_Actions, Functions_ and _Procedures_ used for Windows deployments.</li>   |
| **Always Deploy** | The _Component_ is deployed to the associated _Endpoints_ in the _Target Environment_ regardless if the _Component_ is already present on the _Endpoints_. This is useful for monolithic applications where you want to copy over a binary for example.|
|**Deploy Sequentially** | Normally when a _Component_ in an _Application_ is deployed to several _Endpoints_ in an _Environment_, it is deployed to each _Endpoint_ at the same time (in parallel). The "Deploy Sequentially" option changes this behavior to force the _Component_ to deploy to each _Endpoint_ in turn, sequentially. |
| **Custom Action** | An _Action_ that replaces the usual Deployment Engine processing. Custom _Actions_ can be used to call Ansible, Helm or other external deployment tools.|


### Container Specific Data Definition

For deploying Containers _Components_, Helm is required.  DeployHub interfaces with Helm to support a Kubernetes Cluster deployment.

A Container _Component_ has the following additional attributes, none of which are required:

| **Field**| **Description** |
| --- | --- |
|**Build Job** | The Continuous Delivery Build Job that is used to build/compile the _Component_.  |
|**Last Build Number** | The number of the last Continuous Delivery (CD) Workflow that created the files referenced within the _Component._ This number will default to the Build ID if one is not set by the CD Workflow.|
| **Build ID** | The internal identifier for the _Build Engine_. |
|**Build URL**| The URL to the _Build Engine_. |
|**Build Date**| The timestamp from when the last build job was run.|
|**Helm Chart** | The Helm Chart used to deploy the _Component_. |
|**Helm Chart Version** | The Helm Chart Version from the Helm Repository. |
|**Helm Chart Namespace** | The sub-division of the Kubernetes cluster where your _Component_ Container should run. |
|**Operator**| The RedHat Operator used to deploy your _Component_ container.|
|**Container Registry**| The Container registry where the Container is stored. |
|**Container Digest**| The SHA number of the Container image. |
|**Container Tag**| The tag that was assigned to the Container image. ||
|**Git Commit**| The Git SHA number. Populated when integrated into Continuous Delivery Pipelines.|
|**Git Repo**| The Git Repository that triggered the build.Populated when integrated into Continuous Delivery Pipelines.|
|**Git Tag**| The last tag for the Git Repository. Populated when integrated into Continuous Delivery Pipelines.|
|**Git URL**| The URL for the Git Repository.Populated when integrated into Continuous Delivery Pipelines.|


### Application Specific Data Definition

|**Field** | **Description**|
| --- | --- |
| **Base Directory**|This is the directory that the files will be deployed to on the _Endpoint_. The creation of the directory can come from different locations. If this field has no value, then the _Component_ Target Directory is used. If the _Component_ Target Directory is empty, the _Endpoint_ Target Directory is used. If this field is defined and either the _Component_ Target Directory or _Endpoint_ Target Directory is defined then the value entered here is appended to the Target Directory to create the full path where the file will be installed on the _Endpoint_. Also, if this field is defined but the _Component_ or _Endpoint_ Target Directories are empty, then this value will be used for the location where the files will be deployed on the _Endpoint_.|
| **Pre-Action** | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. |
| **Post-Action** | An _Action_ that is to be run after the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
|**Build Job** | The Continuous Delivery Build Job that is used to build/compile the _Component_.  |
| **Last Build Number** | The number of the last Continuous Delivery (CD) Workflow that created the files referenced within the _Component._ This number will default to the Build ID if one is not set by the CD Workflow.|
| **Build ID** | The internal identifier for the _Build Engine_. |
| **Build URL**| The URL to the _Build Engine_. |
|**Build Date**| The timestamp from when the last build job was run.|
| **Target Directory** | This is the directory on the _Endpoint_ where the file will be deployed if there is not a Target Directory defined at the _Endpoint_. |
| **Repository** |  Choose the Repository that contains your _Application_ binaries, files, etc. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For a list of the _Repositories_  See [Connecting Your Repositories](/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing) for more information.<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repostory_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul> |


### Database Specific Data Definition

Database _Components_ are used for making database updates such as table changes using SQL Scripts. Note: An database form (such as an Oracle Form) can be compiled and should be defined as an Application File not Database _Component_.

| Field | Description |
| --- | --- |
| **Base Directory**| This is the directory that the files will be deployed to on the _Endpoint_. The creation of the directory can come from different locations. If this field has no value, then the _Component_ Target Directory is used. If the _Component_ Target Directory is empty, the _Endpoint_ Target Directory is used. If this field is defined and either the _Component_ Target Directory or _Endpoint_ Target Directory is defined then the value entered here is appended to the Target Directory to create the full path where the file will be installed on the _Endpoint_. Also, if this field is defined but the _Component_ or _Endpoint_ Target Directories are empty, then this value will be used for the location where the files will be deployed on the _Endpoint_. |
| **Pre-Action** | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. |
| **Post-Action** | An _Action_ that is to be run after the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
|**Roll Forward Target Directory**|  This is the directory on the _Endpoint_ where the file will be deployed if there is not a Target Directory defined at the _Endpoint_. |
|**Roll Forward Repository**|  Choose the Repository that contains your Roll Forward SQL. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For more information on _Repositories_ see [Connecting Your Repositories](/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing).<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repository_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul>  |
| **Rollback Target Directory** | This is the directory on the _Endpoint_ where the file will be deployed if there is not a Target Directory defined at the _Endpoint_. |
| **Rollback Repository** | Choose the Repository that contains your Roll Forward SQL. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For more information on _Repositories_ see [Connecting Your Repositories](/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing).<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repository_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul> |

### _Component_ Dependency Map

The Dependency Map provides a graphical view of all _Applications_ that is consuming this _Component_. This will remain empty until your  _Component_ is used by an an _Application_.  

### _Endpoints_

This section provides a list of all _Endpoints_ that the _Component_ has been installed to with the Deployment Number. The Deployment Number is generated by DeployHub for each unique deployment.  You can also use this section to stop incremental deployments and force a specific version to be deployed to the _Endpoint_. By manually adding a specific _Component Version_ to the _Endpoint_, you bypass the incremental deployment logic of the deployment engine.  For example, if you would like to deploy a particular container without accepting any intermediate updates, you would go to the intermediate _Component Versions_ and manually add them to the _Endpoints_, causing the deployment engine to believe that it was previously deployed. When you manually add an _Endpoint_, the Deployment Number will show "manually deployed." To manually add a _Component_ to an _Endpoint_, use the +Add option. You will be provided a list of available _Endpoints_. Use Save to commit the change to the table. You can select multiple _Endpoints_.  To Edit or Delete an _Endpoint_, select the _Endpoint_ and use the Edit or Delete option. 

{{% include "userguide/reusable/Attributes.md" %}}

### Deployed Environments for _Component_

A map showing all _Environments_ where the _Component_ is deployed.

### Consuming _Applications_

This section shows a list of all _Applications_ that are consuming this _Component_.

{{% include "userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

The Access Section allows _Users_ within designated _Groups_ to update or view the _Component_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Component_:

| Access | Description |
| --- | --- |
| **View** | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |

### Change Request

The Change Request section, available for DeployHub Pro users,  shows enhancement requests and bugs for a selected Component for several popular bug tracking systems, including Bugzilla, GitHub, and Jira.

Select the "+Add Change Request to this Version" to assign a Change Request to the _Component_. This will display all the Change Requests (Enhancements, Bugs, etc.) from the assigned Data Source in the resulting Select Bug Record pop up window, and one or more of these can be assigned to the _Component_ by clicking on the box to the left of each CR ID field.

The lower section contains a list of Change Requests with the fields CR ID, Title, and Status. Clicking on the CR ID takes the User to a new tab in the browser that contains the source of the Change Request. For instance, if the _Component_ has a Change Request Data Source of the type GitHub, clicking on the CR ID field for a Change Request will open a tab with the bug or enhancement request within github.com, allowing the User the ability to update, close, or read about it in detail. The Title field holds the title of the Change Request within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either 'open' or 'closed’ and displays them in the Status field with a gold or dark gray background respectively.

## Publishing a New _Component Versions_ Based on an Existing _Component Version_

Create _Component Versions_ that are patterned after the _Component Base Version_ or any _Component Version_. To do this, check box the _Component Base Version_ or _Component Versions_ from which you want to base the new version. Select the New Version Tab and you will be brought into the _Component_ Dashboard to edit the new _Component Version_. When you manually create a new _Component Version_ the name will be auto generated with a new number. You may need to provide it a unique name based on your versioning patterns.

 
  