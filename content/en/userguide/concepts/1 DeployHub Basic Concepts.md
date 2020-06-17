---
title: "DeployHub 101"
linkTitle: "DeployHub 101"
weight: 2
description: >
  Understanding DeployHub Core Objects and concepts.
---

## Intro to Core Objects

The core _Objects_ that define DeployHub are _Domains_, _Applications_, _Components_ , _Environments_ and _Endpoints_. These key Objects are used to catalog, track, and version independently deployable objects like microservices, map their relationships, and release them to clusters, cloud, or physical datacenters.

_Domains_ are core to DeployHub's management of microserivces.  _Domains_ are hierarchical and pass inheritance from parent to siblings.  For this reason, _Components_ can be shared across the _Sub-domains_.  The hierarchical structure of _Domains_ provide a high-level of control and management over how microservices are shared and reused.

![Example of Domains, Applications, Components and Environments](/userguide/concepts/OnlineStore-GlobalDomain.jpg)

 The other _Objects_ include:

- Change Request
- Credentials
- Data Sources
- Date
- DropZone
- DropZone File
- Notifiers
- User
- UserGroup (DeployHub Pro Object)

These Objects support how DeployHub does it works and can be referenced using DeployHub APIs or custom DMSCripts.

Following is a description of each Object and their attributes.

## Application Object

If you are an application developer, this will be where you do most of your work. [_Applications_](/userguide/packaging-applications/) are a collection of _Components_ that can be deployed as a single software solution. You define an Application by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned and deployed to _Environments_. _Applications_ are associated to a _Domain_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

An Application has the following properties:

| **Property** | **Description** |
| --- | --- |
| id | A unique identifier for the _Application_ as used in the database. |
| name | _Application_ name. |
| fqdomain |Fully qualified _Domain_ name. |
| summary | Summary of the _Domain_. |
| owner | User or UserGroup that owns the _Application._ |
| parent | The Base _Application_ .|
| predecessor |Predecessor _Application Version_ (the version on which this version is based). |
| _Release_ | Defines the _Application_Object_with more than one_Application_ . |
| _Applications_ | Multiple _Application_s used to create a _Release_.|
| _Components_ | The objects that the _Application_ consumes. |
| approvals | Used  as part of a pipeline process allowing a control point for progressing a change across the pipeline. |
| requests | The _Change Request_ objects associated with this _Application_ (Pro feature).|
| creator | The User who created this _Application_. |
| modifier | The user who last modified this _Application_. |
| ctime | The date/time the _Application_ was created. |
| mtime |  The date/time the _Application_ was last modified. |
| attributes |  An Array of Strings, keyed by Attribute Name. |

### Release Object

A [_Release_](/userguide/profeatures/5-application-releases/) is only available in **DeployHub Pro**. A _Release_ is a collection of _Applications_ that must be deployed together, sometimes referred to as a 'Release Train.'

## Change Request Object

The [_Change Request_](/userguide/profeatures/5-change-requests/) object represents a change request record associated with either a _Component_ or an _Application_.

The _Change Request_ object has the following properties:

| Property | Description|
| --- | --- |
| id | The change request id. |
| name | The change request description. |
| status  | The change request status. |
| api\_url | A URL which - if passed to restful\_get - will return an array containing the full details of the change request from the external change tracking system. Useful for getting more information than the id / description / status combination which is stored in DeployHub. |
| html\_url | A URL which will direct a browser to the page describing the change request in the external change tracking system. |

## Component Object

DeployHub manages microservices and other reusable objects as [_Components_](/userguide/publishing-components/).  _Components_ are assigned to an _Application_ eventhough they are managed independently.  By assigning _Components_ to _Applications_ you are able to track a 'logical"' view of your software solution.  In a monolithic approach, we performed this step at the software compile and linke step. In microservices, that step goes away. Microservices are loosely coupled and linked at run-time. Defining _Components_ to _Applications_ puts the _Application_ back in the picture, even if it is only a 'logical' view.

If you are an API or microservice developer, this will be where you do most of your work. However, application developers may also define _Components_ that are to be used by only a specific _Application_. _Components_ are microservices (containers), Database updates or files, along with Pre and Post _Actions_ that are used to control the deployment at a detailed level. By tracking the low-level deployment metadata for a _Component_, it can be easily shared and released in a consistent way across team.

