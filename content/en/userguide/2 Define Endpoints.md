---
title: "Endpoints"
linkTitle: "Endpoints"
weight: 24
---
## Endpoints

An _Endpoint_ is an object representing a single container, virtual image, or physical server in an enterprise&#39;s data center. A DeployHub _Environment_ is a collection of _Endpoints_ to which your Application will be deployed. DeployHub can deploy your _Application_ to _Environments_ with a mixture of _Endpoints_ such as containers, database servers or images, cloud images, request routers, or application servers or images. There is a many-to-many relationship between _Environments_ and _Endpoints_, so that an _Endpoint_ can be assigned more than one _Environment_, and an _Environment_ can contain many _Endpoints_.

## Creating and Deleting Endpoints

Select the _Data Center_ Menu item, clicking on the _Endpoints_ tab, and right clicking on the _Domain_ in the tree structure to create where the _Endpoint_ is to reside. The &quot;New Endpoint in this Domain&quot; option displays a dialog box. Once created, the _Endpoint_ details can be edited by selecting the _Endpoint&#39;s_ General tab and clicking on the pencil icon on the far right.

Right click on the _Endpoint_ in the tree view for the &#39;Delete this Endpoint&#39; option. Once deleted, this action cannot be undone. Or select the &#39;Copy Endpoint&#39; option from the list and then paste into another _Domain_ by right clicking on it in the tree structure.

## Editing Endpoints

When you select the _Endpoint_ from the tree structure, you can see the details of the _Endpoint_ in the General tab. Clicking the pencil icon in the right corner of the window to edit. In addition, _Endpoints_ have associated Attributes, Components, and Access which can be modified by selecting each of these tabs. In addition, you can view _Endpoint_ History, and Reports, which shows the usage for the _Endpoint_.

## Timeline Tab

This tab displays log file entries for the deployment of _Applications_ to the selected _Endpoint_.  It includes information concerning how many days ago the deployment took place, the deployment number, which _User_ deployed the _Application_, and the _Environment_ it was deployed to. Click on the deployment number within each line of the list in order to view information about each deployment to the _Endpoint_. A window appears with five tabs:

| Tab | Description |
| --- | --- |
| Files | A list of files that were deployed to the _Endpoint_, which includes the _Repository&#39;s_ path of the source file, and the target path where it was placed. |
| Log | This includes step by step details of the deployment, which includes error messages in red font. |
| Activities | A list of any _Actions, Procedures,_ and _Functions_ that were used during the Deployment. Clicking on the link navigates to the _Action/Procedure/Function_. |
| General | A synopsis of the deployment, which includes the name of the _Application_, the date and time of the deployment, and the amount of time the deployment took. |
| Reports | The Reports tab contains two graphs. One displays the time taken for each deployment. Mouse over the dots to see a small translucent box which shows the deployment number and the time taken to deploy in seconds. The second graph is a pie chart which displays the number of successful and failed deployments for each _Application_ onto the selected _End Point_. |

## Adding Comments

&#39;Click to see earlier items&#39; link shows all of the entries where you can add comments in a text entry field just below the deployment information. Users can also click on the Subscribe link in each entry of the list, which allows the _User_ to receive information about the selected deployment. Any comments appear in the History column of the subscriber&#39;s home page.

&quot;Say something about this End Point&quot; can also have comments placed into it, and files can be attached there. Entering text into this field activates the Add Message button. Click on this button to save the comment as a line in the list.

Clicking on the fingerprint button next to the Add Message button brings up a file explorer that allows files to be selected and attached. These can be retrieved by clicking on the fingerprint icon, which opens a list that displays the file name. Click on it to be downloaded into the default Downloads folder of the PC that hosts the browser used to run DeployHub (not on the server hosting DeployHub). A dropdown list appears at the bottom of the browser with the file name. The options shown are standard in every Windows file download interface, including Open, Always Open this Type of File, and Show in folder. Several drop-down lists can appear along the bottom of the browser. A small &#39;x&#39; on the far-right side at the bottom can be clicked to make all the lists disappear.

