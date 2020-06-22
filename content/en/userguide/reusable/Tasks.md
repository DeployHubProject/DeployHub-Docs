## Deployment Tasks

Task are used for executing deployments, managing approvals, or staging a deployment. Tasks can be assigned to any _Domain_. However, they are most commonly associated to _Project Domains_ and _Lifecycle Domains_.  The following Task are available as default Tasks, but you can create any type of custom Task. A custom Task will call a Custom [_Action_](/userguide/customizations/2-define-your-actions/):

### Adding, Editing and Deleting Tasks

 You can add new Tasks to a _Domain_ by selecting the +Add in the Task section of the Dashboard. A pop-up will display all available Tasks to add. Selecting the type of Task will add a row into your Task table and display the unique details for that Task.

**Approve Version for Move to Next Pipeline State** 

 Approves the _Application_ or _Release_ version so that it can be moved to a specified state in the pipeline (Lifecycle _Sub-Domain_). This works in conjunction with the Move Version Task (see below). When the Approve Task is defined, the Target _Domain_ has to be specified. When the Approve Task is executed, the selected _Application_ or _Release_ version can either be Approved or Rejected. Only when the an _Application_ or _Release_ version is "approved" can it be "Moved" or "Deployed". |

| "Approve" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access to this Task.  |
|**Approval _Domains_**| The target _Domain_ that approval  is the subject of.   |
|**Approval _Notify Template_**| The _Notify Template_ that will be emailed on approval. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |
|**Rejected _Notify Template_**| The _Notify Template_ that will be emailed on rejection. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |

**Move Version to the Next or Previous Pipeline State** 
Moves an _Application_ or _Release_ version from one Pipeline state (Lifecycle _Sub-Domain_) to another. This can be used as a promotion or a demotion of an _Application_ or _Release_ version between Lifecycle states. When the task is defined, the Lifecycle _Sub-Domain_ has to be specified as part of the task definition. If an Approve task exists in the same Lifecycle _Sub-Domain_ as the Move Version task and the Approve task points to the same Lifecycle _Sub-Domain_, then that Approve task has to have been executed for the selected _Application_ or _Release_ version in order to approve the Version for the Target Lifecyle _Sub-domain_. If this has not been done, the Move Version task will fail when it is executed. In other words, the Approval Task must be accepted for the Move Version to succeed.

| "Move" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access to this Task.  |
|**Move To _Domain_**| The target _Domain_ where the version will be moved. |
|**Success _Notify Template_**| The _Notify Template_ that will be emailed on a successful move. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |
|**Failure _Notify Template_**| The _Notify Template_ that will be emailed on a failed move. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/customizations/2-notifier-templates/).  |

**Deploy Version to _Environment_** 
Deploys an _Application_ or _Release_ version to an _Environment_. The target _Environment_ is selectable via a drop-down list.

| "Deploy" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Sub-domains_**| If this is selected, all _Sub-domains_ will have access to this Task.  |

**Request Calendar Entry for Deployment to an _Environment_** 
DeployHub Pro feature. Sends a request from a _User_ to add a time slot to the calendar for a deployment. The request is sent to _Group_ who has the authority to manage a particular _Enviornment's_ Calendar. . When the Request Task is defined it is linked to the task to be requested. When the Request Task is executed an entry is placed into the "To Do" list of all the _Users_ who are members of the _Group_ with the calendar access. The Request Task can have a Request Notification Template defined which can send out a notification to the appropriate _Groups_.

| "Request" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
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

 Keep in mind that _Groups_ are assigned authority on a _Task_ by _Task_ basis, so that it is possible for a _Domain_ to have two different _Tasks_ that perform the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created that have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc., with different _User Groups_ having authority to run them.

- Example: A _Group_ is given the ability to run a "Move" Task which moves an _Application Version_ from the Test Lifecycle State to the Production Lifecycle State, but a Group consisting of testers does not have the ability to run that same Task.

- Example: A Move Task is linked to a Request Task. A User in the Test Group would run the Request Task, which notifies Users in the Release Group and requests that the Application Version be moved. Users in the Production Group would then receive the Request Task through their To Do List and optionally an email (which was designated as the Request Notification Template in the Request Task). They would then run the linked Move Task to move the Application Version to the Production Lifecycle State.

NOTE: Another way to accomplish this is to link an Approval Task to the Request Task. The User in the User Group would send the Request Task, and a User in the Admin Group would be notified. They would then run the Approve Task to allow the User in the Test Group to run the Move Task.
