**Responses for _Application Version_ Result**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | An array of _Application Versions_|  | No |

**_Application Version_ Results Full Detail**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| approvals | [ An Array of Approvals |  | No |
| rejections | [ An Array of Rejections ] |  | No |
| summary | string | Is the summary text associated with the application | No |
| branch | string | Is the name of the branch on which this application is located (if an application version. If no branch is specified, this string is zero length. | No |
| components | [ [component](/restapi/models/#component) ] |  | No |
| requests | [ [request](/restapi/models/#request) ] |  | No |
| application_versions | Arry of Related _Application Versions_ |  | No |

**Approval Results**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| domain | string | _Domain_ that approval was made in | No |
| note | string | Comments about the approval | No |
| timestamp | integer | When the approval was preformed | No |
| user | string | Userid that did the approval | No |

**Rejection Results**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| domain | string | _Domain_ that rejection was made in | No |
| note | string | Comments about the rejection | No |
| timestamp | integer | When the rejection was preformed | No |
| user | string | Userid that did the rejection | No |

