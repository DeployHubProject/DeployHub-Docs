---
title: "Environments"
linkTitle: "Environments"
weight: 30
description: >
  Get a list of Environments.
---

### /dmadminweb/API/environments

#### GET
##### Summary:

List Environments

##### Description:

This call returns an array of JSON objects representing each environment to
which the logged-in user has access.

If the all parameter is not specified then only the environments associated with the user's home domain are listed. If the all parameter is specified and is set to "y" then the result includes the environments included in any accessible sub- domains.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| all | query | y or n | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [environments_result](/restapi/models/#environments_result) |

### /dmadminweb/API/environment/{identifier}

#### GET
##### Summary:

Retrieve specific environment

##### Description:

This call returns a JSON object representing the specified environment.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| identifier | path | Is the identifier of the environment. Either its name, its qualified name i.e. with its parent domains included in dot notations or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [environment_result](/restapi/models/#environment_result) |