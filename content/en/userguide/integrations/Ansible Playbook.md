---
title: "Ansible Playbook"
linkTitle: "Ansible Playbook"
weight: 50
description: >
  Using Ansible Playbook to execute deployments as an Action.
---

Ansible Playbook is a private or community Playbook that installs files and executes commands on an _Endpoint_.  This Playbook is associated to a _Component_ or _Application_ as a pre, post or custom _Action_.  During the execution of the _Action_, the Playbook is fetched from the Git repo into the _Dropzone_ using the _Credentials_ provided, then the Playbook run with _Attributes_ from the _Application_, _Environment_, _Endpoint_ and _Component_ levels.  The results of the Playbook are included in the deployment log.

## Creating the Ansible Playbook Action

### Importing the Procedures

 You will need to import the most current Git, WriteEnv2File and RunAnsiblePlayBook Procedures from GitHub.

- **GitCheckout.re** - This _Procedure_ clones the repo to the _Dropzone_ and then checks out the commit, branch or tag specified.

- **WriteEnv2File.re** - This _Procedure_ writes the _Attributes_ to a file that will be used by the Playbook.

- **RunAnsiblePlayBook.re** - This Procedure executes the Playbook using variables file created by _WriteEnv2File_.

Download them from:

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the DeployHub.

## New Action for the Ansible Playbook

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "AnsiblePlaybook" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the three Procedures. Drag them onto the area under _Start._   The order should be _GitCheckout_, _WriteEnv2File_, _RunAnsiblePlaybook_

### _GitCheckout_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **Git Repo** | $GIT_URL| Repo containing the Playbook |
| **Git Commit** | $GIT_COMMIT | The commit, tag or branch to checkout |
| **To Dir** | $GIT_DIR | The directory to checkout into.  Use "." for the default directory |

### _WriteEnv2File_ Parameters

No fields are required for _WriteEnv2File_.

### _RunAnsiblePlaybook_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **RspFile** | $RspFile | The results from the WriteEnv2Toml.re Procedure |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values. Because this new Action is reusable, no Component variables are defined.

### Assign the AnsiblePlaybook Action to a Component

For each Component you will need to define the variable values. Values are specified when you create a new File _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from DeployHub will be passed along to the Playbook at execution time.

or more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
