---
title: "Build Your Environments"
linkTitle: "Build Your Environments"
weight: 9
description: >
  How to Add Environments for Deployments
---
## Intro to _Environments_

_Environments_ represent a collection of _Endpoints_ where a deployment occurs. Many _Environments_ are assigned to your _Application_  and represent your Pipeline states (Dev, Test, Production).  _Environments_ can be mapped to your Continuous Delivery Pipeline for the deployment step.

Note: First define [_Endpoints_](/userguide/first-steps/2-define-endpoints/) to be assigned before you can define an _Environment_.

### _Environments_ and _Domains_

_Environments_ are associated to a [_Domain_](/userguide/first-steps/2-defining-domains/). Assign _Environments_ to any level of _Domain_ including the _Global Domain_. However, _Environments_ are most commonly associated to a _Project Domain_ used for _Applications_. A _Project Domain_ is used to manage an _Application_ and may be defined to include _Life Cycle Subdomains_ for managing your continuous _Delivery Pipeline_.

## Use the _Environment_ List View to Add and Delete

The _Environment_ menu is on the left of the main panel. Select the _Environment_ menu, to view a list of all _Environments_ to which you have access. The Search bar, represented by a funnel icon, allows you to reorder _Environments_ based on Name or _Domain_.

The _Environments_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _Environment_. |
| **Delete** | Deletes the selected item. |
| **Reports** | Success or Failed Report:  This report shows an ongoing list of all deployments to all _Environments_, regardless of _Domain_ or _Application_ with success or fail status. This report can be sorted based on the column for easy viewing. It can also be exported. |

Double click on an item in the list to see the _Dashboard_ view.

## Use the _Environment_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Environment_.  
The Dashboard view has one additional tab option - Calendars.
Below are the Details for an _Environment_.

### _Environment_ Details

