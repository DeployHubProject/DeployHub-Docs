---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  Creating and manage Domains with the Domain Dashboard. 
---

## Domains for a Domain Driven Design

_Domains_ are used to catalog and publish microservices and other reusable objects (web components, DB updates, etc.) supporting a Domain Driven Design for organization. Domains make it easy for you to catalog and share reusable _Components_ across siloed teams.  Domains organize reusable objects based on a 'solution' space. Domains can represent functional areas such as 'security services' or departments, teams, and software projects.

### Top Down Domain Structure

A _Sub Domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Divisional Domains_,  _Project Domains_ and _Life Cycle Sub-Domains_.

There are typically 4 common ways to implement _Domains_:

| **Purpose** | Description |
|---| --- |
| **Site Domain** | This is the highest-level and default _Domain_. Everyone has a Site _Domain_. For SaaS Users your Site _Domain_ will be defaulted to the Project name you entered when you registered. You can rename your Site _Domain_ if needed. For an on Premise Installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Sub-Domains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Sub-Domains_.|
|**Catalog Sub-Domains**| Organizing reusable _Components_, such as microservices, can be done using a Catalog _Sub-Domain_. At this level, you create as many _Sub-Domains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could build your Catalog as follows: <ul><li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>
|**Division Sub-Domains**| DeployHub Pro Users can take advantage of Division Domains. Division Domains are used by larger companies to define a catalog that more closely represents how they do business and how they want to share _Components_ based on geographical areas, organizational responsibility, or business units. A Division _Sub-Domain_ can have as many child _Sub-Domains_ as needed. For example, a Catalog _Sub-Domain_ for Security and Purchasing Services could be broken down into further _Sub-Domains_: <ul><li> Security Services</li><ul><li>Login Services</li><li>Payment Processing Services <li>Merchant Services</li><li>EMEA Shipping Services</li><li>North America Shipping Services</li></ul><br><li>Purchase Processing Services</li><ul><li>EMEA Check-out Services</li><li>North America Check-out Services</li></ul> |
|**Project Sub-Domains**| Project _Sub-Domains_ are unique because they contain only Life Cycle Sub-Domains and are intended for the management of an _Application_.  An _Application_ is a package of _Components_ that are versioned and tracked together.  _Applications_ are managed via a continuous delivery pipeline or "life cycle". If you define your _Sub-Domain_ as "Contains Life Cycles", you are restricting any lower _Sub-Domains_ except for Life Cycle _Sub-Domains_.|
|**Life Cycle Sub-Domains**| This is the lowest level of Sub-Domain and is available when the parent _Domain_ is defined has "Contains Life Cycles". You create Life Cycle _Sub-Domains_ to map to each stage in your continuous delivery pipeline. Most often Life Cycle _Sub-Domains_ have specific _Environments_ and _Tasks_ assigned for interaction with your continuous delivery orchestration engine.  DeployHub can be called by your continuous delivery Engine (Jenkins X, CircleCI, CloudBuild, GitLab or GitHub Actions,ect.) to perform the continuous configuration management of your microservices and _Applications_ across all _Environment_ states. If you are not using a continuous delivery orchestration engine, you can assign Move, Approve and Request Tasks to your Life Cycle _Sub-Domain_ to define a continuous delivery pipeline process within DeployHub. |

![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)

## Using the Domain Dashboard for Viewing and Editing

The Domain Dashboard provides you a full view of all _Domains_ which you have access to based on your User privileges.  The view is displayed in a "Sun Burst" map, starting at the highest level _Domain_ with the ability to drive down into the _Sub-domains_, and _Sub-domains_ after that.

The detail section of the Dashboard displays the information based on the Sun Burst selection. Each time you move up or down the _Domain_ hierarchy using the Sun Burst map, your detail information will be re-displayed according to where you are in the map.  Following is a description of the _Domain_ details:

### _Domain_ Details

| Details | Description |
| --- | --- |
|Full Domain | The fully qualified _Domain_ Name including any parent _Domains_.
| Name | The Name of the _Domain_. |
| Summary | Domain Description. |
| Owner Type | User or Group. |
| Owner | Name of the Owner.|
| Created | Auto generated date when the _Domain_ was created.|
| Modified | Auto generated date when the _Domain_ was modified.|
| Engine| The hostname of the deployment engine. Defaults to "Deployment Engine." This field can be used to specify another DeployHub Deployment Engine for widely distributed deployments. |
|Containes Lifecycles| This specifies that the _Domain_ will include a Pipeline model.  Lifecycles are normally used as _Sub-domains_ to the Project _Domain_.  Lifecycle _Domains_ cannot have _Sub-domains_. |
| Sub-Domains | A list of all _Sub-domains_ assigned to this _Domain_ including all _Life Cycle Domains_.

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Domain_ in the following ways:

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Domain_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the tree structure. |
| **Change** | Allows the _User_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows _Users_ to see the _Domain_.|
| **Write** | Allows _Users_ to create _Sub-Domains_. |

