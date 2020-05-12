---
title: "Components"
linkTitle: "Components"
weight: 22
---

## Components

The first step in defining your Components is with your _Component Base Version._

A _Component Base Version_ is created with the _Deploy_ Main Menu. Click the _Component_ tab, right click a _Domain_ in the tree structure, and select &#39;New Component Base Version in this Domain&#39;.

Alternatively, you delete a _Component_ by right clicking on it and then selecting the &#39;Delete Component Version from this Domain.&#39; You cannot retrieve a _Component_ once it is deleted.

## Component Items Tab

This tab is used to create or edit _Component Items_ and link them together so as to deploy them in a specific order if needed. To create a _Component Item_, right click anywhere in the blank area within the Component Items tab. Three options will appear:

- Create New Component Item
- Create New Docker Component Item
- Create New Database Component Item

### Create New Component Item

When you choose &#39;Create New Component Item&#39;, a window will appear titled &quot;Edit Item n&quot;, where &#39;n&#39; is an integer, which contains the following fields (none required):

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component Item_. |
| _**Summary**_ | A short text field with a description of the _Component Item_. |
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.If the _Component Item&#39;s_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the _Modifiable Repository Properties_ fields to include: <ul style="list-style-type: none;"><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul> |

### Create New Database Component Item

When you choose &#39;Create New Database Component Item&#39;, a window will appear titled &quot;Edit Item n&quot;, where &#39;n&#39; is an integer, which contains the following fields (none are required):

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component Item_. |
| _**Summary**_ | A short text field with a description of the _Component Item_. |
| _**Roll-Forward**_ | Used in the event that there is a _Roll Forward_ taking place during a deployment. A _Roll Forward_ takes place when the version being deployed is later than the version located on the target. This is determined by the order that the _Application Versions_ are linked in on the _Base Application&#39;s_ Versions tab and NOT by the _Application Version_ name.
There are three possible values for this field. On: Roll Forward from the _Version_ on the _Endpoint_ +1 to the version being deployed.
 Off: Do not include in a Roll Forward.All: Roll Forward from the _Version_ on the _Endpoint_ to the version being deployed inclusive.
For example: If pulling SQL files to apply alter scripts, the roll-forward flag should be set to &quot;On&quot; for the corresponding component item(s). If the Environment contains version 2 and we are deploying version 5, this will operate on version 3 (to roll the DB forward from version 2 to version 3), version 4 (to roll the DB forward from version 3 to version 4) and finally for version 5 (to roll the DB forward from version 4 to version 5). |
| _**Rollback**_ | Used when there is a Rollback taking place during a deployment. This refers to when the version being deployed is earlier than the version located on the target. This is determined by the order that the _Application Versions_ are linked on the _Base Application&#39;s_ Versions tab and NOT by the _Application Version_ name.
There are three possible values for this field.On: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed + 1
Off: Do not include in a rollback.
All: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed inclusive.
For example: If pulling SQL files to apply rollback scripts, the roll-back flag should be set to &quot;On&quot; for the corresponding component item(s). If the _Environment_ contains version 5 and we are deploying version 2, this will operate on version 5 (to roll the DB back from version 5 to version 4), version 4 (to roll the DB back from version 4 to version 2) and finally for version 3 (to roll the DB back from version 3 to version 2). |
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.If the _Component Item&#39;s_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the _Modifiable Repository Properties_ fields to include:<ul style="list-style-type: none;"><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul> |

### Create New Docker Component Item

Docker component items have the following attributes, none of which are required:

| _**BuildId**_ | The build ID from the build system such as Quay or DockerHub |
| --- | --- |
| _**BuildUrl**_ | Build URL for the build system |
| _**Chart**_ | Helm chart for the component |
| _**Chart Version**_ | Version of the Helm chart |
| _**Chart Name Space**_ | Namespace for the Helm chart to deploy to |
| _**Operator**_ | Kubernetes Operator |
| _**DockerBuildDate**_ | Timestamp for the Docker Build |
| _**DockerSha**_ | SHA for the Docker Image |
| _**DockerRepo**_ | URL for the Docker Registry |
| _**GitCommit**_ | Git Commit that triggered the Build |
| _**GitRepo**_ | Git Repo Name |
| _**GitTag**_ | Git Tag such as &#39;Master&#39; or &#39;v1.5.0&#39; |
| _**GitUrl**_ | URL to the Git Repository |
| _**BuildNumber**_ | Build Job Number for CI/CD |
| _**Build Job**_ | Build Job name for CI/CD |
| _**ComponentType**_ | Name of the Component Type |
| _**ChangeRequestDS**_ | Name of the Change Request Datasource |
| _**Category**_ | Name of the Components Category |
| _**AlwaysDeploy**_ | Y/N |
| _**DeploySequentially**_ | Y/N |
| _**BaseDirectory**_ | Base Directory for the Component |
| _**PreAction**_ | Name of the Pre-Action |
| _**PostAction**_ | Name of the Post-Action |
| _**CustomAction**_ | Name of the Custom-Action |
| _**Summary**_ | Component Summary or Description |

