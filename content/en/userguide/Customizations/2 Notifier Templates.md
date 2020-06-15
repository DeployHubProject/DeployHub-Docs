---
title: "Using Notifier Templates"
linkTitle: "Using Notifier Templates"
weight: 29
description: >
  Write and reuse standard message templates for your _Notifiers_.
---


## Intro to _Notifier Templates_

_Notifier Templates_ are used to create standard messages that are automatically sent by _Notifiers_.  Each _Notifier_ is assigned to one or more _Notifier Template_. For example, one for a successful deployment and one for a failed deployment.

Note: To create a _Notifier Template_ you will need to first create the _Notifier_.

Each _Notifier Template_ contains the subject and body of the actual notification, and if via email, a list of recipients. Recipients can be members of one or more _Groups_ as well as the owners of the _Application_, the owner of the _Environment_, and/or the owners of its _Endpoints_.

For more information on _Notifiers_ see [Using Notifiers for Messaging](/userguide/customizations/2-define-notifiers/).

Using these two objects, _Notifiers_ and _Notifier Templates_, notifications can be sent whenever a deployment to an _Environment_ fails or succeeds, whenever a _Request__ Task_ is executed, or the state of an _EndPoint_ changes, using a variety of email or messaging systems, with individually tailored notifications containing all information needed to inform all relevant teams.

## Using the _Notifiers_ List View for Adding or Deleting

You will find _Notifier Templates_ under the Setup menu.  Selecting _Notifier Templates_ will take you to a list of all _Notifier Templates_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Notifier Templates_ List View.  You can reorder the list view on _Notifier Templates_ and _Domains_

_Notifiers Templates_ are defined to a _Domain_ and will be displayed based on your access to the _Domain_ to which it belongs.

The _Notifier Templates_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Notifier Template_. |
| Delete | Deletes the selected item. |

From the _Notifier Template_ List View, double click on the _Notifier Template_ which you would like to view to see all Details.  

## Using the _Notifiers_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Notifier_.

### Notifier Details

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Template._ |
| _**Summary**_ | A short text field to describe the _Template_ and its use. |
| _**Created**_ | The date and time the _Template_ was created. |
| _**Modified**_ | The date and time the _Template_ was last changed. |

## Recipients Section

This section contains the list of email _Users_ that will receive the notification. Clicking on the +Add sign a pop-up window to appear which contains a list of values to choose from. The list will change according to which value is chosen from the Type drop down list:

| List | Description |
| --- | --- |
| _**Calculated**_ | One of three choices:${environment.owner}: the _Environment_ that was deployed to.${server.owner}: the _Server_ that was deployed to.${version.owner}: the _Version_ that was deployed. |
| _**Users**_ | All of the individual _Users_ in the DeployHub installation. |
| _**Groups**_ | All of the _Groups_ in the DeployHub installation. |

Click on a _User_ or _Group_ from these three lists and click the OK button to place the selected value into the Recipients list. All _Users_ and _Groups_ assigned to the Recipients list will receive the email.

## Body Tab

This contains two fields, Subjectand Body, which will be used as the subject and body of the notification that is sent.

## Template Options

Variables that can be used in your _Notifier Template_ with a description.

|Variable Name|  Description Operation |
|---|---|
|${application.name}|The name of the current application Any DeployHub task operating on an Application (such as Deploy, Move, Approve etc)|
|${environment.name}|The name of the target environment Any DeployHub task operating on an Environment (such as Deploy etc)|
|${user.name}|The name of the invoking user Any DeployHub task.|
|$DEPLOY_ID|The Deployment ID Number. Set during a Deploy task.|
|$SERVER_NAME|End Point Name. The name of the end point during an automatic periodic scan (AutoPing or AutoMD5). Use this variable in a Ping or MD5 template.|
|$SERVER_HOSTNAME| End Point hostname. The hostname of the end point during an automatic periodic scan (AutoPing or AutoMD5). Use this variable in a Ping or MD5 template.|
|$SERVER_STATUS| OK or FAILED. The status of the server during an automatic periodic scan (AutoPing). Use this variable in a Ping template. Note this variable is always OK in an MD5 template since MD5 scans are only performed if the ping check succeeds.|
|$NAME_RESOLUTION | OK or FAILED. Set during an automatic periodic scan (AutoPing). Reflects the success or failure of resolution of hostname. Use this variable in a Ping template.|
|$PING|OK or FAILED. Set during an automatic periodic scan (AutoPing). Reflects the success or failure of the ping to the server. Use this variable in a Ping template.|
|$CONNECTION| OK or FAILED. Set during an automatic periodic scan (AutoPing). Reflects the success or failure of the connection attempt to the server using the associated credentials. Use this variable in a Ping template.|
|$BASEDIR|OK or FAILED. Set during an automatic periodic scan (AutoPing). Reflects the success or failure of the attempt to switch to the server's base directory. Use this variable in a Ping template.
|$MD5_FILELIST|A list of files (one per line). Set during an automatic periodic scan (AutoMD5). Lists all the files whose MD5 checksum differs from that calculated during the last deployment to the server. Use this variable in a MD5 template.|
|$SRCDOMAIN|The name of the Source Domain. Set during a Move or Approve task. The name of the Domain the application is being moved from (for a move) or its current domain (for an approve).|
|$TGTDOMAIN|The name of the Target Domain. Set during a Move or Approve task. The name of the Domain the application is being moved to or approved for.|
|$NOTES|Free Text.Set during a Move, Approve or Request task. The notes that were entered (if any) by the user when the task was run.|
|$TASKNAME|The name of the Requested Task.Set during a Request task. The name of the task being requested to be run.|
|$ERROR_TEXT| Last End Point Error. Set during an automatic periodic scan (AutoPing). The last error detected during the connection attempt.|
