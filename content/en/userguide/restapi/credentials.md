---
title: "Credentials"
linkTitle: "Credentials"
weight: 70
description: >
  Create a new Crendential.
---

### /dmadminweb/API/new/credential/{cred_id}

#### GET

##### Summary

Create a New Credential

##### Description

This call creates a new credential. All of the attributes of the new credential are set through parameters to the API.

If "domain" is not specified then the environment is created in the logged in user's home domain.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the name of the credential to be created. | Yes | string |
| domain | query | Is the identifier of the domain in which the credential is to be created. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| summary | query | Is the summary text for the credential. | No | string |
| kind | query | The type of credential to create. Must be one of -      encrypted The username and password are held encrypted in the database.     vars The username and password contain variable names to be expanded when the credential is used. Held unencrypted in the database.     ppk Public/Private Key file.     dfo DFO filename for use with Harvest.  | No | string |
| username | query | Required for credentials of kind encrypted, vars or ppk. The username to be stored against the credential. | No | string |
| password | query | Required for credentials of kind encrypted and vars. The password to be stored against the credential. | No | string |
| keyfile | query | Required for credentials of kind ppk. The path of the private keyfile to be used by the credential. | No | string |
| filename | query | Required for credentials of kind dfo. The path of the Harvest DFO file containing the encrypted username/password. | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/mod/credential/{cred_id}

#### GET

##### Summary

Modify a Credential

##### Description

This call modifies an existing credential. The attributes of the credential are modified through parameters to the API.

It is not possible to modify the credential's kind (encrypted, vars, dfo or ppk) once it has been created. If you need to change the kind of the credential you must delete it and recreate it.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the ID of the credential to be modified. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| domain | query | Is the identifier of the domain in which the credential is to be created. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| summary | query | Is the summary text for the credential. | No | string |
| kind | query | The type of credential to create. Must be one of -      encrypted The username and password are held encrypted in the database.     vars The username and password contain variable names to be expanded when the credential is used. Held unencrypted in the database.     ppk Public/Private Key file.     dfo DFO filename for use with Harvest.  | No | string |
| username | query | Required for credentials of kind encrypted, vars or ppk. The username to be stored against the credential. | No | string |
| password | query | Required for credentials of kind encrypted and vars. The password to be stored against the credential. | No | string |
| keyfile | query | Required for credentials of kind ppk. The path of the private keyfile to be used by the credential. | No | string |
| filename | query | Required for credentials of kind dfo. The path of the Harvest DFO file containing the encrypted username/password. | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/del/credential/{cred_id}

#### GET

##### Summary

Deleting a Credential

##### Description

This call deletes a credential.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the ID of the credential to be deleted. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |
