---
title: "Why Use DeployHub"
linkTitle: "Why Use DeployHub"
weight: 1
description: >
  The Need for and Benefits of...
---

## Why Use DeployHub

Migrating to microservices breaks the way we assemble and configure software.  The loss of the 'software application' is difficult though. We no longer manage a complete software solution. Instead, smaller pieces are independently deployed across multiple environments. The difficulty in managing microservices without the higher order _Application_ is that it impacts most of our standard software practices.  After all, everything is based on an _Application_ version from tracking changes request, to bill of material and difference reports and testing.

While microservices are a big improvement over monolithic practices, we still need a method of tracking the collection delivered to an end-user. DeployHub allows you to move to microservices by giving you back your _Application_ but in a 'logical view.'

DeployHub is a SaaS based central 'hub' for cataloging, versioning, sharing and deploying microservices and other _Components_ across Kubernetes, cloud, virtual and physical _Environments_. An on-premise download is also available.

DeployHub is not a 'microservice registry.' Instead, Developers interact with DeployHub to 'check-in' or publish microservices to a Domain Catalog before they are deployed to any environment. This is like an internal market place for finding, tracking and deploying microservices and relating them to the _Applications_ that consume them. The publishing catalog is based on a _Domain_ structure to support a Domain Driven Design.

 Microservices are now independently deployable and require a solution to support this process. Our back-end version controls the database to accurately track and deploy the many moving parts of a microservice implementation, producing _Application_ maps and _Component_ dependencies.

If you have not moved to a microservice architecture, with us, you can visualize and continuously deploy your monolithic _Application_ based on _Components_ .  A _Component_ can be anything from a microservice to a .Jar file, a DB update to an environment variable update.  So while you begin digesting a new modern architecture, DeployHub starts shifting the way you conceptualize your monolithic _Application_ and prepares you for a service based architecture.

## Versioning

DeployHub versions both microservices (_Components_) and 'logical' _Applications_.  When versioning _Components_, it tracks changes to their critical metadata needed for deployments including:

- GitHub, Jira Change Request (DeployHub Pro)
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Environment Variables
- Deployment Script (Helm Chart, Ansible Playbook, etc)
- Any Attributes (DB Name for example)

When versioning at the _Application_ level, it's based on the _Component_ versions associated to that _Application_ version. If a new version of a _Component_ is pushed out to the environment, DeployHub auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all the microservices, or _Components_, the _Application_ version is consuming (your new Bill of Material - BOM report).
- The specific changes that created the new _Application_ version (your new diff report).
- The audit history
- Log history
- Where it is running
- Trends (Deployment time, success failure rates)

This level of information can also be viewed from the _Component_ level showing similar information to the _Application_, but instead showing the _Applications_ that are dependent on the microservice (_Component_).

Deployhub supports working in a hybrid environment, for both microservices and monolithic applications. In fact, you will be able to decompose a monolithic application, as you break it down into _Components_ - which is the beginning of a microservice journey.

## Key Features

Our four main features are critical to a successful implementation of microservices.

- First and most important is the **Domain structure for cataloging and sharing microservices**. This feature organizes your microservice in a method to facilitate reuse and sharing across development teams.

- Once you begin sharing microservices, you need to track who is using the microservice.  **Dependency maps** show you the 'logical' view of your application and which microservices, or _Components_, it consumes. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

- **A back-end relational database versions your microservice**. A change to any of the microservice attributes (container repository SHA, Helm Chart, etc.) initiates a new version of the microservice and a new version of the _Applications_ that consumes it. Tracking these updates gives you uncompromised visibility of your _Application_ and microservice usage.  

- DeployHub **independently deploys microservices** and records critical release information about the end target locations. This provides DevOps and Site Reliability Engineers the ability to make data-driven decisions when something goes wrong.

- DeployHub integrates into your CD pipeline to continuously version your microservice configurations just prior to release at any state (Dev,Test, Prod). Your existing CI/CD solution can be enhanced to support independent microservice releases without a major re-tooling.

## The Secret Sauce

DeployHub is the only configuration management and deployment solution with a built-in version control engine. This supports fully incremental releases as well as canary or blue/green deployments with fast rollbacks, roll forward, or version jumps. Our back-end version control database is designed specifically for tracking independently deployed _Components_. Every software release configuration is based upon a collection of _Components_ and their critical deployment attributes. A _Component_ is a microservice, executable, database update or configuration, and is part of a complete software _Application_. _Components_ change over time creating _Component Versions_ and therefore _Application Versions_.

DeployHub supports continuous configuration versioning of:

- microservices
- web components
- database updates
- environment variables
- application binaries
- infrastructure components

## Agentless Delivery

  Unlike others, DeployHub's engine for pushing _Components_ to your _Endpoints_ (Clusters, Cloud, etc.), uses an agentless architecture. The deployment engine supports mixed environments from monolithic systems to microservices and is particularly useful for database updates. No _Endpoint_ agents are required.  

This agentless technology works for both cloud native and legacy architectures including:

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

**DeployHub Team**

Our free version is based upon the [Ortelius](https://www.ortelius.io/) open source project. DeployHub Team can be used from the hosted site or installed on premise. It is a strategic and fully open source microservice management solution that integrates with common continuous delivery and DevOps tools such as Spinnaker, GitHub and Jenkins. It supports unlimited endpoints, versions, deployments and users. Sign-up at [https://www.deployhub.com/free-team-sign-up/](https://www.deployhub.com/free-team-sign-up/).

**DeployHub Pro**

For additional security features and support, DeployHub Pro includes extended Users and Group access controls as well as more granular _Domains_.

Unique to DeployHub Pro are "Divisional Domains." These allow you to model your environments based on your organizational top-down structure, facilitating a self-service experience for developers. It also gives you the ability to restrict microservice read/write access to only certain Groups of Users.

DeployHub Pro also provides integration to tools such as Bugzilla, GitHub Issues and Jira for tracking your complete value stream from change request to final endpoint. It also includes 'smart' calendars for scheduling deployments.

## Ortelius Open Source Project

DeployHub is based on the Ortelius Open Source Project. Learn more at [Ortelius.io](http://www.ortelius.io/).
