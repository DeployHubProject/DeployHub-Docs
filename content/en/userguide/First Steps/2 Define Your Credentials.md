---
title: "Create Your Credentials"
linkTitle: "Create Your Credentials"
weight: 3
description: >
  Adding Credentials for Accessing Repositories and Performing Deployments.
---

## Credentials

_Credentials_ are objects within DeployHub that contain username and password pairs. These access the various objects used to retrieve files and _Endpoints_, execute actions and deploy files. Each _Credential_ can be assigned to various objects within DeployHub, so that a single _Credential_ could be assigned to many _Endpoints_ with the same username/password pair. _Credentials_ are primarily used for accessing _Endpoints_ but can be applied to any object in DeployHub that requires a User Name and Password. _Credentials_ are assigned to _Domains._ Anyone with access to the _Domain_ can view the _Credentials_. Further restrictions can be done at the _Credential_ level using the Access Tab.

## Using the Credential List View to Create and Delete 
The _Credentials_ menu option is found under the **Setup** menu on the left of the DeployHub main panel. By selecting the _Credentials_ menu, you will be taken to a list of all _Credentials_ which you have access to. You can also use the Search bar, represented by a funnel icon, to filter _Credentials_ based on Name or Domain. 

The _Credentials_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Credential_. |
| Delete | Deletes the selected item. |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view. 

## The _Credential_ Dashboard 
The Dashboard view displays all information related to a specific _Credential_.  Below are the Details for a _Credential_. 

### Details 

| Field | Description |
| --- | --- |
| Full Domain | The fully qualified path of the Domain the Credential belongs to. |
| Name | The name of the _Credential._ |
| Summary | A general description of the _Credential._ |
| Kind | There are three different Kinds of _Credentials_, that vary according to where they reside:<ul style="list-style-type: none;"><li>**Encrypted in database:** The username/password pair resides in DeployHub's database using 3DES encryption.</li><li>**From Variables:** The username/password is managed in variables.</li><li>**Harvest DFO**: in file system: For connecting to the CA Harvest DFO file system.</li><ul style="list-style-type: none;"> |
| Username | The username that will be used to access the object. |
| Password | The password that will be used to access the object. |
| Filename | Name of file where username and password are stored. _Displayed only for Harvest DFO file system option._ |
| Created | The date and time the _Credential_ was created. |
| Modified | The date and time the _Credential_ was last modified. |

{{% include "userguide/reusable/Access Object.md" %}}




