---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  Create and Manage _Domains_  
---

## A Domain Driven Design

_Domains_ catalog and publish microservices and other reusable objects (web components, DB updates, etc.). This Domain Driven Design is critical for organization. Domains make it easier to catalog and share reusable _Components_ across siloed teams. They organize reusable objects based on a 'solution' space. They can represent functional areas such as 'security services' or departments, teams, and software projects.

### Top Down Structure

A _Sub-domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Divisional Domains_,  _Project Domains_ and _Life Cycle Sub-domains_.

There are typically four common ways to implement _Domains_:

| **Purpose** | Description |
|---| --- |
| **Site _Domain_** | This is the highest-level and default _Domain_. For SaaS Users, your Site _Domain_ will be defaulted to the Project name from registration. You can rename your Site _Domain_ if needed. For an On-Premise installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Sub-domains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Sub-domains_.|
|**Catalog _Sub-domains_**| Used to organize reusable _Components_, such as microservices. At this level, you create as many _Sub-domains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could build your Catalog as follows: <li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>
|**Division Sub-domains**| DeployHub Pro Users can take advantage of Division Domains. These are used by larger companies to define a catalog to share _Components_ based on geographical areas, organizational responsibility, or business units as suitable. A Division _Sub-Domain_ can have many child _Sub-domains_. For example, a Catalog _Sub-Domain_ for Security and Purchasing Services could be broken down into further _Sub-domains_: <ul><li> Security Services</li><ul><li>Login Services</li><li>Payment Processing Services <li>Merchant Services</li><li>EMEA Shipping Services</li><li>North America Shipping Services</li></ul><br><li>Purchase Processing Services</li><ul><li>EMEA Check-out Services</li><li>North America Check-out Services</li></ul> |
|**Project Sub-domains**| These contain only Life Cycle Sub-domains and are intended for the management of an _Application_. An _Application_ is a package of _Components_ that are versioned and tracked together.  _Applications_ are managed via a continuous delivery pipeline or "life cycle". If you define your _Sub-Domain_ as "Contains Life Cycles", you are restricting any lower _Sub-domains_ except for Life Cycle _Sub-domains_.|
|**Life Cycle Sub-domains**| This lowest level of Sub-Domain is available when the parent _Domain_  has "Contains Life Cycles". These Life Cycle _Sub-domains_ map to each stage in your continuous delivery pipeline. Most often they have specific _Environments_ and _Tasks_ assigned for interaction with your continuous delivery orchestration engine. DeployHub can be called by your continuous delivery Engine (Jenkins X, CircleCI, CloudBuild, GitLab or GitHub Actions,ect.) to perform the continuous configuration management of your microservices and _Applications_ across all _Environment_ states. If you are not using a continuous delivery orchestration engine, you can assign Move, Approve and Request Tasks to your Life Cycle _Sub-Domain_ to define a continuous delivery pipeline process within DeployHub. |

![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)

## Using the Domain Dashboard 

You can access a full view of all _Domains_ on the dashboard based on your User privileges. The view is displayed in a "Sun Burst" map, starting at the highest level _Domain_ with the ability to drive down into the _Sub-domains_, and _Sub-domains_ after that.

Each time you move up or down the _Domain_ hierarchy using the Sun Burst map, your detail information will be re-displayed according to where you are in the map.  Following is a description of the _Domain_ details:

### _Domain_ Details

| Details | Description |
| --- | --- |
|Full Domain | The fully qualified _Domain_ Name including any parent _Domains_.
| Name | The Name of the _Domain_. |
| Summary | Domain Description. |
| Owner Type | User or Group. |
| Owner | Name of the Owner.|
| Created | Auto generated date when it was created.|
| Modified | Auto generated date when it was modified.|
| Engine| The hostname of the deployment engine. Defaults to "Deployment Engine." This field can be used to specify another DeployHub Deployment Engine for widely distributed deployments. |
|Contains Lifecycles| This specifies that the _Domain_ will include a Pipeline model.  Lifecycles are normally used as _Sub-domains_ to the Project _Domain_.  Lifecycle _Domains_ cannot have _Sub-domains_. |
| Sub-domains | A list of all _Sub-domains_ assigned to this _Domain_ including all _Life Cycle Domains_.

### Access Control

 _Users_ within designated _Groups_ can update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Domain_ in the following ways:

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Domain_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the tree structure. |
| **Change** | Allows the _User_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows _Users_ to see the _Domain_.|
| **Write** | Allows _Users_ to create _Sub-domains_. |

## Tasks

Tasks can be assigned to any _Domain_. However, they are most commonly associated to _Project Domains_ and _Lifecycle Domains_. Task are used for executing manual deployments, managing approvals, or staging a deployment. The following Task are available as default Tasks, but you can create any type of custom Task. A custom Task will call Custom _Actions_:


### Adding, Editing and Deleting Tasks 

 You can add new Tasks to a _Domain_ by selecting the +Add in the Task section of the Dashboard. A pop-up will display all available Tasks to Add. Selecting one to add a row into your table and to display the unique details for that Task.


**Approve Version for Move to Next Pipeline State** 

 Approves the _Application_ or _Release_ version so that it can be moved to a specified state in the pipeline (Lifecycle _Sub-Domain_). This works in conjunction with the Move Version Task (see below). When the Approve Task is defined, the Target _Domain_ has to be specified. When the Approve Task is executed, the selected _Application_ or _Release_ version can either be Approved or Rejected. Only when an _Application_ or _Release_ version is "approved" can it be "Moved" or "Deployed". |

