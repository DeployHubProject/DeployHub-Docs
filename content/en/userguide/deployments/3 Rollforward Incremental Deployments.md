---
title: "Roll Forward / Rollback Deployments"
linkTitle: "Roll Forward / Rollback Deployments"
weight: 7
description: >
  Incremental Roll Forward and Rollbacks.
---

## Roll Forward Incremental Deployments

Whenever a deployment has a problem, the concept of Roll Forward and Rollback comes into play. Complex situations exist for deploying higher and lower versions of _Applications_ and their _Components_, such as with databases. DeployHub deals with these issues with Roll Forward and Rollback using _Component Items_ within _Components_.

Roll Forward allows DeployHub to apply _Component Items_ to _Endpoints_ incrementally and in order. As DeployHub advances through each _Application__Version_. Each _Component_ within each _Application_ is advanced as well and then each _Component Item_ within it is deployed.

A one-time deploy that doesn't use Roll Forward would be used, for instance, wherever there are binary files to be placed into directories. All the changes will then exist in the latest version of the files themselves, and you can simply replace whatever version of the files are currently there.

Rollback allows DeployHub to return databases and files to a previous state, one _Application_ at a time in reverse order, applying Rollback logic as well as scripts as it goes.

## Setting Roll Forward to On

Typically, the _Application_ being deployed is only one _Version_ higher than the one currently on the _Endpoint(s),_ but occasionally the need arises to deploy an _Application_ that is several _Versions_ higher than the current one. This can be the case where one or more new _Endpoints_ have been added to an _Environment_ and one or more software applications need to be brought up to the same _Version_ as all of the other _Endpoints_. _Applications_ are examined by DeployHub individually, from the next highest _Version_ than the one currently residing on each _Endpoint_, to the higher one being deployed (assuming that a higher version is being deployed. A lower version may be deployed, in which case Rollback comes into play, described below). DeployHub loops through each _Application_, then each _Component_, and finally, each _Component Item_. Each _Component Item_ within a _Component_ is deployed to each _End Point_ in the _Environment_, as long as both of the following conditions apply:

- The Always Deploy checkbox is checked in the _Component_ which contains it, or if the _Component_ is a later version than the one on the _Endpoints_ (according to the RE database).
- The Component Item's Rollforward dropdown list set to On.

## Setting Roll Forward to All

Setting Roll Forward to All causes DeployHub to behave exactly as if it were set to On, with the exception that the _Component Items_ within the current _Application_ that exists on each _Endpoint_ are also deployed, as opposed to starting with the next highest version.

## Setting Rollback to On

Sometimes the need arises to install a previous version of an _Application_, such as when bugs are discovered in an earlier version of a production environment. In this case, the _Applications_ are examined by DeployHub one at a time, from the next lowest version that resides on each _Endpoint_, to the lower one being redeployed. Rollback causes DeployHub to loop backward through each _Application_, then each _Component_, and finally, each _Component Item_. Each _Component Item_ within a _Component_ is deployed to each _End Point_ in the _Environment_, as long as both of the following conditions apply:

- The Always Deploy checkbox is checked in the _Component_ which contains it.
- The Component Item's Rollback dropdown list set to On.

## Setting Rollback to All

Setting Rollback to All causes DeployHub to behave exactly as if it were set to On, with the exception that the current _Application_ that exists on each _End Point_ is also deployed, as opposed to starting with the next lowest version (which happens when Rollback is set to On).

Keep in mind that all pre and post Actions are performed for every _Application_ and _Component_, regardless of whether the operation is Roll Forward, Rollback, an initial deployment, or an incremental deployment.
