---
title: "Jenkins"
linkTitle: "Jenkins"
weight: 68
description: >
  Calling DeployHub from Jenkins for microservice tracking.
---

## Plug-In for Jenkins

The pre and post logic of DeployHub gives a tremendous amount of flexibility, whether used alone or in tandem with Jenkins as a plug-in. Jenkins can call DeployHub to perform:

- Continuous Configuration Management: The process of automatically versioning microservices with their consuming _Applications_. Jenkins notifiies DeployHub when a new Job has been started at which point DeployHub pulls the build job information into DeployHub's database.
- Approvals: Track an Approval, with audit, between Jenkins and DeployHub.
- Moves:  Allows Jenkins to tell DeployHub to push a new update from one state to the next.
- Deploy: Allows Jenkins to tell DeployHub when the deployment needs to be executed.
- Shared Logs: Centralize logs between DeployHub and Jenkins.

| Name | Description |
|--- | --- |
| **Username and Password** | Determines security access to the various objects within DeployHub, including the Applications and Components that are available from the Jenkins Plug-In. |
| **Target Environment** | A DeployHub Environment contains all the Endpoints that will be deployed to. |
| **Application** | A DeployHub Application contains all the Components that make up a deployment. It is deployed against an Environment. |
| **Wait for Deployment to Complete** | This tells Jenkins to wait until DeployHub is finished with the deployment before moving on to the next step in the Job. If this option is chosen, the remaining steps in the Job will only run if the deployment was successful. If left unchecked, Jenkins will continue to the next step in the Job as soon as DeployHub begins the deployment and ignore the success or failure of the deployment. |

## Advanced Application Selection Options

## Use Advanced Version Selection

If this is checked, other options will appear that will allow you to take advantage of the capabilities that are available with _Application_s within DeployHub. These include:

## Find Latest Version

If an _Application_ Base Version has one or more _Application_ Versions associated with it, this will cause the deployment to use the latest _Application_ Version. Otherwise, the _Application_ Base Version will be used. Included with this is the optional Branch Name field. If this is filled in, the value will be used to determine the _Application_ Version to use based on the name of the Branch. Within DeployHub, _Application_ Versions can branch off from an _Application_ Base Version, and these branches can be given a name.

## If Latest Version is approved, create a new version

If this is checked, a new _Application_ Version is created once approved. _Application __Versions_ can only be formed by a _Create Version Tasks_. These can only be executed by Users with access to the _Domain_ or _Life Cycle Sub-Domain_ where the _Application_ Version and _Create Version Task_ are located. A User without access to a _Create Version Task_ can use a _Request Task_ for approval. A User with access to the _Domain_ or _Life Cycle Sub-Domain_ can execute an _Approve Task_, and the requesting User can then execute the _Create Version Task_. However, with the DeployHub plug-in within Jenkins, a new _Application__ Version_ is created if the following takes place:

- The "_If Latest Version is approved, create a new version_" checkbox is checked in the DeployHub plug-in in Jenkins.
- The _Create Version Task Name_ field, located below the "_If Latest Version is approved_" field, is filled in with the name of a _Create Version Task_ within DeployHub.
- A User has executed an _Approve Task_ against the _Create Version Task_ (a _Request Task_ is not required for an _Approve Task_ to be executed).

The newly created version is then deployed. The previous version is typically moved to another Lifecycle Domain within DeployHub. The Create Version Task action is executed regardless of which User executed the Approval Task.

NOTE: DeployHub Team has only two User Groups, Administrators and Users. Upgrade to DeployHub Pro if more granular User Groups are required. DeployHub Pro allows you to create as many different security groups levels as needed.

## Use Components Selection

If this is selected, the name of the _Components_ should be entered into the _Component_ Name field, otherwise an error will occur. By filling this in, a new _Component__Version_ is created if it's associated with an _Application_ that has been approved (see earlier explanation about approved _Application_s). Once this is done, attributes can be created for the _Components__Version_.

## Set Components Attributes

Attributes can be created and their values changed within the plug-in, and these are passed to DeployHub. Each attribute is similar to a variable in a programming language and has a Name and a Value. This helps with keeping track of Jenkins Builds, placing files into or retrieving files from directories and _Repositories_, and allows DeployHub to communicate with Jenkins during a build. A typical use for an attribute is to pass the Jenkins build number to DeployHub. The Jenkins global variable BUILD\_NUMBER is used for this, so that the Attribute Name could be BLD\_NUM, and the attribute value would be ${BUILD\_NUMBER}. DeployHub would then use the value passed as BLD\_NUM in order to store or retrieve files from a _Repository_, copy or retrieve files to a one of a series of directories named by build number, etc.

## Set Application Attributes

The _Add Attribute Button_ can be used to add as many _Components_ attributes as desired. Below that the Set _Application_ attributes allows the same thing for _Application_s.

## Accesing Jenkins

## Volume to access Jenkins build results

### Linux and OS/X

$ docker volume create --name jenkinsfs --opt type=nfs --opt device=:/var/jenkins/jobs --opt o=addr=192.168.0.101

### Volumes Used

jenkinsnfs:/jenkins is the Jenkins build results

~/.ssh:/keys:Z users ssh keys made visible to the container for credentials

### Start the container

$ docker run -d --hostname `hostname` -e CLIENTID=$CLIENTID -v jenkinsfs:/jenkins -v ~/.ssh:/keys:Z ${IMAGE}

## Notes

- NFS is share Jenkins Jobs directory
- DeployHub will see the Jenkins File System Repository as /jenkins

For more information see:
- - [Building Your Domain Catalog - Tasks in this Domain](/userguide/first-steps/2-defining-domains/)
- [Customizing Actions](/userguide/first-steps/2-define-your-actions/) 
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)


### Jenkins Build Engine

A Jenkins Build Job communicates with DeployHub, passing log and results. Any time a DeployHub deployment is performed from Jenkins, the _Application Version_ and _Environment_ are required, by name, i.e. Application;1, Environment. If the names are not unique, the domain name must be included, i.e. DomainName.Application;1.

## Jenkins _Build Jobs_ and Components

A Jenkins Build Job Run creates a Build Job Number stored in a DeployHub _Component_. A field named 'Last Build Number' is updated every time a Build Job is executed. The DeployHub Jenkins plug-in has a "notify only" mode for when a build has been done. Clicking on "Endpoints and Builds" will show all of the builds that have been done for that _Component_. Clicking on a Build Number will open a pop-up with the build log that has been pulled from Jenkins.

## Build Job Run

An execution of Jenkins is called a Build Job Run, and DeployHub can be called at any step during the execution. It can build files, call DeployHub to perform a deployment, build more files, call DeployHub again, etc. This can be done in any order, in separate runs, or all together.

Jenkins build logs can be viewed directly from inside the DeployHub URL, minimizing the amount of browser activity required. For example, a user can see a build artifact on a target _Endpoint_ and open the details of the generating build directly from the _Endpoint_ details page.

If the 'Always Deploy' flag is set to Yes on a Component, it makes no difference if the version of the Component is different or the same as the one on the _Endpoint_; the _Component_ is deployed to the _Endpoint_. If the 'Always Deploy' flag is set to No, the version on the _Endpoint_ and the version of the _Component_ must be different for the _Component_ to be deployed. However, even if the version on the _Endpoint_ and the version of the _Component_ are the same, if the Last Build Number in the _Component_ is different than the last build number in Jenkins, the _Component_ will be deployed.