_Components_ change over time, and so DeployHub contains _Component Base Versions_ and _Component Versions_ like those of _Application Base Versions_ and _Application Versions._ And like _Applications_, _Components_ are associated to a Domain.

- **Component Base Version** : Objects within DeployHub that contain the files and procedures that are deployed to _Endpoints_.

- **Component Version** : A child of the _Component Base Version_ that represents changes.

A _Component_ object has the following properties:

| **Property** |  **Description** |
| --- | --- | --- |
| id | A unique identifier for the _Component_ as used in the database. |
| name | The name of the _Component_. |
| fqdomain | Fully qualified _Domain_ name. |
| summary |  Description of the _Component_. |
| domain | _Domain_ in which the _Component_ is contained. |
| owner | User or UserGroup that owns the _Component_. |
| parent | The Base _Component_. |
| predecessor | Predecessor _Component_ Version (the version on which this version is based). |
| items | The items that make up this _Component_. |
| servers | These are the _Endpoints to which this_Component_ has been deployed. |
| requests | The change requests associated with this _Component_ .|
| lastbuild | The last build number for this _Component_, 0 if never built. |
| creator | The user who created this _Component_. |
| modifier | The user who last modified this _Component_. |
| ctime | The date/time the _Component_ was created. |
| mtime | The date/time the _Component_ was last modified. |
| attributes | Array of Strings, keyed by Attribute Name. |

### Component and Application Relationships

There is a many to many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_. With DeployHub, _Components_ can be easily shared between _Applications_. DeployHub tracks and versions the _Component_ relationships including to which _Applications_ they have been assigned.

### Component and Application Versioning

DeployHub uses a back-in versioning engine to track all configurations of your software deployments. Your software deployment is configured within an _Application_. An _Application_ consists of one or more _Components_. Versioning tracks all changes in both your _Application_ and _Component_ attributes including low level information such as the _Action_ used to perform the installation, environment variables, and database schemas.

When you first define your _Application_ to DeployHub, you create an _Application_ _Base_ _Version_. Over time, as you update your code and deliver new features, each change to the _Application_ creates a new _Application Version_. _Application Versions_ package together all your _Components_ that make up your entire software product. Like _Application Versions_, there is an initial _Component__Base_ _Version_ and subsequent _Component Versions,_ which represent the updates over time. An _Application Base Version_ or _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Application_ or _Component Versions_. Otherwise they are identical types of objects.

When a new _Application Version_ is createdfrom either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ from its predecessor. The predecessor is determined when running a _Create Version Task_ for an _Application Version_. You can specify whether the new _Application Version_ inherits its _Components_ from the original _Application Base Version_, the latest _Application Version_, or a specific _Application Version_.

DeployHub uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

## Credential Object

The [_Credential Object_](/userguide/first-steps/2-define-your-credentials/) contains the logon and password needed to access _EndPoints_ and external Repositories like Git or Quay.

The _Credential Object_ has the following properties:

| Property | Description |
| --- | --- |
| id | A unique identifier for the _Credential_ as used in the database. |
| name | The name of the  _Credential_. |
| summary |  Description. |
| fqdomain |  Fully qualified _Domain_ name that the _Credential_ is associated. |
| domain |  Domain in which the _Credential_ is associated. |
| owner |  User or UserGroup that owns the _Credential_. |
| username | Decrypted username. |
| password | Decrypted password. |
| b64auth |  A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. |
| creator | The user who created this _Credential_. |
| modifier | The user who last modified this _Credential_. |
| ctime | The date/time the _Credential_ was created. |
| mtime | The date/time the _Credential_ was last modified. |
| kind  | _Credential_ use. |

## Data Source Objects

There may come a time when you need to acquire data from outside of DeployHub, such as an ODBC connection to Oracle. The [_Data Source_](/userguide/customizations/2-data-sources/) object in DeployHub is available for communicating with various sources of information such as databases, HTTP servers, FTP servers, etc., and can be used to connect to other DevOps tools.

## Date Object

Dates are used to track the date/time of the creation, deletion or update of an Object.

The _Date Object_ has the following properties:

| Property | Description |
| --- | --- |
| to\_int(secs) | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If specified, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) |  Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below. |

