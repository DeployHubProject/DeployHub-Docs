---
title: "Intro to Applications"
linkTitle: "Intro Applications"
weight: 4
description: >
  Intro to Applications
---

## Application Base Versions and Versions

If you are an application developer, this will be where you do most of your work. _Applications_ are a main [Object](/userguide/concepts/1-deployhub-basic-concepts/#application-object) in DeployHub. They are a collection of _Components_ that can be deployed as a single software solution. You define an _Application_ by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned and deployed to _Environments_. _Applications_ are associated to a _Domain_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

An _Application_ and all objects within it will be deployed to one or more _Endpoints_ (each of which represents a container, physical or virtual server in the enterprise) in an _Environment_. DeployHub uses a back end versioning engine to track all _Application Version_ configurations. For this reason, each new version will be given a new version number.

For instance, your Application Base Version may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc.

## Applications and their Components

_Applications_ are defined by the _Components_ they consume. As with _Applications_, _Components_ have versions. If a new _Component_ is made available, DeployHub can be called by a continuous delivery tool to automatically create a new _Application Version_ each time a new build is detected.  For more information on this topic, see the [CD Engine Chapter](/userguide/pipeline/2-define-your-build-engines/).

When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ and Attributes from its predecessor. You can create a new _Application Version_ from any previous version.

## Applications and Tasks

_Tasks_ allow you to act upon _Applications_. _Tasks_ are defined at the _Domain_ level and will be available to all of the _Applications_ within the Domain as default _Tasks_.  _Tasks_ can also be called via your continuous delivery pipeline.  Common _Tasks_ integrated into continuous delivery are _Move Version_, _Approve_ and _Deploy_. All _Tasks_ are managed at the _Domain_ level.

| Task | Description |
| --- | --- |
| _**Move Version**_ | Moves an _Application Version_ from one _Life Cycle Sub-Domain_ to another. This is typically used as a promotion or a demotion of an _Application Version_ between your life cycle's _Environments_. When the _Task_ is defined, the _Life Cycle Sub-Domain_ must be specified as part of the _Task_ definition. If an _Approve Task_ exists in the same _Life Cycle Sub-Domain_ as the _Move Version Task_ and the _Approve Task_ points to the same _Target Domain_, then that _Approve Task_ has to have been executed for the selected _Application Version_ in order to approve the _Application Version_ for the _Target Life Cycle Sub-Domain_. If this has not been done, the _Move Version Task_ will fail when it is executed. In other words, the selected _Application Version_ has to be approved for the _Life Cycle Sub-Domain_ before the _Move Version_ will succeed if an _Approve Task_ has been defined. |
| _**Deploy**_ | Deploys an _Application Version_ to an _Environment._ The target _Environment_ is selectable via a drop-down list. |
| _**Request**_ | Often times you may need to run a _Task_ but you don't have access to it. A _Request Task_ is used in this situation to ask other _Users_ with access to the _Task_ to run it. When the _Request Task_ is executed an entry is placed into the "To Do" list of all the _Users_ who are members of the _UserGroups_ which have execute access to the _Linked Task_. When the _Linked Task_ is executed by one of the _Users_ with access, the request is removed from all the _Users_ "To Do" lists. The _Request Task_ can have a _Request Notification Template_ defined. This sends out a notification to the appropriate _UserGroups_ letting them know that the requested Task needs to be performed. NOTE: **DeployHub Team** has only 2 UserGroups, Administrators and Users. If more UserGroups are required, you will need to upgrade to **DeployHub Pro**. |
| _**Approve**_ | Approves a _Request Task_ or _Move Version Task_ so that its linked _Task_ can be executed within a specified _Life Cycle Sub-Domain_. For example, a _User_ that belongs to a _Group_ with the authority, via a _Move Task_, to move a particular _Application_ to a specified _Life Cycle Sub-Domain_ can do so, but a _User_ in a _Group_ that has not been assigned the authority for this _Move Task_ must request approval from someone in a _Group_ that does have the authority. When the _User_ with the authority receives the request, that _User_ can run an _Approval Task_, which will then allow a _User_ with access to move the _Application_ to the target _Life Cycle Sub-Domain_. Keep in mind, if an _Approval Task_ exists within a _Domain,_ it must be run before any _Move Tasks_ can be executed to move an _Application Version_ into the specified _Domain_. NOTE: **DeployHub Team** has only 2 UserGroups, Administrators and Users. If more UserGroups are required, you will need to upgrade to **DeployHub Pro**.|
| _**Run Action**_ | Runs a stand-alone _Action_. It will be available only in the _Domain_ where it is created, unless the "Available in Subdomains" checkbox is selected. The _Task_ can be selected by right clicking on the _Domain_ or _Life Cycle Sub-Domain_ or by right clicking on an _Application._ In the latter case, the selected _Application_ is automatically placed onto the stack where it is available for the _Action_ to process. |

## Applications and Iterative Deployments

 Whenever an _Application_ is deployed, DeployHub determines the deployment status of each _Component_ contained within the _Application_.  It does this by comparing it to which _Components_ are already on the associated _Endpoint_. Only if the _Component Version_ differs - or the _Component_ is set to _Always Deploy_ - is the _Component_ deployed to the _Endpoint_. This delta processing allows DeployHub to perform iterative deployments accurately.

Any _Version_ of an _Application_ can be deployed if it has been assigned the _Deploy Task_. If you are pushing continuous deployments across the pipeline, each new incremental _Version_ will be rolled forward. You may want to 'jump' a _Version_ in an _Environment_; for example, Production wants the latest _Version_, but Production rejected the last 4 release candidates. In this case, you can specify the precise _Version_ required, and DeployHub's versioning engine will accurately deal with the incremental changes. Alternatively, an _Application_ can also be deployed that has a lower _Version_ than the one currently residing in a target _Environment_, for instance when a problem has been discovered and a Rollback is needed. Roll Forward, Rollback, and Version Jumping can be done between any _Application Versions_ or _Component Versions_.
