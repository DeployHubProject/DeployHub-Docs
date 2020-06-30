---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  How to Create and Manage _Domains_  
---

## A Domain Driven Design

A DeployHub _Domain_ is how DeployHub organizes and shares data across teams.  You publish your microservices to a Catalog _Domain_, you package your _Application_ in a Project _Domain_ and you track your continuous delivery pipeline with a Lifecycle _Domain_. All DeployHub objects are assigned to a _Domain_.

### Domains and your Domain Driven Design
A Domain Driven Design is critical for organizations moving from monolithic development to microservice development. In microservices, you must have a structured method for organizing microservices into "solution" spaces to facilitate reuse across siloed teams. DeployHub _Domains_ provides this organization. 

_Domains_ catalog and publish microservices and other reusable objects (web components, DB updates, etc.) making it easier to share these microservices and  _Components_ across siloed teams. Domains can be structured to closely resemble the patterns of your organization. They can represent functional areas such as 'security services' or departments, teams, geographical locations and software projects.

### Top Down Structure

Everyone has a single high-level "Global" _Domain_.  All other _Domains_ are _Subdomains_. For SaaS _Users_, your sign-up form asked you for a "Project."  The value you entered for your "Project" will be your highest level _Domain_.  If you are using a locally installed version (on-prem), your highest level _Domain_ will be "Global."

A _Sub-domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Subdomains_.

There are four common ways to implement _Domains_:

| **Purpose** | Description |
|---| --- |
| **Site _Domain_** | This is the highest-level and default _Domain_. For SaaS Users, your Site _Domain_ will be defaulted to the Project name from registration. You can rename your Site _Domain_ if needed. For an On-Premise installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Subdomains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Subdomains_.|
|**Catalog _Subdomains_**| Used to organize reusable _Components_, such as microservices. At this level, you create as many _Subdomains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could build your Catalog as follows: <li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>
|**Division _Subdomains_**| DeployHub Pro Users can take advantage of Division Domains. Larger companies can define a catalog to share _Components_ based on geographical areas, organizational responsibility, or business units. A Division _Sub-Domain_ can have many child _Subdomains_. For example, a Catalog _Sub-Domain_ for Security and Purchasing Services could be broken down into further _Subdomains_: <ul><li> Security Services</li><ul><li>Login Services</li><li>Payment Processing Services <li>Merchant Services</li><li>EMEA Shipping Services</li><li>North America Shipping Services</li></ul><br><li>Purchase Processing Services</li><ul><li>EMEA Check-out Services</li><li>North America Check-out Services</li></ul> |
|**Project _Subdomains_**| Use a _Subdomain_ to represent your software _Application_ and it's Lifecycle. A _Subdomain_ defined for an _Application_ may need a continuous delivery life cycle. This is defined by selecting "All _Subdomains_ are lifecycles." This means that any _SubDomains_ cannot include any additional _Subdomains_ and will be used to represent stages of the _Pipeline_ with specific _Environments_ assigned. |
|**Life Cycle _Subdomains_**| This lowest level of Sub-Domain is available when the parent _Domain_  has "All _Subdomains_ are lifecycles".  They map to each stage in your continuous delivery pipeline. They often have specific _Environments_ and _Tasks_ assigned for interaction with your continuous delivery orchestration engine. DeployHub can be called by your continuous delivery Engine (Jenkins X, CircleCI, CloudBuild, GitLab or GitHub Actions,ect.) to perform the continuous configuration management of your microservices and _Applications_ across all _Environment_ states. In addition, you can assign Move, Approve and Request Tasks to your Life Cycle _Sub-Domain_ to define a continuous delivery pipeline process within DeployHub. |

![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)

## Using the Domain Dashboard

Access of a full view of all _Domains_ on the dashboard is based upon your User privileges. The view is displayed in a "Sun Burst" map, starting at the highest level _Domain_ with the ability to drive down into the _Subdomains_, and _Subdomains_ after that.

When scrolling up or down the _Domain_ hierarchy using the Sun Burst map, the detail information is re-displayed according to where you are in the map.

### _Domain_ Details

| Details | Description |
| --- | --- |
|**Full Domain** | The fully qualified _Domain_ Name including any parent _Domains_.
| **Name** | The Name of the _Domain_. |
| **Summary** | Domain Description. |
| **Owner Type** | User or Group. |
| **Owner** | Name of the Owner.|
| **Created** | Auto-generated date when it was created.|
| **Modified** | Auto-generated date when it was modified.|
| **Engine**| The hostname of the deployment engine. Defaults to "Deployment Engine." This field can be used to specify another DeployHub Deployment Engine for widely distributed deployments. |
|**All _Subdomains_ are Lifecycles**| This specifies that the _Domain_ will include a Pipeline model and all following _Subdomains_ are used for the Pipeline.  Lifecycles are normally used as _Subdomains_ to the Project _Domain_.  Lifecycle _Domains_ cannot have any further _Subdomains_. |
| **_Subdomains_** | A list of all _Subdomains_ assigned to this _Domain_ including all _Life Cycle Domains_.

### Access Control

 _Users_ within designated _Groups_ can update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available _Groups_ list onto desired access list. All _Users_ who belong to a _Group_ in one of the Access lists will be granted access to the _Domain_.

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Domain_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear. |
| **Change** | Allows the _User_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows _Users_ to see the _Domain_.|
| **Write** | Allows _Users_ to create _Subdomains_. |

{{% include "userguide/reusable/Tasks.md" %}}