## Domain Object

The [_Domain Object_](/userguide/customizations/2-define-your-functions-and-procedures/) represents the highest order of organization for managing _Applications_, _Components_ and _Environments_. _Domains_ are hierarchical and can have _Sub-domains_. _Sub-domains_ inherit the parents properties, _Tasks_ and access.

Your microservices, which are a type of _Component_ are cataloged based on _Domains_ and _Sub_Domains_which you define._Domains_are used to catalog microservices that solve the same 'problem sets.' In a similar way,_Applications_are assigned to their own_Domain_._Environments_and_Endpoints_are associated to_Domains_that are managing_Applications_.

The highest level _Domain_ is your _Global Domain_. If you are using the SaaS version, your _Global Domain_ name is defined based on your Company.  If you are using the on-premise installation, you will see a Domain called _Global_.

_Domains_ also include _Tasks_. _Tasks_ include Move, Approve, Version and Deploy. _Tasks_ can be called by external solutions via APIs for integration into your Continuous Delivery Pipeline. _Tasks_ are associated to any _Domain_ and can be defined as _Pre_ or _Post_.  _Tasks_ are normally defined to _Life Cycle Sub-domains_ and support continuous configuration management in your continuous delivery process.

_Life Cycle Sub-domains_ allow you to automate the push of your continuous deployments from development through production. DeployHub can be called by your Continuous Delivery engine (Jenkins, Bamboo, GitLab, CircleCI, Puppet Relay, Google CloudBuild or GitHub Actions) to perform the continuous deployment task across all states of your pipeline. If you are not using a Continuous Delivery orchestration engine, you can assign _Tasks_ to your _Life Cycle Sub-Domain_ to define a continuous deployment 'promotion' process within DeployHub.

The following properties can be accessed on the _Domain_ object:

| **Property** |  **Description** |
| --- | --- | --- |
| id |  Domain id, as used in the database. |
| name | Domain name. |
| fqdomain | Fully qualified domain name. |
| summary | Summary text. |
| domain | Higher level _Domains_ to which it belongs. |
| subdomains | List of _Domain_ objects which are contained within this Domain. |
| lifecycle | A _Domain_ that includes a pipeline and the lowest level _Sub_Domain_Lifecycle_Domains_cannot have_Sub_Domains_. |
| _Applications_ | The _Application_ objects which are contained within this _Domain_. |
| _Environments_ | The _Environment_ objects which are contained within this _Domain_. |
| creator | The User Object representing the user who created this _Domain_. |
| modifier | The User Object representing the user who last modified this _Domain_. |
| ctime | Date Object representing the date/time the _Domain_ was created. |
| mtime | Date Object representing the date/time the _Domain_ was last modified. |
| owner | User or UserGroup that owns the _Domain_. |

## Dropzone Object

The _DropZone Object_ represents a local area on the DeployHub engine where deployment artifacts are  manipulated before onward transmission to the target _Endpoint_(s). A _DropZone Object_ is also present on the stack during pre and post action processing for a _Component_. In this case, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_ Items.

A _DropZone Object_ has the following properties:

| Property | Description |
| --- | --- |
| name | _DropZone_ name. |
| path | The full path of where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files | An Array of _DropZone Objects_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file. |

### DropZone File Object

The _DropZone File Object_ represents a file in the _DropZone_.

The _DropZone File Object_ has the following properties:

| Property | Description |
| --- | --- |
| dzpath | The relative path of the file in the _DropZone_. |
| repopath | The relative path of the file as located in the Repository (this path is relative to the base directory of the repository). |
| size | The size of the file in bytes. |
| ctime | The creation time of the file. |
| mtime | The modified time of the file. |

## Environment Object

The [_Environment Object_](/userguide/first-steps/2-define-environments/) represents a collection of _Endpoints_ where an _Application_ is deployed. Mutlple _Environments_ are used to represent your Pipeline stages such as Development, Testing and Production for a single _Application_.  Your _Application_ can have as many _Envrionments_ as needed to support your Pipeline.

The following properties can be accessed for an _Environment_ object:

