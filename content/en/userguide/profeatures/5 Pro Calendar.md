---
title: "Smart Calendar"
linkTitle: "Smart Calendar"
weight: 84
description: >
  Using the Smart Calendar to schedule deployments.
---
## Smart Calendar

**DeployHub**** Team**_Calendar_ only shows you a history of what has already been deployed.

**DeployHub Pro** _Calendar_ has added features. _Calendar Events_ allow you to schedule deployments and block the _Calendar_ for each _Environment_. This allows for a no-touch approval process driven by your continuous delivery pipeline. Each _Environment_ has its own _Calendar_ that can be used to:

- Automatically deploy an _Application_ or _Release_ into the _Environment_ on a certain date and time.
- Reserve a date to manually deploy an _Application_ or _Release_, preventing other _Users_ from performing deployments into the same _Environment_.
- Block a timeframe from receiving any _Application_ or _Release_ deployments.
- Open a timeframe to auto-approve an _Application_ or _Release_ deployment.

_Calendars_ are found by going to the _Data Center_ Menu. Open the _Life Cycle Sub-Domain_ and select the _Environment_. The _Environment's Calendar_ will appear under the _Calendar_ Tab. When viewing a _Calendar_ by Month, Week, or Day you can click on a place within a selected day and drag the mouse pointer down in order to select the time span for the event. A light blue area appears, covering the selected time. Right click on this area and select "_Create New Event_." A pop-up window appears with buttons that are used to set the selected time period to one of the three types listed above.

## Availability Field

The "Availability" field controls access to the _Environments._ You either close or open the Calendar for deployment events.

- _Available Unless Denied by Calendar –_ Selecting this option **opens** the Calendar for deployments at any time. To restrict a deployment, you would add a "Unavailable" Event for a specified period.

- _Always UnAvailable Unless Allowed by Calendar_ – Selecting this option **closes** the Calendar for deployments. To open a period for deployment, you would add an "Available" Event for a specified period.

![Environment Calendar](RackMultipart20200511-4-1g6tuuf_html_8fec0f2a139617ec.png) _Environment Calendar_

## AutoDeploy

**DeployHub Pro** allows for a scheduled deployment using the _Environment's Calendar_, which is referred to as an "_AutoDeploy_." If _AutoDeploy_ is selected, a drop-down list allows the selection of an _Application_ or _Release_ to be deployed beginning at the designated Start Time. Not only does the _Calendar_ automatically run the deployment at the designated Start Time, it also keeps any other deployments from taking place in the designated Environment during that time period.

## Reserved

If Reserved is selected, only the _Application_ or _Release_ that is selected via the drop-down list can be deployed to the _Environment_ between the Start Time and End Time. No other deployments can take place in the _Environment_ during this period. After a Reserved event has been created, a Task within a _Domain_ in the tree structure can be used to run the deployment using a Deploy Task.

## Unavailable

If Unavailable is selected, no deployments can take place in the _Environment_ between the Start Time and End Time. This can be used to block out time to perform administrative duties such as backups, restores, etc.

## Calendar at Continuous Deployment Availability

You can auto-approve deployments for your continuous delivery pipeline by setting your "Availability" field to "_Always Available Unless Denied by Calendar._" When your CI/CD engine pushes the deployment, DeployHub will first check the Calendar to see if it is available. If not, the deployment will fail and send a message. The next time around, if the Calendar is open, the deployment will execute, jumping versions to the correct state.

The _DeployHub Calendar_ allows you to control deployments into each Environment. Every _Environment_ has a private _Calendar_ which allows _Users_ the ability to:

- Automatically deploy a _Release_ or _Application_ into that _Environment_ on a given date and time.
- Reserve a period of time in order to manually deploy a _Release Version_ or _Application Version_, preventing other _Users_ from deploying into the same _Environment_.
- Make the _Calendar_ unavailable for any _Release Versions_ or _Application Versions._

## Scheduling a Deployment

When viewing by Month, Week, or Day, click within a selected day and drag the mouse pointer down in order to select the time span for the event. A blue area appears covering the selected time. Right click on the area and select 'Create New Event'. This brings up a window with the following fields:

| Field | Description |
| --- | --- |
| Start Time | The date and time for the beginning of the Reserved period, the beginning of the Unavailable period, or for the _Application_ or _Release_ to be AutoDeployed, depending on which button was selected. The Start Time and End Time are standardized to Greenwich Mean Time, so no matter where in the world the _User_ is located, DeployHub stores the time in such a manner that the _User's_ browser will display the correct local time for the deployment, while synchronizing all _Users_ to the same schedule. |
| End Time | The date and time for the end of the Reserved period or the end of the Unavailable period, depending on which button was selected. |
| Reserved | Blocks out the time so that only the specified _Application_ or _Release_ can be deployed to that environment during that time period. |
| Unavailable | Nothing can be deployed to the _Environment_ during a designated time period, such as when _Endpoints_ are down for maintenance. |
| AutoDeploy | Automatically deploy the _Application_ or _Release_ selected from the list above at this date and time. |
| Event Name | A name for the event that shows up on the _Calendar_ for organizing deployments at a glance. |
| Deploy Type | Either _Application_ or _Release_. Causes a list of one or the other to appear accordingly. |
| Application or Release (depending on what was chosen in the Deploy Type field) | A list of all the _Applications_ or _Releases_ that have been assigned to this _Environment_. Select from this list to deploy it at the designated date and time. |
| Description | Free form text that contains more details on the deployment. |

## Calendar Color Grid

Once an event has been scheduled, it will be represented by a color box on the _Calendar_. Below are the definitions for the different colors you will see on the _Calendar_.

| Color | _Calendar_ Type |
| --- | --- |
|  | Represents a time period where the _Endpoints_ are unavailable. |
|  | Represents a scheduled deployment. |
|  | Represents a reservation for a scheduled deployment. |
|  | Represents a reservation or deployment that needs to be approved. |
