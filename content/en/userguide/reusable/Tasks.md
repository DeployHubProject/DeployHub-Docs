
## Deployment Tasks

Task are used for executing deployments, managing approvals, or staging a deployment. Tasks can be assigned to any _Domain_. However, they are most commonly associated to _Project Domains_. You can assign a Task at a higher _Domain_ level allowing any child _Domains_ to automatically inherit the Tasks. This inheritance simplifies managing Tasks by making some common to all of your _Subdomains_. However, this means that a Catalog _Domain_ may include Tasks that it cannot use.

The following Tasks are available as default Tasks, but you can create any type of custom Task. A custom Task will call a Custom [_Action_](/userguide/advanced-features/deployments/2-define-your-actions/):

- Deploy Version to _Environment_
- Manually Trigger _Action_ to be executed

### DeployHub Calendars

DeployHub includes a ["smart" Calendar](/userguide/advanced-features/deployments/calendar/).  The following Task are used to interact with the DeployHub Smart Calendar for Requesting and Approving deployments.

- Request Calendar Entry for Deployment to an _Environment_

### Adding, Editing and Deleting Tasks

 You can add new Tasks from the _Domain_ Dashboard by navigating to the _Domain_ and interacting with the Tasks Section.  Select the +Add option from the Tasks Section and a pop-up displays all available Tasks. Selecting a Task will add a new row into the table.  Use the Task Detail Section to define the unique details of your new Task. You can update or remove a Task by using the Task Section table.  Using the checkbox, select the item and use the the Delete or Edit options.

Once you create a Task, it is recommended that you rename that Task to more closely describe its use depending on the options selected.

Below is a description of all Tasks and their detailed information.


### Deploy Version to _Environment_

Deploys an _Application_ or _Release_ version to an _Environment_. Select the target _Environment_ via a drop-down list.

| "Deploy" Task Detail Fields   | Description                                                                                      |
|-------------------------------|--------------------------------------------------------------------------------------------------|
| **Name**                      | The unique name of the Task.                                                                     |
| **Created**                   | Auto-generated date and time when added.                                                         |
| **Modified**                  | Auto-generated date and time when updated.                                                       |
| **Pre-Action**                | Change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.  |
| **Post-Action**               | Change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
| **Available in _Subdomains_** | If selected, all _Subdomains_ will have access to this Task.                                     |

### Manually Trigger _Action_ to be executed

Runs a stand-alone _Action_. For example, if you need to interrupt a deployment process, this Task allows you to execute the steps manually. The manually triggered _Action_ will be placed in the "To do" list of the _User_ or _Group_ that executed the Deploy Task.

| "Manually Trigger" Task Detail Fields | Description                                                                                                                                                                                                                 |
|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Name**                              | The name of the Task - can be changed to make the Task unique.                                                                                                                                                              |
| **Created**                           | The auto generated date and time the Task was added.                                                                                                                                                                        |
| **Modified**                          | The auto generated date and time the Task was updated.                                                                                                                                                                      |
| **Pre-Action**                        | You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.                                                                                                                     |
| **Post-Action**                       | You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step.                                                                                                                    |
| **Action to Run**                     | The Action that will be executed manually.                                                                                                                                                                                  |
| **Available in _Subdomains_**         | If selected, all _Subdomains_ will have access to this Task.                                                                                                                                                                |
| **Success _Notify Template_**         | The _Notify Template_ that will be emailed on a successful _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/advanced-features/deployments/2-notifier-templates/). |
| **Failure _Notify Template_**         | The _Notify Template_ that will be emailed on a failed _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/userguide/advanced-features/deployments/2-notifier-templates/).     |


### Task Execute Access

Once a _Task_ is defined, it must be granted execute access to a _Group_ before it can be invoked. Select the _Task_ using the check box. Drag the desired  _Group_ from the _Available Groups_ column to the _Group Access_ area. _Users_ of the _Group_ can then execute the specified task.

 _Groups_ are assigned authority on a _Task_ by _Task_ basis. It is possible for a _Domain_ to have two different _Tasks_ with the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created. They can have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc. Also different _User Groups_ can have the authority to run them.

### Additional Task Parameters

Additional parameters can be added to a Task. These additional parameters will set Global Variable at execution time. To add them, select the Task from the Task Section. Use +Add to create a new entry into the Parameters table for the selected task. It will have two columns:

- Label: This will appear on the Task's execution window whenever the Task is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a Task is executed, where values can be either entered or selected, depending on the Type.

Use the Save to commit the change to the table. Use Edit to update a Task Parameter, or Delete to remove a Task Parameter.