| **Property** | **Description** |
| --- | --- |
| id |  Unique identifier for the _Environment_ as used in the database. |
| name | _Environment_ name. |
| fqdomain | Fully qualified domain name. |
| summary |  Description of the _Environment_. |
| domain |  Domain in which the _Environment_ is contained. |
| owner  | User or UserGroup that owns the _Environment_.|
| basedir |  Base directory for deployments. |
| _Endpoints_ |  The _Endpoints_ assigned to the _Environment_. |
| _Applications_ | The _Applications_ associated to the _Environment_. |
| creator |  The user who created this _Environment_. |
| modifier | The user who last modified this _Environment_. |
| ctime | The date/time the _Environment_ was created. |
| mtime |  The date/time the _Environment_ was last modified. |
| parent | Parent _Domain_. |

## Endpoint Object

The [_Endpoint_](/userguide/first-steps/2-define-endpoints/) (server, container, VM/Cloud Image) object represents where a deployment will be sent. _Endpoints_ are assigned to an _Environment_.

### Endpoint Mapping

Each _Component_ is assigned a _Type_ attribute. The _Type_ attribute allows you to specify to what kind of _Endpoint_ that the _Component_ should be installed. For example, a Database _Component_ is installed onto an _Endpoint_ that has the corresponding Database _Type_ definition. A _Component_ is assigned a single _Type_, while an _Endpoint_ can be assigned multiple _Types_. For example, if your single _Endpoint_ needed to have both a database and your application binaries installed, it would be assigned both a 'Database' and an 'Binary' _Type_ attribute.

Mapping of _Component_ to _Endpoints_ is accomplished by assigning one or more _Component Types_ to each _Endpoint_ and assigning a single _Type_ attribute to the _Component._ When an _Application_ is deployed, each _Component_ within the _Application_ will be deployed to each _Endpoint_ if the _Component's Type_ attribute matches one of the _Endpoint's Type_ attributes. DeployHub ships with standard _Component_ and _Endpoint Types_ and allows you to define custom _Type_ attributes.

The _Endpoint_ object has the following properties:

| **Property** | **Description** |
| --- | --- |
| id | A unique identifier for the _Endpoint_ as used in the database. |
| name | The Endpoint name. |
| fqdomain | Fully qualified _Domain_ name. |
| summary | Description of the _Endpoint_. |
| domain | Domain in which the _Endpoint_ is contained. |
| owner | User or UserGroup that owns the _Endpoint_. |
| hostname | Hostname (if set) or name otherwise. |
| basedir | Base Directory for Deployments. |
| type | _Endpoint_ Type, ie: cluster, windows, cloud, etc. |
| credential | The logon and password used to access this _Endpoint_.|
| _Components_ | The _Components_ currently installed on this _Endpoint_. |
| creator |  The user who created this _Endpoint_. |
| modifier | The user who last modified this _Endpoint_. |
| ctime | The date/time the _Endpoint_ was created. |
| mtime | The date/time the _Endpoint_ was last modified. |
| attributes | Array of Strings, keyed by Attribute Name. |

## Notifier Objects

A [_Notifier_](/userguide/customizations/2-define-notifiers/) is sent to various recipients after a successful or failed deployment attempt. They are also sent when deployed files have been changed, a _Request_ _Task_ has been used, or that an _Endpoint_ is down, if these features have been activated on one or more _Endpoints_.  DeployHub can use SMTP (Simple Mail Transfer Protocol), Slack and HipChat for this purpose. A _Notifier_ contains all of the technical information necessary to send notifications.

## User Object

The _User object_ represents a user in DeployHub. _User objects_. The _User Object_ has the following properties:

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

## UserGroup Object

The _UserGroup object_ represents a collection of _Users_ with the same _Domain_ and security access. (Pro feature)

The _UserGroup Object_ has the following properties:

| Property | Description |
| --- | --- |
| id |  A unique identfier for the _UserGroup_, as used in the database. |
| name  | _UserGroup_ Name. |
| kind  | Identifies if this _UserGroup_ is a _User_ or a _UserGroup_. |
| fqdomain | Fully qualified domain name. |
| email  | The User Group&#39;s email address. |
| creator | User Object representing the user who created this user group. |
| modifier | User Object representing the user who last modified this user group. |
| ctime |  Date Object representing the date/time the user group was created. |
| mtime |  Date Object representing the date/time the user group was last modified. |
| owner | User or UserGroup that owns the User Group. |
