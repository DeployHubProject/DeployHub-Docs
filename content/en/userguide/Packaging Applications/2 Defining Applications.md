---
title: "Defining Your Application Baseline"
linkTitle: "Defining Your Application Baseline"
weight: 5
description: >
  Creating a New Baseline Application.
---

# The _Application_ List View for Adding, Editing or Deleteing

From the _Application_ menu option to the left of the DeployHub main panel, you will be taken to a list of all _Application Base Versions_ and _Application Versions_ which you have access to. You can also use the Search bar, represented by a funnel icon, to filter _Applications_.  You can filter on:

- Domain
- Environment
- Last Deployment
- Result
- Version

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

The _Application_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Application Base Version_. To add a new _Application Version_, use the Task option.|
|New Application Version | Creates a copy of the selected _Application_ in the list |
| Delete | Deletes the selected item. |
| Tasks | Displays all Application Tasks available for the selected Item. |
| List | Takes you back to the List View if you have been in the Map View. |
| Map | Displays a global Map of all versions of the _Application_ with _Components_. |

## The _Application_ Dashboard

The Dashboard view displays all information related to a specific _Application Base Version_ or _Application Version_. The Dashboard view as two additional tab options - Package Components and Versions. From the _Application_ List View, double click on the _Application Base Version_ or _Application Version_ which you would like to view to see all Detials.  You can also create a new _Application Base Version_ by selecting the **+Add** option at the top of the List View.  To create a new _Applicaiton Version_, check box which _Applicaiton_ you wish to serve as the parent, and then select **New Application Version**.  Below are the Detials for an _Application_.

### _Application_ Details

| Details | Description |
| --- | --- |
| Domain | The _Domain_ that the _Application_ is associated. |
|Name | The Name of your _Application_. | 
|Owner Type| Owned by a User or Group. |    
|Owner | Name of User or Group. |    
|Summary | Description of the _Application_. | 
|Created | Auto generated based on the date the _Application_ was added. |    
|Modified | Auto generated based on the date the _Application_ was updated. |    
|Change Request DataSource | DeployHub Pro Option - Establishes the Change Request system for the _Application_.|    
Pre-Action| An action that should be executed prior to the deployment of the _Application_.| 
Post-Action| An action that should be executed at the completion of the _Application_ deployment.|
Custom Action | Overides any Pre or Post Actions, such as calling an external soltutions such as Helm.|   
Successful Deployment Template | The template that should be used for success notifications. |    
Failed Deployment Template| The template that should be used for failure notifications.|

### _Application_ Dependency Map

The Dependency Map provides a graphical view of all your _Package Components_. This will remain empty until you assign _Components_ to your _Application_ using the _Package Components_ tab at the top of your _Application_ Dashboard.

### Log History

_Applicaitons_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all steps executed as part of the deployment process.

### Attributes

Attributes are environment variables that need to be assigned to the _Application_ such as Key Value Pairs. Use the +Add option to add Attributes to your _Application_. Attributes have a Name and a Value. Any Attributes defined at the _Application_ level override any Attributes defined at the _Environment_ level.

### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

### Associated Environments

_Applications_ are deployed to _Environments_.  By using the +Assign option, you can add _Environments_ where the _Application_ is to be deployed. Use the +Assign option to add multiple _Environments_.  The Detial field will contain a link to the deployment Log for each _Environment_ where the _Application_ was deployed.

### Last Deployment Difference Graph

The Difference Graph shows what changed in the last deployment between the previous deployment. For the _Application Base Version_ all _Components_ will be shown.  Subsequent deployments will only show what changed.

### Audit Trail

The Audit Trail displays audit entries for deployments, including deployment number, _Environment_, and how many days ago the deployment (hours for all of today's deployments) took place. Any attribute changes to the _Application_ are also shown on the Audit Trail.

{{% include "userguide/reusable/Access Object.md" %}}

### Change Request

The Change Request section, available for DeployHub Pro users,  shows enhancement requests and bugs for a selected Component for several popular bug tracking systems, including Bugzilla, GitHub, and Jira.

Select the "+Add Change Request to this Version" to assign a Change Request to the _Application_. This will display all the Change Requests (Enhancements, Bugs, etc.) from the assigned Data Source in the resulting Select Bug Record pop up window, and one or more of these can be assigned to the _Application_ by clicking on the box to the left of each CR ID field.

The lower section contains a list of Change Requests with the fields CR ID, Title, and Status. Clicking on the CR ID takes the User to a new tab in the browser that contains the source of the Change Request. For instance, if the _Application_ has a Change Request Data Source of the type GitHub, clicking on the CR ID field for a Change Request will open a tab with the bug or enhancement request within github.com, allowing the User the ability to update, close, or read about it in detail. The Title field holds the title of the Change Request within the bug tracking system. The various bug tracking systems used by DeployHub have their own statuses. Bugzilla for instance, has statuses such as New, Unconfirmed, Assigned, etc. DeployHub interprets these as either 'open' or 'closed’ and displays them in the Status field with a gold or dark gray background respectively.

### Package Components

This tab contains all the _Components_ that make up an _Application_, linked together in order of deployment if needed. Click on the _Component_ tree structure on the right side to see the available Categories. Within each one, which is accessed by clicking on the plus '+' sign, are the _Components_ that share that particular Category. Click and drag a _Component_ from the list on the far right side and drop it into the Assigned Components area. It will appear in the area as a box containing the name of the _Component_, and automatically link to the last _Component_ in the area. The connecting line can be deleted by right clicking on the connecting line and selecting "Delete this Connection". A new connector can be created by clicking on the anchor (the green dot at the bottom of the _Component_) and dragging and dropping it onto another _Component_. This determines the order that _Components_ will be deployed. Keep in mind that each _Component_ contains _Component Items_ that are also linked together in the order that they are to be executed.

You can define which _Components_ are to be deployed in parallel by linking the parallel _Components_ to a common parent _Component_. After the parent _Component_ is deployed, each linked child _Component_ is deployed in parallel.

NOTE: In the _Assigned Components_ area, an object represents the currently selected _Application_. It is distinguishable from other _Components_ in the area by the arrow icon that appears in the object along with the word "Start", and it is positioned in the top center of the window. This must be connected to the first _Component_ to be deployed, otherwise DeployHub does not know which _Component_ to begin with, and the deployment will fail.

### Versions

The Version view gives you a list of all _Application Versions_  associated to this _Application Base Version_.

## Adding a New Application Base Version

To add a new _Application_, go to the _Application_ menu from the left side of your DeployHub panel. This will take you to a list of all _Applications_.  Use the _+Add_ option at the top of the list to create a new _Application Base Version_

## Adding a New Application Version

You can create an _Application Version_ if the _Application Base Version_ has been assigned the _Create Version_ Task at the _Domain_ Level.  The _Create Version Task_ must be available before this is possible. See the chapter on 'Domains' for instructions on how to create _Tasks_.

To create an _Application Version_, select an _Application Base Version_ or _Application Version_ from the _Applicaiton_ List View. Use the Task tab at the top of the List View to drop down the available Tasks.  Select the _Create Version_ Task. The new _Application Version_ will be based on the _Application Base Version_ or _Application Version_ you selected from the list view.

The new _Application Version_ is created by using the parent name, followed by a semi-colon and an incremented integer, i.e. MyApp;3.

## Deleting Applications

 Once created, the _Application Base Version_ or _Application Version_ can be deleted by selecting it from the List view and using the Delete option at the top of the List.  The _Application Base Version_ cannot be deleted if child _Application Versions_ are available.

## Editing Applications

Double clicking on an item in the List View will take you to the Dashboard for editing.  
