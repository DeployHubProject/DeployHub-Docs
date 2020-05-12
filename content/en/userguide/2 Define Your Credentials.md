---
title: "Credentials"
linkTitle: "Credentials"
weight: 36
---

## Credentials

_Credentials_ are objects within DeployHub that contain username and password pairs. These access the various objects used to retrieve files and _Endpoints_, execute actions and deploy files. Each _Credential_ can be assigned to various objects within DeployHub, so that a single _Credential_ could be assigned to many _Endpoints_ with the same username/password pair. _Credentials_ are primarily used for accessing _Endpoints_ but can be applied to any object in DeployHub that requires a User Name and Password. _Credentials_ are assigned to _Domains._ Anyone with access to the _Domain_ can view the _Credentials_. Further restrictions can be done at the _Credential_ level using the Access Tab.

## Creating and Deleting Credentials

To create a _Credential_, select the _Connections_ Main Menu item, and right click on a _Domain_ in the tree structure. A pop-up option creates a &#39;New Credential in this Domain.&#39; By selecting this option, the &#39;New Credential&#39; dialog box will be displayed. Alternatively, right click on a _Credential_ to delete it from the _Domain_.

## Editing Credentials

Select the _Credential_ to display the General Tab. The General Tab shows all the basic information about the _Credential_. You can edit the _Credential_ by clicking on the pencil icon in the right-hand corner.

## General Tab

This tab displays basic information concerning the _Credential_ along with the username and password fields.

| Field | Description |
| --- | --- |
| Name | The name of the _Credential._ |
| Summary | A general description of the _Credential._ |
| Kind | There are three different Kinds of _Credentials_, that vary according to where they reside:<ul style="list-style-type: none;"><li>**Encrypted in database:** The username/password pair resides in DeployHub&#39;s database using 3DES encryption.</li><li>**From Variables:** The username/password is managed in variables.</li><li>Harvest DFO in file system: For connecting to the CA Harvest DFO file system.</li><ul> |
| Username | The username that will be used to access the object. |
| Password | The password that will be used to access the object. |
| Filename | Name of file where username and password are stored. _Displayed only for Harvest DFO file system option._ |
| Created | The date and time the _Credential_ was created. |
| Modified | The date and time the _Credential_ was last modified. |

## Access Tab

Allows _Users_ within designated _Groups_ to use and/or change the _Credential_. All _Users_ who belong to a _Group_ in the access lists will be granted access to the _Credential_ in the following ways:

| Access | Description |
| --- | --- |
| View | Allows the _User_ to see the _Credential_. If the _User_ does not belong to a _Group_ in the View Access list, the _Credential_ will not appear in the tree structure. |
| Change | Allows the _User_ to change the _Credential&#39;s_ characteristics i.e. Name, Summary, etc. |
| Read | Allows the _User_ to use the _Credential_ by assigning it to an object such as a _Server_ or _Repository_. |
