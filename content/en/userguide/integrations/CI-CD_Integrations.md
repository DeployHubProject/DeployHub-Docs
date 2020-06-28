---
title: "Using DeployHub with CI/CD"
linkTitle: "Using DeployHub with CI/CD"
weight: 49
description: >
  Integrating DeployHub into your CI/CD process.
---

DeployHub integrates into your CI/CD process at three points.  First, the CI process that is creating your artifacts and containers. Second, the packaging of artifacts and containers into application.  Lastly, the CD process of deploying your applications.

## The CI Step

DeployHub hooks into the CI step after the build has been completed and the artifact or container has been pushed to the registry.  This hook is done by using a DeployHub plugin for the CI tool.  DeployHub's plugins are as follows:

| CI Tool | DeployHub Plugin | How to Install and Use the Plugin |
|---|---|---|
| Jenkins | DeployHub Groovy Library | [Jenkins CI DeployHub Plugin GitHub Repo](https://github.com/jenkinsci/deployhub-plugin) |
| CircleCI | DeployHub CircleCI Orb | [DeployHub Orb](https://circleci.com/orbs/registry/orb/deployhub/deployhub-orb)|
| Google CloudBuild | DeployHub CLI Container | [DeployHub CLI Docker Container](https://github.com/ortelius/compupdate) |
| TeamCity | DeployHub CLI Container | [DeployHub CLI Docker Container](https://github.com/ortelius/compupdate) |

The DeployHub CI integration is used to gather information about the _Component_ build. The DeployHub Plugin will create a new _Component_ Base Version if one does not exist and then create a _Component Version_.  It will also associate build data to the _Component Version_. 

### Automatic Versioning

The following are the parts of the versioning schema:

- Base name is the static part of the _Component_ Name.  For example: email-service.
- Variant is a high level place holder for that versions are created within. The Variant can be aligned with a feature or branch. For example: ssl-update.  Variant is not required.
- Version is the schemantic version number or schemantic + Git commit.  For example:  v1.5.1.0 or v1.5.1-g3d55a2

By default, DeployHub uses the <base name>;<version number> as the default format for the versioning schema. It will automatically increment the version number base on last version found.

The DeployHub Plugin uses an advanced format since it has the information from Git to provide a complete version schema.  The advanced formatting is, <base name>;<variant>;v<version>-g<git commit>.  The version part is broken down further into v<schemantic number>-<number of commits>.  The number of commits provides an autoincrement of the last part of the schemantic number.  

An example of the full name is: email-service;ssl-update;v1_5_1_145-g3d55a2

| Part | Explination |
| ---  | --- |
| email-service | Base Name that you supply to the DeployHub Plugin for the _Component_. |
| semi colon | Separator. |
| ssl-update | Variant that you supply to the DeployHub Plugin for the _Component_. |
| semi colon | Separator. |
| v | Indicates start of the version. |
| 1_5_1_ | Version that you supply to the DeployHub Plugin for the _Component_. |
| 145 | Number of Git Commits for the associated repository.  Used for auto incrementing. |
| -g | Separator indicating that the Git commit is next |
| 3d55a2 | Git command SHA for the commit that triggered the CI process. |

Note: The Variant is optional.  That part of the _Component_ name will be left out if the Variant passed to the DeployHub Plugin is blank.

### Saved Build Data

Any build data can be saved with the _Component Version_ as an _Attribute_.  This data is saved as a key/value pair.  The following data from the build is saved as primary information for a _Component Version_.  This data is viewed on the _Component_ Dashboard under the Details section.

| Build Data | Description |
| --- | --- |
| BuildId | Id or Build Number for the CI Job. |
| BuildUrl | URL of the CI Job. |
| Chart | Name of the Helm Chart that you supply to the DeployHub Plugin for the _Component_. |
| ChartVersion | Version of the Helm Chart that you supply to the DeployHub Plugin for the _Component_. |
| ChartNamespace | Namespace to use for the Helm Chart that you supply to the DeployHub Plugin for the _Component_. |
| operator | RedHat Operator that you supply to the DeployHub Plugin for the _Component_.|
| DockerBuildDate | Timestamp of when the container was created. |
| DockerSha | Container Digest of the container pushed to the container registry. |
| DockerTag | Container Tag of container in the registry. |
| DockerRepo | Container registry for where the container was pushed to. |
| GitCommit | Git Commit that trigger the CI Job process. |
| GitRepo | Git Repo associated with the CI Job. |
| GitTag | Git Tag associated with the CI Job. |
| GitUrl | Git URL of the repository associated with the CI Job. |

The DeployHub Plugin will save this data as part of the _Component Version_.  This save happens automatically after the plugin has created a new _Component Version_.

## Packaging _Components_ into _Application Versions_

The DeployHub Plugin will automatically maintain the _Application Version_ if the _Application_ Name and Version are supplied to the Plugin.  

If the _Application_ Name and Version are passed to the Plugin a new _Application Version_ will be created using the previous version as a starting point.  The Plugin uses a similar naming convention for _Application Versions_ as it does for _Component Versions_:

- Base name is the static part of the _Application_ Name.  For example: webstore.
- Variant is a high level place holder for that versions are created within. The Variant can be aligned with a feature or branch. For example: 50percent-sale.  Variant is not required.
- Version is the schemantic version number. For example, 1_2_10.

An _Application Base_ version must exist in order for the DeployHub Plugin to automatically create a new _Application Version_ when a new _Component Version_ is created.  The base version gives DeployHub the starting point to perform automatic _Application_ versioning.

DeployHub uses the <base name>;<schematic version number>;<version number> as the default format for the versioning schema.   The formatting is <base name>;<variant>;<schematic version number>;<version number> if a Variant is used.  The Plugin will automatically increment the version number base on last version found.

The Plugin will create a new _Application Version_ based on the last _Application Version_ and then replace the old _Component Version_ with the new _Component Version_.  The new _Component Version_ will be added if an old verion was not found.

### Deploying the _Application Version_

The DeployHub Plugin is executed a second time to perform the deployment. The _Application Version_ and _Environment_ are required for the deployment.  The deployment number will be returned to the Plugin and displayed in the Plugin output.

### Additional Plugin Features

**Approve**
The DeployHub Plugin will perform an Approval of an _Application_ Move.  This _Approve_  feature is used to reflect an approval that was done in the CI Pipeline in the _Application's_ audit trail.  

**Move**
The DeploHub Plugin will move the _Application_ from the _From Domain_ using the DeployHub _Move Task_.  This enables the _Application_ to move through the same pipeline steps that the CI-CD process is using.

**Assign**
The DeployHub Plugin will assign the _Components_ to an _Application Version_ creating the _Application Version_ if it does not exist.  This _Assign_ feature is used to associate _Component Versions_ to an _Application Version_ in bulk from the CI proccess.  

**Export**
The DeployHub Plugin will export all of the objects contained in a _Domain_ and all of the _Sub-domains_.  The output is json data formated for the _Import_ feature.  This _Export_ feature enables sharing of a _Domain_ from one DeployHub install to another. 

**Import**
The DeployHub Plugin will import all of the objects contained in the json export file.  The objects will be created in the _To Domain_ specified.  The new _Domain_ hierarchy will be created on-the-fly if it doesn't exist.
