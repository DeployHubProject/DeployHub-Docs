---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  Creating and manage Domains with the Domain Dashboard. 
---

## Domains for a Domain Driven Design

_Domains_ are used to catalog and publish microservices and other reusable objects (web components, DB updates, etc.) supporting a Domain Driven Design for organization. Domains make it easy for you to catalog and share reusable _Components_ across siloed teams.  Domains organize reusable objects based on a 'solution' space. Domains can represent functional areas such as 'security services' or departments, teams, and software projects. There are four types of Domains:

| **Domain Type** | Description |
|---| --- |
| **Site Domain** | This is the highest-level organizational structure. For SaaS Users your Site Domain will be defaulted to the Project name you entered when you registered. You can rename your Site Domain if needed. On Premise Installation, your default Site Domain name is 'Global.' You can rename your Site Domain if needed.|
|**Division Domains**| DeployHub Pro User can take advantage of Division Domains. Division Domains are used by larger companies to define an organizational structure that closely represents how they do business, such as geographical areas, organizational responsibility, or business units. A Division Domain is a Sub-Domain. Division Domains can create as many Sub-Division Domains as needed. In addition, objects defined to a specific Division Domain can be secured with specific User Groups.|
|**Project Domains**_ | You assign your software project to a Project Domain. You can create as many Project Domains as needed. Project Domains cannot have child Sub-Project Domains, but they do have Life Cycle Sub-Domains.|
|**Life Cycle Sub-Domains**_| This Sub-Domain defines the stages in your Delivery Pipeline and will map to your Continuous Delivery solution. Only Project Domains can have Life Cycle Sub-Domains. You create Life Cycle Sub-Domains to map to each stage in your continuous delivery Pipeline. Life Cycle Sub-Domains allow you to automate the push of your continuous deployments from development through production. DeployHub can be called by your Continuous Delivery Engine (Jenkins X, CircleCI, GitLab or GitHub Actions,ect.) to perform the continuous configuration management of your microservices and_Applictions_ across all states of your pipeline. If you are not using a Continuous Delivery orchestration engine, you can assign Move, Approve and Request Tasks to your Life Cycle Sub-Domain to define a continuous delivery process within DeployHub. You can create as many Life Cycle Sub-Domains as you need for each of your Project Domains. You can also rename Life Cycle Domains if your Pipeline changes. |

### Top Down Domain Structure

A _Sub Domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Divisional Domains_,  _Project Domains_ and _Life Cycle Sub-Domains_. All inherited access properties are shown within the Access lists

## Using the Domain Dashboard Adding, Editing or Deleting

The Domain Dashboard provides you a full view of all _Domains_ which you have access to based on your User privileges.  The view is displayed in a "Sun Burst" map, starting at the highest level _Domain_ with the ability to drive down into the Sub-Domains, and Sub-Domains after that. The detail section of the Dashboard displays the information based on the Sun Burst selection. Each time you move up or down the _Domain_ hierarchy using the Sun Burst map, your detail information will be re-displayed according to where you are in the map.  Folloiwng is a description of the _Domain_ details provided by the _Domain_ Dashboard:

### _Domain_ Details

| Details | Description |
| --- | --- |
|Full Name | The fully qualified _Domain_ Name including any parent _Domains_.
| Name | The Name of the _Domain_ |
| Summary | Domain Description |
| Owner Type | User or Group |
| Owner | Name of the Owner|
| Created | Auto generated date when the _Domain_ was created.|
| Modified | Auto generated date when the _Domain_ was modified.|
| Sub-Domains | All Sub-Domains assigned to this _Domain_ including all _Life Cycle Domains_.

{{% include "userguide/reusable/Access Object.md" %}}

## Tasks in this _Domain_

_Domains_ can have _Tasks_ assigned to manage the _Applications_ contained within. _Tasks_ are most commonly assigned to the _Life Cycle Sub-Domains_ and are most commonly used to define a continuous delivery process. _Tasks_ can be assigned to any _Domain_ or _Sub-Domain. Task_ execution rights can be assigned to _User Groups_. Only users who are members of one or more of the assigned _User Group(s)_ can execute the _Task_. **DeployHub Team** has no execution rights over _Tasks_.

_Tasks_ are defined for each _Domain_. By checking the _Available in Sub-Domains_ checkbox then the _Task_ is made available to every _Sub-Domain_ or _Life Cycle Sub-Domain_ below the _Task's Domain_ in the hierarchy.

There are 7 different types of _Tasks_:

