---
title: "Components"
linkTitle: "Components"
weight: 20
---

### /dmadminweb/API/component/{identifier}

#### GET
##### Summary:

Retrieve specific component or component version

##### Description:

This call returns a JSON object representing the specified component. It is useful to determine the application(s) which include the component, whether the application(s) are approved, which other components are used in applications alongside the specified component and so on.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| latest | query | If latest is set to Y then the latest version of the component is returned.  To use this flag, the specified identifier must refer to a BASE component, otherwise the flag has no effect. | No | string |
| branch | query | If branch is set along with latest then the latest version on the specified branch name is returned. | Yes | string |
| identifier | path | Is the identifier of the component. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [component_version_result](/restapi/models/#component_version_result) |


### /dmadminweb/API/new/compver/{comp_id}

#### GET
##### Summary:

Create New Component Version

##### Description:

This call creates a new version of a component. The new component inherits all the attributes of the predecessor component including its domain.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of the component which will be the parent of the new component version. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. The newly created component version will inherit all the attributes from this component. | Yes | integer |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |


### /dmadminweb/API/buildid/{comp_id}/{build_id}

#### GET
##### Summary:

Associate a Build with a Component

##### Description:

This call associates a build number with a specified component. It is typically used from build engines to notify that a new build has been performed. If the component is associated with an approved application then a new version of the component and application is created automatically and the new component version replaces the old component version in the newly created application version.

In order for this to work through the permission model, the associated "Create Application Version" task needs to be specified. This ensures that the invoking user has permission to create a new version of the application (since the permissions are checked against the named task) and also the target domain (i.e. the domain in which the new application is created) is determined from the task. Also, by specifying the task to execute, any pre and post link actions are executed just as if the task had been invoked via the Web UI.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of a BASE component. DeployHub will find the latest version of this component and associate the build with that component version. If branch is specified then the latest version on the branch is located. The component can be specified using either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | integer |
| build_id | path | Is the numeric build ID to associate with the latest version of comp_id. | Yes | integer |
| taskname | query | Is the identifier of a Create New Application task to execute in order to create the new application version. Either its name, its qualified name (i.e. with its domain and any parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| commit | query | Is the commit ID which triggered the build. | No | string |
| issue | query | Is a change request id to associate with this build. If you add an issue then the specified component must have an associated change request datasource associated with it. This is because DeployHub will query the change tracking tool in order to retrieve the description of the change and the current status. If the component does not have such a datasource an error is returned.  You can specify one or more issue parameters if you need to associate multiple change requests with this build or use the issues parameter to specify multiple change requests. | No | string |
| issues | query | Is a comma-separated list of change request ids. This is equivalent to specifying multiple issue parameters. | No | string |
| file | query | Is a filename to record against the build. This is typically a file that was changed that resulted in a build being performed. You can specify one or more file parameters if you need to associate multiple files with this build or use the files parameter to specify multiple files. | No | string |
| files | query | Is a comma-separated list of files. This is equivalent to specifying multiple file parameters. | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/restapi/models/#success) |