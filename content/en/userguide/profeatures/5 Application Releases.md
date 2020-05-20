---
title: "Release Trains"
linkTitle: "Release Trains"
weight: 80
description: >
  Deploying Groups of Applications.
---
## Release Trains

_Releases and Release Versions_ (DeployHub Pro only) are collections of one or more _Applications_. A _Release_ is the first one created and acts as a model for subsequent _Release Versions_. For the purpose of simplicity, both will be referred to as _Releases_ from here on unless it is necessary to draw a distinction between the two. A _Release_ can include multiple _Applications_ that must be managed as a single deployment due to their interdependencies.

For example, a _Release_ could be made up of three different _Applications_, one that includes the sets of binaries that make up the client interface, one set of binaries that manages data access routines, and another set that delivers management reports_. Releases_ allow for a highly flexible method of packaging together the artifacts that need to be included in a single deployment. _Releases_ can be found under the _Deploy_ Main Menu item.

## Deployments and Releases

A deployed _Release_ may be any one of several versions. For instance, it might be the very first one named MyRelease, or any one of several later versions, i.e., MyRelease;2, MyRelease;3, and so forth.

Whenever a _Release_ is deployed, DeployHub deploys each _Application_ contained within it to an _Environment_, by comparing them to what _Applications_ and _Components_ are already on the _End Point_. A _Release_ contains multiple _Applications,_ which contain _Component Versions_.

You can deploy the _Release_ by right clicking on it in the tree view. If the _Domain_ containing the _Release_ has been configured with aDeploy Task, that Deploy Task will display in the pop-up menu options.

## Release Versions and Tasks

When you create a _Domain,_ you can assign Tasks to that _Domain_. All Tasks can be removed, added, or uniquely customized. All Tasks defined to the _Domain_ will be available for any and all _Releases_ withinthe _Domain_. A right click on the _Release_ in the tree view will display all Tasks that are defined for that _Domain_ (to which the user has been given access) and can be used for both _Releases_ and _Applications_. The following Task Types are available for Releases:

| Task | Description |
| --- | --- |
| Move Version | Moves a Release from one Domain to another. This can be used as a promotion or a demotion of a Release between Lifecycle States. When the task is defined, the Target Domain (or Lifecycle State) has to be specified as part of the task definition.
If an Approve task exists in the same Domain or Lifecycle State as the Move Version task and the Approve task points to the same Target Domain, then that Approve task has to have been executed for the selected Release in order to approve the Application Version for the Target Domain. If this has not been done, the Move Version task will fail when it is executed. In other words, the selected Release has to have approved for the Target Domain before the Move Version to that Domain will succeed. |
| Deploy | Deploys a Release to an Environment. The target Environment is selectable via a drop-down list. |
| Request | Sends a request from a User without the authority to run a particular Task, to the User Group(s) who do have the authority. When the Request Task is defined it is linked to the task to be requested. This Linked Task will typically have different access control to the Request Task.
When the Request Task is executed an entry is placed into the &quot;To Do&quot; list of all the users who are members of the User Group(s) which have execute access to the Linked Task. When the Linked Task is executed, the request is automatically removed from the &quot;To Do&quot; list.
The Request Task can have a Request Notification Template defined which can send out a notification to the appropriate User Group(s) when it is executed. |
| Approve | Approves a Release so that it can be moved to a specified Target Domain. This works in conjunction with the Move Task (see above). When the Approve Task is defined, the Target Domain has to be specified.
When the Approve Task is executed, the selected Release can either be Approved or Rejected. Only when the Release is Approved can it be moved to the specified Target Domain. |
| Run Action | Runs a stand-alone Action. The task can be selected by right clicking on the Domain or Lifecycle State or by right clicking on a Component, Application or Release. In the latter case, the selected Component, Application or Release is automatically placed onto the Stack where it is available for the Action to process. See DMScript documentation and the discussion on Actions for more information. |

NOTE: Tasks are created, modified and deleted by using the Task Tab found under the Domain Main Menu item. Select the Domain for which the Tasks should be managed and the Tasks Tab will become available.

## Creating and Deleting Releases

A _Release_ can be created by clicking on the Deploy menu, clicking the Releases tab, right clicking on the _Domain_ from the tree structure in the left side panel, and selecting &#39;New Release in this Domain.&#39; By selecting this option, the New Releasedialog will appear. Alternatively, once created, the _Release_ can be deleted by right clicking on the _Release_ from the tree view and selecting &#39;Delete this Release.&#39; Once deleted, you cannot retrieve the _Release_ or any associated _Release Versions_.After a _Release_ is created, a _Release Version_ can be created by clicking the _Release_ in the tree structure, then clicking on the Versions tab on the right. Right click in the Versions area and select &#39;Create New Release Version&#39;. A new _Release Version_ will appear in the area and will be connected to either the icon at the top that represents the _Release_, or the latest _Release Version_, depending on whether this is the first _Release Version_ created. The new _Release Version_ is created by using the _Release_ name, followed by a semi-colon and an incremented integer, i.e. MyRel;3.

