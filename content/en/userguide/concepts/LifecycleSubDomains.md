---
title: "Using Lifecycle _Subdomains_"
linkTitle: "Using Lifecycle _Subdomains_"
weight: 42
description: >
  Using Lifecycle _Subdomains_ and Pipelines
---
## Introduction to Lifecycle _Subdomains_

DeployHub uses a built-in deployment pipeline for tracking an _Application's_ journey across a software delivery lifecycle, i.e. Dev, Test, Production. However, it is important to understand that a DeployHub Lifecycle _Subdomain_ is not intended to replace your continuous delivery (CD) orchestration solution. In fact, there is integration that allows DeployHub to be called by your CD pipeline so it becomes part of your overall ecosystem for performing continuous configuration management and continuous deployment.  

DeployHub tracks an _Application's_ configuration including where it is in the lifecycle in terms of _Environments_.  An _Environment_ is assigned to a lifecycle _Subdomain_. Therefore, we can track where a _Component_ or _Application_ is in the lifecycle based on where it has been installed. Each Lifecycle _Subdomain_ can contain multiple _Environments_. Regardless of what _Environment_ an _Application_ is running in, DeployHub can still track where it is in the Lifecycle process based on the Lifecycle _Subdomain_. This is the core function of Lifecycle _Subdomains_.

A Lifecycle _Subdomain_ is the lowest level _Domain_.  You can not create a _Subdomain_ off of a Lifecycle _Subdomain_.  

## Using a Lifecycle Subdomain

When you create a Lifecycle Subdomain, you provide a means to include lifecycle state information as part of your _Application's_ configuration. For each state of your software delivery lifecycle, you create an associated Lifecycle _Subdomain_ for your _Application_. You do this by using the _Domain_ Dashboard. Navigate to your _Application's_ _Domain_, select the  "All _Subdomains_ are Lifecycles" checkbox, and then add your child _Subdomains_.  All _Subdomains_ will represent your Lifecycle process. You will need to navigate to the _Environment_ Dashboard to add the _Environments_ to your Lifecycle _Subdomains_.

### Establishing the Progression Order of Your Lifecycle

You can force the progression of your lifecycle process by adding a "Move" Task to the lifecycle _Subdomain_.  At the "Move" Task level, you define what Lifecycle _Subdomain_ will be the next state (the "move to _Domain_). This is how DeployHub clearly defines the order of how an _Application_ should progress through the lifecycle, i.e. first development, then test, and finally production. A "Move" Task does not perform a deployment, it just stages the _Application_ for a deployment into the _Environments_ associated with that Lifecycle _Subdomain.

To deploy an _Application_ into an _Environment_ make sure that the Deploy Task is assigned to the _Domain_.  The Deploy Task is the default Task for all newly created _Domains.  

### Your Lifecycle _Subdomains_ and your Continuous Delivery Engine

Your continuous delivery (CD) engine will define your lifecycle progression.  When you integrate DeployHub into your existing CD Pipeline, you will need to define your Lifecycle _Subdomains_ to mimic your CD Workflow progression. You can then associate integration of each of your CD Workflows directly to a DeployHub Lifecycle _Subdomain_. You can perform calls to DeployHub to both "Move" and "Deploy" _Applications_ into _Environments_.  If you are a DeployHub Pro users, you can also call "Request" and "Approve" Tasks as part of your integration. These Tasks interact with DeployHub Pro "Smart" calendars, not available in DeployHub Team.

Tasks

Any combination of Tasks can be defined to your Lifecycle _Subdomain_. Tasks are defined and linked from the _Domain_ Dashboard.

_Domains_ and their Tasks are a core concept of how DeployHub manages deployments and deployment authorization. To learn more, see [Building Your Domain Catalog](/userguide/first-steps/2-defining-domains/).
