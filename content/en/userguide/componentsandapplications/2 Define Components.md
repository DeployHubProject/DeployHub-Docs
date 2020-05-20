---
title: "Components"
linkTitle: "Components"
weight: 1
description: >
  Adding Components like Microservices to Domains.
---

## What are Components?

DeployHub manages microservices and other reusable objects as _Components_.  _Components_ are assigned to an _Application_ eventhough they are managed independently.  By assigning _Components_ to _Applications_ you are able to track a 'logical' view of your software solution.  In a monolithic approach, we performed this packaging at the software compile and link step. In microservices, that step goes away. Microservices are loosely coupled and linked at run-time. Defining _Components_ to _Applications_ puts the _Application_ back in the picture, even if it is only a 'logical' view.

Unique to DeployHub is its ability to version and map the individual parts of a software _Application._ An _Application_ is a complete software solution that is comprised of individual _Components._ For example, if you are a bank, you might have a Teller _Application_ made up of hundreds of microservices. In DeployHub terms, the Teller _Application_ is one software solution or _Application_ regardless of the number of _Components_ it consumes.

If you are an API or microservice developer, this will be where you do most of your work. However, application developers may also define _Components_ that are to be used by only a specific _Application_. _Components_ are microservices (containers), Database updates or files along with Pre and Post _Actions_ that are used to control the deployment at a detailed level. By tracking the low-level deployment metadata for a _Component_, it can be easily shared and released in a consistent way across team.

## Component and Application Relationships

There is a many to many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_. With DeployHub, _Components_ can be easily shared between _Applications_. DeployHub tracks and versions the _Component_ relationships including to which _Applications_ they have been assigned.

## Sharing Components

If you want your microservice _Component_ to be shared across your teams, you will need to publish your _Component_ to a _Domain_ that allows sharing. If it is defined to only your _Application,_ then only your team will be able to see it.

## Component  Versioning

DeployHub uses a back-in versioning engine to track your _Components_. Versioning tracks _Component_ attributes including low level information that is needed for other teams to reuse your _Component_ including: <ul><li>GitHub, Jira Change Request</li><li>Gitrepo</li><li>CD Build/Workflow Number</li><li>Container SHA</li><li>Docker Registry</li><li>Environment Variables</li><li>Deployment Script (Helm Chart, Ansible Playbook, etc)</li><li>Any Attributes (DB Name for example)such as the _Action_ used to perform the installation, environment variables, and database schemas.</li>

This information is initially collected when you define your _Component_ to the DeployHub catalog. You can use the DeployHub CD plugin to automatically update this information via your CD Pipeline using CD soltuions such as  Jenkins, JenkinsX, Tekton, CircleCI, Google CloudBuild or Puppet Relay.

When you first define your _Component_ DeployHub tracks it as the _Component__Base_ _Version_. Subsequent updates to that _Component_ creates a new _Component Version_ which represent the updates over time. A _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Component Versions_. Otherwise they are identical types of objects.

DeployHub uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

## The Component Dashboard

Manage your _Components_ and _Component Versions_ using the Component Dashboard accessable from the left hand _Component_ menu option.  You will be provided a list of all _Components_ organized by version and _Domanin_.  By double clicking on a _Component_ your will be taken to that _Components_ Dashboard.

### Create New Component

Use the '+Add' menu option at the top of you Component list to Add a new Component. You can create File based Components (default, used for microservices), or Database Components.  Following are the General information needed for creating a new _Component_.

#### General Component Information

