---
title: "Identify Your Repositories"
linkTitle: "Identify Your Repositories"
weight: 5
description: >
  Defining Repositories for Binaries and Containers. 
---

## Intro to Repositories

A _Repository_ is used by a _Component_. A _Repository_ acts as a source location for files that will be deployed as _Components_. Each _Component_ contains a pointer to where an artifact is stored in a _Repository_ or on a file system. When DeployHub performs the pre-deployment steps, it retrieves the artifact from any location you specify. It pulls it from the _Repository_ and creates a deployment package at deployment run time. For this reason, it does not need to store the actual artifact in the DeployHub versioning engine. Each _Component_ is defined with a _Repository_ reference. Your _Repository_ can point to any type of repository such  as Git, GitHub, Quay or binary repository such as Maven. A _Repository_ can also reference a file system.

## Using the Repository List View to Create and Delete 
The _Repository_ menu option is found under the **Setup** menu on the left of the DeployHub main panel. By selecting the _Repository_ menu, you will be taken to a list of all _Repositories_ which you have access to. You can also use the Search bar, represented by a funnel icon, to filter _Repository_ based on Name or Domain. 

The _Repository_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Repository_. You will select from various different _Repository_ Types that have been pre-configured. Each Type will determine the Details for that _Repository|
| Delete | Deletes the selected item. |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view. 

## The _Repository_ Dashboard 
The Dashboard view displays all information related to a specific _Repository_ Type.  

### Common Detials of all Repositories
The following details are common to all _Repository_ types:

| Field | Description |
| --- | --- |
| **Full Domain Name** | The fully qualified Name of the Domain the _Repository_ was defined to. |
| **Name** | The Name of the _Repository_. |
| **Type** | The _Repository_ Type choosen when you performed the Add. |
| **Owner Type** | User or Group |
| **Owner** | Name of the Owner |
| **Summary** | A description of the _Repository_|
| **Created** | Auto generated date when the _Repository_ was added.|
| **Modified**| Auto generated date when the _Repository_ was updated.|
| **Credential**| The _Credential_ used to access the _Repository_ if required. |


### File System _Repository_ Details 

| Field | Description |
| --- | --- |
| **Filepath**|  The fully qualified directory name to the files that will need to be deployed. These files must be on a file system that the DeployHub deployment engine has access to. |
| **Filepath Encrypted** | Select the box to indicate the Filepath name should be hidden in the database.|
| **Filepath Override** | Select the box if the Filepath can be replaced at the _Component_ definition. |  
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Recursive**| Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath. |
|**Recursive Override** |Select the box if the Recursive option can be replaced at the _Component_ definition.|
|**Version**| Allows for the auto generation of a version number based on a template that you define. Enter the template with variables, such as V${buildnumber} to create your unique version number upon deployment. This is most commonly used with DMScript. |
|**Version Encrypted** | Select the box to indicate the Version should be hidden in the database.|
|**Version Override** |Select the box if the Version can be replaced at the _Component_ definition.|

### OpenMake Meister _Repository_ Details 

| Field | Description |
| --- | --- |
| **Buildnumber**| The identifier of the Build that resides in the Meister _Repository_.|
| **Buildnumber Encrypted**| Select the box to indicate the Build Number should be hidden in the database.|
| **Buildnumber Override**| Select the box if the Build Number can be replaced at the _Component_ definition. |
| **Filepath**|  The fully qualified directory name to the files in the OpenMake Meister repository that will need to be deployed. |
| **Filepath Encrypted** | Select the box to indicate the Filepath name should be hidden in the database.|
| **Filepath Override** | Select the box if the Filepath can be replaced at the _Component_ definition. |  
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Recursive**| Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath. |
|**Recursive Override** |Select the box if the Recursive option can be replaced at the _Component_ definition.|


### SVN _Repository_ Details 

