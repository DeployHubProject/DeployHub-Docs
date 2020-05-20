---
title: "Notifiers"
linkTitle: "Notifiers"
weight: 28
description: >
  Notify Users on Success and Fail.
---

## Notfiers

The _Notifier_s tab is under the _Flows_ menu and sends notifications to various recipients after a successful or failed deployment attempt. It also can specify when deployed files have been changed, a _Request__Task_ used, or that an _Endpoint_ is down. A _Notifier_ can be used as part of your continuous _Delivery Pipeline_ to automatically update users and contains all technical information necessary. DeployHub can use SMTP (Simple Mail Transfer Protocol), Slack, and HipChat for this purpose.

Individual notifications are created through another DeployHub object known as a _Notify Template_. A _Notifier_ contains one or more of these. Each contains the subject and body of the actual notification, and if via email, a list of recipients. Recipients can be members of one or more _Groups_ as well as the owners of the _Application_, the owner of the _Environment_, and/or the owners of its _Servers_.

Using these two objects, _Notifiers_ and _Notify __Templates_, notifications can be sent whenever a deployment to an _Environment_ fails or succeeds, whenever a _Request__ Task_ is executed, or the state of an _End__Point_ changes, using a variety of email or messaging systems, with individually tailored notifications containing all information needed to inform all relevant teams.

NOTE: All Users can be assigned email addresses for email type notifications. See the chapter on Users and Groups.

In order to create a _Notifier_, go to the _Flows_ menu. Select the _Notifier_ tab, and right click on any _Domain_. Select &quot;New Notifier in this Domain&quot;. This causes the Notifier Edit dialog to appear. To the right of the tree structure are several tabs which allow the _User_ to modify _Notifier_s. These are listed below, along with the fields contained in each tab, and an explanation for the use and functions of each:

## Editing and Deleting a Notifier

To the right of the tree structure are several tabs which allow the _User_ to modify _Notifier_s. The General tab shows a summary of the _Notifier&#39;s_ configuration. You can edit information in the _Notifier&#39;s_ General tab by clicking on the pencil icon in the upper right-hand corner of the window. You can also delete a _Notifier_ by right clicking on the _Notifier_ in the tree structure and selecting the &#39;Delete&#39; option.

## Properties Tab

| Field | Description |
| --- | --- |
| _**Name**__:_ | Available Options:
_From:_ The email address of the sender, typically a shared address accessible to users who deploy _Releases_ to _Environments._
_HTML:_ Sends emails in HTML format.
_SSL:_ Uses Secure Sockets Layer for sending email.
_Mailserver_: The name of the email server, i.e., smtp.mycompanyserver.com.
_Mailport_: The port that receives email on the mail server. Typically 26, but it could be different.
_Password:_ The password for the mail server.
_Username_: The user name for the mail server.
_Logfile_: Location of the logfile.
If the Type field has been set to &#39;txtlocal&#39;, then only &#39;from&#39;, &#39;password&#39;, and &#39;username&#39; appear in the Name field:
Available options for HipChat:
_webhook_: The url for the group chat, topic chat, or chat room.
_HTML_: Sends messages in HTML format.
_logfile_: Location of the logfile on the server that is running DeployHub.
Available options for Slack:
_webhook_: The url for a Slack Workspace.
_channel_: A particular channel within a Workspace. These can be public, private, or shared.
_logfile_: Location of the logfile on the server that is running DeployHub.
 |
| _**Value**_ | The actual value for the property that was selected from the Name field. |
| _**Encrypted**_ | Checkbox that indicates that the value is to be encrypted in the DeployHub database. |
| _**Override**_ | Checkbox that indicates the property can be changed. This is used for &#39;scripted&#39; notifications where the action editor includes a &#39;notify&#39; action. This allows the notify action to override the value, for example, of the username or hostname of the _Notifier_. |

## Access tab

The Access tab allows you to configure how _Users_ within designated _Groups_ will Access the _Notifier_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list on the far right into the desired Access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Notifier_ in the following ways:

| Access | Description |
| --- | --- |
| _**View**_ | Allows _Users_ to see the _Notifier_. If the _User_ does not belong to a _Group_ in the View Access list, the _Notifier_ will not appear in the tree structure. |
| _**Change**_ | Allows _Users_ to changes the _Notifier_&#39;s characteristics i.e. Name, Summary, etc. |
| _**Send**_ | Allows _Users_ to send an email. |

NOTE: DeployHub Team has only two Groups, Administrators and Users. If you need more granularity in Groups, you will need to upgrade to DeployHub Pro.

## General Tab

The General tab contains fields with basic information for the selected _Notifier_. Information can be changed by clicking on the edit pencil in the upper right-hand corner.

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Notifier._ |
| _**Type**_ | The type of _Notifier_;Options include: smtpemail, slack, hipchat, and txtlocal |
| _**Owner**_ | The owner of the _Notifier_, defaults to the name of the _User_ who created it. The default owner is the _User_ who created the _Notifier_. When editing this field, the Owner Type field is available which includes Owner and Group as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Summary**_ | A short text field to describe the _Notifier_ and its use. |
| _**Created**_ | The date and time the _Notifier_ was created. |
| _**Modified**_ | The date and time the _Notifier_ was last changed. |
| _**Credential**_ | The name of the _Credential_ with username/password for accessing the _Notifier.__Credentials_ are created under the End Points menu. These contain the User Names and Passwords for accessing a _Notifier_. |

## Editing and Deleting Notify Templates

Clicking on a _Notifier_ in the tree structure allows the _User_ to select &quot;New Notify Template for this Notifier&quot; in order to create _Templates_ for the selected _Notifier_. This causes the _Template_ dialog to appear. To the right of the tree structure are several tabs which allow the _User_ to modify _Templates_. These are listed below, along with the fields contained in each tab, and an explanation for the use and functions of each:

## General Tab - Notifier

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Template._ |
| _**Summary**_ | A short text field to describe the _Template_ and its use. |
| _**Created**_ | The date and time the _Template_ was created. |
| _**Modified**_ | The date and time the _Template_ was last changed. |

## Recipients Tab

This tab contains the list of _Users_ that will receive the email created from this _Template_ if it is an email type _Template_. Clicking on the plus (+) sign in the upper right will cause a pop-up window to appear which contains a list of values to choose from. The list will change according to which value is chosen from the Type drop down list:

| List | Description |
| --- | --- |
| _**Calculated**_ | One of three choices:${environment.owner}: the _Environment_ that was deployed to.${server.owner}: the _Server_ that was deployed to.${version.owner}: the _Version_ that was deployed. |
| _**Users**_ | All of the individual _Users_ in the DeployHub installation. |
| _**Groups**_ | All of the _Groups_ in the DeployHub installation. |

Click on a _User_ or _Group_ from these three lists and click the OK button to place the selected value into the Recipients list. All _Users_ and _Groups_ assigned to the Recipients list will receive the email.

## Body Tab

This contains two fields, Subjectand Body, which will be used as the subject and body of the notification that is sent.

## General Tab - Template

This tab contains the fields for the name of the _Template_ and a Summary for the entry of a short description. Created and Modified fields are also included on this tab.
