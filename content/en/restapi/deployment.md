---
title: "Deployment"
linkTitle: "Deployment"
weight: 20
---

### /dmadminweb/API/deploy/{app_id}/{env_id}

#### GET
##### Summary:

Start Deployment

##### Description:

This call starts a deployment of the specified application into the specified environment.

In order for API deployments to work through the permission model, there has to be a Deploy task either in the domain in which the specified application is located or in any of the parent domains if the Deploy task is set to be available to sub-domains. If finer control is required, the task can be named via the task parameter. 

This mechanism ensures that the invoking user has permission to deploy the application (since the permissions are checked against the task). Also, by specifying the task to execute, any pre and post link actions are executed just as if the task had been invoked via the Web UI.

Note - Any additional parameters are created as Global Variables accessible with a url_ prefix. For example, if you passed "myparam=123" as a parameter in the "deploy" api call, it would be available as $url_myparam in DeployHub.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| wait | query | If the wait parameter is not specified - or is specified and set to Y - then the call does not return until the deployment is complete. If the wait parameter is set to N then the call returns as soon as the deployment has been instigated but before it completes. In both cases, the deployment id is returned.  | No | string |
| task | query | Is the identifier of a Deploy task to execute in order to perform the deployment. Either its name, its qualified name (i.e. with its domain and any parent domain(s) included in dot notation) or its internal ID. If the task is not specified, the first accessible Deploy task within the application's domain is used (or any Deploy task in parent domains if they are set to be available to sub-domains).  | No | string |
| app_id | path | Is the identifier of an application. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| env_id | path | Is the identifier of an environment. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [deployment_result](/restapi/models/#deployment_result) |