### Tasks in this _Domain_

_Domains_ can have _Tasks_ assigned to manage the _Applications_ contained within. _Tasks_ are most commonly used for _Life Cycle Sub-Domains_ to define a continuous delivery process that can be mapped to your Continuous Delivery soltuion. _Tasks_ can be assigned to any _Domain_ or _Sub-Domain. Task_ execution rights can be assigned to _User Groups_. Only _Users_ who are members of one or more of the assigned _User Group(s)_ can execute the _Task_. **DeployHub Team** has no execution restriction rights over _Tasks_.

_Tasks_ are defined for each _Domain_. By checking the _Available in Sub-Domains_ checkbox then the _Task_ is made available to every _Sub-Domain_ or _Life Cycle Sub-Domain_ below the _Task's Domain_ in the hierarchy.

There are 7 different types of _Tasks_. By default, your _Domain_ is created with four primary Tasks listed below:

| _Task_ | Description |
| --- | --- |
|"Approve Application Version for Move to next Pipeline stage" | If your life cycle requires an approval process, this Task will serve the purpose. This "Approve" task is linked to the "Move Application Version..." Task.  For example, a _User_ must request approval from an _Administrator_ to _Move_ an _Application_ Version from a development stage to a Test stage.  Keep in mind, if an "Approve Application Version..." Task is defined to the _Domain,_ it must be run before the "Move Application Version..." can be executed. When the "Approve Application Version..." is executed, an entry is placed into the "To Do" list of all the _Users_ who have approval authority.  Once the Task is completed, the "Approve Application Version..." Task is removed from all of the _Users_ "To Do" lists. This Task can have an Approve Notification Template or a Reject Notification Template defined which can send out a notification to the appropriate _Users_ when it is executed. |
|"Move Application Version to the next or previous stage in the pipeline" | (Default Task) Moves an _Application Version_ from one life cycle stage to another. This is typically used as a promotion or a demotion of an _Application Version_ between _Life Cycle Sub-Domains_, i.e. a promotion from Dev to Test.  When the _Task_ is defined, the _Target Domain_ has to be specified as part of the _Task_ definition. If the "Approve Application Version ..." Task is defined to the _Domain_, the selected _Application Version_ has to be approved before this task will succeed. |
|"Deploy Application Version to an Environment"| (Default Task) Deploys an _Application Version_ to an _Environment._ The target _Environment_ is selectable via a drop-down list. |
| "Request calendar entry for a deployment to an Environment" | For **DeployHub Pro** - Deployments can be scheduled on the calendar via a calendar entry.  If you do not want all _Users_ to have access to the calendar, you can allow them to "Request" that a deployment be added to the calendar schedule. When the "Request calendar entry..." is executed, an entry is placed into the "To Do" list of all the _Users_ who have access to update the calendar.  Once the Task is completed, the "Request Calendar entry..." Task is removed from all of the _User_ "To Do" lists. This Task can have a _Request Notification Template_ defined which can send out a notification to the appropriate _Users_ when it is executed or that it needs to be performed. |
| Create new Application Version | (Default Task) Makes a new _Application Version_ from either an _Application Base Version_ or a specific _Application Version_, depending on the choice made by the _User_. This Task is also useful for integration into your continuous delivery pipeline to continuously update the _Application Version_ each time a new microservice is pushed to the cluster.  |
| "Manually trigger an Action to be executed"| (Defualt Tasks) Runs a stand-alone _Action_. It will be available only in the _Domain_ where it is created, unless the 'Available in Sub-Domains' checkbox is selected.|

### Adding and Editing Tasks in the Lifecycle Domains

 You can add new _Tasks_ to a _Domain_ by selecting the "+Add Task" in the _Task_ section of the Dashboard and selecting the type of _Task_ you would like to add to your _Domain_. Alternatively, you can select a _Task_ and delete it using the Delete "trash can" icon.

 When you create a new _Task_ is is created with a default name based on its type along with a number to make the name unique. It is recommended that the newly created _Task_ be renamed to something more meaningful than the default name.  _Tasks_ will have the following options:

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

### Pre and Post Task Actions

