---
title: "Environments Calendar"
linkTitle: "Environments Calendar"
weight: 20
---
### /dmadminweb/API/calendar

#### GET
##### Summary:

Retrieve calendar events

##### Description:

This call returns a JSON object representing the events in the calendar(s). Events can be filtered based on the environment to which the calendar belongs, the application associated with the event, a date/time range or a combination of all of these.


##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| env | query | Is the identifier of an environment. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. Specifying the environment filters the results to those events associated with the given environment | No | string |
| app | query | Is the identifier of an application. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. Specifying the application filters the results to those events associated with the given application.. | No | string |
| starttime | query | Is a date/time which - if specified - restricts the result to only include events which start on or before the specified time. If endtime is not provided, the API returns all future events.  YYYY:MM:DD	A date (4 digit year, a 2 digit month number and a 2 digit day of month).  YYYY:MM:DD:hh:mm	A date and time (4 digit year, a 2 digit month number, a 2 digit day of month and then the hours and minutes).  nnnnnnnnnn	An integer number representing the number of seconds since midnight, 1st Jan 1970 (Epoch time) | No | string |
| endtime | query | Is a date/time which - if specified - restricts the result to only include events which start on or after the specified time. If starttime is not provided, the API only returns events that in the future. Specifying a starttime before the current date/time will return historical events  YYYY:MM:DD	A date (4 digit year, a 2 digit month number and a 2 digit day of month).  YYYY:MM:DD:hh:mm	A date and time (4 digit year, a 2 digit month number, a 2 digit day of month and then the hours and minutes).  nnnnnnnnnn	An integer number representing the number of seconds since midnight, 1st Jan 1970 (Epoch time) | No | string |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| 200 | Success or failure.  Check success field for status. | [calendar_event_result](/restapi/models/#calendar_event_result) |