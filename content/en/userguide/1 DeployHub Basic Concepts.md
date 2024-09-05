---
title: "Understanding DeployHub Objects"
linkTitle: "Understanding DeployHub Objects"
weight: 4
description: >
  Understanding Core Objects and Concepts.
---

## Introduction

DeployHub's core Objects are _Domains_, _Applications_, _Components_, _Environments_ and _Endpoints_. These Objects organize, aggregate, and version independently released artifacts with their DevSecOps metadata such as deployment location, Software Bill of Materials, OpenSSF Scorecard, and known vulnerabilities. This data is the basis for analyzing your software system's security posture and tracking vulnerabilities to where they are running in your environment.  

 _Objects_ related to gathering Security Intelligence include:

- Domains - Organizes data into "solution" spaces
- Components - An independently deployed artifact such as files, APIs, Microservices, Containers
- Applications - A collection of independently deployed artifacts (_Components_) that serves as a complete software solution.
- Environments - The location where the _Application_ is running.
- Endpoints - The clusters, servers, or Virtual Machines within the Environment where a _Component_ is running. 

DeployHub includes an agentless deployment engine for organizations who are looking to standardize on a deployment process.  _Objects_ related to DeployHub's Internal Deployment engine includes:

- Release
- Credentials
- DropZone
- DropZone File
- Notifiers

Following is a description of each Object and their attributes.

### _Domain_ Object

The [_Domain_ Object](/userguide/2-defining-domains/) represents the highest order of organization for managing _Applications_, _Components_ and _Environments_. _Domains_ are hierarchical and can have _Subdomains_. _Subdomains_ inherit the parents properties, _Tasks_ and access.

![Example of Domains, Applications, Components and Environments](/userguide/images/OnlineStore-Domains.jpg)

Your _Components_, are organized based on _Domains_ and _Subdomains_ which you define. _Domains_ categorize _Components_ that solve the same 'problem sets.' In a similar way, _Applications_ are assigned to _Domains_. In addition, _Environments_ and _Endpoints_ are associated to _Domains_ that are running _Applications_.

The highest level _Domain_ is your _Global Domain_. With the SaaS version, your _Global Domain_ name is defined based on your Company. With the on-premise installation, you will see a _Domain_ called _Global_.

The following properties can be accessed on the _Domain_ object:

| **Property** |  **Description** |
| --- | --- | --- |
| ID |  _Domain_ id, as used in the database. |
| Name | _Domain_ name. |
| fqdomain | Fully qualified _Domain_ name. |
| Summary | Summary text. |
| _Domain_ | Higher level organization to which it belongs. |
| _Subdomains_ | Lower level organization to which it belongs |
| _Applications_ | The _Application_ objects which are contained within it. |
| _Environments_ | The _Environment_ objects which are contained within it. |
| Creator | The _User_ or _Group_ Object representing the user who created it. |
| Modifier | The _User_ or _Group_  Object representing the user who last modified it. |
| ctime | _Date_ Object representing the date/time it was created. |
| mtime | _Date_ Object representing the date/time it was last modified. |
| Owner | _User_ or _Group_ Objects that owns it. |

### _Component_ Object

DeployHub manages artifacts and other reusable objects as [_Components_](/userguide/2-define-components/). _Components_ are consumed by _Applications_. By assigning _Components_ to _Applications_ you track a 'logical' view of your software solution as a whole. In cloud-native architecture, _Components_ are loosely coupled and communicate at run-time. Defining _Components_ to _Applications_ supports the aggregation of security data to the _Application_ level to produce _Application_ security reports such as Software Bill of Materials (SBOM) reports in a decoupled architecture where hundreds of SBOMs are needed for one _Application_ SBOM. 

_Components_ change over time. To expose changes, DeployHub takes a snapshot of the initial _Component Base Version_ and tracks subsequent changes recorded as  _Component Versions_. _Components_ are associated to a _Domain_ for organization and quick searches.

- **_Component Base Version_** : The initial _Component_ object that represent the artifacts being managed

- **_Component Version_** : A child of the _Component Base Version_ that represents changes.

A _Component_ object has the following properties:

