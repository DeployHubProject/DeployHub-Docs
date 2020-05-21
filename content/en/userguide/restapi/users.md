---
title: "Users"
linkTitle: "Users"
weight: 20
description: >
  Associate a User to a User Group (Pro Feature).
---


### /dmadminweb/API/assign/user/{user_id}/{group_id}

#### GET

##### Summary

Associate a User with a User Group

##### Description

This call assigns an existing user to a User Group. Once a user has been assigned to the group then the user will have access to any object to which the User Group has been granted appropriate access.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_id | path | Is the identifier of the user to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| group_id | path | Is the identifier of the User Group to which the user should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/unassign/user/{user_id}/{group_id}

#### GET

##### Summary

Disassociate a User from a User Group

##### Description

This call disassociates a user from a User Group. Once a user has been removed from the group they no longer have access to any object to which access has been granted through the User Group.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_id | path | Is the identifier of the user to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| group_id | path | Is the identifier of the User Group to which the user should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |
