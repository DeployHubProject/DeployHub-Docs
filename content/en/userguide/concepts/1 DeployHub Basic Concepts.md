---
title: "Basic Concepts"
linkTitle: "Basic Concepts"
weight: 1
description: >
  Understanding DeployHub Core Objects.
---

## DeployHub Objects

The core _Objects_ that define DeployHub are _Domains_, _Applications_, _Components_ , _Environments_ and _Endpoints_. These key Objects are used to catalog, track, and version independently deployable objects like microservices, map their relationships, and release them to clusters, cloud, or physical datacenters. _Domains_ are hierarchical and pass inheritance from parent to siblings.  For this reason, _Components_ can be shared across the _Sub-Domains_.  The hierarchical structure of _Domains_ provide a high-level of control and management over how microservices are shared and reused. 


![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)


 The other _Objects_ include:

- Change Request
- Credentials
- Date
- DropZone
- DropZone File
- User
- UserGroup (DeployHub Pro Object)

These Objects support how DeployHub does it works and can be referenced using DeployHub APIs or custom DMSCripts. 



Following is a description of each Object and their attributes.

# Domain Object
The _Domain_ object represents the highest order of organization for managing _Applications_, _Components_ and _Environments_. _Domains_ are hierarchical and can have _Sub-Domains_.  Your microservices are cataloged based on _Domains_ and _Sub_Domains_ which you define. 

_Domains_ are used to catalog microservices that solve the same 'problem sets.' In a similar way, _Applications_ are assigned to their own _Domain_. _Environments_ and _Endpoints_ are associated to _Domains_ that are managing _Applications_. _Sub-Domains_ inherit the attributes of their parent _Domain_. 

The highest level _Domain_ is your _Global Domain_. If you are using the SaaS version, your _Global Domain_ name is defined based on your Company.  If you are using the on-premise installation, you will see a Domain called _Global_. The following properties can be accessed on the _Domain_ object:

| **Property** |  **Description** |
| --- | --- | --- |
| id |  Domain id, as used in the database. |
| name | Domain name. |
| fqdomain | Fully qualified domain name. |
| summary | Summary text. |
| domain | Domain in which the Domain is contained |
| subdomains | List of _Domain_ objects which are contained within this Domain. |
| lifecycle | A _Domain_ that includes a pipeline and the lowest level _Sub_Domain_ Lifecycle _Domains_ cannot have _Sub_Domains_. |
| _Applications_ | The _Application_ objects which are contained within this _Domain_. |
| _Environments_ | The _Environment_ objects which are contained within this _Domain_. |
| creator | The User Object representing the user who created this _Domain_. |
| modifier | The User Object representing the user who last modified this _Domain_. |
| ctime | Date Object representing the date/time the _Domain_ was created. |
| mtime | Date Object representing the date/time the _Domain_ was last modified. |
| owner | User or UserGroup that owns the _Domain_. |

# Application Object

The _Application_ object represents either a Base _Application_, an _Application Version,_ or a _Release_ (Pro Feature). 

An Application has the following properties:

| **Property** | **Description** |
| --- | --- |
| id | A unique identifier for the _Application_ as used in the database. |
| name | _Application_ name |
| fqdomain |Fully qualified _Domain_ name |
| summary | Summary of the _Domain_ |
| owner | User or UserGroup that owns the _Application._ |
| parent | The Base _Application_ |
| predecessor |Predecessor _Application Version_ (the version on which this version is based) |
| _Release_ | Defines the _Application_Object_ with more than one _Application_  |
| _Applications_ | Multiple _Application_s used to create a _Release_|
| _Components_ | The objects that the _Application_ consumes |
| approvals | Used  as part of a pipeline process allowing a control point for progressing a change across the pipeline |
| requests | The _Change Request_ objects associated with this _Application_ (Pro feature)|
| creator | The User who created this _Application_. |
| modifier | The user who last modified this _Application_. |
| ctime | The date/time the _Application_ was created. |
| mtime |  The date/time the _Application_ was last modified. |
| attributes |  An Array of Strings, keyed by Attribute Name |


# Component Object 

The _Component_ object represents either a _Base Component_ or a _Component_ Version. 

A _Component_ object has the following properties:

| **Property** |  **Description** |
| --- | --- | --- |
| id | A unique identifier for the _Component_ as used in the database. |
| name | The name of the _Component_  |
| fqdomain | Fully qualified _Domain_ name |
| summary |  Description of the _Component_ |
| domain | _Domain_ in which the _Component_ is contained |
| owner | User or UserGroup that owns the _Component_ |
| parent | The Base _Component_ |
| predecessor | Predecessor _Component_ Version (the version on which this version is based) |
| items | The items that make up this _Component_ |
| servers | These are the _Endpoints to which this _Component_ has been deployed |
| requests | The change requests associated with this _Component_ |
| lastbuild | The last build number for this _Component_, 0 if never built. |
| creator | The user who created this _Component_. |
| modifier | The user who last modified this _Component_. |
| ctime | The date/time the _Component_ was created. |
| mtime | The date/time the _Component_ was last modified. |
| attributes | Array of Strings, keyed by Attribute Name |

