---
title: "Publishing Components"
linkTitle: "Publishing Componets"
weight: 2
description: >
  Publishing Components to Domains.
---

## The _Component_ List View for Adding, Editing or Deleting

Manage your _Components Base Version_ and _Component Versions_ using the Component List View accessible from the left hand _Component_ menu option.  You will be provided a list of all _Components_ organized by version and _Domanin_. If you have not defined any _Components_ to DeployHub, you will see only the sample data. 

## Filtering the _Component_ List View

The _Component_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Application Base Version_. To add a new _Application Version_, use the Task option.|
| Delete | Deletes the selected item. |
| List | Takes you back to the List View if you have been in the Map View. |
| Map | Displays a global Map of all _Component_ versions, with their _Application_ relationships.  |


# Publishing New _Components_
Use the _Component_ List View to publish new _Components_. Select the **+Add** tab at the top of the Panel. 

Select the _Component_ Type from the drop down list.  Options include:

| **Type** | **Description** |
| --- | --- |
| Docker Container | For _Components_ residing in a Docker Registry. |
| Application File | For files residing in a file repository (binaries). |
| Database | For SQL statements residing in a file repository. |

Based on what you selected, you will be provided with the appropriate fields to complete. 


## Defining _Components_ with the Dashboard

_Components_ are defined as Container, File or Database.  These three definition types will address all of the different types of _Components_ you may need from microservices to binares and DB updates.  
The Dashboard view displays all information related to a specific _Component Base Version_ or _Component Version_. Depending on what type of _Component_ you are defining, you will be presented with different data definition fields. 

The following fields are common to all _Components_:

| Field | Description |
| --- | --- |
| **Domain** | The _Domain_ the _Component_ will be published to. |
| _**Name**_ | The name of the _Component._ |
| **Owner Type** | Owned by a User or Group. |
| _**Owner**_ | The owner of the _Component_, whose default value is the creator of the _Component_.  
| _**Summary**_ | A short text field with a description of the _Component_. |
| _**Created**_ | The date and time that the _Component_ was created. |
| _**Modified**_ | The date and time of the last time the _Component_ was changed. |
| _**Endpoint Type**_ | Used to map the _Component_ to _Endpoints_ within an _Environment_ at deployment.  This allows DeployHub to map the _Component_ to the correct Endpoint when moving across different environments. For example a database update is mapped to an endpoint with a database, or an .EAR file is mapped to an endpoint with WebSphere Server. 
| _**Change Request Data Source**_ | This _Data Source_ assigned to the _Component_ for tracking Change Request. |
| _**Category**_ | Categories allow the selection of _Components_ in an orderly manner. Assigning a Category to a _Component_ allows lists of Categories to be used throughout DeployHub. You can add a new Category by simply typing it into the entry field, or use an existing Category displayed in the drop down. |
| _**Always Deploy**_ | The _Component_ is deployed to the associated _Endpoint(s)_ in the _Target Environment_ regardless if the _Component_ is already present on the _Endpoint(s)._ This is useful for monoloithc applications where you want to copy over a binary for example.|
| _**Deploy Sequentially**_ | Normally when a _Component_ in an _Application_ is deployed to several _Endpoints_ in an _Environment_, it is deployed to each _Endpoint_ at the same time (in parallel). The "Deploy Sequentially" option changes this behavior to force the _Component_ to deploy to each _Endpoint_ in turn, sequentially. |
| _**Base Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. 'c:\main' for Windows or '/main' for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component's_ Base Directory is relative, i.e. 'SomeFiles\SomeMoreFiles', then it is appended to the _Endpoint's_ Base Directory, i.e. 'c:\main\SomeFiles\SomeMoreFiles'. Note that the _Target Directory_ for each _Component_ is always appended to this combined path. |
| _**Pre-Action**_ | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. It is executed **after** all of the files have been pulled from the _Repositories_ referenced in the _Component Items_ associated with the _Component_ but **before** they are deployed to _Endpoints_ in the target _Environment_. |
| _**Post-Action**_ | An _Action_ that is to be run before the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
| _**Custom Action**_ | An _Action_ that replaces the usual Deployment Engine processing. Custom _Actions_ can be used to call Ansible, Helm or other external deployment tools.| 
| _**Build Job**_ | The Continuous Delivery Build Job that is used to build/compile the _Component_.  |
| _**Last Build Number**_ | The number of the last Continuous Delivery Workflow that created the files referenced within the _Component._ |

### Container Specific Data Definition

Docker component items have the following additional attributes, none of which are required:

| **Field**| **Description** |
| --- | --- |
| **Build ID** | The internal identifier for the _Build Engine_. |
| **Build URL**| The URL to the _Build Engine_. |
| **Helm Chart** | The Helm Chart used to deploy the _Component_. |
| **Helm Chart Version** | The Helm Chart Version from the Helm Repository. |
| **Helm Chart Namespace** | The sub-division of the Kubernetes cluster where your _Component_ Container should run. |
| **Operator**| The RedHat Operator used to deploy your _Component_ container.|
|**Build Date**| The timestamp from when the last build job was run.|
|**Docker Regsitry**| The Docker registry where the Container is stored. |
| **Docker Digest** | The SHA number of the Docker image. |
|**Docker Tag**| The tag that was assigned to the Docker image. ||


### Appliction Specific Data Definition

|**Field** | **Description**|
| --- | --- |
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. 'c:\main' for Windows or '/main' for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component's_ Base Directory is relative, i.e. 'SomeFiles\SomeMoreFiles', then it is appended to the _Endpoint's_ Base Directory, i.e. 'c:\main\SomeFiles\SomeMoreFiles'.If the _Component Item's_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the Repository Overrides fields to include:<ul style="list-style-type: none;"><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul> For more information on _Repositories_ and their options, see the ["Define Repository" Chapter.](/userguide/setup/2-define-repositories/)|
| **Repository Overrides**| These fields override data that is defined at the _Repository_ level, for the selected _Repository. |

