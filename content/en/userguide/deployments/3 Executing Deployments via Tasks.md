---
title: "Deployment Tasks"
linkTitle: "Deployment Tasks"
weight: 3
description: >
  Adding Deployment Tasks for a Pipeline Model.
---

DeployHub understands a monolithic model as well as a microservice model.  In the traditional approach to deployments, Approvals and Promotions are common.  While we might move away from this in a microservice architecture, there still may be pipelines that require a microservice to be approved before it is pushed out to a particular cluster.  Following are Deployment Tasks that can be used to integrate into your pipeline. 

## Request and Approvals

You can _Request_ and _Approve_ Deployments to be moved to the next stage in a pipeline using the _Request_ and _Approve Tasks_. These Tasks can be executed through a variety of methods:

- Right clicking on an _Application_ in the Applications tab under the Deploy menu and selecting the _Task_ from the resulting drop-down list. Normally, a deployment is run by a _User_ who has access to a _Deploy Task_, but sometimes the _Deploy Task_ needs to be run by someone who does not have access to it. This can be resolved using two additional _Tasks_: _Request_ and _Approve_. The _User_ can run a _Request Task_ to ask for access (via email) from another _User_. The _User_ with access then runs the _Approve Task_, which grants the requesting _User_ access to the _Deploy Task_.
- The _Request Task_ contains a Linked Task field whose value is that of the _Deploy Task_.

NOTE: **DeployHub Team** has only two types of users, Administrators and Users. For more granular Groups you will need to upgrade to **DeployHub Pro**.

- Calling the _Deploy Task_ from within a Pre, Post, or Custom Action via the _Run Task__Procedure_, which is one of DeployHub&#39;s built-in _Procedures_. This is accomplished by creating an _Action_ and placing the Run Task _Procedure_ into the _Action&#39;s_ Workflow. The Run Task _Procedure_ has a field that allows for the selection of a Task from a list. This list is comprised of all of the Tasks within the current _Domain,_ along with any _Tasks_ from the parent _Domain_ that have the &#39;Available in SubDomains&#39; checkbox checked. The _Action_ is then run as a Pre, Post, or Custom _Action_ during a deployment.

- Use a _Run Task_ and a _Wait for Task_ from within an _Action_. A Run Task _Procedure_ is placed just before a _Wait for Task_ in the _Action&#39;s_ Workflow. A _Wait for Task_ causes an _Action_ to pause at a specific place until a specified _Task_ is run. The _Request Task_ causes the _Action_ to send an email to the _User_ with access to the _Deploy Task_ asking for access (as in the previous example above). The _Action_ pauses when it drops through to the _Wait for Task_. The _Task_ that is being waited for is the _Approve Task_. As soon as the _Approve Task_ is run by the _User_ with Access to the _Deploy Task_, the _Deploy Task_ is executed as the next _Run Task_ in the _Action_. Keep in mind that this is just one example of the many possible ways to _use Run Tasks_ and _Wait for Tasks_.
