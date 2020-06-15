---
title: "Using Notifiers for Messaging"
linkTitle: "Using Notifiers for Messaging"
weight: 28
description: >
  Using _Notifiers_ for communicating deployment results.
---

## Intro to _Notifiers_

 _Notifiers_ send messages to various recipients and can be used as follows:

- After a successful or failed deployment.
- When a _Request_ Task has ben used against an _Application_.
- When an _Endpoint_ is unavailable.
- Used As part of your continuous _Delivery Pipeline_ to automatically update users.

DeployHub can use SMTP (Simple Mail Transfer Protocol), Slack, and HipChat for this purpose.

## _Notifiers_ and _Notifier Templates_

_Notifiers_ are associated to a Template. The Template is standard message that needs to be sent when the _Notifier_ is called.  Individual notifications are created through the _Notify Template_. A _Notifier_ contains one or more of these. Each contains the subject and body of the actual notification, and if via email, a list of recipients. Recipients can be members of one or more _Groups_ as well as the owners of the _Application_, the owner of the _Environment_, and/or the owners of its _Servers_.

For more information on _Notifier Templates_ see [Using Notifier Templates](/userguide/customizations/2-notifier-templates/).

Using these two objects, _Notifiers_ and _Notifier Templates_, notifications can be sent whenever a deployment to an _Environment_ fails or succeeds, whenever a _Request__ Task_ is executed, or the state of an _End__Point_ changes, using a variety of email or messaging systems, with individually tailored notifications containing all information needed to inform all relevant teams.

## Using the _Notifiers_ List View for Adding or Deleting

You will find _Notifiers_ under the Setup menu.  Selecting _Notifiers_ will take you to a list of all _Notifiers_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Notifiers_ List View.  You can reorder the list view on _Notifiers_ and _Domains_

_Notifiers_ are defined to a _Domain_ and will be displayed based on your access to the _Domain_ to which it belongs.

The _Notifiers_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Notifier_ of a particular type. |
| Delete | Deletes the selected item. |

From the _Notifier_ List View, double click on the _Notifier_ which you would like to view to see all Details.  

## Using the _Notifiers_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Notifier_.

### Common Details of all _Notifiers_

The following details are common to all _Notifiers_ types:

| Field | Description |
| --- | --- |
| **Full Domain Name** | The fully qualified name of the _Domain_ to which the _Notifier_ was defined. |
| **Name** | The Name of the _Notifier_. |
| **Type** | The _Notifier_ Type chosen when you performed the Add. |
| **Owner Type** | User or Group. |
| **Owner** | Name of the Owner. |
| **Summary** | A description of the _Notifier_.|
| **Created** | Auto generated date when the _Notifier_ was added.|
| **Modified**| Auto generated date when the _Notifier_ was updated.|
| **Credential**| The _Credential_ used to access the _Notifier_ if required. |

## SMTP Email Details

| Field | Description |
| --- | --- |
|**HTML**| If 'Yes,' will send email in HTML format.|
|**HTML Override** |If checked will indicate the value can be overriden. This is used for 'scripted' notifications where the action editor includes a 'notify' action. This allows the notify action to override the value, for example, of the username or hostname of the _Notifier_.|
|**SSL**|Uses Secure Sockets Layer for sending email.|
|**SSL Override**| The SSL can be changed.|
|**From**|The email address of the sender. Typically, this is a shared address accessible to users who push deployments. |
|**From  Encrypted**| The From name can be hidden in the DeployHub database. |
|**From  Override**| The From name can be changed. |
|**Logfile**| The location of the log results between DeployHub and the Mail Server.|
|**Logfile Encrypted**| The Logfile can be hidden in the DeployHub database. |
|**Logfile Override**| The Logfile location can be changed. |
|**Mailport**| The port that receives email on the mail server. Typically 26, but it could be different.|
|**Mailport Encrypted**| The Mailport can be hidden in the DeployHub database. |
|**Mailport Override**| The Mailport can be changed. |

## SMS Details

| Field | Description |
| --- | --- |
|**From**|The address of the sender. Typically, this is a shared address accessible to users who push deployments. |
|**From  Encrypted**| The From name can be hidden in the DeployHub database. |
|**From  Override**| The From name can be changed. |

{{% include "/userguide/reusable/Hipchat.md/" %}}

{{% include "/userguide/reusable/Slack.md/" %}}

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Notifier_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Notifier_ in the following ways:

| Access | Description |
| --- | --- |
| _**View**_ | Allows _Users_ to see the _Notifier_. If the _User_ does not belong to a _Group_ in the View Access list, the _Notifier_ will not appear in the List View. |
| _**Change**_ | This allows a _User_ who belongs to any _User Group_ in the list to change the attributes of the _Notifier_. |
| _**Send**_ | Allows _Users_ to send an email.. |

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

{{% include "userguide/reusable/AuditTrail.md" %}}

## Notifier Templates

You can create standard message templates for you _Notifiers_.  For more information see:
[Notifier Templates](/userguide/customizations/2-notifier-templates/).