| **Property** |  **Description** |
| --- | --- | --- |
| ID | A unique identifier for the _Component_ as used in the database. |
| Name | The name of the _Component_. |
| fqdomain | Fully qualified _Domain_ name. |
| Summary |  Description of the _Component_. |
| _Domain_ | Organization in which the _Component_ is contained. |
| Owner | User or UserGroup that owns the _Component_. |
| Parent | The Base _Component_. |
| Predecessor | The version on which this is based. |
| Items | The items that make up this _Component_. |
|_Endpoint_| The compute node to which this _Component_ has been deployed. |
| Requests | The change requests associated with this _Component_ .|
| Lastbuild | The last build number for this _Component_, 0 if never built. |
| Creator | The User who created this _Component_. |
| Modifier | The User who last modified this _Component_. |
| ctime | The date/time the _Component_ was created. |
| mtime | The date/time the _Component_ was last modified. |
| Key Value Configurations | Key Value Pairs for managing associative arrays. |


### _Application_ Object

[_Applications_](/userguide/2-defining-applications/) are a collection of _Components_ that are released as a single software solution. You define an _Application_ by associating the _Components_ it will consume. When you initially define an _Application_ it is referenced as the _Application Base Version._ When an underlying _Component_ changes, it impacts the _Application_ creating a new  _Application Version_. _Applications_ are organized by a _Domain_.

- **_Application Base Version_** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **_Application Version_** : This represents any changes made in to the _Base Versions_.

An _Application_ has the following properties:

| **Property**      | **Description**                                                              |
|-------------------|------------------------------------------------------------------------------|
| ID                | A unique identifier for the _Application_  in the database.                  |
| Name              | _Application_ name.                                                          |
| fqdomain          | Fully qualified _Domain_ name.                                               |
| Summary           | Summary of the _Domain_.                                                     |
| Owner             | _User_ or _Group_ that owns it.                                              |
| Parent            | The Base _Application_.                                                      |
| predecessor       | Predecessor _Application Version_.                                           |
| _Release_         | Defines the _Application_ Object with more than one _Application_.           |
| _Applications_    | Multiple _Applications_ used to create a _Release_.                          |
| _Components_      | The objects that the _Application_ consumes.                                 |
| Approvals         | Allows a control point for progressing a change within the pipeline process. |
| Requests          | The _Change Request_ objects associated with this _Application_.             |
| creator           | The _User_ or _Group_ who created it.                                        |
| Modifier          | The _User_ or _Group_ who last modified it.                                  |
| ctime             | The date/time it was created.                                                |
| mtime             | The date/time it was last modified.                                          |
| Key Value Configurations | Key Value Pairs for managing associative arrays.                             |


### _Component_ and _Application_ Relationships

There is a many-to-many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_.  _Components_ can be easily shared between _Applications_. DeployHub tracks and versions the _Component_ relationships including which _Applications_ they impact. This is necessary for tracking vulnerabilities found at the _Component_ level to the _Application_ that consumes it.

### _Component_ and _Application_ Versioning

A backend versioning datastore tracks all software configuration updates. This is done within an _Application_. An _Application_ consists of one or more _Components_. Versioning tracks all changes in both your _Application_ and _Component_ attributes. 

When you first define your _Application_, you create an _Application Base Version_. Over time, as you update your code and deliver new features, each change to the _Application_ creates a new _Application Version_.  _Application Versions_ are a collection of all your _Components_ in the software solution delivered to end users. Like _Component Versions_, there is an initial _Application Base Version_ and subsequent _Application Versions,_ which represent the updates over time. An _Application Base Version_ or _Component Base Version_ is always the first one created, and it acts as the base-line for subsequent _Application_ or _Component Versions_. Otherwise they are identical types of objects.

DeployHub uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

You can use your CI/CD process to include variance in your versioning number (base name, variant, version.) See [CI/CD and DeployHub](/userguide/integrations/ci-cd_integrations/).

### _Environment_ Object

The [_Environment_ Object](/userguide/2-define-environments/) represents where an _Application_ is published or deployed. 

The following properties can be accessed for an _Environment_ object:

| **Property**   | **Description**                             |
|----------------|---------------------------------------------|
| ID             | Unique identifier as used in the database.  |
| Name           | _Environment_ name.                         |
| fqdomain       | Fully qualified _Domain_ name.              |
| Summary        | Description of the _Environment_.           |
| _Domain_         | _Domain_ in which it is contained.          |
| Owner          | _User_ or _Group_ Objects that owns it.     |
| basedir        | Base directory for deployments.             |
| _Endpoints_    | The compute node assigned to it.             |
| _Applications_ | The _Applications_ associated to it.        |
| Creator        | The _User_ or _Group_ who created it.       |
| Modifier       | The _User_ or _Group_ who last modified it. |
| ctime          | The date/time it was created.               |
| mtime          | The date/time it was last modified.         |
| Parent         | Parent _Domain_.                            |