| _Task_ | Description |
| --- | --- |
| _**Move Version**_ | Moves an _Application Version_ from one _Domain_ to another. This is typically used as a promotion or a demotion of an _Application Version_ between _Life Cycle Sub-Domains_. When the _Task_ is defined, the _Target Domain_ has to be specified as part of the _Task_ definition. The selected _Application Version_ has to be approved for the _Target Domain_ before the _Move Version_ to that _Domain_ will succeed. Once the _Move Version Task_ has been approved by the _Approval Task_, the _Application Version_ can be moved back and forth between the two _Domains_ until the _Application Version_ has been rejected through the use of the _Approval Task_. |
| _**Deploy**_ | Deploys an _Application Version_ to an _Environment._ The target _Environment_ is selectable via a drop-down list. |
| _**Request**_ | For **DeployHub Pro** - When a _User_ needs to run a _Task_ but doesn't have access to it, a _Request__Task_ is used to ask those with access to the _Task_ to run it. When the _Request Task_ is executed an entry is placed into the "To Do" list of all the _Users_ who are members of the _User Group(s)_ which have execute access to the _Linked Task_. When the _Linked Task_ is executed by one of the _Users_ with access, the request is removed from all of the _Users_ "To Do" lists. The _Request Task_ can have a _Request Notification Template_ defined which can send out a notification to the appropriate _User Group(s)_ when it is executed or that it needs to be performed. |
| _**Approve**_ | Approves a _Request Task_ so that its linked _Task_ can be executed within a specified _Domain_. For example, in **DeployHub Pro** , a _User_ that belongs to a _Group_ with the authority, via a _Move Task_, to move a particular _Application_ to a specified _Domain_ can do so, but a _User_ in a _Group_ that has not been assigned the authority for this _Move Task_ must request approval from someone in a _Group_ that does have the authority. When the _User_ with the authority receives the request, that _User_ can run an _Approval Task_, which will then allow a _User_ with access to move the _Application_ to the target _Domain_. Keep in mind, if an _Approval Task_ exists within a _Domain,_ it must be run before any _Move Tasks_ can be executed to move an _Application Version_ into the specified _Domain_. |
| _**Remove Application**_ | Removes the _Application Base __Version_ from an _Environment_, by rolling back from the currently installed _Application Version_. All files are removed, and all _Rollback__ Actions_ are executed for each _Application Version_ between the Version installed in the _Target Environment_ and the _Application Base Version_. The _Rollback Action_ associated with the _Application Base Version_ is then executed. (Normally, when rolling back to the _Application Base Version_, the _Rollback Action_ is not executed, and the _Application Base Version_ remains deployed.)  A _Remove Application_ Task cannot be executed against an _Application Version_, only an _Application Base Version_. |
| _**Create Version**_ | Makes a new _Application Version_ from either an _Application Base Version_ or a specific _Application Version_, depending on the choice made by the _User_. The _Domain_ where the new _Application Version_ is created can be chosen in the _Create Version in Domain_ field. |
| _**Run Action**_ | Runs a stand-alone _Action_. It will be available only in the _Domain_ or _Life Cycle Sub-Domain_ where it is created, unless the 'Available in Sub-Domains' checkbox is selected. The _Task_ can be selected by right clicking on the _Domain_ or _Life Cycle Sub-Domain_ or by right clicking on an _Application._ In the latter case, the selected _Application_ is automatically placed onto the stack where it is available for the _Action_ to process. See DMScript documentation and the discussion on _Actions_ for more information. |

## Adding and Editing Tasks in the Lifecycle Domains

You can create as many _Tasks_ as necessary in a _Domain_ or _Life Cycle Sub-Domain_. _Tasks_ can be renamed to reference the unique purpose of the _Task_, for example 'Deploy AR to Dev'. You can add new _Tasks_ to a _Domain_ by first selecting the _Task Tab_. Right click anywhere in the '_Tasks in the Domain_' selection dialog. The right click will display the list of available _Task__Types_. Select the _Task Type_ you require, and it will be added to the list of _Tasks_ for the current _Domain_. The _Task_ will be created with a default name based on its type along with a number to make the name unique. It is recommended that the newly created _Task_ be renamed to something more meaningful than the default name. You can edit the new _Task_ by selecting the _Task_ and using the pencil icon found in the right-hand corner of the window. _Tasks_ will have the following options:

| Field | Description |
| --- | --- |
| **Name** | The name of the Task. |
| **Pre-Action** | The Action to be executed before the Task is run. |
| **Post-Action** | The Action to be executed after the Task is run. |
| **<approve/move/create in>Domain** | Optional depending on the type of Task, this is the target Domain for the Approve, Move, or Create Task. |
| **Show Output** | When selected, a log will be shown after the Task has executed. |
| **Linked Task (Request Task Only)** | When a User, who can't execute the Task, requests another User with access to run. |
| **Available in Sub-Domains** | Makes the Task available to all Sub-Domains under the current Domain. |
| **Success Notification Template** | Notification to be sent if the Task succeeds. |
| **Failure Notification Template** | Notification to be sent if the Task fails. |
| **Action to Run** | For Run Action Tasks, the action to execute when the Task is run. |

All _Tasks_ created are available in a drop-down list using a right mouse click from the _Component_, _Application,_ or _Release_ tree structure. This allows you to perform these actions against a _Component Version_, _Application Version_ or a _Release Version_. Run Action _Tasks_ can also be invoked by right-clicking on the _Domain_ or _Life Cycle Sub-Domain_.

