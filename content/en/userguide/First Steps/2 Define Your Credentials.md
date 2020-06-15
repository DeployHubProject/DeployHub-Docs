---
title: "Create Your Credentials"
linkTitle: "Create Your Credentials"
weight: 3
description: >
  Adding Credentials for Accessing Repositories and Deployment Endpoints.
---

## Intro to Credentials

_Credentials_ are objects within DeployHub that contain username and password pairs. These access the various objects used to retrieve files, execute actions, and deploy files. Each _Credential_ can be assigned to various objects within DeployHub, so that a single _Credential_ could be assigned to many _Endpoints_ with the same username/password pair. _Credentials_ are primarily used for accessing _Endpoints_ and _Repositories_ but can be applied to any object in DeployHub that requires a User Name and Password. _Credentials_ are assigned to _Domains._ Anyone with access to the _Domain_ can view the _Credentials_. Further restrictions can be done at the _Credential_ access level .

Note:  In order to define a _Repository_ or _Endpoint_ you will need to pre-define the _Credential_ used to access them.

## Using the Credential List View for Adding or Deleting

The _Credentials_ menu option is found under the **Setup** menu on the left of the DeployHub main panel. By selecting the _Credentials_ menu, you will be taken to a list of all _Credentials_ to which you have access. You can also use the Search bar, represented by a funnel icon, to filter _Credentials_ based on Name or Domain.

The _Credentials_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Credential_. |
| Delete | Deletes the selected item. |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## The _Credential_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Credential_.  Below are the Details for a _Credential_.

### _Credential_ Details

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified path of the Domain which the Credential belongs. |
| **Name** | The name of the _Credential._ |
| **Summary** | A general description of the _Credential._ |
| **Kind* | The type of _Credential_. There are two different types of _Credentials_ based on where they reside:<ul style="list-style-type: none;"><li>**Encrypted in database:** The username/password pair resides in DeployHub's database using 3DES encryption.</li><li>**From Variables:** The username/password is managed in variables.</li><ul style="list-style-type: none;"> |
| **Username** | The username that will be used to access the object. |
| **Password** | The password that will be used to access the object. |
| **Filename** | Name of file where username and password are stored. _Displayed only for Harvest DFO file system option._ |
| **Created** | The date and time the _Credential_ was created. |
| **Modified** | The date and time the _Credential_ was last modified. |

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Credential_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Credential_ in the following ways:

| Access | Description |
| --- | --- |
| _**View**_ | Allows the _User_ to see the _Credential_. If the _User_ does not belong to a _Group_ in the View Access list, the _Credential_ will not appear in the List View. |
| _**Change**_ | Allows the _User_ to change the _Credential’s_ characteristics i.e. Name, Summary, etc. |
| _**Read**_ | Allows the _User_ to use the _Credential_ by assigning it to an object such as an _EndPoint_ or _Repository_. |

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**
