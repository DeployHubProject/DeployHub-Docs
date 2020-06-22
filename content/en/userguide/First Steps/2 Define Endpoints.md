---
title: "Define Your Endpoints"
linkTitle: "Define Your Endpoints"
weight: 7
description: >
  Defining Endpoints for Environments.
---
## Endpoints

An _Endpoint_ is an object representing a single container, virtual image, or physical server in an enterprise's data center. A DeployHub _Environment_ is a collection of _Endpoints_ to which your _Application_ will be deployed.

 DeployHub can deploy your _Application_ to _Environments_ with a mixture of _Endpoints_ such as containers in a cluster,  database servers or images, cloud images, request routers, or application servers or images. There is a many-to-many relationship between _Environments_ and _Endpoints_, so that an _Endpoint_ can be assigned more than one _Environment_, and an _Environment_ can contain many _Endpoints_.

## Using the _Endpoint_ List View for Adding and Deleting

The _Endpoint_ menu option is found on the left of the DeployHub main panel. By selecting the _Endpoint_ menu, you will be taken to a list of all _Endpoints_ to which you have access. You can also use the Search bar, represented by a funnel icon, to reorder _Endpoints_ based on Name or _Domain_.

The _Endpoints_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _Endpoint_. |
| **Delete** | Deletes the selected item. |
| **Test Connection**|
| **Reports** | _Endpoint_ Reports |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## Using the _Endpoint_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Endpoint_.  Below are the Details for a _Endpoint_.

### Endpoint Details

| Field | Description |
| --- | --- |
| **Full Domain Name** | The fully qualified name of the _Domain_ to which the _Endpoint_ is defined.|
| **Name** | The name of the _Endpoint_ object. |
| **Owner Type** | Group or User |
| **Owner** | The owner of the _Endpoint_, it defaults to the _User_ or _Group_ who created it. |
| **Summary** | A short text description of the _Endpoint_. |
| **Created** | The date and time the _Endpoint_ was created. |
| **Modified**| The date and time the _Endpoint_ was last modified. |
| **Endpoint Operating System Type** | The platform type of the physical or virtual server that the _Endpoints_ resides on, the list currently includes Unix, Windows, Tandem, Stratus, and OpenVMS. For containers you should select Unix. |
| **Endpoint Types** | Used to route specific types of _Components_ to the matching _EndPoint_.|
| **Hostname**| The unique name of a server that is used to identify it on the network. |
| **Protocol** | The protocol used to communicate with the _Endpoint_. Currently this includes win, ftp, sftp, and ftps. |
| **SSH Port Number** | The SSH Port used to connect to the _Endpoint_ if the selected Protocol is sftp. |
| **Base Directory** | The Base Directory for a _Component_ can either be absolute, i.e. 'c:\main' for Windows or '/main' for Linux/Unix, etc., in which case it replaces the Base Directory for the _End Point_. If the _Component's_ Base Directory is relative, i.e. 'SomeFiles\SomeMoreFiles', then it is appended to the _End Point's_ Base Directory, i.e. 'c:\main\SomeFiles\SomeMoreFiles'.If the _Component Item's_ Target Directory has a value, it is always appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| **Credential** | The Username and Password pair needed to login to the _Endpoint_. |
| **Auto Ping** | A checkbox that indicates if the DeployHub system will ping the _Endpoint_ periodically. If checked, the following fields will be displayed. <ul><li>Auto MD5 Check:Each _Endpoint_ has a number stored in the DeployHub database that is derived from an MD5 check of all files deployed to the _Endpoint_. If Auto Ping is checked, this field is made available. If the Auto MD5 Check field is selected, an MD5 check is run every time the _Endpoint_ is pinged, and the resulting value is compared against the number stored in the database to see if there have been any changes made outside of DeployHub. If there is a difference, it will be reported via the _Endpoint_ Owner's Home Page. </li> <li>Ping Interval: Indicates how often the _Endpoint_ will be pinged, using 15 minute increments. Value can between 15 and 240 minutes</li><li> Ping Start:Indicates what time pinging will start each day, in military time.</li></li>Ping End:Indicates what time pinging will stop each day, in military time.</li><li>Ping Failure Template:The name of the _Email Template_ that is used to notify _Users_ if Auto Ping is set to Yes and the _Endpoint_ cannot be reached over the network. </li><li>MD5 Mismatch Template: The name of the _Email Template_ that is used to notify _Users_ if any of the deployed files change, causing the result of the MD5 calculation to change.</li><li>Endpoint Component Types</ul>|
|**Name Resolution**| Checks to see if the DNS name can be resolved. Returns "OK" on success or "Failed" if not. |
|**Ping**| Checks to see if the _Endpoint_ responds to ping. Returns "OK" on success or "Failed" if not.|
|**Base Directory Check**| Checks to ensure the Base Directory is available on the _EndPoint_|
|**Ping Time**| Time in milliseconds (ms) for the Ping to respond.|
|**IPV4 Address**| The IP address of the Hostname.|
|**Last Checked**| Timestamp of when the last test connection was performed by using the "Test Connection" option from the _Endpoint_ Dashboard.|
|**Test Results**| Success or Failed message for the last "Test Connection" executed, performed by using the "Test Connection" option from the _Endpoint_ Dashboard.|

{{% include "userguide/reusable/AuditTrail.md" %}}

### Deployed Components

This tab contains a table that displays two different kinds of rows, each of which can be added or deleted by using the group of buttons on the upper right side, which consists of a plus sign and an 'x': The plus sign (+) is used to assign _Component Versions_ that have been deployed to the _Endpoint_ outside of DeployHub. Clicking this button on the right side displays a list of _Component Base Versions_ and _Component Versions_ in a pop-up window titled "Manually Add Component Version(s)" that can be selected and placed into the list, along with the current date and time, indicating that this _Component_ has been deployed to the _Endpoint_ outside of DeployHub. This allows DeployHub's database to keep track of which versions have been deployed, which will affect how deployments are executed in the future.

Any _Components_ that have been deployed through DeployHub's deployment process appear in this list along with the deployment number under the Details column. Clicking on the 'Deploy #' link in the field brings up the Results window seen in various places throughout DeployHub, which includes the Files, Log, General, and Reports tabs. The 'x' button is used to delete a line from the list.

{{% include "userguide/reusable/Attributes.md" %}}

### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Endpoint_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Endpoint_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| This allows any _User_ that belongs to any _Group_ in this list to see the selected _EndPoint_ in the List View. |
|**Change**| This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Endpoint_. |
|**Available Groups**|This list contains all the Groups within the DeployHub installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _EndPoint_.

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**