The General information contains basic information about the _Component_:

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component._ |
| _**Owner**_ | The owner of the _Component_, whose default value is the creator of the _Component_. The default owner is the _User_ who created the _Component_. When editing this field, the Owner Type field is available which includes _Owner_ and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Summary**_ | A short text field with a description of the _Component_. |
| _**Created**_ | The date and time that the _Component_ was created. |
| _**Modified**_ | The date and time of the last time the _Component_ was changed. |
| _**Endpoint Type**_ | Used to map the _Component_ to _Endpoints_ within an _Environment_ when deploying monolithic applications. If your _Component_ needs to be installed to a particular type of _Endpoint_,  this allows DeployHub to map the _Component_ to the correct Endpoint when moving across different environments. For example a database update is mapped to a database server, or an .EAR file is installed to a WebSphere Server.
| _**Change Request Data Source**_ | This _Data Source_ is assigned to the _Component_, and Change Requests can then be assigned to the _Component_ in the Change Requests tab. |
| _**Build Job**_ | The Jenkins Job that is used to build/compile the _Component Item(s)_ in this _Component_. |
| _**Last Build Number**_ | The number of the last Jenkins build that created the files referenced within the _Component&#39;s Component Item(s)._ |
| _**Category**_ | Categories allow the selection of _Components_ in an orderly manner. Assigning a Category to a _Component_ allows lists of Categories to be used throughout DeployHub. Clicking on an individual Category expands the list, and shows all of the _Components_ that belong to that Category. |
| _**Always Deploy**_ | The _Component_ is deployed to the associated _Endpoint(s)_ in the _Target Environment_ regardless if the _Component_ is already present on the _Endpoint(s)._ |
| _**Deploy Sequentially**_ | Normally when a _Component_ in an _Application_ is deployed to several _Endpoints_ in an _Environment_, it is deployed to each _Endpoint_ at the same time (in parallel). The "Deploy Sequentially" option changes this behavior to force the _Component_ to deploy to each _Endpoint_ in turn, sequentially. |
| _**Base Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.Note that the _Target Directory_ for each _Component Item_ in the _Component_ is always appended to this combined path. |
| _**Pre-Action**_ | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. It is executed **after** all of the files have been pulled from the _Repositories_ referenced in the _Component Items_ associated with the _Component_ but **before** they are deployed to _Endpoints_ in the target _Environment_. |
| _**Post-Action**_ | An _Action_ that is to be run before the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
| _**Custom Action**_ | An _Action_ that replaces the usual Deployment Engine processing. Custom _Actions_ can be used when the normal component-level deployment is not suitable for the deployment of the _Component_.

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component Item_. |
| _**Summary**_ | A short text field with a description of the _Component Item_. |
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.If the _Component Item&#39;s_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the _Modifiable Repository Properties_ fields to include: <ul><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul> |

### Create New Database Component Item

When you choose &#39;Create New Database Component Item&#39;, a window will appear titled "Edit Item n", where &#39;n&#39; is an integer, which contains the following fields (none are required):

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Component Item_. |
| _**Summary**_ | A short text field with a description of the _Component Item_. |
| _**Roll-Forward**_ | Used in the event that there is a _Roll Forward_ taking place during a deployment. A _Roll Forward_ takes place when the version being deployed is later than the version located on the target. This is determined by the order that the _Application Versions_ are linked in on the _Base Application&#39;s_ Versions tab and NOT by the _Application Version_ name. There are three possible values for this field. <ul><li> On: Roll Forward from the _Version_ on the _Endpoint_ +1 to the version being deployed.</li>  <li>Off: Do not include in a Roll Forward.All: Roll Forward from the _Version_ on the _Endpoint_ to the version being deployed inclusive. For example: If pulling SQL files to apply alter scripts, the roll-forward flag should be set to "On" for the corresponding component item(s). If the Environment contains version 2 and we are deploying version 5, this will operate on version 3 (to roll the DB forward from version 2 to version 3), version 4 (to roll the DB forward from version 3 to version 4) and finally for version 5 (to roll the DB forward from version 4 to version 5).</li> </ul>|
| _**Rollback**_ | Used when there is a Rollback taking place during a deployment. This refers to when the version being deployed is earlier than the version located on the target. This is determined by the order that the _Application Versions_ are linked on the _Base Application&#39;s_ Versions tab and NOT by the _Application Version_ name. There are three possible values for this field. <ul><li>On: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed + 1 </li><li> Off: Do not include in a rollback. </li> <li>All: Rollback from the _Version_ on the _Endpoint_ to the _Version_ being deployed inclusive. For example: If pulling SQL files to apply rollback scripts, the roll-back flag should be set to "On" for the corresponding component item(s). If the _Environment_ contains version 5 and we are deploying version 2, this will operate on version 5 (to roll the DB back from version 5 to version 4), version 4 (to roll the DB back from version 4 to version 2) and finally for version 3 (to roll the DB back from version 3 to version 2). </li>|
| _**Target Directory**_ | The Base Directory for a _Component_ can either be absolute or relative. If it is absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., then it replaces the Base Directory for the _Endpoint_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _Endpoint&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.If the _Component Item&#39;s_ Target Directory has a value, it is _always_ appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Repository**_ | A required field, this is the _Repository_ where the files to be deployed are located. Clicking on the field presents a drop-down list containing the names of all of the _Repositories_ within the DeployHub installation to which the current _User_ has access. Selecting a Repository will change the _Modifiable Repository Properties_ fields to include:<ul><li>Any _Property_ that has not been defined at the corresponding _Repository_ Level.</li><li>Any _Property_ that has been defined at the corresponding _Repository_ Level but is marked as being either _overridable_ or _appendable_.</li></ul> |

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

## Versions

