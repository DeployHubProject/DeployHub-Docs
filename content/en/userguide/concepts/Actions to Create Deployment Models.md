---
title: "Actions for Deployment Templates"
linkTitle: "Actions for DeployHub Templates"
weight: 6
description: >
  Using Actions to Create Reusable Deployment Templates.
---

## Creating Reusable Deployment Templates with Actions

DeployHub comes with a set of reusable _Actions_ that can be invoked at various points in the deployment of a _Component_. For example, when deploying your Container _Components_, your _Action_ will call a Helm chart _Activity_. 

An _Action_ is a selection of _Activities_ which are executed in sequence in order to provide the unique logic required for the deployment of each _Component_. _Actions_ are created with a graphical editor by simply dragging and dropping the _Activities_ you want to use in the order you want to use them. On save, a new _Action_ will be created.

In addition, a _Custom Action_ can replace the usual Deployment Engine processing by calling an external deployment engines or scripts that perform their own deployment activities.


###  Procedures and Functions

_Actions_ can call _Procedures_ and _Functions_. A _Procedures_ will run a process.  A _Function_ will run a process and return data. 

A Procedure or Function can be defined as:

- An "external" script running locally to the DeployHub Server.
- An "external" script running on the _Endpoint_ to which the deployment is taking place.
- An "external" script which is located locally to the DeployHub Server but which is "pushed" to the Target _Endpoint_ automatically and execute there.

These _Procedures_ and _Functions_ can be:

- Written in DMScript (DeployHub's Deployment Scripting Language). DMScript ships with several pre-installed _Procedures_ and _Functions_. You can also create custom _Procedures_ and _Functions_ and add them to the _Activities_ that can be used when creating a _Components_ installation logic. See the [DMscript Chapter](/userguide/dmscript/) for detials. 

- A script written in any scripting language supported by the Deployment Engine's operating system and held locally to the Deployment Engine.

- A script written in any scripting language supported by the target _Endpoint's_ operating system and located on the target Endpoint.

- A script written in any scripting language supported by the target _Endpoint's_ operating system and held locally to the Deployment Engine. When invoked, the script is automatically copied to the target _Endpoint_ and executed there.

For more information on _Actions_, _Procedures_ or _Functions_ see the [Customize Your Actions Chapter.](/userguide/setup/2-define-your-actions/)







