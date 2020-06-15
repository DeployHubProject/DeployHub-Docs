---
title: "Creating Pro User Groups"
linkTitle: "Creating Pro User Groups"
weight: 82
description: >
  Add additional User Groups for more security and control of _Components_ and deployments.
---
# Creating and Deleting Groups

A new _Group_ can be created by clicking on the Users and Groups menu, clicking on a _Domain_ within the tree structure in the left side panel, and selecting "New Group in this _Domain_" from the resulting list. A window will appear in the list beneath the _Domain_, with entry fields that can be filled in to create a new _Group_. Once a _Group_ is created, it will appear in the list of _Groups_ in the tree structure. The _Group_ can be edited by selecting it in the tree structure and clicking on the pencil icon in the right-hand corner of the window. You can delete a _Group_ by right clicking on it and selecting the 'Delete this Group' menu option. There is no retrieving the deleted _Group_ if this option is selected.

NOTE: DeployHub creates a Group named "Everyone" whenever it is installed, and every User that is created is added to this group and cannot be removed from it.

## User Membership Tab

A list of all _Users_ who belong to the selected _Group_ appears on this tab. Click on the plus '+' button to add a _User_ to this _Group_. A pop-up window will appear containing all available _Users_. Select a _User_ and click OK to add the _User_ to the list of _Users_ in the User Membership tab. You can select multiple users by holding down the shift key while selecting _Users_. A _User_ can be removed from the _Group_ by selecting the _User_ in the User Membership table under the User Membership tab and clicking the 'X' button.

## Admin Rights Tab

Access can be applied to the creation of objects within DeployHub and the restriction of menu items. In addition, you can create a 'Super Administrator Group' by providing the group with override access to all objects within DeployHub. This is done by default with the Administrators _Group_. Defining these access rights are done using checkboxes in the selected _Group_. It is also important to understand that the _Groups_ can only see objects in the _Domain_ they have been assigned. When you create a new _Group_, you create that _Group_ under a particular _Domain_. The _Group_ will be able to see their primary _Domain_ and all its _Sub-Domains_. The access rights for the _Group_ are defined as follows:

## Access Control Rights

Override Access Control allows any _User_ belonging to a _Group_ with this control turned on to have control over the entire system, and no access restrictions apply to them. This option creates a Super Group level of Administrator and should only be used for individuals with full administrative privileges.

### Creation Rights

| Field | Description |
| --- | --- |
| Users | Allows the _User_ to create and add Users to any of the _Domains_ to which they belong. |
| User Groups | Allows the _User_ to create and add _Groups_ to any of the _Domains_ to which they belong. |
| Domains | Allows the _User_ to create and add _Sub-Domains_ to any of the _Domains_ to which they belong. |
| Environments | Allows the _User_ to create and add _Environments_ to any of the _Domains_ to which they belong. |
| Endpoints | Allows the _User_ to create and add _Endpoints_ to any of the _Domains_ to which they belong. |
| Repositories | Allows the _User_ to create and add _Repositories_ to any of the _Domains_ to which they belong. |
| Components | Allows the _User_ to create and add _Components_ to any of the _Domains_ to which they belong. |
| Credentials | Allows the _User_ to create and add _Credentials_ to any of the _Domains_ to which they belong. |
| Applications | Allows the _User_ to create and add _Applications_ to any of the _Domains_ to which they belong. |
| Application Versions | Allows the _User_ to create and add _Application Versions_ to any of the _Domains_ to which they belong. |
| Actions | Allows the _User_ to create and add _Actions_ to any of the _Domains_ to which they belong. |
| Procedures | Allows the _User_ to create and add _Procedures_ to any of the _Domains_ to which they belong. |
| DataSources | Allows the _User_ to create and add _DataSources_ to any of the _Domains_ to which they belong. |
| Notifiers | Allows the _User_ to create and add _Notifiers_ to any of the _Domains_ to which they belong. |

### Group General Tab

The General tab displays the basic descriptive fields that define a _Group._ You can edit this information by clicking on the pencil icon on the right-hand corner of the window. The basic information that defines a _Group_ includes:

| Field | Description |
| --- | --- |
| Group Name | The name of the DeployHub _Group._ |
| Summary | A text field for short description. |
| Email | The _Group_ email address that members of a _Group_ would all have access to, in the event of a notify process. |
| Created | The date and time the _Group_ was created. |
| Modified | The date and time that information concerning the _Group_ was last edited. |
