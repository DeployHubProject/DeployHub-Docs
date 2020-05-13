---
title: "Applications"
linkTitle: "Applications"
weight: 5
---


## Applications

Your _Application_ is created in your _Project Domain_. To create a new _Application_, right-click on the _Project Domain_ you want the _Application_ to be associated with. All _Tasks_ associated to that _Project Domain_ will be applied to the _Application_.

An _Application_ and all objects within it will be deployed to one or more _Endpoints_ (each of which represents a container, physical or virtual server in the enterprise) in an _Environment_. The first Application deployed is referred to as the _Application_ _Base_ _Version._ Subsequent deployments create new _Application Versions_. DeployHub uses a back in versioning engine to track all deployment configurations. For this reason, each release will be given a new version number. For instance, your _Base_ _Version_ may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc.

_Applications_ consist of a collection of _Components_. Whenever an _Application_ is deployed, DeployHub deploys each _Component_ contained within the _Application_, by comparing it to which _Components_ are already on the associated _Endpoint_. Only if the _Component Version_ differs - or the _Component_ is set to _Always Deploy_ - is the _Component_ deployed to the _Endpoint_. This delta processing allows DeployHub to perform iterative deployments accurately.

Any _Version_ of an _Application_ can be deployed. If you are pushing continuous deployments across the pipeline, each new incremental _Version_ will be rolled forward. You may want to &#39;jump&#39; a _Version_ in an _Environment_; for example, Production wants the latest _Version_, but Production rejected the last 4 deployments. In this case, you can specify the precise _Version_ required, and DeployHub&#39;s versioning engine will accurately deal with the incremental changes. Alternatively, an _Application_ can also be deployed that has a lower _Version_ than the one currently residing in a target _Environment_, for instance when a problem has been discovered and a Rollback is needed. Roll Forward, Rollback, and Version Jumping can be done between any _Application Versions_ or _Component Versions_.

A right-click deploys the _Application_ after selecting a Deploy Task.

## Roll-Forward, Jumping, and Roll-Back

When an _Application_ is deployed to a target _Environment_, DeployHub will loop through each _Application Version_ between the _Version_ recorded as being on the target _Environment_ and the _Version_ being deployed. For each &quot;interim&quot; _Application Version_, a check is made for any associated _Components_ that have _Component Items_ marked as &quot;roll forward&quot; or &quot;roll-back&quot;. If any are found, those _Components_ are deployed automatically. Only the _Component Items_ marked as &quot;roll forward&quot; are used when deploying a later _Application Version_ than the one recorded as being in the target _Environment_. Similarly, only the _Component Items_ marked as &quot;rollback&quot; are used when deploying an older _Application Version_ than that recorded in the target _Environment_. This technique allows &quot;deltas&quot; to be applied in sequence and is typically used to roll databases forward or back by applying successive &quot;alter&quot; scripts.

## Applications and Tasks

_Tasks_ can be removed, added, and uniquely customized for your _Application_. All Tasks defined to the _Domain_ will be available to all of the _Applications_ within the Domain. Right clicking on the tree view displays all _Tasks_ defined to that _Domain_. The following Task Types are available:

| Task | Description |
| --- | --- |
| _**Move Version**_ | Moves an _Application Version_ from one _Life Cycle Sub-Domain_ to another. This is typically used as a promotion or a demotion of an _Application Version_ between Development, Test and Production. When the _Task_ is defined, the _Life Cycle Sub-Domain_ must be specified as part of the _Task_ definition.
If an _Approve Task_ exists in the same _Life Cycle Sub-Domain_ as the _Move Version__Task_ and the _Approve Task_ points to the same _Target Domain_, then that _Approve Task_ has to have been executed for the selected _Application Version_ in order to approve the _Application Version_ for the _Target Life Cycle Sub-Domain_. If this has not been done, the _Move Version Task_ will fail when it is executed. In other words, the selected _Application Version_ has to be approved for the _Life Cycle Sub-Domain_ before the _Move Version_ will succeed. |
| _**Deploy**_ | Deploys an _Application Version_ to an _Environment._ The target _Environment_ is selectable via a drop-down list. |
| _**Request**_ | Often times you may need to run a _Task_ but you don&#39;t have access to it. A _Request__Task_ is used in this situation to ask other _Users_ with access to the _Task_ to run it.
When the _Request Task_ is executed an entry is placed into the &quot;To Do&quot; list of all the _Users_ who are members of the _User Group(s)_ which have execute access to the _Linked Task_. When the _Linked Task_ is executed by one of the _Users_ with access, the request is removed from all the _Users_ &quot;To Do&quot; lists.
The _Request Task_ can have a _Request Notification Template_ defined. This sends out a notification to the appropriate _User Group(s)_ letting them know that the requested Task needs to be performed.NOTE: **DeployHub Team** has only 2 User Groups, Administrators and Users. If more User Groups are required, you will need to upgrade to **DeployHub Pro**.
 |
