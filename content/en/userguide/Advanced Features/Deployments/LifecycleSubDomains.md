---
title: "Using Lifecycle Sub-Domains"
linkTitle: "Using Lifecycle Sub-Domains"
weight: 42
description: >
  Using Lifecycle Sub-Domains to Execute a Deployment Pipeline
---
## Introduction to lifecycle _Subdomains_

DeployHub uses a built-in deployment pipeline for tracking an _Application's_ journey across a software delivery lifecycle, i.e. Dev, Test, Production. However, it is important to understand that a DeployHub lifecycle _Subdomain_ is not intended to replace your continuous delivery (CD) orchestration solution. In fact, there is integration that allows DeployHub to be called by your CD pipeline so it becomes part of your overall ecosystem for performing continuous configuration management and continuous deployment.  

DeployHub tracks an _Application's_ configuration including where it is in the Lifecycle in terms of _Environments_.  An _Environment_ is assigned to a lifecycle _Subdomain_. Therefore, we can track where a _Component_ or _Application_ is in the lifecycle based on where it has been installed. Each lifecycle _Subdomain_ can contain multiple _Environments_. Regardless of what _Environment_ an _Application_ is running in, DeployHub can still track where it is in the lifecycle process based on the lifecycle _Subdomain_. This is the core function of lifecycle _Subdomains_.

A lifecycle _Subdomain_ is the lowest level _Domain_.  You can not create a _Subdomain_ off of a lifecycle _Subdomain_.  

## Using a lifecycle Subdomain

When you create a lifecycle Subdomain, you provide a means to include lifecycle state information as part of your _Application's_ configuration. For each state of your software delivery lifecycle, you create an associated lifecycle _Subdomain_ for your _Application_. You do this by using the _Domain_ Dashboard. Navigate to your _Application's_ _Domain_, select the  "All _Subdomains_ are lifecycles" checkbox, and then add your child _Subdomains_.  All _Subdomains_ will represent your lifecycle process. You will need to navigate to the _Environment_ Dashboard to add the _Environments_ to your lifecycle _Subdomains_.

### Establishing the Progression Order of Your lifecycle

You can force the progression of your lifecycle process by adding a "Move" Task to the lifecycle _Subdomain_.  At the "Move" Task level, you define what lifecycle _Subdomain_ will be the next state (the "move to _Domain_). This is how DeployHub clearly defines the order of how an _Application_ should progress through the lifecycle, i.e. first development, then test, and finally production. A "Move" Task does not perform a deployment, it just stages the _Application_ for a deployment into the _Environments_ associated with that lifecycle _Subdomain_.

To deploy an _Application_ into an _Environment_ make sure that the Deploy Task is assigned to the _Domain_.  The Deploy Task is the default Task for all newly created _Domains_.  

### Your lifecycle _Subdomains_ and your Continuous Delivery Engine

Your continuous delivery (CD) engine will define your lifecycle progression.  When you integrate DeployHub into your existing CD Pipeline, you will need to define your lifecycle _Subdomains_ to mimic your CD Workflow progression. You can then associate integration of each of your CD Workflows directly to a DeployHub lifecycle _Subdomain_. You can perform calls to DeployHub to both "Move" and "Deploy" _Applications_ into _Environments_.  If you are a DeployHub Pro users, you can also call "Request" and "Approve" Tasks as part of your integration. These Tasks interact with DeployHub Pro "Smart" calendars, not available in DeployHub Team.