## Component Relationships

_Component Items_ can be connected to determine the installation order when the _Component_ is deployed. In order to connect two _Component Items_, click on the small green dot, or anchor, on the bottom of a _Component Item_. Drag the anchor and drop it onto the top anchor of the _Component Item_ that should follow it. A connector will now exist between these two _Component Items_, and they will be installed in that order.

## Versions Tab

Create _Component Versions_ that are patterned after the _Component Base Version_. To do this, right click in the _Component Versions_ area within the Versions tab, and &quot;Create New Component Version&quot; will appear as the only row in the resulting drop-down list. Select this and a new version of the _Component Base Version_ will appear as a box in the _Component Version&#39;s_ area. It will be named after the _Component Base Version_ along with an integer, separated by a semicolon, i.e, &quot;myComponent;1&quot;.

Each subsequent _Component Version_ will have incremental number changes. You can rename these. They are linked automatically or by clicking the anchor on the bottom of one _Component Version_ and dragging and dropping it on the top anchor of another. When this is done, the _Component __Items_ of the linked _Component__ Version_ are changed automatically to those of the connected _Component__Version_.

The connecting links can be deleted by right clicking on the link and selecting &quot;Delete this Connection&quot;. _Component Versions_ can have multiple Child Versions, that is have multiple connections from its bottom connector. This can be used to indicate different development branches. You can label a branch by right-clicking on the relevant link and selecting &quot;Add Branch Label&quot;.

The links for _Component Versions_ is not used in the same way that they are for _Application Versions_ (where they are used to determine the order of Application Deployment during a roll forward or rollback deployment) or _Component Items_ (where the links determine the deployment order). They are used merely for showing the branching of different _Component Versions_ as they are created over time.

Clicking the Plus &#39;+&#39; sign next to a _Component Base Version_ in the tree structure causes it to expand and display all _Component Versions_ for the selected _Component Base Version._ Clicking on one of these causes the tabs to change on the right side of the main window which includes all of the tabs for the _Component Base Version_, with the exception of the Versions tab. These tabs work the same for the _Component Versions_ as they do for the _Component Base_ _Version_.

NOTE: Alternatively, you can create a _Component Version_ by clicking on a _Component Base Version_ in the tree structure, selecting the Versions tab on the right, then right clicking on the _Component Versions_ area. This brings up a drop-down list with &quot;Create New Component Version&quot;. Clicking on this creates a new _Component Version_ for this _Component Base Version_, and names it by using the name of the _Component Base Version_ followed by an incremented integer, separated by a semicolon, i.e., &quot;MyComponent;1&quot;.

## Timeline Tab

