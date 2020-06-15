---
title: "Why DeployHub"
linkTitle: "Why DeployHub"
weight: 1
description: >
  Why you should use DeployHub.
---

## Why DeployHub

Migrating to microservices breaks the way we assemble and configure software. What is most difficult about microservices is the loss of the 'software application.' We no longer manage a complete software solution and instead manage smaller pieces that are independently deployed across multiple environments. The difficulty in managing microservices without the higher order _Application_ is that it impacts most of our standard software practices.  After all, everything we do is based on an _Applicaiton_ version from tracking changes request, to bill of material and difference reports and testing. 

While microservices are a big improvement over monolithic practices, we still need a method of tracking what we are delivering to an end-user, which is a collection of microservices.  DeployHub allows you to move to microservices by giving you back your _Application_ but in a 'logical view.'

DeployHub is a SaaS based central 'hub' for cataloging, versioning, sharing and deploying microservices and other _Components_ across Kubernetes, cloud, virtual and physical _Environments_. An on-premise download is also available.

DeployHub is not a 'microservice registry.' Developers interact with DeployHub to 'check-in' or publish microservices to a Domain Catalog before they are deployed to any environment. Think of DeployHub as an internal market place for finding, tracking and deploying microservices and relating them to the _Applications_ that consume them. The publishing catalog is based on a _Domain_ structure to support a Domain Driven Design of microservices.

DeployHub is unique because of the way it can incrementally deploy any _Component_ of an _Application_. Microservices are independently deployable and require a solution that can support an incremental deployment process. DeployHub uses a back end version control database to accurately track and deploy the many moving parts of a microservice implementation, producing _Applicaiton_ maps and _Component_ dependencies.

If you have not moved to a microservice architecture, DeployHub can help you visualize and continuously deploy your monolithic _Application_ based on _Components_ incrementally. A _Component_ can be anything from a microservice to a .Jar file, a DB update to an environment variable update.  So while you begin digesting a new modern architecture, you can use DeployHub to start shifting the way you conceptualize your monolithic _Application_ and prepare you for a service based architecture.

## DeployHub Versioning

DeployHub versions both microservices (_Components_) and 'logical' _Applications_.  When versioning _Components_, DeployHub tracks changes to their critical metadata needed for deployments including:

- GitHub, Jira Change Request (DeployHub Pro)
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Environment Variables
- Deployment Script (Helm Chart, Ansible Playbook, etc)
- Any Attributes (DB Name for example)

When versioning at the _Application_ level, DeployHub does so based on the _Component_ versions associated to the _Application_ version. If a new version of a _Component_ is pushed out to the environment, DeployHub auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all the microservices, or _Components_, the _Application_ version is consuming (your new Bill of Material - BOM report).
- The specific changes that created the new _Application_ version (your new diff report).
- The audit history
- Log history
- Where it is running
- Trends (Deployment time, success failure rates)

This level of information can also be viewed from the _Component_ level showing similar information to the _Application_, but instead showing the _Applications_ that are dependent on the microservice (_Component_).

And if you are working in a hybrid environment, supporting both microservices and monolithic applications, DeployHub can support both models. In fact, DeployHub can help teach you how to decompose a monolithic application by helping you break it down into _Components_ - the beginning of a microservice journey.

## Key Features of DeployHub

DeployHub delivers 4 main features critical to a successful implementation of microservices.

- First and most important is the way DeployHub provides a **Domain structure for cataloging and sharing microservices** with their critical deployment attributes. This allows you to organize your microservice in a method that will facilitate reuse and sharing across development teams.

- Once you begin sharing microservices, you need a method of tracking who is using the microservice. DeployHub **builds dependency maps** showing you the 'logical' view of your application and what microservices, or _Components_, it consumes. In DeployHub an 'application' is a logical collection of _Components_ that make up an entire software solution.

- DeployHub uses a **backend relational database for versioning your microservice**. A change to any of the microservice attributes (container repository SHA, Helm Chart, etc.) initiates a new version of the microservice and a new version of the _Applications_ that consumes it. DeployHub tracks these updates giving you uncompromised visibility of your _Application_ and microservice usage.  

- DeployHub **independently deploys microservice** and records critical release information about the end target locations providing DevOps and Site Reliability Engineers the ability to make data-driven decisions when something goes wrong.

- DeployHub integrates into your CD pipeline to continuously version your microservice configurations just prior to release at any state (Dev,Test, Prod). With DeployHub your existing CI/CD solution can be enhanced to support independent microservice releases without a major re-tooling.

## DeployHub's Secret Sauce

DeployHub's secret sauce is its backend version control database designed specifically for tracking independently deployed _Components_. Every software release configuration is based upon a collection of _Components_ and their critical deployment attributes. A _Component_ is a microservice, independent executable, database update or configuration that is part of a complete software _Application_. _Components_ change over time creating _Component Versions_ and therefore _Application Versions_. DeployHub is the only configuration management and deployment solution that has a built-in version control engine to support fully incremental releases and supports canary or blue/green deployments with fast rollbacks, roll forward, or version jumps.

DeployHub supports continuous configuration versioning of:

- microservices
- web components,
- database updates,
- environment variables,
- application binaries,
- infrastructure components.

## Agentless Delivery

If you choose to use DeployHub's engine for pushing _Components_ to your _Endpoints_ (Clusters, Cloud, etc.) over something like Helm or Ansible,  it is important to know that is uses an agentless architecture. No 'side cars' or _Endpoint_ agents required.  DeployHub's deployment engine can support mixed environments from monolithic systems to microservices and is particularly useful for database updates.  

DeployHub uses an agentless technology to support deployments for both cloud native and legacy architectures including:

- AWS, Google Compute, Azure
- Cloud Foundry
- Kubernetes, Docker
- SalesForce
- Windows 2008, Windows 2012
- Solaris, HP-UX, AIX, Linux
- Microsoft Azure
- Ubantu, Redhat, SuSe, Debina
- Tandem, Stratus, IBM iSeries, OpenVMS, Unisys, IBM 4690
- z/OS
- Jetty, Tomcat, WebSphere
- Microsoft IIS, Microsoft SQL Server, Oracle, Sybase
- Request Routers and Appliances

## Free Version with Optional Pro Upgrade

There are two options: DeployHub Team and DeployHub Pro.

DeployHub Team

DeployHub Team is a Free version of DeployHub based on the [Ortelius](https://www.ortelius.io/) open source project. DeployHub Team can be used from the hosted site or installed on premise. DeployHub Team is a strategic and fully open source microservice management solution that integrates with common continuous delivery and DevOps tools such as Spinnaker, GitHub and Jenkins. It supports unlimited endpoints, versions, deployments and users. Sign-up at [https://www.deployhub.com/free-team-sign-up/](https://www.deployhub.com/free-team-sign-up/).

DeployHub Pro

For additional security features and support, DeployHub Team can be upgraded to DeployHub Pro. DeployHub Pro includes extended Users and Group access controls as well as more granular _Domains_.

Unique only to DeployHub Pro is the concept of "Divisional Domains." This allows you to model your environments based on your organizational top-down structure, facilitating a self-service experience for developers and the ability to restrict microservice read/write access to only certain Groups of Users.

DeployHub Pro also provides integration to bug tracking tools such as Bugzilla, GitHub Issues and Jira for tracking your complete value stream from change request to final endpoint. It also includes 'smart' calendars for scheduling deployments.

## Ortelius Open Source Project

DeployHub is based on the Ortelius Open Source Project. Learn more at [Ortelius.io](http://www.ortelius.io/).
