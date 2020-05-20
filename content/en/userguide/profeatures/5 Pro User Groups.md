---
title: "Users and Groups"
linkTitle: "Users and Groups"
weight: 86
description: >
  Customizing User Groups.
---
## Defining _Users_ and _Groups_

**DeployHub Pro** supports as many Users and User Groups as is required to fit within your organizational structure. **DeployHub Team** allows you to create as many Users as required but only two Groups are supported – _Users_ and _Administrators_.

Both Users and User Groups are given access to DeployHub Objects. Access to various objects, menus, and administrative rights within DeployHub are determined by granting access to _Users_ and _Groups_. _Users_ who belong to a _Group_ that has been granted access to an object are also granted the same access. A many-to-many relationship exists between _Users_ and _Groups_, so that a _User_ can belong to many different _Groups_, and a _Group_ can contain many different _Users_.

## Access

Access is applied to every object within DeployHub. It is very important that the correct access is granted to every object that a _User_ needs in order to perform that _User&#39;s_ duties. For instance, if a _User_ needs to deploy a _Release_ containing several _Applications_ to an _Environment_, then one of the _Groups_ that _User_ belongs tomust have &#39;deploy&#39; access to the _Environment_, &#39;change&#39; access to the _Endpoints_ within that _Environment_, &#39;deploy&#39; access to the _Applications_ that are contained within the _Release_, &#39;execute&#39; access to any _Actions_ that are run in order to control the deployment, and &#39;check-out&#39; access to all _Repositories_ that contain the files referenced by _Component Items_ in the _Components_ that are contained within the _Applications_.

## Groups, Users, Domains and Inheritance

_Users_ and _Groups_ are created under a _Domain_. A _User_ or _Group_ that is created at a higher level _Domain_ will inherit access to all _Sub-Domains_, based on their access settings. As an example, Administrators, Director, and Operational level _Users_ or _Groups_ can be assigned to the highest level _Domain_ for the Enterprise while Application Teams and Testing Teams can be defined to only the _Sub-Domains_ that pertain to their area of expertise. _Users_ or _Groups_ can belong to more than one _Sub-Domain_.

_Group Access_ and Inherited access properties can be overridden within a _Sub-Domain_ by dragging and dropping a _Group_ name from the Available Groups list into one of the four access lists. A _Group_ that has been added to an access list are non-highlighted, as this is the first _Sub-Domain_ given this particular access property for this particular _Group_. All _Sub-Domains_ below this one will now show the _Group_ in that Access list as highlighted, indicating it was inherited from its parent _Domain_.

An existing property can be removed from a _Domain_ by dragging and dropping a _Group_ from the Available Groups lists into one of the four access lists where the access property already exists. When a _Group_ has been removed from an Access list that was inherited from a parent _Domain_, the highlighted _Group_ name remains visible in the access list, but another un-highlighted line containing the same _Group_ name appears in the list with a line through it. All _Sub-Domains_ under this one will appear the same way, having inherited this removal of the _Group_ from the access list.

## Creating and Deleting Users

New _Users_ and _Groups_ can be created by clicking on the Users and Groups menu and right clicking on a _Domain_ within the tree structure in the left side panel. This will give you the option to add a &quot;New User/Group in this Domain&quot;. By selecting this, the _New __User_ or _New Group_ dialog will appear. Once created, the _New__ User_ or _Group_ will appear in the list in the tree structure under the selected _Domain_. Right clicking on a _User_ or _Group_ allows you to delete it. There is no retrieving the deleted _User_ or _Group_ if this option is selected. When a _User_ or _Group_ is selected in the tree structure in the left panel, the following tabs and their fields appear in the right side panel:

## Timeline Tab

This tab displays log file entries for deployments that used this User, including deployment number, _Environment_, _Application_, and how many days ago the deployment (or hours for all of today&#39;s deployments) took place. Click on the &#39;Click to see earlier items&#39; link to see all of the entries. _Users_ can add comments to these entries by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information.

Users can also click on the Subscribe link in each entry of the list, which allows the _User_ to receive information about the selected deployment. Any comments added to the deploymentwill appear in the History column of the subscriber&#39;s home page.

There is a field above the list labeled &quot;Say something about this User (or Group)&quot; that can have comments placed into it, and files can be attached to the comment as well. Entering text into this field activates the Add Message button. Click on this button to save the comment as a line in the list.

Clicking on the fingerprint button next to the Add Message button brings up a file explorer that allows files to be selected and attached to the comment. These attachments can later be retrieved by clicking on the fingerprint icon on the far right of the comment, which opens the line in the list to display the name of the file. Click on the file name and it will be downloaded into the default Downloads folder of the PC that hosts the browser used to run DeployHub (not on the server hosting DeployHub). A dropdown list appears at the bottom of the browser, which is labeled with the name of the file. Clicking the drop down presents options that are standard in every Windows file download interface, including Open, Always Open this Type of File, and Show in folder. Several drop-down lists can appear along the bottom of the browser. A small &#39;x&#39; on the far-right side at the bottom can be clicked to make all the lists disappear.

## Group Membership Tab

This tab contains a list of all the _Groups_ the selected _User_ belongs to. Add a _Group_ to the selected _User_ by clicking on the plus &#39;+&#39; sign in the upper right, which brings up a pop-up window containing all of the available _Groups._ Click on a _Group in_ the list and click the OK button to add the _Group_ to the list in the Group Membership tab. Clicking the &#39;x&#39; button after selecting a _Group_ in the list will delete that _Group_ from the list.

## User General Tab

The General tab displays basic descriptive fields that define a selected _User_. To edit the _User&#39;s_ information, right click on the pencil icon in the upper righ- hand corner of the window.

All fields that define the currently selected _User_ in the tree structure are as follows (fields are available for edit by clicking on the General tab, then clicking on the pencil icon in the upper right):

| Field | Description |
| --- | --- |
| User Name | The _User&#39;s_ login name. |
| Real Name | The full name of the _User._ |
| Email | Email address of the _User_. This will be referenced within DeployHub, such as when email notifications are sent for successful and failed deployments. |
| Phone | Phone number of the _User_. |
| Date Format | The date format for this User, it is set by clicking on the &#39;little person&#39; icon in the upper right corner of the window which brings up the Profile window, allowing the User to change the setting via a drop-down list of choices. |
| Time Format | The time format for this User, it is set by clicking on the &#39;little person&#39; icon in the upper right corner of the window which brings up the Profile window, allowing the User to change the setting via a dro- down list of choices. |
| Password | Current Password of the _User_. Shows up only in the entry window during editing, not in the display window, and only if the Validation Data Source is not selected. This password is encrypted and stored in the DeployHub database. |
| Validation Data Source | The name of a Data Source, either ODBC or LDAP, that is used to validate a User and allow entry into the current DeployHub installation. It is used in place of a Username/Encrypted Password pair stored in the DeployHub database. The values for the Real Name and Email fields are populated using the values found in the Data Source. |
| Account Locked | Locks a _User_ out of the system while keeping the _User_ in the system for historical/auditing purposes. (Available in General tab only, for the selected _User_.) |
| Force Change Password | Forces the DeployHub _User_ to change the password that is initially created by an administrator the first time the _User_ logs into DeployHub, thereby allowing the _User_ to have exclusive access to the password. (Available in General tab only, for the selected _User_.) |
| Last Login | The last date and time the selected _User_ was logged into DeployHub. |

All fields that define the current _User_ are as follows (fields are available for edit by clicking on the &#39;Little Person&#39; icon in the upper right):

| Field | Description |
| --- | --- |
| User Name | The _User&#39;s_ login in name. |
| Real Name | The full name of the _User._ |
| Email | Email address of the _User_. This will be referenced within DeployHub, such as when email notifications are sent for successful and failed deployments. |
| Phone | Phone number of the _User_. |
| Date Format | All dates are shown in this format for this _User_. |
| Time Format | All times are shown in this format for this _User_. |
| New Password | Entered by the _User_ when a new Password is desired. |
| New Password Again | Entered as a confirmation of the new Password. |

## Using an LDAP Validation Data Source

Access to a DeployHub installation can be controlled by accessing _Users_ in an LDAP server instead of DeployHub&#39;s database. This is accomplished by creating a Data Source of Type &#39;ldap&#39; with parameters that will allow it to access an LDAP database and use the information stored there to gain access to DeployHub. It also populates the _Users_ General tab with Real Name and Email, which it gets from the LDAP database.

A _Credential_ is created whose Username value is in the form of a user id (uid) followed by the necessary domain components (dc), all comma delimited (i.e., uid=tesla,dc=example,dc=com). The _Credential&#39;s_ Password field contains the password for the user in the LDAP directory.

The Data Source has 3 (optionally 4) parameters that are used to validate a User:

- LDAP Server: The address of the LDAP server, which can include the port (i.e., ldap://ldap.forumsys.com:389). If the port isn&#39;t included, it can be put separately into the Port Number parameter.
- Search Base: The location in the directory where the LDAP search begins (i.e., dc=example,dc=com).
- Search Filter: Always (uid=$USERNAME) (include parenthesis), as this locates the user within the LDAP database using the Username that was entered into the DeployHub Credential.

The _User_ contains the name of the _Data Source_ in the Validation Data Source field. If this is selected from the list of available _Data Sources_ then no Password field is available, since the password has been supplied by the Credential for the LDAP server.

## Creating and Deleting Groups

A new _Group_ can be created by clicking on the Users and Groups menu, clicking on a _Domain_ within the tree structure in the left side panel, and selecting &quot;New Group in this _Domain_&quot; from the resulting list. A window will appear in the list beneath the _Domain_, with entry fields that can be filled in to create a new _Group_. Once a _Group_ is created, it will appear in the list of _Groups_ in the tree structure. The _Group_ can be edited by selecting it in the tree structure and clicking on the pencil icon in the right-hand corner of the window. You can delete a _Group_ by right clicking on it and selecting the &#39;Delete this Group&#39; menu option. There is no retrieving the deleted _Group_ if this option is selected.

NOTE: DeployHub creates a Group named &quot;Everyone&quot; whenever it is installed, and every User that is created is added to this group and cannot be removed from it.

## User Membership Tab

A list of all _Users_ who belong to the selected _Group_ appears on this tab. Click on the plus &#39;+&#39; button to add a _User_ to this _Group_. A pop-up window will appear containing all available _Users_. Select a _User_ and click OK to add the _User_ to the list of _Users_ in the User Membership tab. You can select multiple users by holding down the shift key while selecting _Users_. A _User_ can be removed from the _Group_ by selecting the _User_ in the User Membership table under the User Membership tab and clicking the &#39;X&#39; button.

## Admin Rights Tab

Access can be applied to the creation of objects within DeployHub and the restriction of menu items. In addition, you can create a &#39;Super Administrator Group&#39; by providing the group with override access to all objects within DeployHub. This is done by default with the Administrators _Group_. Defining these access rights are done using checkboxes in the selected _Group_. It is also important to understand that the _Groups_ can only see objects in the _Domain_ they have been assigned. When you create a new _Group_, you create that _Group_ under a particular _Domain_. The _Group_ will be able to see their primary _Domain_ and all its _Sub-Domains_. The access rights for the _Group_ are defined as follows:

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
