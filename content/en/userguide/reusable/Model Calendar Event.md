**Calendar Event**

Places an Event on the _Environment_ Calendar. 

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