Create _Component Versions_ that are patterned after the _Component Base Version_. To do this, right click in the _Component Versions_ area within the Versions tab, and "Create New Component Version" will appear as the only row in the resulting drop-down list. Select this and a new version of the _Component Base Version_ will appear as a box in the _Component Version&#39;s_ area. It will be named after the _Component Base Version_ along with an integer, separated by a semicolon, i.e, "myComponent;1".

Each subsequent _Component Version_ will have incremental number changes. You can rename these. They are linked automatically or by clicking the anchor on the bottom of one _Component Version_ and dragging and dropping it on the top anchor of another. When this is done, the _Component __Items_ of the linked _Component__ Version_ are changed automatically to those of the connected _Component__Version_.

The connecting links can be deleted by right clicking on the link and selecting "Delete this Connection". _Component Versions_ can have multiple Child Versions, that is have multiple connections from its bottom connector. This can be used to indicate different development branches. You can label a branch by right-clicking on the relevant link and selecting "Add Branch Label".

The links for _Component Versions_ is not used in the same way that they are for _Application Versions_ (where they are used to determine the order of Application Deployment during a roll forward or rollback deployment) or _Component Items_ (where the links determine the deployment order). They are used merely for showing the branching of different _Component Versions_ as they are created over time.

Clicking the Plus &#39;+&#39; sign next to a _Component Base Version_ in the tree structure causes it to expand and display all _Component Versions_ for the selected _Component Base Version._ Clicking on one of these causes the tabs to change on the right side of the main window which includes all of the tabs for the _Component Base Version_, with the exception of the Versions tab. These tabs work the same for the _Component Versions_ as they do for the _Component Base_ _Version_.

NOTE: Alternatively, you can create a _Component Version_ by clicking on a _Component Base Version_ in the tree structure, selecting the Versions tab on the right, then right clicking on the _Component Versions_ area. This brings up a drop-down list with "Create New Component Version". Clicking on this creates a new _Component Version_ for this _Component Base Version_, and names it by using the name of the _Component Base Version_ followed by an incremented integer, separated by a semicolon, i.e., "MyComponent;1".

## Timeline

Audit entries for deployments with this tab, including deployment number, _Environment_, and how many days ago the deployment (or hours for all of today&#39;s deployments) took place. Any attribute changes to the _Component_ are also shown on the timeline.

## Timeline Comments

Users can add comments to entries in the timeline by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information. Click on the &#39;Click to see earlier items&#39; link to see other audit entries.

There is a field labeled "Say something about this Component?" above all deployment lines that can have comments placed into it, and files can be attached to the comment as well. Entering text into this field activates the Add Message button. Click on this button to save the comment as a new audit entry.

## Adding Documents to the Timeline

Clicking on the paperclip button next to the Add Message button brings up a file explorer that allows multiple files to be selected and attached to the comment. Comments with files attached are shown with a paperclip. Clicking on the paperclip expands the audit entry to show the files attached to the comment as hyperlinks. Clicking on the link will download the file. This process in browser-specific.

## Subscribe to Components

Users can also click on the Subscribe link in each entry of the list, which places the audit entry into the User&#39;s personal _Timeline_. Any comments added to the auditwill appear in the Timeline tab of the subscriber&#39;s home page.

## Endpoints &amp; Builds

This tab contains a table that shows which _Component Versions_ have been installed on _Endpoints_ within _Environments_. The fields in the table include Environment, Endpoint, Component Version, and Details.

If a _Component Base Version_ is selected, then the _Deployed Endpoints_ Tab will show all the _Component Versions_ of the selected _Component Base Version_ and where they have been deployed. If a _Component Version_ is selected, the display will be limited to only the _Endpoints_ to which that _Component Version_ has been deployed.

## Assigned Applications

This tab contains a table showing to which _Application Versions_ the selected _Component_ is assigned. There are two fields, Application Version and Component Version. This table can be viewed as a kind of quick reference in order to inform the user of which _Applications_ will be affected by changes to _Component Versions_. Clicking on any of the values in the list will take the User to that object.

## Attributes

This tab allows the creation of values that are stored against an object and can be used to control deployments. The Name field holds the name of the value, and the Value field holds the data, which can be either a numeric or text value. It can also be an array of Name/Value pairs. Clicking on a blank Name field allows the user to enter a new Name, and then tab into and enter its associated Value.

To enter the values for an array use the following syntax for the Name:

name[subscript]

You can enter multiple names with different subscripts to create an array. These need not be numeric since arrays in DeployHub are associative.

## Access

You can assign _Groups_ which contain _Users_ to View and Change access to _Component_. There are two Access options for _Component_:

| Access | Description |
| --- | --- |
| _View_ | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the tree structure on the right side. |
| _Change_ | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |
