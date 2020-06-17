---
title: "Managing Users and Groups"
linkTitle: "Managing Users and Groups"
weight: 86
description: >
  Adding and Managing User and Groups to DeployHub.
---

## Intro to _User_ and _Groups_

DeployHub Team has two Groups - Administrators and Users.  Access control to objects are based on these two high level _Groups_. DeployHub Team allows you to create as many _Users_ as required but only the "User" and "Administrator" _Groups_ are supported.

**DeployHub Pro** allows you to create custom UserGroups for more granular security control around _Domains_, _Environments_, _Applications_ and _Components_. For information on how to create User _Groups_ with DeployHub Pro see [Creating DeployHub Pro UserGroups](/userguide/profeatures/5-pro-groups/.)

Both _Users_ and _Groups_ are given access to DeployHub Objects. _Users_ who belong to a _Group_ that has been granted access to an object are also granted the same access. A many-to-many relationship exists between _Users_ and _Groups_, so that a _User_ can belong to many different _Groups_, and a _Group_ can contain many different _Users_.

### _User_ and _Group_ Access Priveledges

Access is applied to the following Objects within DeployHub:

- _Domains_
- _Credentials_
- _Repositories_
- _Enpoints_
- _Environments_
- _Components_
- _Applications_
- _Releases_ (DeployHub Pro)

 The default Access gives all Users and Groups access to everything. If you want to restrict Access, you can deny access to only certain Users. Access allows _Users_ within designated _Groups_ to update the Object in various ways.  All objects have the following standard Access:

| Access | Description |
| --- | --- |
| _**View**_ | If a _User_ belongs to a _UserGroup_ in the View Access list for the this object, the object will be visible. |
| _**Change**_ | This allows a _User_ who belongs to any _UserGroup_ in the list to change the attributes of the object as well as to add/remove items from the object. |
| _**Read**_ | Performs no function for the object itself but acts as an _Inherited Permission_ for items created within the object. The exact meaning of 'Read' will depend on the item created within the object. |
| _**Write**_ | Performs no function for the object itself but acts as an _Inherited Permission_ for items created within the object. The exact meaning of 'Write' will depend on the item created within the object. |

Other Objects, such as Environments, may have additional Access rights. For example, an _Environment_ allows you to restrict access to the _Environment Calendar_.

You can create a deep level of control over objects with the Access control.

For instance, if a _User_ needs to deploy an _Application_ to an _Environment_, then they must be given  'deploy' access to the _Environment_, 'change' access to the _Endpoints_ within that _Environment_, 'deploy' access to the _Applications_ that are contained within the _Release_, 'execute' access to any _Actions_ that are run in order to control the deployment, and 'check-out' access to all _Repositories_ that contain the files referenced by _Component Items_ in the _Components_ that are contained within the _Applications_.

### _Users_ and _Domain_ Inheritance

_Users_ and _Groups_ are created under a _Domain_. A _User_ or _Group_ that is created at a higher level _Domain_ will inherit access to all _Sub-domains_, based on their access settings. _Group_ access and inherited access properties can be overridden within a _Sub-Domain_. As an example, Administrators, Director, and Operational level _Users_ or _Groups_ can be assigned to the highest level _Domain_ for the Enterprise while Application Teams and Testing Teams can be defined to only the _Sub-domains_ that pertain to their area of expertise. _Users_ or _Groups_ can belong to more than one _Sub-Domain_.  

## Using the _User_ List View for Adding or Deleting

You will find _Users_ under the Setup menu.  Selecting _Users_ will take you to a list of all _Users_. which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Users_ List View.  You can reorder the list view on _Users_ and _Domains_

The _Users_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _User_ of a particular type. |
| Delete | Deletes the selected item. |

From the _User_ List View, double click on the _User_ which you would like to view to see all Details.  

## Using the _User_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Notifier_.

### _User_ Details

The following details are common to all _Users_ types:

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified name of the _Domain_ to which the _User_ was defined. |
| **User Name** | The Login name of the _User_. |
| **Real Name** | The _User's_ Proper Name. |
| **Email** | The _User's_ email. Used to send event notifications. |
| **Phone** | _Users_ phone number.  |
| **Date Format** | Defines how the date will be displayed to address geographical differences.|
| **Time Format** | 24 hour clock (mililarty time) vs. 12 hour clock |
| **Validation Data Source**| Set to the Data Source (LDap, Active Directory) for login. Data Source must be pre-defined.|
| **Password**| Password selected by the _User_ (encrypted in the DeployHub database).|
| **Account Locked**| Locks the User out of the DeployHub system. |
| **Force Change Password**| Forces the User to change their password on initial sign-in.|
| **Created** | Auto generated date when the _Notifier_ was added.|
| **Modified**| Auto generated date when the _Notifier_ was updated.|
| **Credential**| The _Credential_ used to access the _Notifier_ if required. |
| **Last Login** | Displays the last time the User logged into DeployHub. |

{{% include "userguide/reusable/AuditTrail.md" %}}

## Group Membership

This Section contains a list of all the _Groups_ the selected _User_ belongs to. Add a _Group_ to the selected _User_ by clicking on the plus '+Add' sign in the upper right, which adds an empty row to the table with a drop down list of all avaialbe _Groups_. Use the Trash Can icon to delete a _Group_ from the table.
