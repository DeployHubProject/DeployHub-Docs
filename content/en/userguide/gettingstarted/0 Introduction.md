---
title: "Introduction"
linkTitle: "Introduction"
weight: 1
---

## Introduction

Moving to microservices breaks the way we assemble and configure software. DeployHub puts it back together by providing a central &#39;hub&#39; for cataloging, versioning, sharing and releasing microservices across the organization. DeployHub empowers you to easily move from monolithic to microservices by supporting a central location to manage, version and deploy microservices while still supporting your monolithic release automation needs.

DeployHub delivers 4 main features critical to a successful implementation of microservices.

- First and most important is the way DeployHub provides a **Domain structure for cataloging and sharing microserv** ices with their critical deployment attributes. This allows you to organize your microservice in a method that will facilitate reuse and sharing across development teams.

- Once you begin sharing microservices, you need a method of tracking who is using the microservice. DeployHub **builds dependency maps** showing you the service to service and &#39;application&#39; to service relationships. In DeployHub an &#39;application&#39; is a logical collection of microservices that make up an entire software solution.

- Versioning is a critical concept for source code management, particularly for sorting out your software build (compile/link). But with microservices the build process is somewhat eliminated. Services are linked at runtime not during a CI step. For this reason, DeployHub uses a **backend relational database for versioning your microservice**. A change to any of the microservice attributes (container repository SHA, Helm Chart, etc.) initiates a new version of the microservice and potentially a new version of the Application that consumes it. DeployHub tracks these updates giving you a level of visibility you would otherwise need to track in spreadsheets.

- DeployHub **independently deploys microservice** and records critical release information providing Release Engineers the ability to make data-driven decisions when something goes wrong.

DeployHub also integrates into your CD pipeline to continuously version your microservice configurations just prior to release. With DeployHub your existing CI/CD solution can be enhanced to support independent microservice releases without a major re-tooling. DeployHub can support both your legacy and modern architecture deployments and provide you a roadmap for moving from a monolithic architecture to a service-based architecture.

## Why DeployHub

DeployHub&#39;s secret sauce is its backend version control database designed specifically for tracking independently deployed _Components_. Every software release configuration is based upon a collection of _Components_ and their critical deployment attributes. A _Component_ is a microservice, independent executable, database update or configuration that is part of a complete software application. _Components_ change over time creating _Component Versions_ and therefore _Application Versions_. DeployHub is the only configuration management and deployment solution that has a built-in version control engine to support fully incremental releases and supports canary or blue/green deployments with fast rollbacks, roll forward, or version jumps.

DeployHub supports the deployment and configuration versioning of:

- microservices
- web components,
- database updates,
- environment variables,
- application binaries,
- infrastructure components.

## Agentless Delivery

DeployHub uses an agentless architecture with cloud native software deployment features. DeployHub&#39;s release process can support mixed environments from monolithic systems to microservices, where the move away from monolithic deployments may occur overtime.

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
- Jetty, Tomcat, Websphere
- Microsoft IIS, Microsft SQL Server, Oracle, Sybase
- Request Routers and Appliances

## SaaS or On Prem

DeployHub can be installed on premise or accessed via the [DeployHub hosted site.](https://www.deployhub.com/free-team-sign-up/)

## Free Version with optional Pro Upgrade

There are two options: DeployHub Team and DeployHub Pro.

DeployHub Team

DeployHub Team is a Free version of DeployHub that can be used from the hosted DeployHub site or installed on premise. DeployHub Team is a strategic and fully open microservice management solution that integrates with common continuous delivery and DevOps tools such as Spinnaker, GitHub and Helm. DeployHub Team is based on the Open Source DeployHub Project. It supports unlimited endpoints, deployments and users. Sign-up at [https://www.deployhub.com/free-team-sign-up/](https://www.deployhub.com/free-team-sign-up/).

DeployHub Pro

For additional security features and support, DeployHub Team can be upgraded to DeployHub Pro. DeployHub Pro includes extended Users and Group access controls.

Unique only to DeployHub Pro is the concept of &quot;Divisional Domains.&quot; This allows you to model your environments based on your organizational top-down structure, facilitating a self-service experience for developers and the ability to restrict microservice read/write access to only certain Groups of Users.

DeployHub Pro also provides integration to bug tracking tools such as Bugzilla, GitHub Issues and Jira for tracking your complete value stream from change request to final endpoint.

## Ortelius Open Source Project

DeployHub is based on the Ortelius Open Source Project. Learn more at [Ortelius.io](http://www.ortelius.io/).