You can also subscribe to the _Release_. Subscribing allows you to receive information about the selected _Release_. Any information connected to the _Release_ will appear in the Timeline column of the subscribing _User&#39;s_ home page. Subscribe to the _Release_ by right clicking on it in the tree view and select &#39;Subscribe to this Release.&#39;

## Editing Release Versions

To edit a _Release Version_, select it in the Tree view, then click on the General tab. Edit the General information by clicking on the pencil icon in the upper right-hand corner of the window. In addition to General information about the _Release Version_, you can define Attributes, assign Access and view Reports and History. These options are available under their corresponding tabs.

### Assigned Applications Tab

This tab contains all of the _Applications_ that make up the _Release Version_, linked together in order of deployment. Click on the tree structure on the right side in order to see all the available _Applications_, then click and drag an _Application_ from the list on the right side and drop it into the _Release_ area. It will appear in the area as a box containing the name of the _Application_ and will automatically link to the last _Application_ in the area. The connecting line can be deleted by right clicking on the connector line and selecting &quot;Delete this Connector&quot;. A new connector can be created by clicking on the anchor (the green dot at the bottom of the _Application_) and dragging and dropping it onto another _Application_. This determines the order that _Applications_ will be deployed. Keep in mind that each _Application_ contains _Components_, which contain _Component Items_, all of which are linked together in the order that they are executed.

NOTE: In the Application Version area, there is an object that represents the currently selected Release Version. It is distinguishable from any Applications in the area by the arrow icon that appears in the object along with the word &quot;Start&quot; and is positioned in the top center of the window and cannot be moved from that position. This must be connected to the first Application to be deployed, otherwise DeployHub does not know which Application to begin with, and the deployment will fail.

Applications can be set to deploy in parallel by joining two or more applications to a common parent. In this case, when the parent application has been deployed the &quot;child&quot; applications are deployed in parallel. You can attach multiple application to the &quot;Start&quot; block in order to deploy the initial applications in parallel.

## Versions Tab

_Release Versions_ represent the changes in the software over time. The first _Release Version_ inherits data from the _Release_, and subsequent _Releases_ inherit data from previous ones. _Release Versions_ allow you to track the software deployments as they change over time without having to re-create the release base information each time an update is available. To create a _Release Version_ from a _Release_, see the instructions above.

## Timeline Tab

