---
title: "UserGroup"
linkTitle: "UserGroup"
weight: 114
description: >
  Retrieve a User Group Object.
---

The _UserGroup object_ represents a user group in _DMScript_. UserGroup objects can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a getusergroup call or from a _User_ object (as a list of groups to which the user belongs).

The following properties can be accessed on the User Group object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | User Group id, as used in the database. |
| --- | --- | --- |
| name | String | User Group Name. |
| kind | String | Returns "group". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified domain name. |
| email | String | The User Group's email address. |
| creator | User | User Object representing the user who created this user group. |
| modifier | User | User Object representing the user who last modified this user group. |
| ctime | Date | Date Object representing the date/time the user group was created. |
| mtime | Date | Date Object representing the date/time the user group was last modified. |
| owner | Object | User or UserGroup that owns the User Group. |
