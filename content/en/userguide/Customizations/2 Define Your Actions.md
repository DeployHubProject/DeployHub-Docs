---
title: "Customize Your Actions"
linkTitle: "Customize Your Actions"
weight: 30
description: >
  Understanding and Adding Actions for defining your deployment logic.
---

## Intro to Actions

An _Action_ is a selection of _Activities_ which are executed in sequence in order to provide the unique logic required for the deployment of each _Component_. You can create _Actions_ or use the Built-in _Actions_.  _Actions_ are created with a graphical editor by simply dragging and dropping the _Procedures_ and _Functions_ that make up your _Action_.

In addition, a _Custom Action_ can replace the usual Deployment Engine processing by calling an external deployment engine or scripts that perform thee deployment step.

### Procedures and Functions

_Actions_ are used to customize DeployHub around deployments, and _Tasks_.  For most users, no configuration of _Actions_ is required.  However, if you want to use your own deployment scripts, then you will need to use a _Custom Action_.  This section will get you started on creating your own _Actions._

DeployHub comes with a set of reusable Built-in _Actions_. An _Action_ includes a set of _Functions_ and/or _Procedures_ which are executed in sequence to provide the logic of a _Component's_ deployment. _Actions_ can also be used as Pre or Post deployment steps to an _Application_ or _Release_.  

_Actions_ depend on _Procedures_ and _Functions_ to do the work.  If you want to create a new _Custom Action_, you will need to define the _Procedures_ and _Functions_ that the _Action_ will use before you create the _Action_. Alternatively, you can use the Built-in _Actions_,  _Procedures_, and _Functions_, that ship with DeployHub for defining the Steps of your new _Action_.  For most user, the Built-in _Actions_ will be sufficient for working with standard environments like Docker Containers.

In addition, a _Custom Action_ can replace the usual Deployment Engine processing by calling an external script that performs its own deployment activities. _Custom Actions_ call _Functions_ and _Procedures_ that  execute extenral process such as Helm or Ansible. _Functions_ and _Procedures_ can be:

_Actions_ can be implemented in many ways including:

- Written in DMScript - DeployHub's internal deployment scripting language. DMScript has access to the DeployHub Object Model.  DMScript ships with several pre-installed _Procedures_ and _Functions_. It is also easy to create your own and add them to the activities that can be used when creating your _Components_ installation logic. For more information see [Dmscript](/userguide/dmscript/).

- A 'local' script  - written in any scripting language that is supported by Linux, and executes in the DeployHub Container mounted from the Docker Host.

- A 'remote' script - written in any scripting language supported by the target _Endpoint's_ operating system and accessible to DeployHub.  If allowed, the script is automatically copied to the target _Endpoint_ and executed there. (Note: Copy remote must be set to TRUE at the _Function_ or _Procedure_ Level).

_Actions_ can be invoked:

- Before any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Pre-Action" can be specified. This can be either a _Procedure_ or a _Function_. The specified _Procedure_ or _Function_ is invoked before the _Task_ is executed. If the _Procedure_ or _Function_ aborts or returns a non-zero return code, the _Task_ itself is prevented from running. This can be used to connect to external systems to do "pre-flight" checks (for example, to notify a group of users that the selected _Application Version_ is about to be deployed).

- After any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Post-Action" can be specified. The specified _Action_ is invoked after the _Task_ is executed. This can be used to connect to external systems to notify others that a _Task_ has been executed (for example, to notify a bug-tracking system that an _Application Version_ has been moved to a Testing state).

- As a stand-alone _Action_ that can be invoked from the DeployHub User Interface: The _Action_ is associated with a "Run Action" _Task_. When invoked, the _Action_ is executed. A user can right-click on the _Domain_ to view the _Task_ to execute the _Action_. Alternatively, they can right-click on an _Application_ or a _Component_. In these circumstances, the selected object is pushed onto the _Stack_ and is available via the $application or $component objects. See DMScript [Stack](/userguide/dmscript/dmscript-stack/) for more information.