| Field | Description |
| --- | --- |
| **Path** | The path to the files within the Subversion repository.|
|**Path Encrypted** | Select the box to indicate the Path should be hidden in the database.|
|**Path Override** |Select the box if the Path can be replaced at the _Component_ definition.|
| **Revision** | Refers to the Tag used within the Subversion repository that contains the versions of the necessary files.|
|**Revision Encrypted** | Select the box to indicate the Revision should be hidden in the database.|
|**Revision Override** |Select the box if the Revision can be replaced at the _Component_ definition.|
|**URL** | The Universal Resource Locator used to locate the Subversion repository. |
|**URL Encrypted** | Select the box to indicate the URL should be hidden in the database.|
|**URL Override** |Select the box if the URL can be replaced at the _Component_ definition.|

### Git _Repository_ Details 

| Field | Description |
| --- | --- |
|**Git Repo** | URL to the Git Repo. |
|**Git Repo Encrypted** | Select the box to indicate the Git Repo should be hidden in the database.|
|**Git Repo Override** |Select the box if the Git Repo can be replaced at the _Component_ definition.|
|**Git Commit**| Git Commit to be checked out. |
|**Git Commit Encrypted** | Select the box to indicate the Git Commit should be hidden in the database.|
|**Git Commit Override** |Select the box if the Git Commit can be replaced at the _Component_ definition.|
|**To Dir** | Directory where the files will be checked out to. |
|**To Dir Encrypted** | Select the box to indicate the To Dir should be hidden in the database.|
|**To Dir Override** |Select the box if the To Dir can be replaced at the _Component_ definition.|
| **Filepath**|  The fully qualified directory name to the files that will need to be deployed. These files must be on a file system that the DeployHub deployment engine has access to. |
| **Filepath Encrypted** | Select the box to indicate the Filepath name should be hidden in the database.|
| **Filepath Override** | Select the box if the Filepath can be replaced at the _Component_ definition. |  
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Recursive**| Select the box in order to cause the _Repository_ to return all of the files from directories below those designated by Filepath. |
|**Recursive Override** |Select the box if the Recursive option can be replaced at the _Component_ definition.|

### HTTP _Repository_ Details 

| Field | Description |
| --- | --- |
|**URL** | The Universal Resource Locator used to locate the HTTP repository. |
|**URL Encrypted** | Select the box to indicate the URL should be hidden in the database.|
|**URL Override** |Select the box if the URL can be replaced at the _Component_ definition.|
| **Log File**|  The fully qualified file name to the logs from the HTTP get. 
| **Log File Encrypted** | Select the box to indicate the Log File name should be hidden in the database.|
| **Log File Override** | Select the box if the Log File can be replaced at the _Component_ definition. | 
|**Params** | Used to invoke a RESTful API, allowing more detailed interaction with the HTTP Endpoint.|
| **Params Encrypted** | Select the box to indicate the Parameters should be hidden in the database.|
| **Params Override** | Select the box if the Parameters can be replaced at the _Component_ definition. | 
|**Pattern** | This defines the file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. |
|**Pattern Encrypted** | Select the box to indicate the Pattern should be hidden in the database.|
|**Pattern Override** |Select the box if the Pattern can be replaced at the _Component_ definition.|
|**Port** | The port used to connect to the HTTP Endpoint.|
|**Port Encrypted** | Select the box to indicate the Port should be hidden in the database.|
|**Port Override** |Select the box if the Port can be replaced at the _Component_ definition.|
|**Endpoint** | The hostname of the HTTP Endpoint|
|**Endpoint Encrypted** | Select the box to indicate the Endpoint should be hidden in the database.|
|**Endpoint Override** |Select the box if the Endpoint can be replaced at the _Component_ definition.|
|**Version** | Value optional. DeployHub will generate a Version number for the files extracted if no Version is entered. |
|**Version Encrypted** | Select the box to indicate the Version should be hidden in the database.|
|**Version Override** |Select the box if the Version can be replaced at the _Component_ definition.|

### Attributes

Attributes are environment variables that need to be assigned to the Component such as Key Value Pairs. Use the +Add option to add Attributes to your Component. Attributes have a Name and a Value. Any Attributes defined at the Component level override any Attributes defined at the Application level and the Environment level.

{{% include "userguide/reusable/Access Object.md" %}}

### Audit Trail

The Audit Trail displays audit entries for deployments, including deployment number, _Environment_, and how many days ago the deployment (hours for all of today's deployments) took place. Any attribute changes to the _Application_ are also shown on the Audit Trail. 

