---
title: "WebSphere"
linkTitle: "WebSphere"
weight: 78
---
## WebSphere

A DeployHub deployment can point to one or more _Repositories_ which contain the artifacts (.ear, .jar, and .war files) that make up a WebSphere application. These are referenced in DeployHub by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. A _Post Action_ is then executed which deploys these artifacts into WebSphere. The user creates the _Action_, which itself contains _Procedures_. The Procedure defined to the _Action_ for a WebSphere deployment is called &quot;WebSphereDeploy.&quot;

## Define Your WebSphere Action

- From the _Flows_ Menu, select the _Actions_ tree view.
- Right click on your _Domain_ and select &quot;_New Action in this Domain_.&quot;
- Create a new _Action_.
- Once your _Action_ is created, go to the _Workflow_ tab.
- Find the &quot;WebSpheredeploy&quot; _Procedure_ from the _Activities_ tree view on the right.
- Drag it out to your design pallet.
- To use the &quot;WebSphereDeploy&quot; _Procedure_, enter the parameters unique to your WebSphere application.

## Variables in Parameters

You can use variables in the Parameters fields. The use of variables enables your deployment to adapt across Components and your continuous delivery pipeline. Hard coded values are not recommended. The values for the variables are defined as attributes to Components, Applications, Environments and Endpoints. To resolve the variables, you define them at these higher levels. For example, a database connection that is unique to an Environment can be defined at the Environment level.
