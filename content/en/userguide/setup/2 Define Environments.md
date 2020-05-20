---
title: "Environments"
linkTitle: "Environments"
weight: 7
description: >
  Adding Environments for Deployments.
---
## Environments

_Environments_ represent a collection of _Endpoints_ used by a specific group of individuals. Each _Application_ can have many _Environments_, commonly Development, Testing and Production. _Environments_ are mapped to your continuous _Delivery Pipeline_ stages.

## Environments and Domains

_Environments_ are associated to a _Domain_. You can assign _Environments_ to any level of _Domain_ including the _Global Domain_. However, _Environments_ are most commonly associated to a _Project Domain_. A Project Domain is the lowest level of _Domain_ and includes _Life Cycle Sub-Domains_ for managing your continuous _Delivery Pipeline_. This means that a state of your _Delivery Pipeline_ will map to a _Project Domain_.

## Create Environment

An _Environment_ can be created by clicking on the _Data Center_ Menu item, then the Environments tab, and right clicking on the _Domain_ where the _Environment_ is to reside. This pop-up menu includes &quot;New Environment in this Domain.&quot; Select this option to bring up a dialog box, which contains the required fields for defining the _New__Environment_.

## Delete Environment

You can delete an _Environment_ by right clicking on the _Environment_ from the tree view and selecting the &#39;Delete this Environment&#39; option.

## Duplicate Environment Names

Duplicates names are restricted. This prevents the User from receiving the duplicate error message even though they cannot see a duplicate name. It would be confusing when a User wants to know which _Environment_ an application is running, or could be deployed against. It is recommended that _Environments_ be named in a specific manner, such as &#39;DevEnv-CallCenter,&#39; and not use the base DevEnv alone.

## Editing Environments

The General Tab on the tree allows you to edit the information by selecting the pencil icon in the right-hand corner of the window.

## Timeline Tab

This tab displays log file entries for the deployment of _Applications_ to the selected _Environment_. It includes information concerning how many days since the deployment took place, the deployment number, and which _User_ deployed the _Application_.

## Subscribe to a Deployment

The Subscribe link in each entry of the list allows you to receive information about the selected deployment.

## Adding Comments to a Timeline

You can add information by clicking on the &#39;Comment&#39; link within a text entry field. These appear in the History column of your subscriber&#39;s home page. There is a field above the list labeled &quot;Say something about this Application&quot; that can have comments placed into it, and files can be attached to the comment as well. Entering text into this field activates the Add Message button. Click on this button to save the comment as a line in the list.

## Adding Files to Your Comments

Clicking on the fingerprint button next to the Add Message button brings up a file explorer that allows files to be selected and attached to the comment. These attachments can later be retrieved by clicking on the fingerprint icon on the far right of the comment, which opens the line in the list to display the name of the file. Click on the file name in the dropdown list. This download into the default Downloads folder of the computer that hosts the browser used to run DeployHub (not on the location hosting DeployHub). The options are standard in every Windows file download interface, including Open, Always Open this Type of File, and Show in folder. Several other lists appear along the bottom of the browser. A small &#39;x&#39; on the far-right side at the bottom can be clicked to make them disappear.

## Deployment Details

To view specific details such as the files deployed, the log output, activities executed and other information, click on the deployment number within each line. A window will appear with six tabs:

| Tab Name | Description |
| --- | --- |
| Files | A list of files that were deployed to the _Environment_, which includes the _Repository&#39;s_ path of the source file, and the target path where it was placed. |
| Log | This includes step by step details of the deployment, which includes error messages in red font. |
| Activities | A list of any _Actions_, _Procedures_, and _Functions_ that were used during the deployment. |
| Change Request(DeployHub Pro only) | The Change Request tab shows enhancement requests and bugs for a selected _Application_ for several popular bug tracking systems, including Bugzilla, GitHub, and Jira. |
| General | A synopsis of the deployment, which includes the name of the _Application_, the date and time of the deployment, and the amount of time the deployment took. |
| Reports | The Reports tab contains two graphs. One displays the time taken for each deployment. Mouse over the dots to see a small translucent box which shows the deployment number and the time taken to deploy in seconds. The second graph is a pie chart which displays the number of successful and failed deployments for each _Application_ onto each _End Point_ within the selected _Environment_. |

## Attributes Tab

Values that are stored against an _Environment_ can be used to control deployments. The Name field holds the name of the Value, and the Value field holds the data, which can be either a numeric or text value. It can also be an array of Name/Value pairs associated with a Name. Clicking the plus sign (+) allows you to add a new Attributes. Clicking on the pencil icon allows you to edit an existing Name and its associated Value. Selecting the Attribute from the table and clicking on the &quot;X&quot; in the upper right-hand corner deletes the selected line from the table of Name/Value pairs.

## Access Tab

The Access tab allows _Users_ within designated _Groups_ to update the _Environment_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list on the far right into the desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Environment_ in the following ways:

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| _**View**_ | Allows the _User_ to see the _Environment_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the tree structure. |
| _**Change**_ | Allows the _User_ to change the _Environment&#39;s_ characteristics i.e. Name, Summary, etc. |
| _**Create Calendar Entries**_ | Allows _Users_ to control the Calendar for the selected _Environment_.NOTE: Securing Environment Calendars is only available in DeployHub Pro.
 |
| _**Deploy**_ | Allows _Users_ to deploy _Releases_ and the _Applications_ they contain into the selected _Environment_. |

## General Tab

The General Tab displays the basic information that defines an _Environment._ Select the pencil icon from the right-hand corner of the window to edit.

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Environment_ object. |
| _**Owner**_ | The owner of the _Environment_, it defaults to the _User_ who created it. The default owner is the _User_ who created the _Environment_. When editing this field, the Owner Type field is available which includes Owner and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Summary**_ | A short text description of the _Environment_. |
| _**Availability**__**(DeployHub Pro feature)**_ | The default value, &quot;Always Available Unless Denied by Calendar&quot;, allows the User to deploy Applications into the Environment unless there is an entry in the Calendar during a specific time (hours, days, weeks) that prevents it from doing so through the use of an added Unavailable section. The other value, &quot;Always Unavailable Unless Denied by Calendar&quot;, doesn&#39;t allow deployments unless a specific entry in the Calendar overrides it. |
| _**Created**_ | The date and time the _Environment_ was created. |
| _**Modified**_ | The date and time the _Environment_ was last modified. |
