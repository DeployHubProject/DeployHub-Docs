---
title: "SalesForce"
linkTitle: "SalesForce"
weight: 70
description: >
  Deploying SalesForce objects with DeployHub.
---

Salesforce offers a SaaS where customized applications can be developed using class and package files. Developers create and store these class and package files into various source repositories, such as Git,  and then deploys them into Salesforce to be executed. Salesforce offers different regions such as testing, pre-production, production, where the class and package files can be deployed.

The following directions allows you to import pre-written _Procedures_ downloaded from the Ortelius Open Source Project.  You will create an SalesForce _Custom Action_ that can then be referenced when you create your SalesForce _Component_.

## Create a SalesForce Repository

A Filesystem DeployHub _Repository_ is used to reference files pulled from Git.  For this reason, you will need to create a DeployHub FileSystem _Repository_.  To create this _Repository_ see the [Connect Your Repositories](/userguide/first-steps/2-define-repositories/) section.

## Create a SalesForce Credential

You will need a DeployHub _Credential_ to login to Salesforce for the deployment step.  See the [Create Your Credentials](/userguide/first-steps/2-define-your-credentials/) section.

## Create a SalesForce Environment and EndPoint

You will need to create an _Endpoint_ and then an _Environment_ for your SalesForce deployment. You can create as many _Environments_ as needed based on your SalesForce Regions. See the [Define Your Endpoints](/userguide/first-steps/2-define-endpoints/] and [Build Your Environments](/userguide/first-steps/2-define-environments/) sections for more information.  The following parameters should be used when defining your _Environment_.

**Endpoint Settings**
Create an _Endpoint_ that is set to "localhost" for the Hostname.

**Set Your SalesForce _Environment_ Attributes**

| Variables | Description |
|--- | --- |
| ${SalesforceCredential}| Name of the credential that contains the Salesforce Userid and Password.
|${ServerURL} |Salesforce URL for the target deployment.
 ${SalesforceRepo} | Local repository name pointing to the location in which the git step placed the files in.|
| ${TestLevel} | Salesforce Test Case Level.|

## Import Your SalesForce _Procedures_ from GitHub

You will need to import the most current GitCheckout, RunAnt, SalesforceCredential and SalesforceDeploy _Procedures_/_Functions_ from the Ortelius Open Source GitHub Project at: 

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

The following _Procedures_ need to be retrieved: 

- **GitCheckout.re** - This _Procedure_ clones the repo to the _Dropzone_ and then checks out the commit, branch or tag specified.

- **RunAnt.re** - This _Procedure_ runs Ant

- **SalesforceCredential.re** - This _Procedure_ exposes the credential for the Salesforce Deploy _Procedure_

- **SalesforceDeploy.re** - This Procedure executes Ant against a dymanically created build.xml file to upload the classes to Salesforce.

Once downloaded, you will need to use the "Import" option at the top of the _Func/Procs_ List View to import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_ menu item on the left hand side of the main DeployHub panel.  From the list view select the **Import** option. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.

## Define a New SalesForce _Custom Action_

Once you have imported your _Procedures_, you can define your _Action_. To create a New _Action_ see the [Customize Your Actions](/userguide/customizations/2-define-your-actions/) section.  

Name the new Action "SalesForceAction" (no spaces).

Now we are going to customize this _Action_. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your _Domain_ to find the three Procedures. Drag them onto the area under 'Start.' The order should be _GitCheckout_, _SalesforceCredential_, and _SalesforceDeploy_.  _RunAnt_ is reference by the _SalesforceDeploy_ procedure and does not need to be included in the _Action_.

At this point the Action is ready to be used by anyone with access (based on the _Domain's_ Access options). Each _Component_ that uses the _Action_ will need to define specific values.
The _Action_ can now be placed into the _Custom Action field_ of a _Component_ as part of an _Application_ deployed to a Salesforce region.

**GitCheckout Parameters**

| _**Field**_ | Value | Description |
| --- | --- | --- |
| _**Title**_ | Not Required | The name of the step. |
| _**Summary**_ | Not Required | Description of the step.  |
| _**Git Repo**_ | $GIT_URL| Git Repo containing the SalesForce Source Code.|
| _**Git Commit**_ | $GIT_COMMIT | The commit, tag or branch to checkout. |
| _**To Dir**_ | $GIT_DIR | The directory to checkout into.  Use "." for the default directory. |

**SalesforceCredential Parameters**

| Argument | Description |
|--- | --- |
| Credential Name | Name of the Credential to use for the Salesforce Deployment |

**SalesforceDeploy Parameters**

| Argument | Description |
|--- | --- |
| User | Taken from the SalesForceCredential _Procedure_.|
| Password | Taken from the SalesForceCredential _Procedure_|
| ServerUrl | The Salesforce region to be deployed to. |
| Repo | The _Repository_ where the class and packages exist, typically a filesystem type _Repository_.|
| TestLevel | When test cases are run, which level (All, Some, etc.). |

## Create Your SalesForce _Component_

Now that you have defined your SalesForce _Custom Action_ you are ready to create your SalesForce _Component_.  Use the following parameters at the _Component_ detail from the _Component_ Dashboard:

| **Parameter**|**Description**|
| ---| --- |
|**Repository**| Select your SalesForce Repository.|

### Set Your _Component_ Attributes

The following variables must be used as Attributes within any _Components_ used to deploy files to a Salesforce region:

| Variables | Description |
|--- | --- |
| **${GIT_URL}** | git url for the git repository. This is used in the git check out step executed by the SalesForce _Action_.|
|**${GIT_COMMIT}** |The commit hash for the version to be checked out from the git repository.|
|**${GIT_DIR}**| The temporary directory is used by git to clone and checkout. This parameter should be a directory defined in a DeployHub _Repository_ for the_Component_ to find the files.|

You are now ready to assign your SalesForce _Component_ to an _Application_ and perform a deployment to one of the SalesForce _Environments_.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