## Deployed Components Tab

This tab contains a table that displays two different kinds of rows, each of which can be added or deleted by using the group of buttons on the upper right side, which consists of a plus sign and an &#39;x&#39;: The plus sign (+) is used to assign _Component Versions_ that have been deployed to the _Endpoint_ outside of DeployHub. Clicking this button on the right side displays a list of _Component Base Versions_ and _Component Versions_ in a pop-up window titled &quot;Manually Add Component Version(s)&quot; that can be selected and placed into the list, along with the current date and time, indicating that this _Component_ has been deployed to the _Endpoint_ outside of DeployHub. This allows DeployHub&#39;s database to keep track of which versions have been deployed, which will affect how deployments are executed in the future.

Any _Components_ that have been deployed through DeployHub&#39;s deployment process appear in this list along with the deployment number under the Details column. Clicking on the &#39;Deploy #&#39; link in the field brings up the Results window seen in various places throughout DeployHub, which includes the Files, Log, General, and Reports tabs. The &#39;x&#39; button is used to delete a line from the list.

## Trends Tab

The uppermost section of the Trends tab shows the Change History for the _Endpoint&#39;s__Components_. There are horizontal areas across the top and bottom containing a calendar. _Components_ are represented by horizontal areas with a thick blue line. A thin blue vertical line can be clicked on and dragged back and forth across these areas to see what _Components_ were on the _Endpoint_ at the selected date and time.

Using the scrolling device on the _User&#39;s_ mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the _User_ to easily view the entire Change History from beginning to end, in detail, while using the _Calendar_ as a reference.

The bottom section of the Trends tab contains information about deployments to the _Endpoint_. The horizontal numbers across the bottom of the chart indicate the Deployment Number. The vertical numbers on the left side represent the time taken to deploy. Hovering the mouse pointer over any one of the dots on the chart where these intersect shows both values.

The pie chart in the bottom right side shows the number of failed and successful deployments. Hovering the mouse pointer over the chart shows the number of failures (red) and successes (green).

## Status Tab

The Status tab is used to check the status of the physical or virtual server that the _Endpoint_ object represents. Clicking on the &quot;Test Now&quot; button causes DeployHub to connect to the server on the network, and returns the following information:

- Name Resolution: Determines if the server hostname could be resolved to an IP address.
- Ping: Determines if the &quot;ping&quot; to the IP addressed derived from the name resolution step worked.
- Connection: If the &quot;ping&quot; succeeded, whether the connection using the specified attributes to the server was successful.
- Base Directory Check: If the connection succeeded, whether the engine could switch to the server&#39;s &quot;target directory&quot;.
- Ping Time (ms): Time taken for the ping to respond (in milliseconds).
- IPv4 Address: The IP address returned by the &quot;Name Resolution&quot; step.
- Last Checked: The date and time of the last test. If &quot;auto ping&quot; is set to true on the _End Point_ General tab, then this will update automatically to the last automatic connection test.
- Last Error: If any of the above steps failed, this displays the detected error.

## Attributes Tab

Values that are stored against an _Endpoints_ can be used to control deployments. The Name field holds the name of the Value, while the Value field holds the data as either a numeric or text. It can also be an array of Name/Value pairs associated with a Name. Clicking on the plus sign (+) allows the _User_ to enter a new Name and its associated Value. Selecting the Attribute in the table and clicking on the &quot;X&quot; in the upper right-hand corner deletes the line from the table of Name/Value pairs, while selecting the pencil icon displays a window for editing the selected Name and Value.

## Access Tab

You can define _Groups_ which contain _Users_ to View and Change access to _Endpoints_. This access allows you to define who can manage the _Endpoints_. There are three Access options:

| Access | Description |
| --- | --- |
| _**View**_ | This allows any _User_ that belongs to any _Group_ in this list to see the selected _End Point_ in the tree structure on the right side. |
| _**Change**_ | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _End Point_. |
| _**Available**__**Groups**_ | This list contains all the _Groups_ within the DeployHub installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _End Point._ |

## General Tab

The General Tab displays the basic information that defines an _Endpoint._ The _Endpoint_ can be edited by clicking on the pencil icon from the right-hand corner of the window. The basic _Endpoint_ information includes:

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Endpoint_ object. |
| _**Owner**_ | The owner of the _Endpoint_, it defaults to the _User_ who created it. When editing this field, the Owner Type field is available which includes Owner and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Summary**_ | A short text description of the _Endpoint_. |
| _**Created**_ | The date and time the _Endpoint_ was created. |
| _**Modified**_ | The date and time the _Endpoint_ was last modified. |
| _**Endpoint Type**_ | The platform type of the physical or virtual server that the _Endpoints_ resides on, the list currently includes AS400, Mac, Unix, Windows, Tandem, Stratus, and OpenVMS. For Docker, you should select Unix or Windows. |
| _**Hostname**_ | The unique name of a server that is used to identify it on the network. |
| _**Protocol**_ | The protocol used to communicate with the _Endpoint_. Currently this includes win, ftp, sftp, and ftps. |
| _**SSH Port Number**_ | The SSH Port used to connect to the _Endpoint_ if the selected Protocol is sftp. |
| _**Base Directory**_ | The Base Directory for a _Component_ can either be absolute, i.e. &#39;c:\main&#39; for Windows or &#39;/main&#39; for Linux/Unix, etc., in which case it replaces the Base Directory for the _End Point_. If the _Component&#39;s_ Base Directory is relative, i.e. &#39;SomeFiles\SomeMoreFiles&#39;, then it is appended to the _End Point&#39;s_ Base Directory, i.e. &#39;c:\main\SomeFiles\SomeMoreFiles&#39;.If the _Component Item&#39;s_ Target Directory has a value, it is always appended to the end of whatever value has been created from the Base Directories of the _Endpoint_ and _Component_. |
| _**Credential**_ | The Username and Password pair needed to login to the _Endpoint_. |
| _**Auto Ping**_ | A checkbox that indicates if the DeployHub system will ping the _Endpoint_ periodically. If checked, it causes the Ping Interval, Ping Start, and Ping End fields to be available. |
| _**Auto MD5 Check**_ | Each _Endpoint_ has a number stored in the DeployHub database that is derived from an MD5 check of all files deployed to the _Endpoint_. If Auto Ping is checked, this field is made available. If the Auto MD5 Check field is selected, an MD5 check is run every time the _Endpoint_ is pinged, and the resulting value is compared against the number stored in the database to see if there have been any changes made outside of DeployHub. If there is a difference, it will be reported via the _Endpoint_ Owner&#39;s Home Page. |
| _**Ping Interval**_ | Indicates how often the _Endpoint_ will be pinged, using 15 minute increments. Value can between 15 and 240 minutes. |
| _**Ping Start**_ | Indicates what time pinging will start each day, in military time. |
| _**Ping End**_ | Indicates what time pinging will stop each day, in military time. |
| _**Ping Failure Template**_ | The name of the _Email Template_ that is used to notify _Users_ if Auto Ping is set to Yes and the _Endpoint_ cannot be reached over the network. |
| _**MD5 Mismatch Template**_ | The name of the _Email Template_ that is used to notify _Users_ if any of the deployed files change, causing the result of the MD5 calculation to change. |
| _**Endpoint Component Types**_ | Used to match _Components_ to _Endpoints_ using a many-to-one relationship, with each _Endpoint_ having one or more Types and each _Component Version_ having only one Type. When an _Application Version_ is deployed into an _Environment_, each _Component_ in the _Application_ will be deployed against each _Endpoint_ that matches its _Component Type._ |
