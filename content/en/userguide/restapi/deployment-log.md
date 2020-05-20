---
title: "Deployment Log"
linkTitle: "Deployment Log"
weight: 60
description: >
  Retrieve a deployment log.
---

### /dmadminweb/API/log/{lognumber}

#### GET
##### Summary:

Retrieve deployment log

##### Description:

This call returns a JSON object representing the specified deployment log.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| lognumber | path | Is the deployment ID being retrieved. Note if the deployment log relates to an application outside of your domain hierarchy or to an application to which you do not have read access then you will receive an error. | Yes | integer |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [log_result](/restapi/models/#log_result) |