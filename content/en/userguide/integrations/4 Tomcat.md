---
title: "Tomcat"
linkTitle: "Tomcat"
weight: 74
---
## Tomcat Integration

_Actions_ for Tomcat Windows servers are pre-defined within DeployHub. A deployment points to one or more _Repositories_ with that application's artifacts. These are referenced by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. _Pre_ and _Post__Actions_ at the _Application_ level are used for Tomcat deployments. The _Pre Action_ stops the Tomcat instance, the _Post Action_ starts it. In between the start and stop, the _Components_ will deployed.

## Define Your Tomcat Action to Your Component

- From the _Flows_ Menu, select the _Actions_ tree view.
- Right click on your _Domain_ and select "_New Action in this Domain_."
- Create a new _Action_.
- Once your _Action_ is created, go to the _Workflow_ tab.
- Open the Tomcat folder from the _Activities_ tree view on the right.
- Find the "_Tomcat Pre Deploy_" _Procedure_ from the tree view.
- Drag it out to your design pallet.
- To use the "_Tomcat Pre Deploy_" _Procedure_, enter the parameters unique to your Tomcat application.

Repeat the same steps for creating your "_Tomcat Post Deploy_" _Action_. Connect the "_Tomcat Pre-Deploy_" _Procedure_ to the "_Tomcat Post Deploy_" to create your flow logic.

## Variables in Parameters

You can use variables in the _Parameters_ fields. The use of variables enables your deployment to adapt across _Components_ and your continuous delivery pipeline. Hard coded values are not recommended. The values for the variables are defined as attributes to _Components, Applications, Environments_ and _Endpoints_. To resolve the variables, you define them at these higher levels. For example, a database connection that is unique to an _Environment_ can be defined at the _Environment_ level.
