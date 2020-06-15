---
title: "WebSphere"
linkTitle: "WebSphere"
weight: 78
description: >
  Executing deployments requiring a WebSphere Server.
---

## WebSphere

A DeployHub deployment can point to one or more _Repositories_ which contain the artifacts (.ear, .jar, and .war files) that make up a WebSphere application. These are referenced in DeployHub by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. A _Post Action_ is then executed which deploys these artifacts into WebSphere. The user creates the _Action_, which itself contains _Procedures_. The Procedure defined to the _Action_ for a WebSphere deployment is called "WebSphereDeploy."

## Define Your WebSphere Action

- Go to the _Actions_ List View from the _Action_ menu..
- Select the +Add option at the top of the List View.
- Complete the general detial information for the _Action_.
- Once your _Action_ is created, go to the _Workflow_ section.
- Find the "WebSpheredeploy" _Procedure_ from the _Activities_ tree view on the right.
- Drag it out to your design pallet.
- To use the "WebSphereDeploy" _Procedure_, enter the parameters unique to your WebSphere application.

## Variables in Parameters

You can use variables in the Parameters fields. The use of variables enables your deployment to adapt across Components and your continuous delivery pipeline. Hard coded values are not recommended. The values for the variables are defined as attributes to Components, Applications, Environments and Endpoints. To resolve the variables, you define them at these higher levels. For example, a database connection that is unique to an Environment can be defined at the Environment level.


For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/) 
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)