# Environment Object

The _Environment Object_ represents a collection of _Endpoints_ that an _Application_ is deployed to. Mutlple _Environments_ are used to represent Development, Testing and Production for a single _Application_.  Your _Application_ can have as many _Envrionments_ as needed to support your Lifecycle Pipeline. 

The following properties can be accessed for an _Environment_ object:

| **Property** | **Description** |
| --- | --- |
| id |  Unique identifier for the _Environment_ as used in the database. |
| name | _Environment_ name. |
| fqdomain | Fully qualified domain name. |
| summary |  Description |
| domain |  Domain in which the _Environment_ is contained. |
| owner  | User or UserGroup that owns the _Environment_ |
| basedir |  Base directory for deployments |
| _Endpoints_ |  The _Endpoints_ assigned to the _Environment_ |
| _Applications_ | The _Applications_ associated to the _Environment_ |
| creator |  The user who created this _Environment_ |
| modifier | The user who last modified this _Environment_ |
| ctime | The date/time the _Environment_ was created |
| mtime |  The date/time the _Environment_ was last modified |
| parent | Parent _Domain_ |

# Endpoint Object

The _Endpoint_ (_server, container, VM/Cloud Image_) object represents where a deployment will be sent. _Endpoints_ are assigned to an _Environment_.

The _Endpoint_ object has the following properties:

| **Property** | **Description** |
| --- | --- | 
| id | A unique identifier for the _Endpoint_ as used in the database. |
| name | The Endpoint name |
| fqdomain | Fully qualified _Domain_ name |
| summary | Description of the _Endpoint_ |
| domain | Domain in which the _Endpoint_ is contained. |
| owner | User or UserGroup that owns the _Endpoint_ |
| hostname | Hostname (if set) or name otherwise. |
| basedir | Base Directory for Deployments. |
| type | _Endpoint_ Type, ie: cluster, windows, cloud, etc. |
| credential | The logon and password used to access this _Endpoint_|
| _Components_ | The _Components_ currently installed on this _Endpoint_ |
| creator |  The user who created this _Endpoint_ |
| modifier | The user who last modified this _Endpoint_ |
| ctime | The date/time the _Endpoint_ was created |
| mtime | The date/time the _Endpoint_ was last modified |
| attributes | Array of Strings, keyed by Attribute Name |




# Change Request Object

The _Change Request_ object represents a change request record associated with either a _Component_ or an _Application_. 

The _Change Request_ object has the following properties:

| Property | Description|
| --- | --- |
| id | The change request id |
| name | The change request description |
| status  | The change request status |
| api\_url | A URL which - if passed to restful\_get - will return an array containing the full details of the change request from the external change tracking system. Useful for getting more information than the id / description / status combination which is stored in DeployHub. |
| html\_url | A URL which will direct a browser to the page describing the change request in the external change tracking system. |

# Credentials
The _Credential Object_ contains the logon and password needed to access _EndPoints_ and external Repositories like Git or Quay.

The _Credential Object_ has the following properties:

| Property | Description |
| --- | --- |
| id | A unique identifier for the _Credential_ as used in the database |
| name | The name of the  _Credential_ |
| fqdomain |  Fully qualified _Domain_ name that the _Credential_ is associated |
| summary |  Description |
| domain |  Domain in which the _Credential_ is associated |
| owner |  User or UserGroup that owns the _Credential_ |
| username | Decrypted username |
| password | Decrypted password |
| b64auth |  A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. |
| creator | The user who created this _Credential_ |
| modifier | The user who last modified this _Credential_ |
| ctime | The date/time the _Credential_ was created |
| mtime | The date/time the _Credential_ was last modified |
| kind  | _Credential_ use. |


# Date Object
Dates are used to track the date/time of the creation, deletion or update of an Object. 

The _Date Object_ has the following properties:

| Property | Description |
| --- | --- | 
| to\_int(secs) | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If specified, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) |  Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below. |


# Dropzone and DropZone File Object
## DropZone

The _DropZone Object_ represents a local area on the DeployHub engine where deployment artifacts are  manipulated before onward transmission to the target _Endpoint_(s). A _DropZone Object_ is also present on the stack during pre and post action processing for a _Component_. In this case, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_ Items.

A _DropZone Object_ has the following properties:

| Property | Description |
| --- | --- |
| name | _DropZone_ name. |
| path | The full path of where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files | An Array of _DropZone Objects_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file. |

## DropZone File
The _DropZone File Object_ represents a file in the _DropZone_. 

The _DropZone File Object_ has the following properties:

| Property | Description |
| --- | --- | 
| dzpath | The relative path of the file in the _DropZone_. |
| repopath | The relative path of the file as located in the Repository (this path is relative to the base directory of the repository). |
| size | The size of the file in bytes. |
| ctime | The creation time of the file. |
| mtime | The modified time of the file. |


