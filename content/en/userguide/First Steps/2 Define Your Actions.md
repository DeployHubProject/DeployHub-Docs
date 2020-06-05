---
title: "Customize Your Actions"
linkTitle: "Customize Your Actions"
weight: 11
description: >
  Understanding and Adding Actions for defining your deployment logic.
---

## Actions

DeployHub comes with a set of reusable _Actions_ that can be invoked at various points in a deployment. An _Action_ includes a set of _Activities_ which are executed in sequence to provide the logic of a _Componentes_ deployment. _Actions_ are created with a graphical editor by simply dragging and dropping the _Activities_ you want to use in the order you want to use them. On save, a new _Action_ will be created.

In addition, a _Custom Action_ can replace the usual Deployment Engine processing by calling an external script that performs its own deployment activities. _Custom Actions_ can be used when the normal component-level deployment is not suitable for the deployment of the _Application_.

_Actions_ can call _Procedures_ and _Functions_. These _Procedures_ and _Functions_ can be:

- Written in DMScript (DeployHub's Object-Oriented Scripting Language) – this is akin to a "Stored Procedure". DMScript has access to the DeployHub Object Model.

- A script written in any scripting language supported by the Deployment Engine's operating system and held locally to the Deployment Engine.

- A script written in any scripting language supported by the target _Endpoint's_ operating system and located on the target Endpoint.

- A script written in any scripting language supported by the target _Endpoint's_ operating system and held locally to the Deployment Engine. When invoked, the script is automatically copied to the target _Endpoint_ and executed there.

DMScript ships with several pre-installed _Procedures_ and _Functions_. It is also easy to create your own and add them to the activities that can be used when creating a _Components_ installation logic.

_Actions_ can be invoked:

- Before any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Pre-Action" can be specified. This can be either an _Action_ or a _Function_. The specified _Action_ or _Function_ is invoked before the _Task_ is executed. If the _Action_ (or _Function_) aborts or returns a non-zero return code, the _Task_ itself is prevented from running. This can be used to connect to external systems to do "pre-flight" checks (for example, to notify a group of users that the selected _Application Version_ is about to be deployed).

- After any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Post-Action" can be specified. The specified _Action_ is invoked after the _Task_ is executed. This can be used to connect to external systems to notify them that a _Task_ has been executed (for example, to notify a bug-tracking system that an _Application Version_ has been moved to a Testing state).

- As a stand-alone _Action_ that can be invoked from the DeployHub User Interface: The _Action_ is associated with a "Run Action" _Task_. When invoked, the _Action_ is executed. A user can right-click on the _Domain_ to view the _Task_ to execute the _Action_. Alternatively, they can right-click on an _Application_ or a _Component_. In these circumstances, the selected object is pushed onto the _Stack_ and is available via the $application or $component objects. See DMScript user guide for more information on the Stack.

- Before an _Application_ is deployed: When an _Application_ is defined it can have a "Pre-Action" associated with it. This can be either an _Action_ or a _Function_. When the _Application_ is deployed, this "Pre-Action" is invoked first before any other operation. If this Pre-Action aborts or returns a non-zero return code, the deployment itself will be prevented. This can be used to perform "pre-flight" checks (for example, to deny a roll-back operation and force the user to "fix-forward").

- After an _Application_ is deployed: When an _Application_ is defined it can have a "Post-Action" associated with it. When the _Application_ has completed deployment, this "Post-Action" is invoked. This can be used to connect to external systems to notify them that an _Application_ has been deployed.

- As a _Custom Action_ for the _Application_: When an _Application_ is defined it can have a "Custom Action" associated with it. This "Custom Action" is then executed to deploy the application. It is the responsibility of this Custom Action to deliver the code to the target _Endpoint(s)._

- Before a _Component_ is deployed to an _Endpoint_: When a _Component_ is defined it can have a "Pre-Action" associated with it. When a _Component_ is being deployed to an _Endpoint_, _Component Items_ are processed, and the files are pulled from the _Repositories_ and placed into the _Dropzone_. Any action defined as a Pre-Action to a _Component_ is executed **after** the _Dropzone_ has been populated from the _Component Items_ but **before** those files are pushed to the _Target Endpoint(s)_. A Pre-Action to a _Component_ can be used to manipulate the files in the _Dropzone_ before the files are delivered to the _Target Endpoint_ (for example, by modifying configuration files).

- After a _Component_ is deployed to an _Endpoint_. When a _Component_ is defined it can have a "Post-Action" associated with it. When a _Component_ has been deployed (i.e. all the files from the _Component Items_ have been pushed to the _Target Endpoint_) any "Post-Action" is executed. A Post-Action to a _Component_ can be used to run scripts on the _Endpoint_ after the files have been delivered (for example, to install SQL changes or restart the Application Server).

- As a _Custom Action_ for the _Component_. When a _Component_ is defined, it can have a "Custom Action" associated with it. This "Custom Action" is then executed to deploy the _Component_. It is the sole responsibility of this Custom Action to deliver the code to the target _Endpoint_. Use a Custom Action when the delivery method differs from the usual "push files" mechanism – for example, invoking Ansible to install a piece of infrastructure or to issue a RESTful call to update the configuration of a load balancer.

The _Actions_ tab is available from the Flows Main Menu item.

## Creating and Deleting Actions

You can create a new _Action_ by right clicking the _Domain_ or _Life Cycle Sub-Domain_. A pop-up menu item will appear to create a 'New Action in this Domain.' Alternatively, you can delete an _Action_ by right clicking on the _Action_ in the tree structure and selecting the 'Delete this Action from the Domain.'

## Finding where Actions are Used

To find out where (or if) an _Action_ is used, right click on the _Action_ in the left-hand tree view and select _Show References_. A pop-up box shows the _Components_, _Applications,_ and _Tasks_ which use that _Action_. Clicking on the reference will take you to the object where the _Action_ is used.

## Configuring Actions

Once created, the _Action_ will need to be configured. _Actions_ are made up from _Activities_ within a Workflow. _Activities_ include _Procedures_ and _Functions_ that are accessible in the Domain Hierarchy. You will need to define the _Procedures_ and _Functions_ that the _Action_ will use prior to defining the Workflow_._ Alternatively, you can use the available _Procedures, Functions,_ and other _Activities_ that ship with DeployHub for defining the Workflowsteps.

To configure the _Action's_ basic information, select the _Action_ from the tree view, and click on the pencil icon in the right-hand corner. This will bring up the General Dialog box for defining the _Action's_ basic information.

## Workflow Tab

_Actions_ are defined within the Workflow Tab. A tree view on the right shows all the categories available to be include in the _Action's_ Workflow. You can use the built-in activities for defining the Workflowsteps or you can create new _Procedures_ or _Functions_ and have them available as activities to use.

The Workflow tab contains all activitiesthat make up the _Actions_ Workflow steps, linked together in the order they are to be executed. Each Activity in the Workflow has several Anchors where connections can be made – an Input Anchor (in blue) at the top of the Activity where the Workflow enters the Activity and zero, one or more Output Anchors where the Workflow exits that Activity.

Click on one of the Categories in the list to see the available activities_._ Expand a Category and then select the desired Activity to drag and drop it into the _Action_ Workflow area. It appears as a box containing the name of the Activity. It automatically links to the nearest Activity with a free _Output Anchor_. An editor box opens automatically to set any input values required. If the dropped Activity refers to a _Procedure_ or _Function,_ then the input values will be the input parameters of the _Procedure_ or _Function_. If the dropped Activity refers to a _Function,_ then an additional _Result_ field is presented. This needs to be the name of a _Variable_ that receives the result of the _Function_.

You can connect Activities in any order you require. To do this, left-click and hold down the button on one of the _Output__Anchors_, then drag the resulting line onto another _Input Anchor_. This connects the Activities together and determines the order for processing the Workflow steps.

The lines connecting Activities can be deleted by right clicking on the connector line and selecting "Delete this Connector".

Some Built-in Activities have more than one exit point. For example the "if" Activity can be used to create conditional branches where different routes are taken through the Workflow dependent on the evaluation of an expression. In such cases, there are multiple output "anchors" with labels (for example, true and false) which indicate the meaning of the anchor. Connect the Activities to the appropriate _Output Anchor_.

Some Built-in _Activities_ can contain other Workflows. When such _Activities_ are dropped onto the Action's Workflow area they are represented by a larger "box" containing a diagram showing another Workflow. Double clicking on such an Activity will "drill down" into that Activity and open up another Workflow editor. Such actions are typically "loops" (where the Workflow "inside" the loop is executed for each iteration through the loop) and "using" Activities (where everything in the Workflow is set to use a particular _Stream_, _Dropzone_, _Component_ or _Application_).

There are _Procedures_ and _Functions_ that ship with DeployHub, such as the Windows function 'listservices' and the WebSphere 'DeployWS' control procedure. These are editable (by an administrator with access to the GLOBAL _Domain_) just as any _User_ defined _Function_ or _Procedure_ would be. There are also some Activities that simply wrap around DMScript (such as "Loop through Array Keys") that are not editable.

When the Workflow is executed, it's first converted into a DMScript Procedure. DMScript is DeployHub's built-in Object-Oriented Scripting Language. If you want to see what the generated DMScript will look like, right-click anywhere in the background of the Action Editor Pane and select "Show Generated DMScript". A window pops up showing the DMScript of the assembled Workflow.

You can also export the generated workflow as a _Procedure_. To do this, right-click anywhere in the background of the Action Editor Pane and select "Export as Procedure". This generates the DMScript and then exports it as a Procedure Export file. This can then be imported later into the workflow. You can use this technique to create DMScript procedures using a drag-and-drop editor.

NOTE: In the Workflow area, an object represents the currently selected Action. It is distinguishable by the arrow icon that appears in the object along with the word "Start", and it is positioned in the top of the window. It can be moved horizontally to aid with Workflow layout. This Start Activity has a single Output Anchor which must be connected to the first Activity to be executed, otherwise DeployHub does not know where to begin, and the Workflow will fail.

## Timeline Tab

This tab displays audit log entries for deployments that used this Action, including deployment number, _Environment_, _Application_, and how many days ago the deployment (or hours for all of today's deployments) took place.

## Commenting on an Action

Click on the 'Comment' link within each entry to open a text entry field just below the deployment information. There is a field labeled "Say something about this Action?" for comments and files. Entering text into this field activates the _Add Message_ button. Click on this button to save the comment as a new audit entry.

## Adding Documents to your Comments

Clicking on the paperclip button next to _Add Message_ brings up a file explorer for multiple files to be selected and attached to the comment. Clicking on that paperclip expands the audit entry to show the files attached to the comment as hyperlinks. Clicking on the link downloads the file. This process is browser-specific. 'Click to see earlier items' link shows earlier entries in the timeline.

## Subscribing to an Action

The Subscribe link places the audit entry into the User's personal timeline. Any comments added to the auditwill appear in the Timeline tab of the subscriber's home page.

## Access Tab

This tab contains _Groups_, and the _Users_ that belong to them, who have access to this _Action_. Click on a _Group_ name in the Available Groups list and drag this into one of the lists to allow the _Users_ in that _Group_ access to View, Change, or Execute the currently selected _Action_. Access includes:

| Access | Description |
| --- | --- |
| _**View**_ | Allows the _User_ to see the _Action_. If the _User_ does not belong to a _Group_ in the View Access list, the _Action_ will not appear in the tree structure |
| _**Change**_ | Allows the _User_ to change the _Action's_ characteristics i.e. Name, Summary, etc. |
| _**Execute**_ | Allows _Users_ to execute this _Action._ |

## General Tab

The General tab defines basic information about the _Action_ and allows you to add it to a specific category.

| Field | Description |
| --- | --- |
| _**Name**_ | A unique Name that describes the _Action._ This cannot be the same as a reserved word within DMScript (see the DMScript chapter), as it will cause a syntax error when executed. |
| _**Summary**_ | A brief description of what the _Action_ does. |
| _**Category**_ | Categories are used to arrange _Actions_ in an orderly manner. Assigning a Category to an _Action_ allows lists of Categories to be used throughout DeployHub. Clicking on an individual Category expands the list and shows all _Actions_ that belong to that Category. |
| _**Owner**_ | The _User_ or _Group_ name of the _Action's_ owner. The default owner is the _User_ who created the _Action_. When editing this field, the Owner Type field is available which includes _Owner_ and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Created**_ | When the _Action_ was created (read-only). |
| _**Modified**_ | When the _Action_ was last modified (read-only). |
