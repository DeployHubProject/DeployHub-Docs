**Responses for _Application Version_ Results Full Detail**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| approvals | [ An Array of Approvals |  | No |
| rejections | [ An Array of Rejections ] |  | No |
| summary | string | Is the summary text associated with the application | No |
| branch | string | Is the name of the branch on which this application is located (if an application version. If no branch is specified, this string is zero length. | No |
| components | [ [component](/restapi/models/#component) ] |  | No |
| requests | [ [request](/restapi/models/#request) ] |  | No |
| application_versions | Arry of Related _Application Versions_ |  | No |