### _Endpoint_ Object

The [_Endpoint_ object](/userguide/2-define-endpoints/) is a compute node that (Local Helm Host, container, VM/Cloud Image) represents where an _Application_ is running. _Endpoints_ are assigned to an _Environment_.

_Endpoints_ are the containers, virtual machines, or servers where the _Application_ has been deployed. _Endpoints_ allow DeployHub to expose where vulnerabilities are running across your development, testing and production _Environments_.

 _Endpoints_ are mapped to _Components_ and _Environments_.  _Endpoints_ are used to track where a _Component_ is installed for vulnerability exposure, and referenced by the DeployHub internal deployment engine for executing deployments. 

The _Endpoint_ object has the following properties:

| **Property**             | **Description**                                        |
|--------------------------|--------------------------------------------------------|
| ID                       | A unique identifier as used in the database.           |
| Name                     | The _Endpoint_ name.                                   |
| fqdomain                 | Fully qualified _Domain_ name.                         |
| Summary                  | Description of the _Endpoint_.                         |
| _Domain_                   | _Domain_ in which it is contained.                     |
| Owner                    | _User_ or _Group_ that owns it.                        |
| Hostname                 | Hostname (if set) or name otherwise.                   |
| basedir                  | Base Directory for where the _Application_ is running.                        |
| _Credential_               | The logon and password used to access this _Endpoint_. |
| _Components_             | The _Components_ currently installed on it.            |
| Creator                  | The _User_ or _Group_ who created it.                  |
| Modifier                 | The _User_ or _Group_ who last modified it.            |
| ctime                    | The date/time it was created.                          |
| mtime                    | The date/time it was last modified.                    |
| Key Value Configurations | Key Value Pairs for managing associative arrays.       |

### _Date_ Object

Dates track the date/time of the creation, deletion, or update of an Object.

The _Date_ has the following properties:

| Property      | Description                                                                                                                                                                                                                                          |
|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| to\_int(secs) | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If needed, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) | Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below.                                                                                                                          |

### _Change Request_ Object

The [_Change Request_](/userguide/advanced-features/deployments/changerequest) Object represents a change request record associated with either a _Component_ or an _Application_. 

The _Change Request_ object has the following properties:

| Property  | Description                                                                                                                                                                                                                                                                 |
|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ID        | The _Change Request_ id.                                                                                                                                                                                                                                                    |
| Name      | The _Change Request_ description.                                                                                                                                                                                                                                           |
| Status    | The _Change Request_ status.                                                                                                                                                                                                                                                |
| api\_url  | A URL which, if passed to restful\_get, will return an array containing the full details of the _Change Request_ from the external change tracking system. Useful for getting more information than the ID / description / status combination which is stored in DeployHub. |
| html\_url | A URL which will direct a browser to the page describing the change request in the external change tracking system.|


### _Data Source_ Objects

 The [_Data Source_](/userguide/advanced-features/deployments/2-data-sources/) object  communicates with various sources of information such as databases, HTTP servers, FTP servers, etc., and can be used to connect to other DevOps tools as needed.

### _Group_ Object

The [_Group_ Object](/userguide/user-groups/) represents a collection of _Users_ with the same _Domain_ and security access. 

The _Group_ Object has the following properties:

| Property | Description                                                           |
|----------|-----------------------------------------------------------------------|
| ID       | A unique identifier as used in the database.                          |
| Name     | _Group_ Name.                                                         |
| Kind     | Identifies whether this is a _User_ or a _Group_.                     |
| fqdomain | Fully qualified _Domain_ name.                                        |
| Email    | The _Group's_ email address.                                          |
| Creator  | _User_ or _Group_ Object representing who created this Group.         |
| Modifier | _User_ or _Group_ Object representing who last modified this _Group_. |
| ctime    | _Date_ Object representing the date/time it was created.              |
| mtime    | _Date_ Object representing the date/time it was last modified.        |
| Owner    | _User_ or _Group_ that owns the object.                               |


### _User_ Object

The _User_ Object represents a User in DeployHub. It has the following properties:

| **Property** | **Return Type** | **Description**                                                                                 |
|--------------|-----------------|-------------------------------------------------------------------------------------------------|
| ID           | Integer         | User id, as used in the database.                                                               |
| Name         | String          | User Name.                                                                                      |
| kind         | String          | Returns "user". Used to differentiate between users and groups when retrieving an owner object. |
| fqdomain     | String          | Fully qualified _Domain_ name.                                                                  |
| Realname     | String          | The _User's_ full name.                                                                         |
| Email        | String          | The _User's_ email address.                                                                     |
| Phone        | String          | The _User's_ telephone number.                                                                  |
| groups       | Array           | Array of _Group_ Objects to which this User belongs.                                            |
| lastlogin    | Date            | The date/time last logged into DeployHub.                                                       |
| Creator      | User            | _User_ or _Group_ Object representing who created this _User_.                                  |
| Modifier     | User            | _User_ or _Group_ Object representing who last modified this _User_.                            |
| ctime        | Date            | _Date_ Object representing the date/time the User was created.                                  |
| mtime        | Date            | _Date_ Object representing the date/time the User was last modified.                            |
| Owner        | Object          | _User_ or _Group_ that owns the _User_                                                          |


## Objects Used by the Internal Deployment Engine

If your organization requires a standardized method of doing deployments, the DeployHub internal deployment engine can be configured for this use. The internal deployment engine is agentless and requires a [reverse proxy.](/userguide/advanced-features/deployments/0-saas-and-reverse-proxy/) For more information on the internal deployment engine [read the deployment chapter.](/userguide/advanced-features/deployments/)

### _Release_ Object

A [_Release_](/userguide/advanced-features/deployments/5-application-releases/) is only available in DeployHub. A _Release_ is a collection of _Applications_ that must be deployed together, sometimes referred to as a 'Release Train.' Releases are used as part of DeployHub's internal deployment engine and are not required for managing Security Intelligence. 

### _Credential_ Object

The [_Credential_ Object](/userguide/advanced-features/deployments/2-define-your-credentials/) contains the logon and password needed to access _EndPoints_ and external repositories like Git or Quay. _Credentials_ are used by the internal deployment engine, but not required for Security Intelligence gathering. 

The _Credential_ Object has the following properties:

| Property | Description                                                                                                                                                      |
|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ID       | A unique identifier for the _Credential_ as used in the database.                                                                                                |
| Name     | The name of the  _Credential_.                                                                                                                                   |
| Summary  | Description.                                                                                                                                                     |
| fqdomain | Fully qualified _Domain_ name that the _Credential_ is associated with.                                                                                          |
| _Domain_   | Organization in which the _Credential_ is associated.                                                                                                                |
| Owner    | _User_ or _Group_ that owns the _Credential_.                                                                                                                    |
| Username | Decrypted username.                                                                                                                                              |
| Password | Decrypted password.                                                                                                                                              |
| b64auth  | A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. |
| creator  | The _User_ or _Group_ who created this _Credential_.                                                                                                             |
| Modifier | The _User_ or _Group_ who last modified this _Credential_.                                                                                                       |
| ctime    | The date/time the _Credential_ was created.                                                                                                                      |
| mtime    | The date/time the _Credential_ was last modified.                                                                                                                |

### _Dropzone_ Object

The _DropZone_ Object is used by the DeployHub internal deployment engine. It represents a local area where deployment artifacts are manipulated before sent to the target _Endpoints_. A _DropZone_ Object is also present on the stack during Pre and Post _Action_ processing for a _Component_. For example, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_.

A _DropZone_ Object has the following properties:

| Property | Description                                                                                                                                   |
|----------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Name     | _DropZone_ name.                                                                                                                              |
| Path     | The full path of where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files    | An Array of _DropZone Objects_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file.  |

### _DropZone_ File Object

The _DropZone File_ Object represents a file in the _DropZone_.

The _DropZone File_ Object has the following properties:

| Property | Description                                                                                                                 |
|----------|-----------------------------------------------------------------------------------------------------------------------------|
| dzpath   | The relative path of the file in the _DropZone_.                                                                            |
| repopath | The relative path of the file as located in the repository (this path is relative to the base directory of the repository). |
| size     | The size of the file in bytes.                                                                                              |
| ctime    | The creation time of the file.                                                                                              |
| mtime    | The modified time of the file.                                                                                              |


### _Notifier_ Objects

A [_Notifier_](/userguide/advanced-features/deployments/2-define-notifiers/) is sent after a successful or failed deployment attempt. If these features are activated, they are also sent when deployed files have been changed, a Request Task has been used, or when an _Endpoint_ is down,  DeployHub can use SMTP (Simple Mail Transfer Protocol), Slack and HipChat for this purpose.