### Database Specific Data Definition 

When you choose 'Create New Database Component', a window will appear titled "Edit Item n", where 'n' is an integer, which contains the following fields (none are required):

| Field | Description |
| --- | --- |
| _**Roll-Forward**_ | Used in the event that there is a _Roll Forward_ taking place during a deployment. A _Roll Forward_ takes place when the version being deployed is later than the version located on the target. This is determined by the order that the _Application Versions_ are linked in on the _Base Application's_ Versions tab and NOT by the _Application Version_ name. There are three possible values for this field. <ul style="list-style-type: none;"><li> On: Roll Forward from the _Version_ on the _Endpoint_ +1 to the version being deployed.</li>  <li>Off: Do not include in a Roll Forward.All: Roll Forward from the _Version_ on the _Endpoint_ to the version being deployed inclusive. For example: If pulling SQL files to apply alter scripts, the roll-forward flag should be set to "On" for the corresponding component item(s). If the Environment contains version 2 and we are deploying version 5, this will operate on version 3 (to roll the DB forward from version 2 to version 3), version 4 (to roll the DB forward from version 3 to version 4) and finally for version 5 (to roll the DB forward from version 4 to version 5).</li> </ul>|
| _**Rollback**_ | Used when there is a Rollback taking place during a deployment. This refers to when the version being deployed is earlier than the version located on the target. This is determined by the order that the _Application Versions_ are linked on the _Base Application's_ Versions tab and NOT by the _Application Version_ name. There are three possible values for this field. <ul style="list-style-type: none;"><li>On: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed + 1 </li><li> Off: Do not include in a rollback. </li> <li>All: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed inclusive. For example: If pulling SQL files to apply rollback scripts, the roll-back flag should be set to "On" for the corresponding component item(s). If the _Environment_ contains version 5 and we are deploying version 2, this will operate on version 5 (to roll the DB back from version 5 to version 4), version 4 (to roll the DB back from version 4 to version 2) and finally for version 3 (to roll the DB back from version 3 to version 2). </li>|
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. 'c:\main' for Windows or '/main' for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component's_ Base Directory is relative, i.e. 'SomeFiles\SomeMoreFiles', then it is appended to the _Endpoint's_ Base Directory, i.e. 'c:\main\SomeFiles\SomeMoreFiles'.If the _Component Item's_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the _Modifiable Repository Properties_ fields to include:<ul style="list-style-type: none;"><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul>  For more information on _Repositories_ and their options, see the "Define Repository" Chapter. |
| **Repository Overrides**| These fields override data that is defined at the _Repository_ level, for the selected _Repository. |

### _Component_ Dependency Map
The Dependency Map provides a graphical view of all _Applicaitons_ that is consuming this _Component_. This will remain empty until your  _Component_ is used by an an _Application_.  

### _Endpoints_
This section provides a list of all _Endpoints_ that the _Component_ has been installed to with the Deployment Number. The Deployment Number is generated by DeployHub for each unique deployment.  

### Attributes
Attributes are environment variables that need to be assigned to the _Component_ such as Key Value Pairs. Use the +Add option to add Attributes to your _Component_. Attributes have a Name and a Value. Any Attributes defined at the _Component_ level override any Attributes defined at the _Application_ level and the _Environment_ level. 

### Deployed Environments for _Component_
A map showing all _Environments_ where the _Component_ is deployed.

### Consuming _Applications_
This section shows a list of all _Applications_ that are consuming this _Component_.

### Audit Trail

The Audit Trail displays audit entries for deployments, including deployment number, _Environment_, and how many days ago the deployment (hours for all of today's deployments) took place. Any attribute changes to the _Component_ are also shown on the Audit Trail. 


{{% include "userguide/reusable/Access Object.md" %}}

### Change Request
The Change Request section, available for DeployHub Pro users,  shows enhancement requests and bugs for a selected Component for several popular bug tracking systems, including Bugzilla, GitHub, and Jira. 

Select the "+Add Change Request to this Version" to assign a Change Request to the _Component_. This will display all the Change Requests (Enhancements, Bugs, etc.) from the assigned Data Source in the resulting Select Bug Record pop up window, and one or more of these can be assigned to the _Component_ by clicking on the box to the left of each CR ID field.

The lower section contains a list of Change Requests with the fields CR ID, Title, and Status. Clicking on the CR ID takes the User to a new tab in the browser that contains the source of the Change Request. For instance, if the _Component_ has a Change Request Data Source of the type GitHub, clicking on the CR ID field for a Change Request will open a tab with the bug or enhancement request within github.com, allowing the User the ability to update, close, or read about it in detail. The Title field holds the title of the Change Request within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either 'open' or 'closed’ and displays them in the Status field with a gold or dark gray background respectively.

## Publishing New _Component Versions_ using the Dashboard

Create _Component Versions_ that are patterned after the _Component Base Version_ or any _Component Version_. To do this, check box the _Component Base Version_ or _Component Versions_ from which you want to bae the new version. Select the New Version Tab and you will be brought into the _Component_ Dashboard to edit the new _Component Version_. When you manually create a new _Component Version_ the name will not include any unique identifier. You will need to provide it a unique name.

 By double clicking on a _Component_ you will be taken to that _Components_ Dashboard.  You can also use the Search bar, represented by a funnel icon, to filter _Components_.  You can filter on: 
- Domain
- Environment
- Last Deployment
- Result
- Version
  