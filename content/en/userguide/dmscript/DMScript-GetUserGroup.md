---
title: "Get User Group"
linkTitle: "Get User Group"
weight: 72
description: >
  Gets a User Group object based on a User Group Name. 
---


### getusergroup

getusergroup takes a User Group Name and returns the matching _User Group Object_.

**Usage:**

getusergroup(FQN)

Where:

FQN: Is the qualified name of the user group to be retrieved.

**Returns:**

User Group Object

A qualified name can include as many Domain names as is necessary to uniquely identify the user group. If the user group name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one user group with the same name (in different accessible domains) will it be necessary to qualify the user group name with the domain in which it is located.

**Examples:**

_1) Retrieve a User.Group_

set group = getusergroup("Developers");

_2) Retrieve a User Group specifying the enclosing domain:_

set group = getusergroup("Project1.Developers");


Further descriptions of Group Objects are found in the high level section named _DMScript_ Objects, in the section named Group.
 

**See Also:**

get_Application_(), get_Component_(), getcredential(), get_Environment_(), getserver(), getuser()