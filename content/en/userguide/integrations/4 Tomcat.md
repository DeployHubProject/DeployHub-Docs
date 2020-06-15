---
title: "Tomcat"
linkTitle: "Tomcat"
weight: 74
description: >
  Executing deployments requiring a Tomcat Server.
---

## Tomcat Integration

_Actions_ for Tomcat Windows servers are pre-defined within DeployHub.  _Pre_ and _Post_ _Actions_ at the _Application_ definition level are used for stopping and starting the Tomcat server. 

## Define Your Tomcat Action to Your Component

- From the _Actions_ List View, select the +Add option. 
- Create a new _Action_.
- Once your _Action_ is created, go to the _Workflow_ section.
- Open the Tomcat folder from the _Activities_ tree view on the right.
- Find the "_Tomcat Pre Deploy_" _Procedure_ from the tree view.
- Drag it out to your design pallet.
- To use the "_Tomcat Pre Deploy_" _Procedure_, enter the parameters unique to your Tomcat application.

Repeat the same steps for creating your "_Tomcat Post Deploy_" _Action_. Connect the "_Tomcat Pre-Deploy_" _Procedure_ to the "_Tomcat Post Deploy_" to create your flow logic.

## Variables in Parameters

You can use variables in the _Parameters_ fields. The use of variables enables your deployment to adapt across _Components_ and your continuous delivery pipeline. Hard coded values are not recommended. The values for the variables are defined as attributes to _Components, Applications, Environments_ and _Endpoints_. To resolve the variables, you define them at these higher levels. For example, a database connection that is unique to an _Environment_ can be defined at the _Environment_ level.


For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/) 
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)