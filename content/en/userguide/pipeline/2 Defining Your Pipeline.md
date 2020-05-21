---
title: "Pipelines"
linkTitle: "Pipelines"
weight: 42
description: >
  DeployHub and your Pipeline Process.
---
## Pipelines

The Delivery Pipeline defines a continuous delivery process for driving continuous deployments. You can use DeployHub independent of a continuous delivery engine such as Jenkins Blue Ocean, GitLab, Bamboo, or GitHub Actions. Alternatively, you can integrate to these types of tools allowing DeployHub to manage the continuous deployment steps and report back to these tools, logs, and success/fail messages.

## Building your Delivery Pipeline

The Delivery Pipeline contains all information for _Life Cycle Sub-Domains_ concerning the deployment of _Applications_ and their movement development through production release. It is designed to show and keep track of the procession of _Applications_ through the continuous delivery pipeline, as well as the deployment of _Applications_ into _Environments_. Keep in mind that when dealing with software lifecycles within DeployHub, parent _Domains_ contain _Life Cycle Sub-Domains_, and these contain Applications and Environments. All Move, Deploy, and Request _Tasks_ discussed in this section are utilized in the tree structure by right clicking on the _Applications_ within Lifecycle Domains. The results are viewed in the Delivery Pipeline tab for the parent Domain.

The _Delivery Pipeline_ tab is only available in _Project Domains_ that contain _Life Cycle Sub-Domains_. _Applications_ can be moved forward or backward between Development, Test, and Production _Life Cycle Sub-Domains_, which have been arranged within the parent _Project__Domain_ in the correct continuous delivery pipeline order. Therfore, there could be three _Life Cycle Sub-Domains_ in the parent _Project Domain_ named appropriately, i.e. Dev, Test, and Prod, in that order.

## Delivery Pipeline Process

_Applications_ can be moved between _Life Cycle Sub-Domains_ with a _Move Task_. Any _User_ with access to that specific _Move Task_, which designates which _Project Domain_ the _Application_ can be moved to, can use it to move the _Application_. However, if there is an _Approval Task_ present in the _Project Domain_, you need approval before it can be moved to the next _Life Cycle Sub-Domain_ as designated by the _Approval Task_.

If a _User_ does not have access to the _Move Task_, that _User_ can make a _Request Task_. Then a _User_ with access to the _Request_ and _Move Tasks_ can grant access to the _Move Task_. The _Approval Task_ also designates which _Life Cycle Sub-Domain_ the _Application_ can be moved to, so that in order to move an _Application_, both the _Approval_ and _Move Tasks_ must designate the same destination _Life Cycle Sub-Domain_.

If an _Application_ has been approved by a _User_ with access to the _Approval Task_, it will appear in the boxes under the _Delivery Pipeline_ tab and will be shown with a green checkmark, and the _Application_ can then be moved to the designated _Life Cycle Sub-Domain_. If it has been rejected, it will be represented with a red 'X,' and it cannot be moved.

An _Application_ can be moved to another _Life Cycle Sub-Domain_ by right-clicking on the _Life Cycle Sub-Domain_ within the tree structure and then selecting the _Move Task_. Once it has been moved, it is represented with neither a checkbox or 'X.' These icons only work when moving forward. When moving backward through _Life Cycle Sub-Domains,_ there are no icons displayed in the boxes under the _Delivery Pipeline_ tab.

If an _Application_ is deployed, it appears in one of the lower boxes which represents the _Environment_ it was deployed to, and the _Application_ no longer appears in the upper box titled _Undeployed Applications_. _Environments_ are stacked vertically under the _Life Cycle Sub-Domains_ in which they belong.