| "Approve" Task Detail Fields| Description|
|---|---|
|**Name**| The name can be changed to make it unique. |
|**Created**| The auto generated date and time it was added. |
|**Modified**| The auto generated date and time the it updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access.  |
|**Approval _Domains_**| The target _Domain_ that approval  is the subject of.   |
|**Approval _Notify Template_**| The _Notify Template_ that will be emailed on approval. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |
|**Rejected _Notify Template_**| The _Notify Template_ that will be emailed on rejection. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |


**Move Version to the Next or Previous Pipeline State** 
Moving an _Application_ or _Release_ version from one Pipeline state (Lifecycle _Sub-Domain_) can be  a promotion or a demotion of an _Application_ or _Release_ version between Lifecycle states. When the task is defined, the Lifecycle _Sub-Domain_ has to be specified as part of the task definition. If an Approve task exists in the same Lifecycle _Sub-Domain_ as the Move Version task, and the Approve task points to the same Lifecycle _Sub-Domain_, then that Approve task has to have been executed for the selected _Application_ or _Release_ version in order to approve the Version for the Target Lifecyle _Sub-domain_. If this has not been done, the Move Version task will fail when it is executed. In other words, the Approval Task must be accepted for the Move Version to succeed.

| "Move" Task Detail Fields| Description|
|---|---|
|**Name**| The name can be changed to make the Task unique. |
|**Created**| The auto generated date and time it was added. |
|**Modified**| The auto generated date and time it was updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access.  |
|**Move To _Domain_**| The target _Domain_ where the version will be moved. |
|**Success _Notify Template_**| The _Notify Template_ that will be emailed on a successful move. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |
|**Failure _Notify Template_**| The _Notify Template_ that will be emailed on a failed move. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |


**Deploy Version to _Environment_** 
Deploys an _Application_ or _Release_ version to an _Environment_. The target _Environment_ is selectable via a drop-down list.

| "Deploy" Task Detail Fields| Description|
|---|---|
|**Name**| The name can be changed to make the Task unique. |
|**Created**| The auto generated date and time it was added. |
|**Modified**| The auto generated date and time it was updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access.  |

**Request Calendar Entry for Deployment to an _Environment_** 
This DeployHub Pro feature sends a request from a _User_ to add a time slot to the calendar for a deployment. The request is sent to _Group_ who has the authority to manage a particular _Enviornment's_ Calendar. When the Request Task is defined, it is linked to the task to be requested. When the Request Task is executed, an entry is placed into the "To Do" list of all the _Users_ who are members of the _Group_ with the calendar access. A Request Notification Template can be defined for a notification to the appropriate _Groups_.

| "Request" Task Detail Fields| Description|
|---|---|
|**Name**| The name can be changed to make the Task unique. |
|**Created**| The auto generated date and time it was added. |
|**Modified**| The auto generated date and time it was updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access to this Task.  |
|**Linked Task**| The target _Domain_ where the version will be moved. |
|**Request _Notify Template_**| The _Notify Template_ that will be emailed for the request. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |

**Manually Trigger _Action_ to be executed**
Runs a stand-alone Action. For example, if you need to interrupt a deployment process, this Task allows you to execute the steps manually. The manually triggered _Action_ will be placed in the "To do" list of the _User_ or _Group_ that executed the Deploy Task.

| "Manually Trigger" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
|**Action to Run**| The Action that will be executed manually. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access to this Task.  |
|**Success _Notify Template_**| The _Notify Template_ that will be emailed on a successful _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |
|**Failure _Notify Template_**| The _Notify Template_ that will be emailed on a failed _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |


You can also delete a Task in the table using the Delete "trash can" icon next to the Task item.

**Task Execute Access**

Once a _Task_ is defined, it must be granted execute access to a _Group_ before it can be invoked. To do this, select the _Task_ from the _Tasks_ table using the check box. Drag the desired  _Group_ from the _Available Groups_ column to the _Group Access_ area. _Users_ who are members of the _Group_ will be allowed to execute the specified task.

 Keep in mind that _Groups_ are assigned authority on a _Task_ by _Task_ basis, so that it is possible for a _Domain_ to have two different _Tasks_ that perform the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created that have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc., with different _UserGroups_ having authority to run them.

~~~
Example: A _Group_ is given the ability to run a "Move" Task which moves an _Application Version_ from the Test Lifecycle State to the Production Lifecycle State, but a Group consisting of testers does not have the ability to run that same Task.

Example: A Move Task is linked to a Request Task. A User in the Test Group would run the Request Task, which notifies Users in the Release Group and requests that the Application Version be moved. Users in the Production Group would then receive the Request Task through their To Do List and optionally an email (which was designated as the Request Notification Template in the Request Task). They would then run the linked Move Task to move the Application Version to the Production Lifecycle State.

NOTE: Another way to accomplish this is to link an Approval Task to the Request Task. The User in the UserGroup would send the Request Task, and a User in the Admin Group would be notified. They would then run the Approve Task to allow the User in the Test Group to run the Move Task.
~~~

### Additional Parameters

Additional parameters can be added to a Task.  These additional parameters that are past to the Task are going to set a Global Variable at execution time. To add addtional parameters, select the _Task_ from the _Tasks_ table using the check box. Use the +Add to create a new entry into the Parameters table for the selected task. It will have two columns: 

- Label: This will appear on the _Task_'s execution window whenever the _Task_ is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a _Task_ is executed, where values can be either entered or selected, depending on the Type.

You will need to use the Save to commit the change to the table. You can use the Edit to update a Task, or Delete to remove a Task. 
