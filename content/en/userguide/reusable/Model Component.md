*_Component_ Object for APIs**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the _Component's_ internal ID | No |
| lastbuild | integer | Is the last build number associated with this _Component_ (0 if never built or no associated build job) | No |
| name | string | Is the name of the _Component_ | No |
| summary | string | Is the summary text associated with the _Component_ | No |
| domain | string | The fully-qualified domain name of the _Domain_ in which the application is located. | No |
| application_id | string | Is the internal ID of the _Application_ | No |
| application_name | string | Is the name of the _Application_ | No |
| owneruser | string | If the "owner" of the _Application_ is a user, then this is the name of the useron | No |
| ownergroup | string | If the "owner" of the _Application_ is a _User Group_, then this is the name of that _Group_. | No |
| predecessor | _Application Version_ | Parent _Application Version_.  | No |

[application_predecessor](/restapi/models/#application_predecessor)