Audit entries for deployments with this tab, including deployment number, _Environment_, and how many days ago the deployment (or hours for all of today&#39;s deployments) took place. Any attribute changes to the _Component_ are also shown on the timeline.

## Timeline Comments

Users can add comments to entries in the timeline by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information. Click on the &#39;Click to see earlier items&#39; link to see other audit entries.

There is a field labeled &quot;Say something about this Component?&quot; above all deployment lines that can have comments placed into it, and files can be attached to the comment as well. Entering text into this field activates the Add Message button. Click on this button to save the comment as a new audit entry.

## Adding Documents to the Timeline

Clicking on the paperclip button next to the Add Message button brings up a file explorer that allows multiple files to be selected and attached to the comment. Comments with files attached are shown with a paperclip. Clicking on the paperclip expands the audit entry to show the files attached to the comment as hyperlinks. Clicking on the link will download the file. This process in browser-specific.

## Subscribe to Components

Users can also click on the Subscribe link in each entry of the list, which places the audit entry into the User&#39;s personal _Timeline_. Any comments added to the auditwill appear in the Timeline tab of the subscriber&#39;s home page.

## Endpoints &amp; Builds Tab

This tab contains a table that shows which _Component Versions_ have been installed on _Endpoints_ within _Environments_. The fields in the table include Environment, Endpoint, Component Version, and Details.

If a _Component Base Version_ is selected, then the _Deployed Endpoints_ Tab will show all the _Component Versions_ of the selected _Component Base Version_ and where they have been deployed. If a _Component Version_ is selected, the display will be limited to only the _Endpoints_ to which that _Component Version_ has been deployed.

## Assigned Applications Tab

This tab contains a table showing to which _Application Versions_ the selected _Component_ is assigned. There are two fields, Application Version and Component Version. This table can be viewed as a kind of quick reference in order to inform the user of which _Applications_ will be affected by changes to _Component Versions_. Clicking on any of the values in the list will take the User to that object.

## Attributes Tab

This tab allows the creation of values that are stored against an object and can be used to control deployments. The Name field holds the name of the value, and the Value field holds the data, which can be either a numeric or text value. It can also be an array of Name/Value pairs. Clicking on a blank Name field allows the user to enter a new Name, and then tab into and enter its associated Value.

To enter the values for an array use the following syntax for the Name:

name[subscript]

You can enter multiple names with different subscripts to create an array. These need not be numeric since arrays in DeployHub are associative.

## Access Tab

You can assign _Groups_ which contain _Users_ to View and Change access to _Component_. There are two Access options for _Component_:

| Access | Description |
| --- | --- |
| _View_ | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the tree structure on the right side. |
| _Change_ | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |

## General Tab

The General tab contains basic information about the _Component_:

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component._ |
| _**Owner**_ | The owner of the _Component_, whose default value is the creator of the _Component_. The default owner is the _User_ who created the _Component_. When editing this field, the Owner Type field is available which includes _Owner_ and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Summary**_ | A short text field with a description of the _Component_. |
| _**Created**_ | The date and time that the _Component_ was created. |
| _**Modified**_ | The date and time of the last time the _Component_ was changed. |
| _**Component Type**_ | Used to match the _Component_ to _Endpoints_ within an _Environment_ when deploying. An _Endpoint_ can be assigned many different Component Types, and a _Component_ can have only one Component Type assigned to it. This allows an _Application_ containing many different _Components_ to be deployed into an _Environment_, with each _Component_ only deploying to its matching _Endpoints_. |
| _**Change Request Data Source**_ | This _Data Source_ is assigned to the _Component_, and Change Requests can then be assigned to the _Component_ in the Change Requests tab. |
| _**Build Job**_ | The Jenkins Job that is used to build/compile the _Component Item(s)_ in this _Component_. |
| _**Last Build Number**_ | The number of the last Jenkins build that created the files referenced within the _Component&#39;s Component Item(s)._ |
| _**Category**_ | Categories allow the selection of _Components_ in an orderly manner. Assigning a Category to a _Component_ allows lists of Categories to be used throughout DeployHub. Clicking on an individual Category expands the list, and shows all of the _Components_ that belong to that Category. |
| _**Always Deploy**_ | The _Component_ is deployed to the associated _Endpoint(s)_ in the _Target Environment_ regardless if the _Component_ is already present on the _Endpoint(s)._ |
| _**Deploy Sequentially**_ | Normally when a _Component_ in an _Application_ is deployed to several _Endpoints_ in an _Environment_, it is deployed to each _Endpoint_ at the same time (in parallel). The &quot;Deploy Sequentially&quot; option changes this behavior to force the _Component_ to deploy to each _Endpoint_ in turn, sequentially. |
| _**Base Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.Note that the _Target Directory_ for each _Component Item_ in the _Component_ is always appended to this combined path. |
| _**Pre-Action**_ | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. It is executed **after** all of the files have been pulled from the _Repositories_ referenced in the _Component Items_ associated with the _Component_ but **before** they are deployed to _Endpoints_ in the target _Environment_. |
| _**Post-Action**_ | An _Action_ that is to be run before the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
| _**Custom Action**_ | An _Action_ that replaces the usual Deployment Engine processing. Custom _Actions_ can be used when the normal component-level deployment is not suitable for the deployment of the _Component_. No _Component Items_ are used if a Custom _Action_ is being used. |
