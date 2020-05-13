---
title: "Executing Deployments On-demand"
linkTitle: "Executing Deployments On-demand"
weight: 5
---
## Executing Deployments On-demand

An on-demand deployment can be initiated for an _Application_ or _Release_ using a _Deploy Task_. Tasks are _Domain_-specific DeployHub objects that can be created for performing actions on _Applications_ or _Release_. Once the _Deploy Task_ has been defined in the _Domain_, it will be available by right clicking on the _Application_ or _Release_ tree view. The _Deploy Task_ can run _Actions_ before and after the deployment, known as pre and post _Actions_, which can be used to customize each _Deploy Task._

NOTE: Releases are only available in **DeployHub Pro**. A Release is used to deploy multiple applications together, as in a Release Train.

To create a _Deploy Task_:

- Click on a _Domain_ in the tree structure and click on the Tasks tab on the right.
- Right click on the &#39;Tasks in this Domain&#39; area and a drop-down list will appear with options for the creation of seven different Tasks.
- Select &#39;Add _Deploy Task_&#39;.
- A new _Deploy Task_ will appear in the &#39;Tasks in this Domain&#39; area, with the name Deploy, followed by a hyphen and an incremented integer, i.e. Deploy-162.
- The name can be changed by clicking the General tab on the right, and again on the pencil icon on the upper right side of the resulting Task Detail section.
- A window appears with the name of the Task along with other fields such as Pre-Action and Post-Action.
- Click on these drop-down lists to see the names of _Actions_ that can be chosen to run before and after the execution of the _Deploy Task_.
- There are also two lists, &#39;Group Access&#39; and &#39;Available Groups&#39;, below the &#39;Tasks in this Domain&#39; and &#39;Task Detail&#39; areas.
- Click on a _Group_ in the &#39;Available Groups&#39; list and drag and drop it into the &#39;Group Access&#39; list in order to allow _Users_ in the selected _Group_ to run the selected _Deploy Task_.

NOTE: **DeployHub Team** has two Groups, Administrators and Users. If you need more granular User Groups, you will need to upgrade to **DeployHub Pro**.

To run a _Deploy Task_:

- Select the Deploy menu at the top, click on the Applications tab in the tree structure.
- Click on the plus sign (+) to the left of a _Domain_ in the tree structure to display all _Applications_ itcontains, and right click on the _Application._
- All Tasks for that _Domain_ will appear in a pop-up menu.
- Select a _Deploy Task_ from the menu to run. A window will appear with a drop-down list of _Environments_ to choose from.