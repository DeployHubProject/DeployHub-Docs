---
title: "Build Engines"
linkTitle: "Build Engines"
weight: 34
description: >
  Integrating with Build Engines like Jenkins.
---
## Build Engines

A DeployHub Build Engine maps to your continuous integration engines such as Jenkins.

_Build Engines_ can be created by selecting the _Data Center_ Menu item, clicking on the _Build Engine_ tab, and right clicking on the _Domain_ in the tree structure.

## Jenkins Build Engine

A Jenkins Build Job communicates with DeployHub, passing log and results. Any time a DeployHub deployment is performed from Jenkins, the _Application Version_ and _Environment_ are required, by name, i.e. Application;1, Environment. If the names are not unique, the domain name must be included, i.e. DomainName.Application;1.

## Build Jobs and Components

A Jenkins Build Job Run creates a Build Job Number stored in a DeployHub _Component_. A field named 'Last Build Number' is updated every time a Build Job is executed. The DeployHub Jenkins plug-in has a "notify only" mode for when a build has been done. Clicking on "Endpoints and Builds" will show all of the builds that have been done for that _Component_. Clicking on a Build Number will open a pop-up with the build log that has been pulled from Jenkins.

## Build Job Run

An execution of Jenkins is called a Build Job Run, and DeployHub can be called at any step during the execution. It can build files, call DeployHub to perform a deployment, build more files, call DeployHub again, etc. This can be done in any order, in separate runs, or all together.

Jenkins build logs can be viewed directly from inside the DeployHub URL, minimizing the amount of browser activity required. For example, a user can see a build artifact on a target _Endpoint_ and open the details of the generating build directly from the _Endpoint_ details page.

If the 'Always Deploy' flag is set to Yes on a Component, it makes no difference if the version of the Component is different or the same as the one on the _Endpoint_; the _Component_ is deployed to the _Endpoint_. If the 'Always Deploy' flag is set to No, the version on the _Endpoint_ and the version of the _Component_ must be different for the _Component_ to be deployed. However, even if the version on the _Endpoint_ and the version of the _Component_ are the same, if the Last Build Number in the _Component_ is different than the last build number in Jenkins, the _Component_ will be deployed.

## Creating and Deleting Build Engines

A _Build Engine_ is created by selecting the Data Center Menu item, clicking on the Build Engines tab, and right clicking on the _Domain_ in the tree structure. This action brings the "New Build Engine in this Domain" option. By selecting this option, the New Build Engine dialog box will automatically be displayed. Once created, the _Build Engine_ details can be edited by selecting the General tab and clicking on the pencil icon on the far right.

To delete a _Build Engine_, right click on the _Build Engine_ in the tree view to see the 'Delete this Build Engine' option. Once deleted, this action cannot be undone. A _Build Engine_ can be copied by right clicking on the _Build Engine_, selecting the 'Copy End Point', and then paste it into another _Domain_ with a right click.

A DeployHub _Build Engine_ has a single property, which is the URL of the physical or virtual server where a continuous integration server resides. A _Build Engine_ can also have a _Credential_, which contains the username and password to the physical or virtual server.

## Editing a Build Engine

When you select the _Endpoint_ from the tree structure, the details of the _Endpoint_ are in the General tab. Edit the _Endpoint_ details by clicking the pencil icon in the right corner of the window. In addition, _Endpoints_ have associated Attributes, Components, and Access, which can be modified by selecting each of these tabs. In addition, you can view Endpoint History and usage Reports.

### Properties Tab

| Field | Description |
| --- | --- |
| Name | End Point URL: The URL where the Build Engine is located. |
| Value | End Point URL: Enter the I.P. (and directory if necessary) to where the Build Engine is located. |
| Encrypted | Checkbox that indicates that the value is to be encrypted in the DeployHub database. |
| Overridable | Checkbox that indicates the _Property_ can be changed at runtime by specifying a replacement value in the _Component Item_. |

### Access Tab

| Access | Description |
| --- | --- |
| View | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Build Engine_ in the tree structure on the right side. |
| Change | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Build Engine_. |
| Available Groups | This list contains all the _Groups_ within the DeployHub installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _Build Engine._ |

### General Tab - Build Engine

### The General Tab displays the basic information that defines a Build Engine. The Build Engine can be edited by clicking on the pencil icon from the right-hand corner of the window. The basic Build Engine information includes

| Field | Description |
| --- | --- |
| Name | The name of the _Build Engine_ object. |
| Type | The type of Build Engine, i.e. Jenkins. |
| Owner | The owner of the _Build Engine_, it defaults to the _User_ who created it. When editing this field, the Owner Type field is available which includes Owner and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| Summary | A short text description of the _Build Engine_. |
| Created | The date and time the _Build Engine_ was created. |
| Modified | The date and time the _Build Engine_ was last modified. |
| Credential | The Username and Password pair needed to login to the _Build Engine_. |

## Build Jobs

Build jobs are used to build different kinds of executable files for placement within _Components_ for eventual deployments.

Using Jenkins as an example, Jenkins performs a software build which includes compiling source code. Jenkins then calls DeployHub and places its Build Number into DeployHub to be referenced during a subsequent deployment. (This appears in the target _Component's_ General tab within the Last Build Number field). Jenkins then puts the files into the _Repository_ that is referenced by the _Component Item(s)_ within the _Component_. As a separate operation, Jenkins calls DeployHub to perform the deployment by referencing the _Application_ that contains the _Component_. For **DeployHub Pro** users, Jenkins can also call a _Release_ that contains multiple _Applications_.

## Builds Tab

The General Tab displays the basic information that defines a _Build Engine._ The _Build Engine_ can be edited by clicking on the pencil icon from the right-hand corner of the window.

The basic _Build Engine_ information includes:

| Field | Description |
| --- | --- |
| Build Number | The Build Number supplied by Jenkins. Clicking on this brings up a window with 3 fields: Build Log: The output from the Jenkins build.Deployed Servers: This includes a list of deployed _Components_, the _Endpoints_ that they were deployed to, the DeployHub deployment ID, and the date and time of the deployment. _General:_ This includes the Jenkins Build Number, the date and time of the deployment, the duration of the build in seconds, the name of the Build Engine, and the name of the Build Job. |
| Date/Time | The Date and time the build was completed. |
| Components | A list of _Components_ that were affected by the build. |

### General Tab - Build Job

The General Tab displays the basic information about the _Build Job._ The _Build Job_ can be edited by clicking on the pencil icon from the right-hand corner of the window. The basic _Build Job_ information includes:

| Field | Description |
| --- | --- |
| _**Name**_ | The name of the _Build Job_. |
| _**Summary**_ | A brief description of the _Build Job_ and its use. |
| _**Project Name**_ | The Jenkins Project Name. |
| _**Created**_ | The date and time the _Build Job_ was created. |
| _**Modified**_ | The date and time the _Build Job_ was last modified. |