Assigning Pre-Actions and Post-Actions to _Tasks_ adds versatility to them, allowing such things as prerequisite checking and clean-up operations to take place before and after the execution of a _Task._ You can create any type of _Action_ by going to the _Actions_ Menu option and adding an _Action._ Any _Actions_ created for the _Domain_ and any _Parent Domains_ will be available in the Pre and Post Action drop down box.

A Pre-Action will be executed before the _Task_ is run. If the pre-action fails in some way (either by returning a non-zero exit code or by aborting) then the _Task_ is not executed. This can be used for validity checking.

A Post-Action will be executed after the _Task_ is run. The Post-Action is always executed regardless of whether the _Task_ itself has run successfully.

### Task Execute Access

Once a _Task_ is defined, it must be granted execute access before it can be invoked. To do this, select the _Task_ from the _Tasks in this Domain_ area and drag the desired User Group(s) from the _Available Groups_ column to the _Group Access_ area. Users who are members of the User Group(s) in the _Group Access_ area will be allowed to execute the specified task.

 Keep in mind that _Groups_ are assigned authority on a _Task_ by _Task_ basis, so that it is possible for a _Domain_ to have two different _Tasks_ that perform the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created that have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc., with different _User Groups_ having authority to run them.

Example: A _Group_ is given the ability to run a Move _Task_ which moves an _Application Version_ from the Test _Lifecycle State_ to the Production _Lifecycle State_, but a _Group_ consisting of testers does not have the ability to run that same _Task_.

Example: A Move _Task_ is linked to a Request _Task_. A _User_ in the Test _Group_ would run the Request _Task_, which notifies _Users_ in the Release _Group_ and requests that the _Application Version_ be moved. _Users_ in the Production _Group_ would then receive the Request _Task_ through their home page (click on the 'house' icon on the upper right of the DeployHub window) and optionally an email (which was designated as the Request Notification Template in the Request _Task_). They would then run the linked Move _Task_ to move the _Application Version_ to the Production _Lifecycle State._

NOTE: Another way to accomplish this is to link an Approval Task to the Request Task. The User in the User Group would send the Request Task, and a User in the Admin Group would be notified. They would then run the Approve Task to allow the User in the Test Group to run the Move Task.

NOTE: **DeployHub Team** has only two Groups, Administrators and Users. **Deployhub Pro** can have unlimited User Groups.

### Additional Parameters

Additional parameters can be added to a _Task_ by clicking the plus icon in the lower right corner. A window appears that allows the entry of a Label, a Variable, and a Type.

- Label: This will appear on the _Task_'s execution window whenever the _Task_ is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a _Task_ is executed, where values can be either entered or selected, depending on the Type.

- Type: A value is entered if it is an Entry or Password field type field (a Password type field shows the entered characters as bullet points), or the value is selected from the list if it is a Dropdown. If Dropdown is selected from the list of available Types, another field will appear and the name of an array that contains the list values can be entered.

Additional Parameters are stored in Global variables that can be referenced anywhere within DeployHub during the execution of the _Task_. This is particularly useful during deployments where Pre and Post Actions are executed at the _Component_ and _Application_ levels.

## Creating a Life Cycle Sub-Domain

When you set the _Sub-Domain_ to include _Lifecycle States_ from the _Domain_ Edit dialog, you define that _Domain_ as a _Project Domain_ with all further child _Sub-Domains_ to be _Lifecycle Sub-Domains._ They will all exist at the same level of the _Domain_ hierarchy_. Life Cycle Sub-Domains_ are a type of child _Sub-Domain_ that allows the parent _Sub-Domain_ to be defined to have a _Lifecycle_ process for Continuous Delivery. _Lifecycle_ processes allow for the management of the flow of the _Application_ as it moves through various states within the enterprise, such as from Development through Production.

In order to create a _Life Cycle Sub-Domain_, edit the _Sub-Domain_ by highlighting it in the tree structure and select the pencil icon in the right-hand corner. Select the _Contains Lifecycle_ checkbox in the edit dialog. This will now restrict the addition of any lower level _Sub-Domains_, and instead allow you to create _Life Cycle Sub-Domains_. A _Life Cycle Sub-Domain_ cannot have a child _Sub-Domain._ The icon for the newly created _Life Cycle Sub-Domain_ will change from a world to a flowchart, indicating that this is now a _Life Cycle Sub-Domain_. You can re-order the _Life Cycle Sub-Domains_ by selecting the higher level _Sub-Domain_ General Tab. Edit the _Sub-Domain_ by selecting the pencil icon in the right-hand corner. This will bring you to the Edit General dialog box. You can drag and drop the _Life Cycle Sub-Domains_ to re-order them.
