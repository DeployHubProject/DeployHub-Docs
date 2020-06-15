**Responses for_Component Version_ Full Detail**

Is a JSON  object representing the _Component_ being retrieved.

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| branch | string | Is the name of the branch on which this _Component_ is located. If no branch is specified, this string is zero length. | No |
| domain | string | The fully-qualified domain name of the _Domain_ in which the _Component_ is located. | No |
| id | integer | The internal id of the _Component_ or _Component Version_. | No |
| lastbuild | integer | Last Build number that created the _Component_ or _Component Version_. | No |
| name | string | The name of the  _Component_ or _Component Version_. | No |
| owneruser | string | If the "owner" of the _Component_ is a _User_, then this is the name of the _User_. | No |
| ownergroup | string | If the "owner" of the _Component_ is a _Group_, then this is the name of that _Group_. | No |
| requests | [ [request](/restapi/models/#request) ] |  | No |
| summary | string | Is the summary text associated with the _Component Version_ | No |
| component_versions | [ [component_version](/restapi/models/#component_version) ] |  | No |
| applications | [ [application_version_full](/restapi/models/#application_version_full) ] |  | No |
| predecessor | [ [component_predecessor](/restapi/models/#component_predecessor) ] |  | No |