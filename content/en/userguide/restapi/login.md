---
title: "Login"
linkTitle: "Login"
weight: 5
description: >
  Login into DeployHub.
---

### /dmadminweb/API/login

#### GET

##### Summary

Login

##### Description

When issuing calls to the API, the client application must either first issue a "login" call, specifying the username and password or must specify the username and password in each individual call to the API.

When calling the API from inside DMScript (the built-in scripting language), the JSESSIONID value for the logged-in user is available via a global variable ($JSESSIONID). This can be used to allow DMScript to call the API without the need for an explicit second login. See the DMScript user guide for more information.

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user | query | User Id | Yes | string |
| pass | query | Password for User | Yes | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | The result will include a JSESSIONID cookie. Include this in subsequent calls to the API. | [success](/restapi/models/#success) |
