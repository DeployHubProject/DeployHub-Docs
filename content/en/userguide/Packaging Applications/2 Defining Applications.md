---
title: "Defining Your Application Baseline"
linkTitle: "Defining Your Application Baseline"
weight: 5
description: >
  Creating a New Baseline Application.
---

## The _Application_ List View for Adding or Deleting

From the _Application_ menu option to the left of the DeployHub main panel, you will be taken to a list of all _Application Base Versions_ and _Application Versions_ to which you have access. There is a row for every _Environment_ to which the _Application Base Version_ or _Application Version_ has been deployed.  For this reason, you will see multiple entries for the same _Application_ if it has been deployed to multiple _Environments_.  

The list view is organized on the following columns:

| List Column | Description|
|---|---|
|**Version**|  The _Application Base Version_ or _Application Version_ number. |
|**Domain**| The _Domain_ to which the _Application_ belongs.|
|**Parent**| The _Application Base Version_ from which the _Application Version_ was created. This will be empty for the _Application Base Version_.|
|**Environment**| The _Environment_ to which the _Application_ has been deployed. Each _Environment_ will represent a different row in the List View table.|
|**Last Deployment to Environment**| The Deployment Log number.|
|**Completed**|The date and time of the last deployment to the listed _Environment_.|
|**Results**| Success or Fail.|

You can also use the Filter bar, represented by a funnel icon, to reorder your _Application_ List View.  You can filter on:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## Additional Tabs from the _Application_ List View

The _Application_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
| Refresh | Refreshes the browser. |
| Add Base | Allows you to Add a new _Application Base Version_. |
| Add Version | Creates a copy of the selected _Application_ in the list, creating a new _Application Version_. |
| Delete | Deletes the selected item. However, you must delete the _Applications_ starting from the newest to the oldest.  The _Application Base Version_ would be deleted last. Sorting by "Version" gives you the order.  |
| Tasks | Displays all _Application_ Tasks available for the selected Item based on the Tasks defined to the _Application_ Domain. See [Tasks](/userguide/first-steps/2-defining-domains/#tasks) for more information.   |
| List | Takes you back to the List View if you have been in the Map View. |
| Map | Displays a global Map of all versions of the _Application_ with _Components_. |

## Viewing and Editing with the _Application_ Dashboard

The Dashboard view displays all information related to a specific _Application Base Version_ or _Application Version_. The Dashboard view has two additional tab options - Package Components and Versions.  Below are the Details for an _Application_.

| Details | Description |
| --- | --- |
|Full Domain | The fully qualified path of the _Domain_ that the _Application_ is to be associated, showing all parent _Domains_. |
|Name | The Name of your _Application_. |
|Owner Type| Owned by a User or Group. |
|Owner | Name of User or Group. |
|Summary | Description of the _Application_. |
|Created | Auto generated based on the date the _Application_ was added. |
|Modified | Auto generated based on the date the _Application_ was updated. |  
|Change Request DataSource | DeployHub Pro Option - Establishes the Change Request system for the _Application_. A Change Request Data Source must be pre-defined for this field to be used. |
Pre-Action| An action that should be executed prior to the deployment of the _Application_.|
Post-Action| An action that should be executed at the completion of the _Application_ deployment.|
Custom Action | Overrides any Pre or Post Actions, such as calling an external solutions such as Helm.|
Successful Deployment Template | The template that should be used for success notifications. |
Failed Deployment Template| The template that should be used for failure notifications.|

### _Application_ Dependency Map

The Dependency Map provides a graphical view of all your _Package Components_. This will remain empty until you assign _Components_ to your _Application_ using the _Package Components_ tab at the top of your _Application_ Dashboard.

### Log History

_Applications_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all deployments based on "Result" and "Date".

{{% include "userguide/reusable/Attributes.md" %}}

### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

### Associated Environments

Each _Application Base Version_ are assigned the _Environments_ to which they will be deployed. _Application Versions_ inherit the _Environments_ from the _Application Base Version_. By using the "+Add this Application to an Environment to enable Deployments" option, you can add _Environments_ where the _Application_ is to be deployed. You can assign the _Application_ to as many _Environments_ as needed.  The Detail field will contain a link to the deployment Log for the last _Environment_ where the _Application_ was deployed.

### Last Deployment Difference Based on Environment

The Difference Map shows what changed in an _Environment_ for the selected _Application_. Because _Applications_ are deployed to many _Environments_, you are given the option of selecting the _Environment_ to interrogate. The resulting map shows what changed between the current and previous _Application_ in the selected _Environment_.  

{{% include "userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

The Access Section allows _Users_ within designated _Groups_ to update or view the _Application_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Application_:

| Access | Description |
| --- | --- |
| **View** | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |
| **Deploy** | This allows any _User_ that belongs to any _Group_ in this list to deploy the _Application_.  This is further restricted based on the Access defined at the _Environment_ level. |


### Change Request

The Change Request section, available for DeployHub Pro users, shows enhancement requests and bugs for a selected _Application_. You must have a "Change Request" Data Source defined in your General settings in order to see Change Requests. Change Request Data Sources can be connected to several popular bug tracking systems, including Bugzilla, GitHub, and Jira. To setup your Change Request see [Managing Data Sources](/userguide/customizations/2-data-sources/).

Select the "+Add Change Request to this Version" to assign a Change Request to the _Application_. This will display all the Change Requests (Enhancements, Bugs, etc.) from the assigned Data Source in the resulting Select Bug Record pop up window, and one or more of these can be assigned to the _Application_ by clicking on the box to the left of each CR ID field.

The lower section contains a list of Change Requests with the fields CR ID, Title, and Status. Clicking on the CR ID takes the User to a new tab in the browser that contains the source of the Change Request. For instance, if the _Application_ has a Change Request Data Source of the type GitHub, clicking on the CR ID field for a Change Request will open a tab with the bug or enhancement request within github.com, allowing the User the ability to update, close, or read about it in detail. The Title field holds the title of the Change Request within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either 'open' or 'closed’ and displays them in the Status field with a gold or dark gray background respectively.

## Package Components Tab

This tab contains all the _Components_ that make up an _Application_, linked together in order of deployment if needed using a blueprint designer. Click on the _Component_ Selector on the right side to see the available _Components_ based on _Domains_ and Categories. A Category acts as a tag or label assigned at the _Component_ level and are not specific to _Domains_.  _Domains_ are identified with a sitemap icon and Category is identified with a Tag icon. Selecting either will expand the options to show all available _Components_. 

Click and drag a _Component_ from the list on the far right side and drop it into the Assigned _Components_ area. It will appear in the area as a box containing the name of the _Component_, and automatically link to the last _Component_ in the area. The connecting line can be deleted by right clicking on the connecting line and selecting "Delete this Connection". A new connector can be created by clicking on the anchor (the green dot at the bottom of the _Component_) and dragging and dropping it onto another _Component_. This determines the order that _Components_ will be deployed. Keep in mind that each _Component_ contains _Component Items_ that are also linked together in the order that they are to be executed.  For a microservice implementation, they can all be linked to the "start point". This means they will be deployed in parallel.

NOTE: At least one _Component_ must be connected to the "start point", otherwise DeployHub does not know which _Component_ to begin with, and the deployment will fail.

