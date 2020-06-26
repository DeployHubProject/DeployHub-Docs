---
title: "Intro to Applications"
linkTitle: "Intro Applications"
weight: 4
description: >
  Intro to Applications
---

## Application Base Versions and Versions

 _Applications_ are a main [Object](/userguide/concepts/1-deployhub-basic-concepts/#application-object) in DeployHub. They are a collection of _Components_ that can be deployed as a single software solution. You define an _Application_ by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned and deployed to _Environments_. _Applications_ are associated to a _Domain_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

An _Application_ and all objects within it will be deployed to one or more _Endpoints_. (Each one represents a container, physical or virtual server in the enterprise in an _Environment_. A back-end versioning engine tracks all _Application Version_ configurations. For this reason, each new version will be given a new version number.

For instance, your Application Base Version may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc.

## Applications and their Components

_Applications_ are defined by the _Components_ they consume. As with _Applications_, _Components_ have versions. If a new _Component_ is made available, DeployHub can be called by a continuous delivery tool to automatically create a new _Application Version_ each time a new build is detected.  For more information on this topic, see the [CD Engine Chapter](/userguide/pipeline/2-define-your-build-engines/).

When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ and Attributes from its predecessor. You can create a new _Application Version_ from any previous version.

## Applications and Tasks

_Tasks_ allow you to act upon _Applications_. They are defined at the _Domain_ level and are available to all of the _Applications_ within the Domain as default _Tasks_.  _Tasks_ can also be called via your continuous delivery pipeline.  Common _Tasks_ integrated into continuous delivery are _Move Version_, _Approve_ and _Deploy_. All _Tasks_ are managed at the _Domain_ level. For more information on Tasks and _Domains_ see [Deployment Task](/userguide/first-steps/2-defining-domains/#deployment-tasks).

## Applications and Iterative Deployments

 Whenever an _Application_ is deployed, DeployHub determines the deployment status of each _Component_ contained within the _Application_.  It does this by comparing it to which _Components_ are already on the associated _Endpoint_. Only if the _Component Version_ differs - or the _Component_ is set to _Always Deploy_ - is the _Component_ deployed to the _Endpoint_. This delta processing allows DeployHub to perform iterative deployments accurately.

Any _Version_ of an _Application_ can be deployed if it has been assigned the _Deploy Task_. If you are pushing continuous deployments across the pipeline, each new incremental _Version_ will be rolled forward. You may want to 'jump' a _Version_ in an _Environment_; for example, Production wants the latest _Version_, but Production rejected the last 4 release candidates. In this case, you can specify the precise _Version_ required, and DeployHub's versioning engine will accurately deal with the incremental changes. Alternatively, an _Application_ can also be deployed that has a lower _Version_ than the one currently residing in a target _Environment_, for instance when a problem has been discovered and a Rollback is needed. Roll Forward, Rollback, and Version Jumping can be done between any _Application Versions_ or _Component Versions_.
