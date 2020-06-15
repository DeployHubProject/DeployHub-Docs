---
title: "Managing Data Sources"
linkTitle: "Managing Data Sources"
weight: 20
description: >
  Managing Data Sources such as ODBC connections.
---
## Intro to Data Sources

You may need to acquire data from outside of DeployHub such as an ODBC connection to Oracle. The _Data Source_ object communicates with various databases, HTTP servers, FTP servers, etc., and can be used to take advantage of this kind of information sharing.

The most common use for _Data Sources_ is for setting up integration with issue tracking systems such as Jira, Bugzilla and GitHub.  If you are using DeployHub Pro, you can configure _Components_ with  _Change Requests_. To do this, you will need to define a connection to the change request system. This can be done using _Data Sources_. 

## The _Data Sources_ List View for Adding or Deleting

You will find _Data Sources_ under the Setup menu.  Selecting _Data Sources_ will take you to a list of all _DataSources_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Data Sources_ List View.  You can filter the list view on _Data Sources_ and _Domains_.

_Data Sources_ are defined to a _Domain_ and will be displayed based on your access to the _Domain_ to which it belongs. 

The _Data Sources_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Data Sources_ of a particular type. |
| Delete | Deletes the selected item. |

From the _Data Source_ List View, double click on the _Data Source_ which you would like to view to see all Details.  

## Using the _Data Sources_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Data Source_.

### Common Details of all _Data Sources_

The following details are common to all _Data Sources_ types:

| Field | Description |
| --- | --- |
| **Full Domain Name** | The fully qualified name of the _Domain_ to which the _Data Source_ was defined. |
| **Name** | The Name of the _Data Source_. |
| **Type** | The _Data Sources_ Type chosen when you performed the Add. |
| **Owner Type** | User or Group. |
| **Owner** | Name of the Owner. |
| **Summary** | A description of the _Data Source_.|
| **Created** | Auto generated date when the _Data Source_ was added.|
| **Modified**| Auto generated date when the _Data Source_ was updated.|
| **Credential**| The _Credential_ used to access the _Repository_ if required. |


### Git _Data Source_ Details

| Field | Description |
| --- | --- |
|**Poll Interval** | The time frequency of how often DeployHub should look for Git issues in seconds, i.e. 60. |
|**Poll Interval Encrypted** | Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override** |Select the box if the Poll Interval can be changed.|
| **Organization**| The full URL to the Git [Organization](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-organizations). |
| **Organization Encrypted** | Select the box to indicate the Product name should be hidden in the database.|
| **Organization Override** | Select the box if the Product can be changed. |  
|**Repository** | The name of the [Git Repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/about-repositories) underneath the Git Product. |
|**Repository Encrypted** | Select the box to indicate the Git Repository should be hidden in the database.|
|**Repository Override** |Select the box if the Git Repository can be changed.|

### Jira _Data Source_ Details

| Field | Description |
| --- | --- |
|**Filter**| Enter the [Jira Status](https://confluence.atlassian.com/adminjiraserver/defining-status-field-values-938847108.html) you want to use as your filter.  |
|**Filter** Encrypted**| Select the box to indicate the Filter name should be hidden in the database. |
|**Filter** Override**| Select the box to indicate the Filter name can be changed. |
|**Poll Interval** | The time frequency of how often DeployHub should look for Jira issues in seconds, i.e. 60.|
|**Poll Interval Encrypted** | Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override** |Select the box if the Poll Interval can be changed.|
| **Project**| The [Jira Project Name](https://support.atlassian.com/jira-software-cloud/docs/what-is-a-jira-software-project/) within the Jira Server. |
| **Project Encrypted** | Select the box to indicate the Project name should be hidden in the database.|
| **Project Override** | Select the box if the Project can be changed. |  
|**Server** | The fully qualified URL to the Jira Server so DeployHub can get access. |
|**Server Encrypted** | Select the box to indicate the Jira Server should be hidden in the database.|
|**Server Override** |Select the box if the Jira Server can be changed.|

### Bugzilla _Data Source_ Details

| Field | Description |
| --- | --- |
|**Component** | The name of the [Bugzila Component](https://bugzilla.readthedocs.io/en/latest/api/core/v1/bug.html#search-bugs). |
|**Component Encrypted** | Select the box to indicate the Bugzilla Component should be hidden in the database.|
|**Component Override** |Select the box if the Bugzilla Component can be changed.|
|**Poll Interval** | The time frequency of how often DeployHub should look for Bugzilla issues in seconds, i.e. 60.  |
|**Poll Interval Encrypted** | Select the box to indicate the Poll Interval should be hidden in the database.|
|**Poll Interval Override** |Select the box if the Poll Interval can be changed.|
| **Product**| The full URL to the [Bugzilla Product](https://bugzilla.readthedocs.io/en/latest/administering/categorization.html). |
| **Product Encrypted** | Select the box to indicate the Product name should be hidden in the database.|
| **Product Override** | Select the box if the Product can be changed. |  
|**Server** | The fully qualified URL to the Bugzilla Server so DeployHub can get access. |
|**Server Encrypted** | Select the box to indicate the Server should be hidden in the database.|
|**Server Override** |Select the box if the Server can be changed.|
|**Status**| The [Bugzilla Status](https://bugzilla.readthedocs.io/en/latest/using/understanding.html?highlight=what%20is%20a%20status) you want to use as your Filter. |
|**Status Encrypted**| Select the box to indicate the Status should be hidden in the database. |
|**Status Override**| Select the box if the Status can be changed. |

{{% include "/userguide/integrations/LDAP and Active Directory.md/" %}}