## Pre and Post Task Actions

Assigning Pre-Actions and Post-Actions to _Tasks_ adds versatility to them, allowing such things as prerequisite checking and clean-up operations to take place before and after the execution of a _Task._ You can create any type of _Action_ by going to the Flows Menu option and adding an _Action._ Any _Actions_ created for the _Domain_ and any _Parent Domains_ will be available in the Pre and Post Action drop down box.

A Pre-Action will be executed before the _Task_ is run. If the pre-action fails in some way (either by returning a non-zero exit code or by aborting) then the _Task_ is not executed. This can be used for validity checking.

A Post-Action will be executed after the _Task_ is run. The Post-Action is always executed regardless of whether the _Task_ itself has run successfully.

## Task Execute Access

Once a _Task_ is defined, it must be granted execute access before it can be invoked. To do this, select the _Task_ from the _Tasks in this Domain_ area and drag the desired User Group(s) from the _Available Groups_ column to the _Group Access_ area. Users who are members of the User Group(s) in the _Group Access_ area will be allowed to execute the specified task.

Keep in mind that _Group_s are assigned authority on a _Task_ by _Task_ basis, so that it is possible for a _Domain_ to have two different _Tasks_ that perform the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created that have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc., with different _User Group_s having authority to run them.

Example: A _Group_ is given the ability to run a Move _Task_ which moves an _Application Version_ from the Test _Lifecycle State_ to the Production _Lifecycle State_, but a _Group_ consisting of testers does not have the ability to run that same _Task_.

Example: A Move _Task_ is linked to a Request _Task_. A _User_ in the Test _Group_ would run the Request _Task_, which notifies _Users_ in the Release _Group_ and requests that the _Application Version_ be moved. _Users_ in the Production _Group_ would then receive the Request _Task_ through their home page (click on the 'house' icon on the upper right of the DeployHub window) and optionally an email (which was designated as the Request Notification Template in the Request _Task_). They would then run the linked Move _Task_ to move the _Application Version_ to the Production _Lifecycle State._

NOTE: Another way to accomplish this is to link an Approval Task to the Request Task. The User in the User Group would send the Request Task, and a User in the Admin Group would be notified. They would then run the Approve Task to allow the User in the Test Group to run the Move Task.

NOTE: **DeployHub Team** has only two Groups, Administrators and Users. **Deployhub Pro** can have unlimited User Groups.

## Additional Parameters

Additional parameters can be added to a _Task_ by clicking the plus icon in the lower right corner. A window appears that allows the entry of a Label, a Variable, and a Type.

- Label: This will appear on the _Task_'s execution window whenever the _Task_ is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a _Task_ is executed, where values can be either entered or selected, depending on the Type.

- Type: A value is entered if it is an Entry or Password field type field (a Password type field shows the entered characters as bullet points), or the value is selected from the list if it is a Dropdown. If Dropdown is selected from the list of available Types, another field will appear and the name of an array that contains the list values can be entered.

Additional Parameters are stored in Global variables that can be referenced anywhere within DeployHub during the execution of the _Task_. This is particularly useful during deployments where Pre and Post Actions are executed at the _Component_ and _Application_ levels.

## Creating a Life Cycle Sub-Domain

NOTE: All _Domains_ in **DeployHub Team** are _Project Domains_ except for the high-level _Site Domain._

When you set the _Sub-Domain_ to include _Lifecycle States_ from the _Domain_ Edit dialog, you define that _Domain_ as a _Project Domain_ with all further child _Sub-Domains_ to be _Lifecycle Sub-Domains._ They will all exist at the same level of the _Domain_ hierarchy_. Life Cycle Sub-Domains_ are a type of child _Sub-Domain_ that allows the parent _Sub-Domain_ to be defined to have a _Lifecycle_ process for Continuous Delivery. _Lifecycle_ processes allow for the management of the flow of the _Application_ as it moves through various states within the enterprise, such as from Development through Production.

In order to create a _Life Cycle Sub-Domain_, edit the _Sub-Domain_ by highlighting it in the tree structure and select the pencil icon in the right-hand corner. Select the _Contains Lifecycle_ checkbox in the edit dialog. This will now restrict the addition of any lower level _Sub-Domains_, and instead allow you to create _Life Cycle Sub-Domains_. A _Life Cycle Sub-Domain_ cannot have a child _Sub-Domain._ The icon for the newly created _Life Cycle Sub-Domain_ will change from a world to a flowchart, indicating that this is now a _Life Cycle Sub-Domain_. You can re-order the _Life Cycle Sub-Domains_ by selecting the higher level _Sub-Domain_ General Tab. Edit the _Sub-Domain_ by selecting the pencil icon in the right-hand corner. This will bring you to the Edit General dialog box. You can drag and drop the _Life Cycle Sub-Domains_ to re-order them.
