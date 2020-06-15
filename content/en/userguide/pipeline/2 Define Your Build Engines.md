---
title: "CD Engines"
linkTitle: "CD Engines"
weight: 34
description: >
  Integrating with CD Engines for automated configuration management.
---

## Intro to CD Engines

A DeployHub CD Engine maps to your continuous delivery orchestration solution.

## Using the _CD Engine_ List View for Adding and Deleting

The _CD Engine_ menu option is found on the left of the DeployHub main panel. By selecting the _CD Engine_ menu, you will be taken to a list of all _CD Engines_ to which you have access. You can also use the Search bar, represented by a funnel icon, to reorder _CD Engines_ based on Name or _Domain_.

The _CD Engine_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _CD Engine_, by selecting a type. |
| **Delete** | Deletes the selected item. |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## Using the _CD Engine_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _CD Engine_ based on the type you selected.  Below are the Details common to all _CD Engines_.

| Field | Description |
| --- | --- |
| **Full Domain Name** | The fully qualified name of the _Domain_ to which the _CD Engine_ was defined. |
| **Name** | The Name of the _CD Engine_. |
| **Type** | The _CD Engine_ Type chosen when you performed the Add. |
| **Owner Type** | User or Group. |
| **Owner** | Name of the Owner. |
| **Summary** | A description of the _CD Engine_.|
| **Created** | Auto generated date when the _CD Engine_ was added.|
| **Modified**| Auto generated date when the _CD Engine_ was updated.|
| **Credential**| The _Credential_ used to access the _CD Engine_ if required. |

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _CD Engine_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _CD Engine_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| This allows any _User_ that belongs to any _Group_ in this list to see the selected _CD Engine_ in the List View. |
|**Change**| This allows any _User_ that belongs to any _Group_ in this list to make changes to the _CD Engine_. |
|**Available Groups**|This list contains all the Groups within the DeployHub installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _CD Engine_.

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

### Jenkins CD Engine Details

| Field | Description |
| --- | --- |
| **Jenkins Match URL** | End Point URL: The URL where the Build Engine is located. |
| **Jenkins Match Encrypted** | Hides the Jenkins URL in the DeployHub database. |
| **Jenkins Match Override** | The Jenkins URL can be changed.|
| **Server URL**| Only needed if Jenkins is returning a different URL.|
| **Server URL Encrypted** | Server URL is hidden in the DeployHub database. |
| **Server URL Override** | Server URL can be changed.|

For more information on the Jenkins Integration see [Jenkins](/userguide/integrations/jenkins/)