| Field | Description |
| --- | --- |
|**Full _Domain_**| The fully qualified name of the _Domain_, including all parent _Domians_.
| **Name**| The name of the _Environment_. Note: Duplicate Names are restricted. It is recommended that _Environments_ be named in a specific manner, such as 'DevEnv-HipsterStore.'|
|**Owner Type**| User or Group |
| **Owner**| The owner defaults to the _User_ or _Group_ who created it.  |
|**Summary**| A short text description of the _Environment_. |
|**Availability**| (DeployHub Pro feature) The default value, "Always Available Unless Denied by Calendar", allows the _User_ to deploy _Applications_ into the _Environment_ . If there is an entry in the Calendar during a specific time (hours, days, weeks, deployment will be prevented with the use of an added Unavailable section. The other value, "Always Unavailable Unless Denied by Calendar", doesn't allow deployments unless a specific entry in the Calendar overrides it. |
| **Created** | Auto-generated date and time the _Environment_ was created. |
| **Modified** | Auto-generated date and time the _Environment_ was last modified. |

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Environment_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Environment_ in the following ways:

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Environment_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear. |
| **Change** | Allows the _User_ to change the _Environment's_ characteristics i.e. Name, Summary, etc. |
| **Create Calendar Entries** | Allows _Users_ to control the Calendar for the selected _Environment_. NOTE: Securing Environment Calendars is only available in DeployHub Pro.|
| **Deploy** | Allows _Users_ to deploy  _Applications_ into the selected _Environment_. |

{{% include "userguide/reusable/AuditTrail-withDeployments.md" %}}

{{% include "userguide/reusable/Attributes.md" %}}

### Assigned _Endpoints_

Note: You will need to have pre-defined your _Endpoints_.  See the [Define Your Endpoints](/userguide/first-steps/2-define-endpoints/) chapter for more information. 

_Environments_ are a collection of _Endpoints_. Use this section to assign the _Endpoints_ that will make up this _Environment_. Use +Add to create a new row in the _Endpoints_ table. Use Save to commit the row.  Select the row and use Edit or Delete to update or remove an _Endpoint_. When you add a new _Endpoint_ the  Hostname will be displayed. The Hostname is the actual network name or IP address.  It is assigned when the _Endpoint_ is defined, but is not a required field. If it is defined, it will be displayed in the row.

### Trends

This section shows the success/failure rate and time required for the last 10 deployments to this _Environment_.

### Assigned _Applications_

View all the _Application Base Versions_ assigned to this _Environment_. This is read only.  _Applications Base Versions_ are associated to _Environments_ when created using the [_Application_ Dashboard](/userguide/packaging-applications/2-defining-applications/#viewing-and-editing-with-the-_application_-dashboard). 

### Deployed _Components_ to _Environment_ Map

This map shows you all of the current _Component Versions_, with _Application Versions_, that have been deployed to this _Environment_.

## Smart _Environment_ Calendars

**DeployHub Team** _Calendar_ only shows you a history of what has already been deployed.

**DeployHub Pro**  Smart Calendars allow for a no-touch approval process driven by your continuous delivery pipeline. Smart _Calendars_  control the scheduling of deployments to the _Environment_. Each _Environment_ has a unique Calendar. Smart Calanders use events to schedule deployment for 'Auto Deploy', schedule a Task for an on-demand deployment, or block the _Calendar_ to prevent a deployment. If an _Environment_ Owner needs to block the Calendar, your CI/CD process will be blocked from executing the deployment. Once the Calendar has been re-opened, the deployments will bring the _Application Version_ upto the correct state. Each _Environment_ has its own _Calendar_ to:

- Automatically deploy an _Application_ or _Release_ into the _Environment_ on a certain date and time.
- Reserve a date to deploy on-demand an _Application_ or _Release_, preventing other _Users_ from performing deployments into the same _Environment_.
- Block a time-frame from receiving any _Application_ or _Release_ deployments.
- Open a time-frame to auto-approve an _Application_ or _Release_ deployment.

When viewing a _Calendar_ by Month, Week, or Day, click within a selected day and drag the mouse pointer down to select the time span for the event. A light blue area appears, covering the selected time. Right click and select "_Create New Event_." A pop-up window appears with buttons to set the selected time period.

**Availability Field**

The "Availability" field controls access to the _Environments._ You either close or open the Calendar for deployment events.

- _Available Unless Denied by Calendar –_ Selecting this option **opens** the Calendar for deployments at any time. To restrict a deployment, add an "Unavailable" Event for a specified time period.

- _Always UnAvailable Unless Allowed by Calendar_ – Selecting this option **closes** the Calendar for deployments. To open a period for deployment, add an "Available" Event for a specified time period.

**AutoDeploy**

**DeployHub Pro** allows for a scheduled deployment using the _Environment's Calendar_, called an "_AutoDeploy_." With _AutoDeploy_, a drop-down list allows the selection of an _Application_ or _Release_ to be deployed beginning at the designated Start Time. Not only does the _Calendar_ automatically run the deployment at the designated Start Time, it also keeps any other deployments from taking place in the designated Environment during that time period.

**Reserved**

If Reserved is selected, only the _Application_ or _Release_ that is selected via the drop-down list can be deployed to the _Environment_ between the Start Time and End Time. No other deployments can take place in the _Environment_ during this period. After a Reserved event has been created, a Task within a _Domain_ can be used to run the deployment using a Deploy Task.

**Unavailable**

If Unavailable is selected, no deployments can take place in the _Environment_ between the Start Time and End Time. This can be used to block out time to perform administrative duties such as backups, restores, etc.

## Calendars and Continuous Deployment Availability

You can auto-approve deployments by setting your "Availability" field to "_Always Available Unless Denied by Calendar_" When your CI/CD engine pushes the deployment, DeployHub checks the Calendar for availablility. If unavailable, the deployment will fail and send a message. When the Calendar is open, the deployment will execute, jumping versions to the correct state.

The _DeployHub Calendar_ allows you to control deployments into each Environment. Every _Environment_ has a private _Calendar_ which allows _Users_ the ability to:

- Automatically deploy a _Release_ or _Application_ into that _Environment_ on a given date and time.
- Reserve a period of time in order to manually deploy a _Release Version_ or _Application Version_, preventing other _Users_ from deploying into the same _Environment_.
- Make the _Calendar_ unavailable for any _Release Versions_ or _Application Versions._

## Scheduling a Deployment

When viewing by Month, Week, or Day, click within a selected day and drag the mouse pointer down in order to select the time span for the event. A blue area appears covering the selected time. Right click on the area and select 'Create New Event'. This brings up a window with the following fields:

| Field | Description |
| --- | --- |
| **Start Time** | The date and time for the beginning of the Reserved period, the beginning of the Unavailable period, or for the _Application_ or _Release_ to be AutoDeployed, depending on which button was selected. The Start Time and End Time are standardized to Greenwich Mean Time, so no matter where in the world the _User_ is located, DeployHub stores the time in such a manner that the _User's_ browser will display the correct local time for the deployment, while synchronizing all _Users_ to the same schedule. |
| **End Time** | The date and time for the end of the Reserved period or the end of the Unavailable period, depending on which button was selected. |
| **Reserved** | Blocks out the time so that only the specified _Application_ or _Release_ can be deployed to that environment during that time period. |
| **Unavailable** | Nothing can be deployed to the _Environment_ during a designated time period, such as when _Endpoints_ are down for maintenance. |
| **AutoDeploy** | Automatically deploy the _Application_ or _Release_ selected from the list above at this date and time. |
| **Event Name** | A name for the event that shows up on the _Calendar_ for organizing deployments at a glance. |
| **Deploy Type** | Either _Application_ or _Release_. Causes a list of one or the other to appear accordingly. |
| **Application or Release**  | Depending on what was chosen in the Deploy Type field, a list of all the _Applications_ or _Releases_ that have been assigned to this _Environment_. Select from this list to deploy it at the designated date and time. |
| **Description** | Free form text that contains more details on the deployment. |

## Calendar Color Grid

Once an event has been scheduled, it will be represented by a color box on the _Calendar_. Below are the definitions for the different colors you will see on the _Calendar_.

| Color | _Calendar_ Type |
| --- | --- |
| Black | Represents a time period where the _Endpoints_ are unavailable. |
| Orange | Represents a scheduled deployment. |
| Blue  | Represents a reservation for a scheduled deployment. |
| Grey  | Represents a reservation or deployment that needs to be approved. |
