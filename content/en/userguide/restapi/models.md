---
title: "Models"
linkTitle: "Models"
weight: 110
description: >
  Using RESTful API's to Integrate DeployHub into DevOps Tooling.
---

### Models


#### success

Value is true for a successful result, false for unsuccessful result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean |  | Yes |
| error | string |  | No |

#### Application

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| completed | string | The date/time of the last deployment of this application into the environment. | No |
| deploymentid | integer | The ID of the last deployment of this application into the environment. An ID of 0 indicates that the application has been manually associated with the environment. | No |
| exitcode | integer | The exit code of the last deployment of this application into the environment. | No |
| id | integer | The internal object ID of the BASE application. | No |
| name | string | The name of the BASE application. | No |
| predecessorid | integer | The ID of the previous application version if the application is a version. | No |
| versionid | integer | The ID of the application version if the application is a version. | No |
| versionname | string | The name of the application version if the application is a version. | No |

#### Applications

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Applications | array |  |  |

#### Environment

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| domain | string | The fully-qualified domain name of the domain in which the environment is located. | No |
| id | integer | Is the internal ID of the environment | No |
| name | string | Is the name of the environment | No |
| owneruser | string | If the "owner" of the environment is a user, then this is the name of the user | No |
| ownergroup | string | If the "owner" of the environment is a user group, then this is the name of that group. | No |
| summary | string | The summary string associated with the environment. | No |
| applications | [applications](/restapi/models/#applications) |  | No |

#### Environments

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| Environments | array |  |  |

#### Environments_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [ [environments](/restapi/models/#environments) ] | Is a JSON  array of objects, one for each environment returned by the query (if success is true). | No |

#### environment_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [environment](/restapi/models/#environment) |  | No |

#### applications_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [ [applications](/restapi/models/#applications) ] | Is a JSON  array of objects, one for each environment returned by the query (if success is true). | No |

#### request

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| title | string | Is the description of the change request | No |
| id | integer | Is the ID of the change request as known by the external change tracking system. | No |
| status | string | Is the status of the change request. | No |
| api_url | string | Is the URL of the API call to the external change tracking system that is required to return more data about the specified change request. | No |
| html_url | string | Is the URL of the page in the external change tracking system which details more information about the change request. | No |

#### application_version

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the internal application ID | No |
| name | string | Is the name of the application version | No |
| summary | string | Is the summary text associated with the application version | No |

#### application_predecessor

Only returned for application versions. A JSON Object representing the predecessor of this application (if the application is a version).

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the internal application ID | No |
| name | string | Is the name of the predecessor application | No |
| summary | string | Is the summary text associated with the predecessor application | No |
| versions | [ [application_version](/restapi/models/#application_version) ] |  | No |

#### component

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the component's internal ID | No |
| lastbuild | integer | Is the last build number associated with this component (0 if never built or no associated build job) | No |
| name | string | Is the name of the Component | No |
| summary | string | Is the summary text associated with the Component | No |
| domain | string | The fully-qualified domain name of the domain in which the application is located. | No |
| application_id | string | Is the internal ID of the application | No |
| application_name | string | Is the name of the application | No |
| owneruser | string | If the "owner" of the application is a user, then this is the name of the useron | No |
| ownergroup | string | If the "owner" of the application is a user group, then this is the name of that group. | No |
| predecessor | [application_predecessor](/restapi/models/#application_predecessor) |  | No |

#### approval

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| domain | string | Domain that approval was made in | No |
| note | string | Comments about the approval | No |
| timestamp | integer | When the approval was preformed | No |
| user | string | Userid that did the approval | No |

#### rejection

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| domain | string | Domain that rejection was made in | No |
| note | string | Comments about the rejection | No |
| timestamp | integer | When the rejection was preformed | No |
| user | string | Userid that did the rejection | No |

#### application_version_full

Is a JSON  object representing the application being retrieved.

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| approvals | [ [approval](/restapi/models/#approval) ] |  | No |
| rejections | [ [rejection](/restapi/models/#rejection) ] |  | No |
| summary | string | Is the summary text associated with the application | No |
| branch | string | Is the name of the branch on which this application is located (if an application version. If no branch is specified, this string is zero length. | No |
| components | [ [component](/restapi/models/#component) ] |  | No |
| requests | [ [request](/restapi/models/#request) ] |  | No |
| application_versions | [ [application_version](/restapi/models/#application_version) ] |  | No |

#### application_version_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [application_version_full](/restapi/models/#application_version_full) |  | No |

#### server

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| automd5 | string | Is a Boolean representing if "Auto MD5 Scanning" is set for the server. | No |
| autoping | string | Is a Boolean representing if "Auto Ping" is set for the server. | No |
| basedir | string | Is the base directory for the server. | No |
| comptypes | [ [comptype](/restapi/models/#comptype) ] |  | No |
| credential | string | Is the name of the credential used to connect to the server. | No |
| domain | string | Is the server's fully qualified domain. | No |
| environments | [ [environment](/restapi/models/#environment) ] |  | No |
| hostname | string | Is the hostname of the server | No |
| id | string | Is the server's internal object ID. | No |
| md5template | string | Is the name of the template to be used for notification should the server fail an automated mD5 scan. | No |
| name | string | Is the server's name. | No |
| owneruser | string | If the "owner" of the server is a user, then this is the name of the user | No |
| ownergroup | string | If the "owner" of the server is a user group, then this is the name of that group. | No |
| pingend | string | The time after which auto ping will stop (in format HH:MM) | No |
| pingstart | string | The time at which auto ping will start (in format HH:MM) | No |
| pingtemplate | string | Is the name of the template to be used for notification should the server fail an automated ping. | No |
| protocol | string | The protocol used to connect to the server. | No |
| summary | string | Any summary text associated with the server. | No |

#### comptype

component type used by components and servers

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| comptype | string | component type used by components and servers |  |

#### servers

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| servers | array |  |  |

#### servers_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [servers](/restapi/models/#servers) |  | No |

#### server_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [server](/restapi/models/#server) |  | No |

#### component_version

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the internal application ID | No |
| name | string | Is the name of the application version | No |
| summary | string | Is the summary text associated with the application version | No |

#### component_predecessor

Only returned for application versions. A JSON Object representing the predecessor of this application (if the application is a version).

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | Is the internal application ID | No |
| name | string | Is the name of the predecessor application | No |
| summary | string | Is the summary text associated with the predecessor application | No |
| versions | [ [component_version](/restapi/models/#component_version) ] |  | No |

#### component_version_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [component_version_full](/restapi/models/#component_version_full) |  | No |

#### component_version_full

Is a JSON  object representing the application being retrieved.

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| branch | string | Is the name of the branch on which this component is located (if a component version). If no branch is specified, this string is zero length. | No |
| domain | string | The fully-qualified domain name of the domain in which the component is located. | No |
| id | integer | The internal id of the component or component version | No |
| lastbuild | integer | Last Build number that created the component or component version | No |
| name | string | The name of the component or component version | No |
| owneruser | string | If the "owner" of the server is a user, then this is the name of the user | No |
| ownergroup | string | If the "owner" of the server is a user group, then this is the name of that group. | No |
| requests | [ [request](/restapi/models/#request) ] |  | No |
| summary | string | Is the summary text associated with the component version | No |
| component_versions | [ [component_version](/restapi/models/#component_version) ] |  | No |
| applications | [ [application_version_full](/restapi/models/#application_version_full) ] |  | No |
| predecessor | [ [component_predecessor](/restapi/models/#component_predecessor) ] |  | No |

#### event_timestamp

datetime and epoc

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| datetime | string | is the date/time in YYYY:MM:DD:hh:mm format | No |
| timestamp | integer | is the date/time in Epoch Time. | No |

#### event_creator

Is an object representing the user who created the event

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | is the internal user id | No |
| name | string | is the name of the user. | No |

#### event_environment

Is an object representing the user who created the event

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| id | integer | is the internal environment ID | No |
| name | string | is the environment name. | No |

#### event

Calendar Event

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| allday | boolean | Is a Boolean indicating whether the event is an "all day" event. | No |
| application | [application](/restapi/models/#application) |  | No |
| created | [event_timestamp](/restapi/models/#event_timestamp) |  | No |
| creator | [event_creator](/restapi/models/#event_creator) |  | No |
| endtime | [event_timestamp](/restapi/models/#event_timestamp) |  | No |
| deployid | integer | Is the ID of the deployment (if this is a deployment record), 0 otherwise. | No |
| desc | string | Is the Description of the event. | No |
| environment | [event_environment](/restapi/models/#event_environment) |  | No |
| id | integer | Is the internal event id. | No |
| pending | boolean | Is a Boolean indicating whether the event is awaiting approval by the environment owner. | No |
| starttime | [event_timestamp](/restapi/models/#event_timestamp) |  | No |
| title | string | Is the event title. | No |
| type | string | Is the event type. | No |

#### calendar_event_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [ [event](/restapi/models/#event) ] |  | No |

#### deployment_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| deploymentid | integer | Deployment Id | No |

#### log

Deployment Log

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| application | string | The name of the application that was deployed. | No |
| complete | boolean | A Boolean indicating if the deployment is complete (true) or still in progress (false). | No |
| environment | string | The environment to which the application was deployed. | No |
| exitcode | integer | The exit code of the deployment. | No |
| exitstatus | string | The error text if the deployment failed. | No |
| started | integer | The start date/time of the deployment (in Epoch time) | No |
| finished | integer | The end date/time of the deployment (in Epoch time) | No |
| id | integer | The deployment ID. | No |
| loglinecount | integer | The number of lines in the "logoutput" array | No |
| logoutput | [ string ] |  | No |

#### log_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| result | [log](/restapi/models/#log) |  | No |

#### attribute

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| attrname | string | name of the attribute key | No |
| attrvalue | string | value for the attribute | No |

#### attribute_result

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false then result is not returned and a text field named "error" is returned instead. | No |
| attributes | [ [attribute](/restapi/models/#attribute) ] |  | No |