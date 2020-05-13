---
title: "Navigation"
linkTitle: "Navigation"
weight: 4
---

## Applications

If you are an application developer, this will be where you do most of your work. _Applications_ are a collection of _Components_ that can be deployed as a single software solution. You define an Application by associating the Components it will consume. The first time you define an _Application,_ it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version. Applications_ are assigned and deployed to _Environments.__Applications_ are associated to a _Domain_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

## Components

If you are an API or microservice developer, this will be where you do most of your work. However, application developers may also define _Components_ that are to be used by only a specific _Application_. _Components_ are microservices (containers), Database updates or files_,_ along with Pre and Post _Actions_ that are used to control the deployment at a detailed level. By tracking the low-level deployment metadata for a _Component_, it can be easily shared and released in a consistent way across team.

_Components_ change over time, and so DeployHub contains _Component Base Versions_ and _Component Versions_ like those of _Application Base Versions_ and _Application Versions._ And like _Applications_, _Components_ are associated to a Domain.

- **Component Base Version** : Objects within DeployHub that contain the files and procedures that are deployed to _Endpoints_.

- **Component Version** : A child of the _Component Base Version_ that represents changes.

## Releases

A Release is a collection of _Applications_ that need to be deployed all at the same time, sometimes referred to as a Release Train. Releases are only available in DeployHub Pro.

## Domains

_Domains_ organize an enterprise&#39;s approach to organizing Applications, Environments and Components (like microservices.) _Domains_ can be used to control the sharing of objects between teams and geographical areas. Domains can have Sub-Domains. Sub-Domains inherit the characteristics of their parent which can be overridden.

NOTE: **DeployHub Team** allows you to create a single high-level Domain. **DeployHub Pro** allows you to create multiple High-level Domains for organizing how your company manages silos and business structures.

- **Life Cycles and Pipelines:** DeployHub includes the concept of a _Life Cycle Sub-Domain._ This can be created with associated _Tasks_ such as Approve, Move, and Deploy. _Life Cycle Sub-Domains_ are used to move objects from one _Lifecycle_ to another, i.e. Development, Testing, Production, etc.

- **Tasks:** _Domain_ specific _Tasks_ allow _Users_ to move _Application Versions_ between _Domains_ and deploy them to _Environments_ when necessary. They provide the ability for _Actions_ to be executed, and compartmentalize responsibilities via _Users_ and _Groups_ during development, testing, and release. _Tasks_ can perform the following for _Application Versions_: create a new _Application Version_, remove an _Application Version_, move an _Application Version_ to another _Domain_, deploy an _Application Version_, request another _Task_ to be run or approved by a _User_ with authority, approve a _Task_ to be run by a _User_ without authority, and run an _Action_. Keep in mind that a _Task_ is not a DeployHub object that can be shared between _Domains_, but rather each _Domain_ contains its own _Tasks_.

## Environments

_Environments_ are groups of _Endpoints_ set up to represent different areas where _Applications_ will be deployed, such as Development, Test, or Production_. Environments_ are associated to a particular _Domain._

## Endpoints

_Endpoints_ represent the container, physical server, virtual image or cloud image where the _Components_ will be deployed.

## CD Engines

Connections to external continuous delivery pipeline orchestration tools such as Jenkins, CircleCI, Tekton, and Puppet Rely.

## Build Jobs

Build Jobs are a list of CD Engine &quot;workflows&quot; that you have access to.

## Actions

You create reusable deployment models using _Actions. Actions_ are made up of _Procedures, Functions,_ and other _Actions._ These are placed into an _Action&#39;s_ Workflow and connected in a logical way so that any portion of a deployment can be controlled in detail. _Actions_ can be assigned to _Tasks, Applications_, _and Components_ as _Pre-Actions_ and _Post-Actions_. _Pre_ and _Post-Actions_ are executed before and after a _Task_ is run, before and after an _Application Version_ is deployed, and before and after a _Component Version_ is deployed. Custom _Actions_ replace the normal execution of deployments for _Applications_ and _Components._ This allows for complete control of a deployment at every level.

## Func/Proc

_**Procedures and Functions**_: _Procedures_ and _Functions_ are scripts or programs that can be written in a variety of languages (Python, Ruby etc.) and executed during a deployment. They are used to build Workflows in _Actions_ that are assigned to _Tasks_, _Applications_, and _Components_.

## Repository

When you deploy the _Component Item_, you need to specify where to get the artifacts such as binaries. A _Repository_ allows you to integrate with a version control system, a binary repository, or retrieve files from an external file system.

## Data Sources

An object that supports a connection for retrieving information from external locations, such as databases.

## Credentials

Objects within DeployHub that contain username and password pairs for accessing all of the various objects used to retrieve files from _Repositories_, access _Endpoints_, execute _Actions,_ and deploy files.

## Users

The _Users_ menu item allows you to create _Users_. All DeployHub User access is controlled through Group Membership. Where needed, an Access tab is associated with the different DeployHub objects that will display a list of the _Groups_ that should have access to the object.

## Users and Groups

The _Groups_ menu item allows you to create _Groups_ and assign _Users_. All DeployHub access is controlled through Group Membership.

NOTE: **DeployHub Team** allows you to have two Groups - Administrator and Users. **DeployHub Pro** includes the ability to create multiple Groups.

## Notifiers

Allows the setup of standardized emails that will be sent upon a successful or failed deployment.

## Notifier Template

A list of standard email templates that can be reused.

## Customize Types

DeployHub comes with three standard Component Types: Container, Database and File (binaries, etc.). You can customize DeployHub to use additional types to fit your integration requirements.

## Right Hand Icons

- **Person Icon** : Clicking on the Person Icon in the group of icons on the upper far right displays information about the current User, which can be changed. A new password can also be entered for the User.

- **Question Mark Icon** : Clicking on the Question Mark Icon on the upper far right takes the User to the web page containing all the online documentation for DeployHub.

- **Logout:** Clicking on the logout button on the farthest upper right causes the User to be logged out of DeployHub and immediately returned to the login window in the browser.

- **Home Icon** : Clicking on the Home Icon in the group of icons on the upper far right, or clicking on any Domain in the tree structure at any time, causes three tabs to appear on the right side:

- **To Do List** : This contains all Requests for the current _User_ that are created by _Request Tasks_ as well as pending _Calendar_ entries.
- **Timeline** : All activity within the DeployHub installation for the current User.
- **Global Reports** : These are a series of reports.

  - _Endpoint_ Inventory Report: This list of the assets deployed to each _Endpoint_ in the system, including _Files, Components, Applications, Environments, Dates,_ and _Users._
  - File Audit Trace: Allows for the selection of a file on the local user&#39;s machine, and returns all related deployments as well as Dates, _Applications_, _Components_, and _Endpoints_.
  - Audit of the files deployed to _Endpoints_: This report shows the differences between the files on _Endpoints_ compared to what was deployed.
  - Success/Failed Deployments per _Environment_ Report: The number of successful and failed deployments per _Environment._ It includes the Deployment Number, _Environment_ deployed to, _Application_ and _Components,_ date deployed, and each _Endpoint_ deployed to along with all files.

- **Delivery Pipeline** : This tab only appears when a Domain containing _Life Cycle Sub-Domain_ has been selected. It is used to define your continuous delivery process.