This tab displays audit entries for the creation of _Releases_ and their deployments, _Environment_, and how many days ago the deployment (hours for all of today&#39;s deployments) took place.

Any attribute changes to the _Release_ are also shown on the timeline.

Users can add comments to entries in the timeline by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information.

Click on the &#39;Click to see earlier items&#39; link to see earlier audit entries.

Users can also click on the Subscribe link in each entry of the list, which places the audit entry into the User&#39;s personal timeline. Any comments added to the auditwill appear in the Timeline tab of the subscriber&#39;s home page.

There is a field labeled &quot;Say something about this Release?&quot; at the top of the timeline that can have comments placed into it, and files can be attached to the comment as well. Entering text into this field activates the Add Message button. Click on this button to save the comment as a new audit entry.

Clicking on the paperclip button next to the Add Message button brings up a file explorer that allows multiple files to be selected and attached to the comment.

Comments with files attached are shown with a paperclip. Clicking on the paperclip expands the audit entry to show the files attached to the comment as hyperlinks. Clicking on the link will download the file. This process in browser-specific.

## Trends Tab

Using the scrolling device on the _User&#39;s_ mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the _User_ to easily view the entire Change History from beginning to end, in detail, while using the _Calendar_ as a reference.

The Trends tab contains information about Release&#39;s deployments. The horizontal numbers across the bottom of the chart indicate the Deployment Number. The vertical numbers on the left side represent the time taken to deploy. Hovering the mouse pointer over any one of the dots on the chart where these intersect shows both of these values.

The pie chart in the bottom right side shows the number of failed and successful deployments. Hovering the mouse pointer over the chart shows the number of failures (red) and successes (green).

## Change Requests

The Change Request tab shows enhancement requests and bugs for a selected Release and its _Applications_ for several popular bug tracking systems, including Bugzilla, Github, and Jira.

The Change Request tab for _Releases_ contains two sections. The upper section is titled CR Opened/Closed over Time, which contains a burndown chart showing all of the Change Requests for all _Applications_ in the _Release_. A _Calendar_ runs across the top to show when Change Requests were opened and closed. Change Requests are shown in the horizontal area below, with open Change Requests shown in light yellow, while closed are shown in dark gray. Each line represents a Change Request, which begins with the date that it was added to a _Component_. The area turns dark gray at the point of the calendar where the Change Request was closed. Using the scrolling device on the _User&#39;s_ mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the _User_ to easily view the entire Release Plan from beginning to end, in detail, while using the _Calendar_ along the top as a reference. The numbers along the left side represent the number of Change Requests. This will adjust vertically to fit the total number of Change Requests for the _Applications_ in the _Release_. This can be adjusted further with the _User&#39;s_ mouse or trackpad.

The lower section contains a list of Change Requests for all _Applications_ in the _Release_, which includes the Change Request ID, Application, Title, and Status fields. Clicking on the ID takes the _User_ to a new tab in the browser that contains the source of the Change Request. For instance, if there is a Change Request _Datasource_ of the type Github, clicking on the ID field for a Change Request will open a tab with the bug or enhancement request within github.com, allowing the _User_ the ability to update, close, or read about it in detail.

The Title field holds the title of the Change Request within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either &#39;open&#39; or &#39;closed&#39; and displays them in the Status field with a gold or dark gray background respectively.

## Planner

This tab Contains Release Planner, which helps to plan and schedule the deployment of _Releases_ and their _Applications_ throughout the software lifecycle. The Release Planner provides an overall view of the activities for a _Release_, which includes the _Applications_ contained within the _Release_, the number of Defects for Components within each _Application_, and target _Environments_ for the deployment of _Releases_ and _Applications_, all in a linear _Calendar_ format with drag and expansion capabilities. By viewing the number of open defects along with the scheduled testing time for each _Application_ in the _Release_, Production Support Teams can easily make judgements as to whether the _Release_ is on track or needs to be restructured or rescheduled.

The uppermost horizontal area of the Release Planner contains a _Calendar_ that corresponds to the dates contained within _Environments_ that the _Release_ and its _Applications_ are to be deployed to. The gray area beneath this represents the _Release_ and contains any _Environments_ that the _Release_ will be deployed to. Beneath this is one or more areas, each for every _Application_ contained within the _Release_.

Using the scrolling device on the _User&#39;s_ mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the User to easily view the entire Release Plan from beginning to end, in detail, while using the _Calendar_ along the top as a reference.

There are pie charts as the first field in each _Application_ that represent open and closed defects for _Components_ contained in each _Application_. The gray section of each pie chart represents the number of closed defects, while the gold section represents the number of open defects. Hovering the pointer over a pie chart will show the actual number of open and closed defects. This is used to help with tracking defects at a glance so that they can be dealt with, thereby helping to prevent the failure or postponement of a deployment.

Within the _Application_ areas are various colored blocks that represent a deployment in the _Environment&#39;s__Calendar_ in the form of either an Auto Deploy or a Reserved event. The label shown on the block refers to the domain that the target _Environment_ is contained within. Hovering the mouse pointer over it will display the name of the _Environment_ it will be deployed to. Clicking on a block will take the _User_ to the _Calendar_ entry for the designated _Environment_.

A red line indicates today and assists in identifying where deployments for _Applications_ and _Releases_ are in the schedule. The various blocks within the different areas are colored according to where they stand in the release plan. A gold block represents an overdue deployment into an _Environment_, and this is will always appear to the left of the red line. A slate colored block represents a completed deployment into an _Environment_. A dark blue block represents a deployment scheduled to take place in the future.

## Attributes Tab

Values that are stored against a _Release_ can be used to control deployments. The Name field holds the name of the value, and the Value field holds the data, which can be either a numeric or text value. It can also be an array of Name/Value pairs. Clicking on a blank Name field allows the user to enter a new Name, and then tab into and enter its associated Value.

To enter the values for an array, use the following syntax for the Name:

name[subscript]

You can enter multiple names with different subscripts to create an array. Note, the subscript need not be numeric since arrays in DeployHub are associative.

## Access Tab

| Field | Description |
| --- | --- |
| Name | The name of the _Release_. |
| Owner | The owner of the _Release_, this defaults to the _User_ who created it. The default owner is the _User_ who created the _Release_. When editing this field, the Owner Type field is available which includes _Owner_ and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| Summary | A brief description of the _Release_, its use, etc. |
| Created | The date and time the _Release_ was created. |
| Modified | The date and time the _Release_ was updated. |
| Successful Deployment Email Template | The email that will be sent to _Users_ whenever a deployment is successful, which is determined by the _Notify Template_ selected from this list.NOTE: Email templates are objects that belong to _Notifiers_ and can be created by going to the NotifierTab under the Deploy menu, right clicking on a _Notifier_, and selecting &quot;New Notify Template for this Notifier&quot;. |
| Failed Deployment Email Template | The email that will be sent to Users whenever a deployment is unsuccessful, which is determined by the _Notify Template_ selected from this list.NOTE: Email templates are objects that belong to _Notifiers_ and can be created by going to the NotifierTab under the Deploy menu, right clicking on a _Notifier_, and selecting &quot;New Notify Template for this Notifier&quot;. |

This tab contains _Groups_ that have access to this _Release_. Click on a _Group_ name in the Available Groups list and drag this into one of the lists to allow the _Users_ in that _Group_ access to View, Change, or Deploy the currently selected _Release_. Access includes:

| Access | Description |
| --- | --- |
| View | Allows the User to see the Release. If the User does not belong to a Group in the View Access list, the Release will not appear in the tree structure. |
| Change | Allows the User to change the Release&#39;s characteristics i.e. Name, Summary, etc. |
| Deploy | Allows Users to deploy this Release to Environments. |

## General Tab

The General tab includes basic descriptive fields, along with _Action_ fields, that determine deployment behavior for _Release Versions_.