- Before an _Application_ is deployed: An _Application_ can be defined as having a "Pre-Action." This can be either an _Action_ or a _Function_. When the _Application_ is deployed, this "Pre-Action" is invoked first before any other operation. If this Pre-Action aborts or returns a non-zero return code, the deployment itself will be prevented. This can be used to perform "pre-flight" checks (for example, to deny a roll-back operation and force the user to "fix-forward").

- After an _Application_ is deployed: An _Application_ can be defined as having a "Post-Action." When the _Application_ has completed a deployment, this "Post-Action" is invoked. This can be used to connect to external systems to notify others that an _Application_ has been deployed.

- As a _Custom Action_ for the _Application_: An _Application_ is can be defined as having a "Custom Action." This "Custom Action" is then executed to deploy the _Application_. It is the responsibility of this _Custom Action_ to deliver the update to the target _Endpoint(s)._

- Before a _Component_ is deployed to an _Endpoint_: A _Component_ can be defined as having a "Pre-Action." When a _Component_ is being deployed to an _Endpoint_, the _Component_ is processed, and the files are pulled from the _Repositories_ and placed into the _Dropzone_. Any action defined as a Pre-Action to a _Component_ is executed **after** the _Dropzone_ has been populated from the _Component Items_ but **before** those files are pushed to the _Target Endpoint(s)_. A Pre-Action to a _Component_ can be used to manipulate files in the _Dropzone_ before the files are delivered to the _Target Endpoint_ (for example, a modification to a configuration file).

- After a _Component_ is deployed to an _Endpoint_. A _Component_ can be defined as having a "Post-Action." When a _Component_ has been deployed (i.e. all the files from the _Component Items_ have been pushed to the _Target Endpoint_) any "Post-Action" is executed. A Post-Action to a _Component_ can be used to run scripts on the _Endpoint_ after the files have been delivered (for example, to install SQL changes or restart the Application Server).

- As a _Custom Action_ for the _Component_. When a _Component_ is defined, it can have a "Custom Action" associated with it. This "Custom Action" is then executed to deploy the _Component_. It is the sole responsibility of this Custom Action to deliver the update to the target _Endpoint_. Use a Custom Action when the delivery method differs from the usual "push files" mechanism – for example, invoking Ansible to install a piece of infrastructure or to issue a RESTful call to update the configuration of a load balancer.

{{% include "userguide/reusable/ListofActions.md" %}}

## The _Action_ List View for Adding or Deleting

From the _Action_ menu option to the left of the DeployHub main panel, you will be taken to a list of all available _Actions_ which you have access to based on the _Domain_. You can also use the Filter bar, represented by a funnel icon, to reorder your _Actions_ List View.  You can filter on:

- Domain
- Action

The _Action_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Action_. |
| Delete | Deletes the selected item. |

From the _Action_ List View, double click on the _Action_ to view to see all Details.

## Using the _Action_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Action_.

| Details | Description |
| --- | --- |
| _**Name**_ | A unique Name that describes the _Action._ |
| _**Summary**_ | A brief description of what the _Action_ does. |
| _**Category**_ | Categories are used to arrange _Actions_ in an orderly manner. Assigning a Category to an _Action_ allows lists of Categories to be used throughout DeployHub. Clicking on an individual Category expands the list and shows all _Actions_ that belong to that Category. You can add a new Catergory by simply adding it to the list using the entry field. |
| **Owner Type** | User or Group |
| _**Owner**_ | The _User_ or _Group_ name of the _Action's_ owner. The default owner is the _User_ who created the _Action_. |
| _**Created**_ | An auto generated date when the _Action_ was created (read-only). |
| _**Modified**_ | An auto generated date when the _Action_ was last modified (read-only). |


### Workflow Section

_Actions_ are defined within the Workflow Tab. A tree view on the right shows all the categories available to be include in the _Action's_ Workflow. You can use the built-in activities for defining the Workflow Steps or you can create new _Procedures_ or _Functions_ and have them available as activities to use.

The Workflow tab contains all activities that make up the _Actions_ Workflow steps, linked together in the order they are to be executed. Each Activity in the Workflow has several Anchors where connections can be made – an Input Anchor (in blue) at the top of the Activity where the Workflow enters the Activity and zero, one or more Output Anchors where the Workflow exits that Activity.

