---
title: "SalesForce"
linkTitle: "SalesForce"
weight: 70
---
## SalesForce Integration

Salesforce offers a SaaS (Software as a Service) model where customers use and customize applications using class and package files. Create and store these into various _Repositories_ such as Git and then deploy into Salesforce for a company's Salesforce based applications.

Salesforce offers different regions such as testing, preproduction, etc., where the class and package files can be deployed prior production.

## Installation Instructions

First import the Salesforce Procedures into DeployHub and configure your Salesforce deployment, follow these instructions:

- Go to the following Google Groups website: [https://groups.google.com/forum/#!categories/deployhub-project](https://groups.google.com/forum/%23!categories/deployhub-project)

- Click on the DeployHub Salesforce Deploy Action.

- At the bottom of the page, there are 6 files. Download all of these except SalesForceDeployAction.png to a folder locally.

## Install into DeployHub

- Click on the Flows menu.
- Click on the _Functions and__Procedures_ tab.
- Click on a _Domain_ and select "_Import a Function or Procedure into this Domain_".
- Click the "Choose File" button to navigate to the directory where the 5 files are located, 4 of which have an extension of .re.
- Select the RunAnt.re file and click the Open button.
- Click on the Import button.
- Do the same for the GitCheckout.re, SalesForceDeploy.re, and _SalesforceCredential.re_ files.
- Move the git-checkout file to the $HOME/scripts directory on the location where DeployHub is installed.

NOTE: Double clicking SalesForceDeployAction.png will show the arrangement of the GitCheckout, SalesForceDeploy, and SalesforceCredential Procedures within the SalesForceDeploy Action as will be described later.

Notice there are now four new _Procedures_ in the _Domain_ named "RunAnt" and "GitCheckout," under the Deploy Category, as well as "SalesForceDeploy" and "SalesforceCredential," under the SalesForce Category.

The _SalesforceCredential Procedure_ is of the type "_DMScript Procedure in Database_". It contains _DMScript_ code that takes the username/ password of the named _Credential_. It's a single argument and therefore uses the same username/ password to access a Salesforce region (test, prod, etc.)

The _GitCheckout Procedure_ is of the type "_Procedure provided by local external script or program_". It has the following arguments:

- GitRepo: The URL to the Git repository.
- GitCommit: The version/commit to check out.
- ToDirectory: Where files will be checked out to, a directory on the same server where DeployHub is installed.

The _RunAnt Procedure_ is of the type "_Procedure provided by local external script or program_". It has the following arguments:

- BuildFile: The Ant XML Build, which is a configuration file containing Ant tasks that are to be executed.
- Target: Which target in the build file will be used when Ant is run. It references a group of tasks i.e., build, test, install, etc.

The _SalesforceDeploy__Procedure_ is of the type "_DMScript Procedure in Database_". It contains _DMScript_ that deploys classes and packages into Salesforce regions (test, production, etc.). It has the following arguments:

- User: Taken from the _SalesForceCredential Procedure_.
- Password: Taken from the _SalesForceCredential Procedure_.
- ServerUrl: The Salesforce region to be deployed to.
- Repo: The _Repository_ where the class and packages exist, typically a filesystem type _Repository_.
- TestLevel: When test cases are run, which level (All, Some, etc.).

## Create Salesforce Deployment Action

- Create the _Action_ to be used to deploy to Salesforce by right clicking on the _Actions_ tab in the same _Domain_ as the _Procedures._
- Select "_New Action in this Domain_".
- In the _Workflow_ tab, scroll down the _Activities_ list on the right side and click on the plus sign next to the Salesforce Category.
- Click and drag the _Procedure_ that was just created named "GitCheckout" onto the Workspace.
- Repeat with the _Procedures_ named "SalesforceCredential" and "SalesForceDeploy," in that order.

The following Global variables must be used as Attributes within any Components used to deploy files to Salesforce regions:

- ${GIT\_URL} = git url for the repo. Used in the clone step executed by the procedure.
- ${GIT\_COMMIT} = the commit hash for the version to be checked out from the repo.
- ${GIT\_DIR} = temporary directory used to clone and checkout into. This should be a known name so the _Repository_ for the _Component_ can find the files.

The following Global variables must be used as attributes within any _Environments_ that are used for the purpose of deploying files to Salesforce regions:

- ${SalesforceCredential} = name of the credential that contains the Salesforce Userid and Password.
- ${ServerURL} = Salesforce URL for the target deployment.
- ${SalesforceRepo} = local repository name pointing to the location in which the git step placed the files in.
- ${TestLevel} = Salesforce Test Case Level.

The _Action_ can now be placed into the _Custom Action field_ of a _Component_ as part of an _Application_ deployed to a Salesforce region.