| _**Approve**_ | Approves a _Request Task_ so that its linked _Task_ can be executed within a specified _Life Cycle Sub-Domain_. For example, a _User_ that belongs to a _Group_ with the authority, via a _Move Task_, to move a particular _Application_ to a specified _Life Cycle Sub-Domain_ can do so, but a _User_ in a _Group_ that has not been assigned the authority for this _Move Task_ must request approval from someone in a _Group_ that does have the authority. When the _User_ with the authority receives the request, that _User_ can run an _Approval Task_, which will then allow a _User_ with access to move the _Application_ to the target _Life Cycle Sub-Domain_. Keep in mind, if an _Approval Task_ exists within a _Domain,_ it must be run before any _Move Tasks_ can be executed to move an _Application Version_ into the specified _Domain_. |
| _**Remove Application**_ | Removes the _Application Base __Version_ from an _Environment_, by rolling back from the currently installed _Application Version_. All files are removed and all _Rollback__ Actions_ are executed for each _Application Version_ between the _Version_ installed in the _Target Environment_ and the _Application Base Version_. The _Rollback Action_ associated with the _Application Base Version_ is then executed. (Normally, when rolling back to the _Application Base Version_, the _Rollback Action_ is not executed, and the _Application Base Version_ remains deployed.)
 A _Remove Application__Task_ cannot be executed against an _Application Version_, only an _Application Base Version_. |
| _**Create Version**_ | Makes a new _Application Version_ from either an _Application Base Version_ or a specific _Application Version_, depending on the choice made by the _User_. The _Domain_ where the new _Application Version_ is created can be chosen in the _Create Version in Domain_ field. |
| _**Run Action**_ | Runs a stand-alone _Action_. It will be available only in the _Domain_ where it is created, unless the &quot;Available in Sub-Domains&quot; checkbox is selected. The _Task_ can be selected by right clicking on the _Domain_ or _Life Cycle Sub-Domain_ or by right clicking on an _Application._ In the latter case, the selected _Application_ is automatically placed onto the stack where it is available for the _Action_ to process. |

NOTE: _Tasks_ are created, modified and deleted by using the _Task_ tab found under the _Domain_ Main Menu item. Select the _Domain_ for which the _Tasks_ should be managed and the relevantTab will become available.

## Creating and Deleting Applications

An _Application Base Version_ is created through the _Deploy_ Main Menu. Click on the Applications tab, then right click on the _Domain_ where the _Application Base Version_ should reside. Provided you have permission to create Applications, one of the displayed options will be to add a &#39;New Application Base Version in this Domain.&#39; By selecting this option, the &#39;New Application Base Version&#39; dialog will appear. Once created, the _Application Base Version_ can be deleted by right clicking on the _Application Base Version_ in the tree view and selecting &#39;Delete this Application Base Version.&#39; Once deleted, you cannot retrieve the _Application Base Version_, or any of its associated _Application Versions_.

Unlike an _Application Base Version,_ an _Application __Version_ can only be created by right clicking on an _Application__ Base__Version_ and selecting a _Create Version Task_ from the resulting dropdown list. The _Create Version Task_ must be available before this is possible. See the chapter on &#39;Defining Your Domains&#39; for instructions on how to create _Tasks_.

You can also subscribe to an _Application_. Subscribing allows you to receive information about the selected _Application_. Any history connected to the _Application_ will appear in the Timeline column of the subscribing _User&#39;s_ home page.