Click on one of the Categories in the list to see the available activities_._ Expand a Category and then select the desired Activity to drag and drop it into the _Action_ Workflow area. It appears as a box containing the name of the Activity. It automatically links to the nearest Activity with a free _Output Anchor_. An editor box opens automatically to set any input values required. If the dropped Activity refers to a _Procedure_ or _Function,_ then the input values will be the input parameters of the _Procedure_ or _Function_. If the dropped Activity refers to a _Function,_ then an additional _Result_ field is presented. This needs to be the name of a _Variable_ that receives the result of the _Function_.

You can connect Activities in any order you require. To do this, left-click and hold down the button on one of the _Output__Anchors_, then drag the resulting line onto another _Input Anchor_. This connects the Activities together and determines the order for processing the Workflow steps.

The lines connecting Activities can be deleted by right clicking on the connector line and selecting "Delete this Connector".

Some Built-in Activities have more than one exit point. For example the "if" Activity can be used to create conditional branches where different routes are taken through the Workflow dependent on the evaluation of an expression. In such cases, there are multiple output "anchors" with labels (for example, true and false) which indicate the meaning of the anchor. Connect the Activities to the appropriate _Output Anchor_.

Some Built-in _Activities_ can contain other Workflows. When such _Activities_ are dropped onto the Action's Workflow area they are represented by a larger "box" containing a diagram showing another Workflow. Double clicking on such an Activity will "drill down" into that Activity and open up another Workflow editor. Such actions are typically "loops" (where the Workflow "inside" the loop is executed for each iteration through the loop) and "using" Activities (where everything in the Workflow is set to use a particular _Stream_, _Dropzone_, _Component_ or _Application_).

There are _Procedures_ and _Functions_ that ship with DeployHub, such as the Windows function 'listservices' and the WebSphere 'DeployWS' control procedure. These are editable (by an administrator with access to the GLOBAL _Domain_) just as any _User_ defined _Function_ or _Procedure_ would be. There are also some Activities that simply wrap around DMScript (such as "Loop through Array Keys") that are not editable.

When the Workflow is executed, it's first converted into a DMScript Procedure. DMScript is DeployHub's built-in Object-Oriented Scripting Language. If you want to see what the generated DMScript will look like, right-click anywhere in the background of the Action Editor Pane and select "Show Generated DMScript". A window pops up showing the DMScript of the assembled Workflow.

You can also export the generated workflow as a _Procedure_. To do this, right-click anywhere in the background of the Action Editor Pane and select "Export as Procedure". This generates the DMScript and then exports it as a Procedure Export file. This can then be imported later into the workflow. You can use this technique to create DMScript procedures using a drag-and-drop editor.

NOTE: In the Workflow area, an object represents the currently selected Action. It is distinguishable by the arrow icon that appears in the object along with the word "Start", and it is positioned in the top of the window. It can be moved horizontally to aid with Workflow layout. This Start Activity has a single Output Anchor which must be connected to the first Activity to be executed, otherwise DeployHub does not know where to begin, and the Workflow will fail.


### Commenting on an Action

Click on the 'Comment' link within each entry to open a text entry field just below the deployment information. There is a field labeled "Say something about this Action?" for comments and files. Entering text into this field activates the _Add Message_ button. Click on this button to save the comment as a new audit entry.

### Adding Documents to your Comments

Clicking on the paperclip button next to _Add Message_ brings up a file explorer for multiple files to be selected and attached to the comment. Clicking on that paperclip expands the audit entry to show the files attached to the comment as hyperlinks. Clicking on the link downloads the file. This process is browser-specific. 'Click to see earlier items' link shows earlier entries in the timeline.

### Subscribing to an Action

The Subscribe link places the audit entry into the User's personal timeline. Any comments added to the audit will appear in the Timeline tab of the subscriber's home page.

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Action__ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Action_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Allows _Users_ to see the _Action_. If the _User_ does not belong to a _Group_ in the View Access list, the _Action_ will not appear in the List View. |
|**Change**| Allows _User_ to change the _Action’s_ characteristics i.e. Name, Summary, etc. |
|**Execute**| Allows _Users_ to execute this _Action_. |

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**
{{% include "userguide/reusable/AuditTrail.md" %}}

