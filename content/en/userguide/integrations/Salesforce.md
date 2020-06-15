---
title: "SalesForce"
linkTitle: "SalesForce"
weight: 70
description: >
  Deploying SalesForce objects with DeployHub.
---

Salesforce offers a SaaS where customers use and customize applications using class and package files. Developers create and store these class and package files into various _Repositories_ such as Git and then deploy them into Salesforce for a company's Salesforce based applications.

Salesforce offers different regions such as testing, preproduction, etc., where the class and package files can be deployed prior production.

## Creating the Salesforce Action

### Importing the Procedures and Functions

 You will need to import the most current GitCheckout, RunAnt, SalesforceCredential and SalesforceDeploy _Procedures_/_Functions_ from GitHub.

- **GitCheckout.re** - This _Procedure_ clones the repo to the _Dropzone_ and then checks out the commit, branch or tag specified.

- **RunAnt.re** - This _Procedure_ runs Ant

- **SalesforceCredential.re** - This _Procedure_ exposes the credential for the Salesforce Deploy _Procedure_

- **SalesforceDeploy.re** - This Procedure executes Ant against a dymanically created build.xml file to upload the classes to Salesforce.

Download them from:

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.

## New Action for the Ansible Playbook

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "AnsiblePlaybook" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the three Procedures. Drag them onto the area under _Start._   The order should be _GitCheckout_, _SalesforceCredential_, and _SalesforceDeploy_.  _RunAnt_ is reference by the _SalesforceDeploy_ procedure and does not need to be included in the Action.

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Custom Action field_ of a _Component_ as part of an _Application_ deployed to a Salesforce region.

### _GitCheckout_ Parameters

| _**Field**_ | Value | Description |
| --- | --- | --- |
| _**Title**_ | Not Required |
 |
| _**Summary**_ | Not Required |
 |
| _**Git Repo**_ | $GIT_URL| Repo containing the Playbook |
| _**Git Commit**_ | $GIT_COMMIT | The commit, tag or branch to checkout |
| _**To Dir**_ | $GIT_DIR | The directory to checkout into.  Use "." for the default directory |

### _SalesforceCredential_ Parameters

| Argument | Description |
|--- | --- |
| Credential Name | Name of the Credential to use for the Salesforce Deployment |

### _SalesforceDeploy_ Parameters

| Argument | Description |
|--- | --- |
| User | Taken from the SalesForceCredential _Procedure_.|
| Password | Taken from the SalesForceCredential _Procedure_|
| ServerUrl | The Salesforce region to be deployed to. |
| Repo | The _Repository_ where the class and packages exist, typically a filesystem type _Repository_.|
| TestLevel | When test cases are run, which level (All, Some, etc.). |

### Global Variables

The following Global variables must be used as Attributes within any Components used to deploy files to Salesforce regions:

| Variables | Description |
|--- | --- |
| ${GIT_URL} | git url for the repo. Used in the clone step executed by the procedure.|
| ${GIT_COMMIT} |The commit hash for the version to be checked out from the repo.|
| ${GIT_DIR}| The temporary directory used to clone and checkout into. This should be a known name so the_Repository_for the_Component_ can find the files.|

The following Global variables must be used as attributes within any _Environments_ that are used for the purpose of deploying files to Salesforce regions:

| Variables | Description |
|--- | --- |
| ${SalesforceCredential}| Name of the credential that contains the Salesforce Userid and Password.
|${ServerURL} |Salesforce URL for the target deployment.
 ${SalesforceRepo} | Local repository name pointing to the location in which the git step placed the files in.|
| ${TestLevel} | Salesforce Test Case Level.|

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