## Editing Applications

To edit an _Application_, select it from the tree view. You can edit information in the General tab by selecting the pencil icon in the upper right hand corner of the window. In addition to General information about the _Application_, you can create _Application Versions_, link _Components_, define Attributes, assign Access, assign _Environments_ and view Reports and History. These options are available under the corresponding tabs.

## Assigned Components Tab

This tab contains all the _Components_ that make up an _Application_, linked together in order of deployment. Click on the _Component_ tree structure on the right side to see the available Categories. Within each one, which is accessed by clicking on the plus &#39;+&#39; sign, are the _Components_ that share that particular Category. Click and drag a _Component_ from the list on the far right side and drop it into the Assigned Components area. It will appear in the area as a box containing the name of the _Component_, and automatically link to the last _Component_ in the area. The connecting line can be deleted by right clicking on the connecting line and selecting &quot;Delete this Connection&quot;. A new connector can be created by clicking on the anchor (the green dot at the bottom of the _Component_) and dragging and dropping it onto another _Component_. This determines the order that _Components_ will be deployed. Keep in mind that each _Component_ contains _Component Items_ that are also linked together in the order that they are to be executed.

You can define which _Components_ are to be deployed in parallel by linking the parallel _Components_ to a common parent _Component_. After the parent _Component_ is deployed, each linked child _Component_ is deployed in parallel.

NOTE: In the _Assigned Components_ area, an object represents the currently selected _Application_. It is distinguishable from other _Components_ in the area by the arrow icon that appears in the object along with the word &quot;Start&quot;, and it is positioned in the top center of the window. This must be connected to the first _Component_ to be deployed, otherwise DeployHub does not know which _Component_ to begin with, and the deployment will fail.

## Versions Tab

_Application Versions_ represent the changes in the software over time. _Application Versions_ inherit objects from either the _Application Base Version_ or the previous _Application Version_, and these can be changed to meet new requirements. _Application Versions_ allow you to track the software as it changes over time without having to re-create the _Application Base Version_ and its _Components_ and their _Component Items_ each time.

To create an _Application Version_, select an _Application Base Version_ from the tree view. You will see the General tab displayed along with several other tabs. Choose the _Versions_ tab. You will immediately see a box named &#39;Start&#39; at the top of the area that represents the _Application Base Version_. Right click on the window and a dropdown list with all of the _Tasks_ for the currently selected _Domain_ (this can also be achieved by right clicking on the _Application Base Version_ in the tree structure) will appear. Select the _Create Version Task_ to see a window with a _Predecessor Version_ dropdown. The choices include &#39;Latest Version&#39;, &#39;Application Base Version&#39;, and all of the versions of the _Application_ created so far.

The new _Application Version_ is created by using the _Application Base Version_ name, followed by a semi-colon and an incremented integer, i.e. MyApp;3. An _Application Version_ must be linked to the _Application Base Version_ for DeployHub to utilize Rollup and Rollback methods. _Pre-Actions_ and _Post-Actions_ can be included with _Application Versions_ in order to control their deployment at a detailed level, before and after the deployment, or to completely replace DeployHub&#39;s internal deployment process with a _Custom Action_, such as a previously written deployment script.

## Timeline Tab

This tab displays audit entries for deployments, including deployment number, _Environment_, and how many days ago the deployment (hours for all of today&#39;s deployments) took place. Any attribute changes to the _Application_ are also shown on the _Timeline_. You can add comments to entries in the timeline by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information. &#39;Click to see earlier items&#39; link shows other audit entries.

Users can also click on the Subscribe link in each entry of the list, which places the audit entry into the User&#39;s personal _Timeline_. Any comments added to the auditwill appear in the _Timeline_ tab of the subscriber&#39;s home page.

A field labeled &quot;Say something about this Application?&quot; is at the top of the _Timeline_. Entering text into this field activates the Add Message button. Click on this button to save the comment as a new audit entry. Clicking on the paperclip button next to the Add Message button brings up a file explorer that allows multiple files to be selected and attached to the comment. Clicking on the paperclip shows the attached files as hyperlinks. Clicking on the link will download the file, a process that is browser-specific.
