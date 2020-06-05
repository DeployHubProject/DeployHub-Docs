---
title: "Applications"
linkTitle: "Applications"
weight: 10
description: >
  APIs for Applications.
---

## Get a List Applications

### /dmadminweb/API/applications

This call returns an array of JSON objects representing each application to which the logged-in user has access.

If the all parameter is not specified then only the applications associated with the user's home domain are listed. If the all parameter is specified and is set to "y" then the result includes the applications included in any accessible sub-domains.

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| all | query | y or n | No | string |

### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [applications_result](/restapi/models/#application_result) |

## Retrieve specific application or application version

### /dmadminweb/API/application/{identifier}

This call returns a JSON object representing the specified application.

Note, the resulting JSON will vary slightly depending on whether the specified application is a BASE application or an application version.

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| latest | query | If latest is set to Y then the latest version of the application is returned.  To use this flag, the specified identifier must refer to a BASE application, otherwise the flag has no effect. | No | string |
| branch | query | If branch is set along with latest then the latest version on the specified branch name is returned. | Yes | string |
| identifier | path | Is the identifier of the application. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [application_version_result](/restapi/models/#application_version_result) |

## Create New Application Version

### /dmadminweb/API/new/appver/{app_id}

This call creates a new version of an application. The new application inherits all the attributes of the predecessor application. In order for this to work through the permission model, there has to be a Create Version task either in the domain in which the specified application is located or in any of the parent domains if the Create Version task is set to be available to sub-domains. If finer control is required, the task can be named via the task parameter.

This mechanism ensures that the invoking user has permission to create a new version of the application (since the permissions are checked against the task) and also the target domain (i.e. the domain in which the new application is created) is determined from the task. Also, by specifying the task to execute, any pre and post link actions are executed just as if the task had been invoked via the Web UI.

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the ID of the application which will be the parent of the new application version. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. The newly created application version will inherit all the attributes from this application. | Yes | integer |
| task | query | Is the identifier of a task to execute in order to create the new application version. Either its name, its qualified name (i.e. with its domain and any parent domain(s) included in dot notation) or its internal ID. If the task is not specified, the first accessible Create Version task within the application's domain is used (or any Create Version task in parent domains if they are set to be available to sub-domains). | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/new/replace/{app_id}/{old_comp_id}/{new_comp_id}

#### GET

##### Summary

Replace a Component within an Application

##### Description

This call replaces a specific Component within an Application. You can use this to update the version of a Component within an Application by replacing the old Component Version with the new.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the ID of the application with which old_comp_id is  associated. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| old_comp_id | path | Is the ID of the component in app_id which is to be replaced. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| new_comp_id | path | Is the ID of the component which will replace old_comp_id in the application identified by app_id. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/approve/{app_id}

#### GET

##### Summary

Approving an Application

##### Description

This call allows the API to approve/reject an application for a specified domain.
In order for this to work through the permission model, there has to be a Approve task either in the domain in which the specified application is located or in any of the parent domains if the Approve task is set to be available to sub-domains. If finer control is required, the task can be named via the task parameter.

This mechanism ensures that the invoking user has permission to approve the application (since the permissions are checked against the named task) and also the target domain (i.e. the domain to which the application is being approved/rejected) is determined from the task. Also, by specifying the task to execute, any pre and post link actions are executed just as if the task had been invoked via the Web UI.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the application to be approved/rejected. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| task | query | Is the identifier of a task to execute in order to approve the application. Either its name, its qualified name (i.e. with its domain and any parent domain(s) included in dot notation) or its internal ID. If the task is not specified, the first accessible Approve task within the application's domain is used (or any Approve task in parent domains if they are set to be available to sub-domains). | No | string |
| approve | query | Is optional. If specified and set to N then the application is rejected. If this parameter is not specified or is set to Y then the application is approved. | No | string |
| notes | query | Any free-text notes that should be associated with the approval/rejection. | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/assign/application/{app_id}/{env_id}

#### GET

##### Summary

Associate an Application to an Environment

##### Description

This call associates an existing application with an environment. This association allows the application (or any of its versions) to be deployed to that environment. An application needs to be assigned to an environment before it can be deployed to that environment.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the application to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the environment to which the server should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |

### /dmadminweb/API/unassign/application/{app_id}/{env_id}

#### GET

##### Summary

Disassociate an Application from an Environment

##### Description

This call disassociates an application from an environment. Once the application has been disassociated from the environment neither it nor any of its versions can be deployed to that environment.

Disassociating an application from an environment does not physically remove the application from the environment. It simply prevents deploying any version of the application to the environment.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the application to be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the environment to which the server should be assigned. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |
