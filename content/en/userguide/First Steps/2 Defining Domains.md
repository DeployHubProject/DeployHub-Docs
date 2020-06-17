---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  Create and manage _Domains_ with the _Domain_ Dashboard. 
---

## Domains for a Domain Driven Design

_Domains_ are used to catalog and publish microservices and other reusable objects (web components, DB updates, etc.) supporting a Domain Driven Design for organization. Domains make it easy for you to catalog and share reusable _Components_ across siloed teams.  Domains organize reusable objects based on a 'solution' space. Domains can represent functional areas such as 'security services' or departments, teams, and software projects.

### Top Down Domain Structure

A _Sub-Domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Divisional Domains_,  _Project Domains_ and _Life Cycle Sub-domains_.

There are typically 4 common ways to implement _Domains_:

| **Purpose** | Description |
|---| --- |
| **Site _Domain_** | This is the highest-level and default _Domain_. Everyone has a Site _Domain_. For SaaS Users your Site _Domain_ will be defaulted to the Project name you entered when you registered. You can rename your Site _Domain_ if needed. For an on Premise Installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Sub-domains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Sub-domains_.|
|**Catalog _Sub-domains_**| Organizing reusable _Components_, such as microservices, can be done using a Catalog _Sub-Domain_. At this level, you create as many _Sub-domains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could build your Catalog as follows: <li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>
|**Division Sub-domains**| DeployHub Pro Users can take advantage of Division Domains. Division Domains are used by larger companies to define a catalog that more closely represents how they do business and how they want to share _Components_ based on geographical areas, organizational responsibility, or business units. A Division _Sub-Domain_ can have as many child _Sub-domains_ as needed. For example, a Catalog _Sub-Domain_ for Security and Purchasing Services could be broken down into further _Sub-domains_: <ul><li> Security Services</li><ul><li>Login Services</li><li>Payment Processing Services <li>Merchant Services</li><li>EMEA Shipping Services</li><li>North America Shipping Services</li></ul><br><li>Purchase Processing Services</li><ul><li>EMEA Check-out Services</li><li>North America Check-out Services</li></ul> |
|**Project Sub-domains**| Project _Sub-domains_ are unique because they contain only Life Cycle Sub-domains and are intended for the management of an _Application_.  An _Application_ is a package of _Components_ that are versioned and tracked together.  _Applications_ are managed via a continuous delivery pipeline or "life cycle". If you define your _Sub-Domain_ as "Contains Life Cycles", you are restricting any lower _Sub-domains_ except for Life Cycle _Sub-domains_.|
|**Life Cycle Sub-domains**| This is the lowest level of Sub-Domain and is available when the parent _Domain_ is defined has "Contains Life Cycles". You create Life Cycle _Sub-domains_ to map to each stage in your continuous delivery pipeline. Most often Life Cycle _Sub-domains_ have specific _Environments_ and _Tasks_ assigned for interaction with your continuous delivery orchestration engine.  DeployHub can be called by your continuous delivery Engine (Jenkins X, CircleCI, CloudBuild, GitLab or GitHub Actions,ect.) to perform the continuous configuration management of your microservices and _Applications_ across all _Environment_ states. If you are not using a continuous delivery orchestration engine, you can assign Move, Approve and Request Tasks to your Life Cycle _Sub-Domain_ to define a continuous delivery pipeline process within DeployHub. |

![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)

## Using the Domain Dashboard for Viewing and Editing

The Domain Dashboard provides you a full view of all _Domains_ which you have access to based on your User privileges.  The view is displayed in a "Sun Burst" map, starting at the highest level _Domain_ with the ability to drive down into the _Sub-domains_, and _Sub-domains_ after that.

The detail section of the Dashboard displays the information based on the Sun Burst selection. Each time you move up or down the _Domain_ hierarchy using the Sun Burst map, your detail information will be re-displayed according to where you are in the map.  Following is a description of the _Domain_ details:

### _Domain_ Details

| Details | Description |
| --- | --- |
|Full Domain | The fully qualified _Domain_ Name including any parent _Domains_.
| Name | The Name of the _Domain_. |
| Summary | Domain Description. |
| Owner Type | User or Group. |
| Owner | Name of the Owner.|
| Created | Auto generated date when the _Domain_ was created.|
| Modified | Auto generated date when the _Domain_ was modified.|
| Engine| The hostname of the deployment engine. Defaults to "Deployment Engine." This field can be used to specify another DeployHub Deployment Engine for widely distributed deployments. |
|Contains Lifecycles| This specifies that the _Domain_ will include a Pipeline model.  Lifecycles are normally used as _Sub-domains_ to the Project _Domain_.  Lifecycle _Domains_ cannot have _Sub-domains_. |
| Sub-domains | A list of all _Sub-domains_ assigned to this _Domain_ including all _Life Cycle Domains_.

### Access Control

The Access Section allows _Users_ within designated _Groups_ to update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Domain_ in the following ways:

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Domain_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the tree structure. |
| **Change** | Allows the _User_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows _Users_ to see the _Domain_.|
| **Write** | Allows _Users_ to create _Sub-domains_. |

{{% include "userguide/reusable/Tasks.md" %}}

### Additional Parameters

Additional parameters can be added to a Task.  These additional parameters that are past to the Task are going to set a Global Variable at execution time. To add addtional parameters, select the _Task_ from the _Tasks_ table using the check box. Use the +Add to create a new entry into the Parameters table for the selected task. It will have two columns: 

- Label: This will appear on the _Task_'s execution window whenever the _Task_ is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a _Task_ is executed, where values can be either entered or selected, depending on the Type.

You will need to use the Save to commit the change to the table. You can use the Edit to update a Task, or Delete to remove a Task. 