# User Object
The _User object_ represents a user in _DMScript_. _User objects_ can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a _getuser_ call.

The following properties can be accessed on the User object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | User id, as used in the database. |
| name | String | User Name. |
| kind | String | Returns "user". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified domain name. |
| realname | String | The User&#39;s full name. |
| email | String | The User&#39;s email address. |
| phone | String | The User&#39;s telephone number. |
| groups | Array | Array of UserGroup Objects – the User Groups to which this user belongs. |
| lastlogin | Date | The date/time the user last logged into DeployHub. |
| creator | User | User Object representing the user who created this user. |
| modifier | User | User Object representing the user who last modified this user. |
| ctime | Date | Date Object representing the date/time the user was created. |
| mtime | Date | Date Object representing the date/time the user was last modified. |
| owner | Object | User or UserGroup that owns the User |



# UserGroup Object
The _UserGroup object_ represents a collection of _Users_ with the same _Domain_ and security access. (Pro feature)

The _UserGroup Object_ has the following properties:

| Property | Description |
| --- | --- |
| id |  A unique identfier for the _UserGroup_, as used in the database. |
| name  | _UserGroup_ Name. |
| kind  | Identifies if this _UserGroup_ is a _User_ or a _UserGroup_ |
| fqdomain | Fully qualified domain name. |
| email  | The User Group&#39;s email address. |
| creator | User Object representing the user who created this user group. |
| modifier | User Object representing the user who last modified this user group. |
| ctime |  Date Object representing the date/time the user group was created. |
| mtime |  Date Object representing the date/time the user group was last modified. |
| owner | User or UserGroup that owns the User Group. |



## Application and Component Overview

Unique to DeployHub is its ability to version and map the individual parts of a software _Application._ An _Application_ is a complete software solution that is comprised of individual _Components._ For example, if you are a bank, you might have a Teller _Application_ made up of hundreds of microservices. In DeployHub terms, the Teller _Application_ is one software 'Application' regardless of the number of _Components_ it consumes. _Applications_ and _Components_ are assigned to a _Domain_.

## Domain Overview

DeployHub is unique in the way in incorporates the use of a _Domain_ Catalog to support a microservice domain driven design. Domains are used to organize and share microservices across teams reducing redundant coding and encouraging reuse.

DeployHub organizes your shared or private microservices and reusable components via Domains. Domains support the creation of catalogs where developers can go to find and share reusable objects of any type (microservices, scripts, web components, SQL.) Domains are defined to meet your unique requirements as no two organizations are alike in terms of structure. Domains are organized based on 'problem spaces,' geographical divisions, and security. Building a Domain Driven Design is a key step in achieving a successful microservices implementation. Without Domains, microservices and reusable objects are not easily shared across teams.

The lowest level Domain is a _Life Cycle Domain._ A Life Cycle Domain includes steps that can integrate with your external Continuous Delivery (CD) Pipeline orchestration tools.

# Navigation

All navigation is done via the left hand navigation menu. This menu will take you to Application, Component and Domain dashboards as well as the ability to setup Repositories, Data Sources, CD Engines and other objects.  

## Upper Right Hand Corner Icons

- **Person Icon** : Clicking on the Person Icon in the group of icons on the upper far right displays information about the current User, which can be changed. A new password can also be entered for the User.

- **Question Mark Icon** : Clicking on the Question Mark Icon on the upper far right takes the User to the web page containing all the online documentation for DeployHub.

- **Logout:** Clicking on the logout button on the farthest upper right causes the User to be logged out of DeployHub and immediately returned to the login window in the browser.

- **Home Icon** : Clicking on the Home Icon in the group of icons on the upper far right, or clicking on any Domain in the tree structure at any time, causes three tabs to appear on the right side:

- **To Do List** : This contains all Requests for the current _User_ that are created by _Request Tasks_ as well as pending _Calendar_ entries.
- **Timeline** : All activity within the DeployHub installation for the current User.
- **Global Reports** : These are a series of reports.
  - _Endpoint_ Inventory Report: This list of the assets deployed to each _Endpoint_ in the system, including _Files, Components, Applications, Environments, Dates,_ and _Users._
  - File Audit Trace: Allows for the selection of a file on the local user's machine, and returns all related deployments as well as Dates, _Applications_, _Components_, and _Endpoints_.
  - Audit of the files deployed to _Endpoints_: This report shows the differences between the files on _Endpoints_ compared to what was deployed.
  - Success/Failed Deployments per _Environment_ Report: The number of successful and failed deployments per _Environment._ It includes the Deployment Number, _Environment_ deployed to, _Application_ and _Components,_ date deployed, and each _Endpoint_ deployed to along with all files.

- **Delivery Pipeline** : This tab only appears when a Domain containing _Life Cycle Sub-Domain_ has been selected. It is used to define your continuous delivery process.

