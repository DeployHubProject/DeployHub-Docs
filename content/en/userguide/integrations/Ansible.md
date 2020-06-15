---
title: "Ansible Galaxy Roles"
linkTitle: "Ansible Galaxy Roles"
weight: 50
description: >
  Using Ansible to execute deployments as an Action.
---

Ansible is an agentless Infrastructure configuration management solution that automates cloud provisioning and infrastructure level deployments. Ansible consists of Galaxy Roles, which are reusable playbooks that perform different infrastructure operations. Galaxy Roles contain Tasks, which are the individual commands executed, performing operations such as installing a package or creating a directory. Playbooks are written in programming language called YAML, while Modules (a more complicated type of Task) can be written in any language.

When starting DeployHub, the most popular and most used Modules are downloaded from the Ansible website at [https://galaxy.ansible.com](https://galaxy.ansible.com/) and placed as _Custom Actions_ into _Components_.

If you have used a Galaxy Role as a _Component_ in a previous deployment, a new _Version_ of the Galaxy Role will be created, if upon start-up DeployHub determines the Galaxy Role has updates.

In Ansible is an Inventory which lists endpoints that Ansible will execute Modules against. This is a static text file containing the names of hosts on the network. In DeployHub, an Inventory is created whenever an _Application_ is associated with an _Environment_. The information is gathered from each DeployHub _Endpoint_ within the _Environment_ and placed into the Inventory prior to execution of each _Component_ within the _Application_.

## Adding Components Containing Ansible Modules to an Application

- Go to the _Components_ menu which will take you to the _Component_ List View.
- Click on the plus sign for the Infrastructure Domain within the tree structure. This contains all Categories containing _Components_ that have a _Custom Actions_, each of which contains an Ansible Module. After selecting the _Application_ tab and opening a _Domain_, click on the _Assigned Components_ tab in order to see the workflow area containing the _Components_ for a given _Application_. On the far right are all available _Component_ Categories, each of which contains one or more _Components_. Click on the plus sign for a Category in order to see all _Components_ listed within it. Drag and drop the desired _Component_ onto the workflow area and make sure it connects to either the Start icon or to another _Component_.

Right click on the _Component_ and select the 'Go to this Component' item in the resulting drop-down list. The General tab shows the _Custom Action_ field in the _Component_. This allows an Ansible Module to be run from anywhere within a DeployHub deployment. Notice that the Action is given the same name as the _Component_, with a suffix of '_action'.

Click on the _Custom Action_ in order to go to the Workflow tab in the Actions tab. Notice that the _Action_ appears in the Workflow, and allows the entry of values into variables If these need to be changed at any time, right click on the _Action_ in the Workflow and select 'View Details' from the resulting dropdown list.

Click OK, and go to the Procedure by right clicking on the Module in the Workflow and selecting 'Goto this Procedure' in the resulting dropdown list. The Procedure for the Custom _Action_ will be shown, which the user can change if necessary

For more information see:

- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
