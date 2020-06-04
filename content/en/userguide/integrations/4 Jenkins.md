---
title: "Jenkins"
linkTitle: "Jenkins"
weight: 68
---

## Plug-In for Jenkins

The pre and post logic of DeployHub gives a tremendous amount of flexibility, whether used alone or in tandem with Jenkins as a plug-in. An A_pplication_ is deployed to an _Environment_ which contains one or more _Endpoint_s. An _Application_ contains _Components_, which in turn contain _Components__Items_, which access _Repositories_ that contain all the files that are deployed. Both _Application_s and _Components_ also contain _Procedures_ and _Functions_, which can be executed before and after each _Application_ deployment, and each _Components_ contained within it.

Jenkins can call DeployHub in the process, enabling Jenkins to deploy files, which are typically the result of a compile step. The plug-in is displayed in the Jenkins Configure window to see what is required from DeployHub. The basic configuration, which shows under the title "_Use DeployHub to run a deployment_", includes the following:

| Username and Password | Determines security access to the various objects within DeployHub, including the Applications and Components that are available from the Jenkins Plug-In. |
| --- | --- |
| Target Environment | A DeployHub Environment contains all the Endpoints that will be deployed to. |
| Application | A DeployHub Application contains all the Components that make up a deployment. It is deployed against an Environment. |
| Wait for Deployment to Complete | This tells Jenkins to wait until DeployHub is finished with the deployment before moving on to the next step in the Job. If this option is chosen, the remaining steps in the Job will only run if the deployment was successful. If left unchecked, Jenkins will continue to the next step in the Job as soon as DeployHub begins the deployment and ignore the success or failure of the deployment. |

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