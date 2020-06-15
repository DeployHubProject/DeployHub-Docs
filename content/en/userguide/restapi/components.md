---
title: "Component APIs"
linkTitle: "Component APIs"
weight: 20
description: >
  APIs for _Components_.
---


##Retrieve a _Component_
Retrieve specific _Component_ or _Component_ version. This call returns a JSON object representing the specified _Component_. It is useful to determine the _Application_(s) which include the _Component_, whether the _Application_(s) are approved, which other _Components_ are used in _Application_s alongside the specified _Component_ and so on.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  dmadminweb/API/_Component_/{identifier} |

**Parameters**

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| latest | query | If latest is set to Y, for "Yes",  then the latest version of the _Component_ is returned.  To use this flag, the specified identifier must refer to a  _Component Base Version_, otherwise the flag has no effect. | No | string |
| branch | query | If branch is set along with latest then the latest version on the specified branch name is returned. | Yes | string |
| identifier | path | Is the identifier of the _Component_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | string |

**Responses**

| Return Code | Return Code Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [_Component__version_result](/userguide/restapi/models/#_Component__version_result) |

##Create New _Component Version_

This call creates a new _Component Version_. The new _Component_ inherits all the attributes of the predecessor _Component_ including its _Domain_.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  /dmadminweb/API/new/compver/{comp_id} |

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of the _Component_ which will be the parent of the new _Component Version_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. The newly created _Component Version_ will inherit all the attributes from this _Component_. | Yes | integer |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](userguide/restapi/models/#success) |


## Associate a Build with a _Component_

This call associates a build number with a specified _Component_. It is typically used with _CD Engines_ to notify that a new build has been performed. If the _Component_ is associated with an approved _Application_ then a new version of the _Component_ and _Application_ is created automatically and the new _Component_ version replaces the old _Component_ version in the newly created _Application_ version.

In order for this to work through the permission model, the associated "Create _Application_ Version" Task needs to be specified. This ensures that the invoking user has permission to create a new version of the _Application_ (since the permissions are checked against the named Task) and also the target _Domain_ (i.e. the domain in which the new _Application_ is created) is determined from the Task. Also, by specifying the Task to execute, any Pre and Post link _Actions_ are executed just as if the Task had been invoked via the Web UI.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  /dmadminweb/API/buildid/{comp_id}/{build_id} |

**Parameters**

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of a BASE _Component_. The latest version of this _Component_ will be found and associated to the build with that _Component Version_. If "branch" is specified then the latest version on the branch is located. The _Component_ can be specified using either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | integer |
| build_id | path | Is the numeric build ID to associate with the latest version of _Component_ ID (comp_id). | Yes | integer |
| taskname | query | Is the identifier of a "Create New _Application_ Task" to execute in order to create the new _Application Version_. Either its name, its qualified name with its domain and any parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |
| commit | query | Is the commit ID which triggered the build. | No | string |
| issue | query | Is a change request id to associate with this build. If you add an issue then the specified _Component_ must have an associated Change Request _Data Source_ associated with it. This is because the API  will query the change tracking tool in order to retrieve the description of the change and the current status. If the _Component_ does not have such a Change Request _Data Source_ an error is returned.  You can specify one or more issue parameters if you need to associate multiple change requests with this build or use the issues parameter to specify multiple change requests. | No | string |
| issues | query | Is a comma-separated list of change request ids. This is equivalent to specifying multiple issue parameters. | No | string |
| file | query | Is a filename to record against the build. This is typically a file that was changed that resulted in a build being performed. You can specify one or more file parameters if you need to associate multiple files with this build or use the files parameter to specify multiple files. | No | string |
| files | query | Is a comma-separated list of files. This is equivalent to specifying multiple file parameters. | No | string |

**Responses**

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [success](/userguide/restapi/models/#success) |
