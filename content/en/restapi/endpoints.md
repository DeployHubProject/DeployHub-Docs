---
title: "End Points"
linkTitle: "End Points"
weight: 20
---

### /dmadminweb/API/servers

#### GET
##### Summary:

List All Accessible Servers

##### Description:

This call returns an array of JSON objects representing each application to which the logged-in user has access.

If the all parameter is not specified then only the applications associated with the user's home domain are listed. If the all parameter is specified and is set to "y" then the result includes the applications included in any accessible sub-domains.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| all | query | y or n | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [servers_result](/restapi/models/#servers_result) |

### /dmadminweb/API/server/{identifier}

#### GET
##### Summary:

Retrieve specific server

##### Description:

This call returns a JSON object representing the specified server.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| identifier | path | Is the identifier of the server. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [server_result](/restapi/models/#server_result) |


### /dmadminweb/API/assign/server/{server_id}/{env_id}

#### GET
##### Summary:

Assign a Server to an Environment

##### Description:

This call allows an existing server to be associated with an existing environment. Once the server is associated with an environment it can receive components during a deployment.

Servers can be associated with more than one environment. Assigning a server to an environment will not disassociate the server from any other environment with which it may be already associated. To move a server between environments you must use the API/server/unassign call to remove the server from the original environment - see next section for more information.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| server_id | path | Is the identifier of the server to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the environment to which the server should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/unassign/server/{server_id}/{env_id}

#### GET
##### Summary:

Disassociate a Server from an Environment

##### Description:

This call disassociates a server from an environment. When the server is disassociated from the environment then any subsequent deployments to that environment will not result in any files or operations being directed at the server.

This call does not delete the server - it simply disassociates it from the environment. To delete a server use the API/del/server call.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| server_id | path | Is the identifier of the server to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the environment to which the server should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |