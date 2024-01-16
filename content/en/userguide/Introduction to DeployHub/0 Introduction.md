---
title: "Why Use DeployHub"
linkTitle: "Why Use DeployHub"
weight: 1
description: >
  DeployHub - a Catalog of Supply Chain Evidence
---

## Why Use DeployHub

DeployHub is supply chain evidence catalog for publishing, versioning and sharing microservices and other _Components_ such as DB objects and file objects. DeployHub centralizes everything you need to know about a component-driven architecture including _Component level_ ownership, SBOMs, vulnerabilities, dependency relationships, key values, deployment metadata, consuming applications and versions. DeployHub harvests information from the DevOps pipeline centralizing supply chain data across tools and teams.

![Supply Chain Catalog](/userguide/images/supplychaincatalog.png/)

DeployHub visualizes ‘logical’ application versions in a cloud-native architecture providing a clear view of the software supply chain and their consumers. With this _Component_ level information, DeployHub can easily aggregate metadata up to the 'logical' application producing application level SBOMs, CVEs, audit reports, deployment inventory and status.

DeployHub is particularly suited for a microservice architecture where hundreds of artifacts and repos are used, and a central view of the entire supply chain from a usage, security, and inventory perspective is required. When you outgrow your excel spreadsheet, its time to consider DeployHub.

DeployHub is based on the open-source Continuous Delivery Foundation project, [Ortelius.io](https://ortelius.io)

### Decoupled Environments are Complex

Migrating to decoupled, cloud-native architecture breaks the way we assemble and configure software. With a decoupled implementation, we no longer build a complete software solution, or Application Version. Instead we manage many moving parts that communicate at run-time based on APIs.  The loss of the 'Application Version' disrupts the core of software delivery.  It impacts most of our standard software practices including the generation of application security level reports.  After all, everything is based on an Application Version from tracking changes request, determining differences, tracking relationships and supporting users. Without a method of tracking the logical _Application_, IT teams struggle to confirm that the software they deliver to end users is safe.

DeployHub is not a 'microservice registry' or 'API Gateway."  Instead, DeployHub interacts with the DevOps pipeline to automatically gather supply chain metadata. Tracking microservices and _Components_ in this way facilitates their sharing and reuse across teams. DeployHub serves as an internal market place for finding, tracking and versioning microservices and relating them to the _Applications_ that consume them. The publishing catalog is based on a _Domain_ structure to support a Domain Driven Design.

## Versioning - DeployHub's Secret Sauce

DeployHub versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, DeployHub provides insights needed to determine if the service is safe for consumption including:

- Software Bill of Material
- Common Vulnerabilities and Exposures (CVE)
- Swagger Details
- Readme and Licensing
- Consuming Applications
- Ownership
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Key Values
- Deployment Script (Helm Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example)

 _Application Versions_ are based on a collection of _Component Versions_. If a new version of a _Component_ is built or registered, DeployHub auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all the microservices, or _Components_, the _Application_ version is consuming.
- An Application Level SBOM, based on all _Component_ SBOMs
- An Application Level CVE
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history
- Log history
- Where it is running
- Trends (Deployment time, success failure rates)

This level of information can also be viewed from the _Component_ level showing similar information to the _Application_, but instead showing the _Applications_ that are dependent on the microservice (_Component_).

## Other Core Features

**Domain-Driven-Design:** First and most important is the DeployHub Domain structure for cataloging and sharing microservices. This feature organizes your microservice in a method that encourages reuse and sharing across development teams.

**Dependency maps:** Shows you the 'logical' view of your application and which microservices, or _Components_, it consumes. Once you begin sharing microservices, you need to track who is using the microservice. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

**Application Level SBOMs and CVE:** DeployHub aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled.

**Blast Radius:** Know your service impact before you ever deploy. DeployHub can provide predictive insights showing what _Applications_ will be impacted by an updated service. DeployHub provides this data in clear maps of dependent _Applications_ and services.

 **Improved incident response:** DeployHub makes it easy to find the owner of microservice or common _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** DeployHub is automated via your CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed.

**Agentless Software Releases:** If you do not currently use an automated deployment solution, DeployHub includes an agentless release engine for deploying _Components_ and _Applications_ across your _Environments_. Alternatively, DeployHub can integrate with your existing deployment solutions such as Helm, Spinnaker or any release solution with APIs or CLIs.  

## Agentless Delivery

If you do not have a centralized solution for automating deployments, DeployHub can help. DeployHub Pro includes a deployment engine for pushing _Components_ to your _Endpoints_ (Clusters, Cloud, etc.) using an agentless architecture. The deployment engine can support containers, DB Updates. and file updates (.dll, .jar, Apex files, Lamda functions, Terraform, z/OS objects, etc.)

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
- Microsoft IIS, Microsoft SQL Server, Oracle
- Request Routers and Appliances

## Free Version with Optional Pro Upgrade

### DeployHub Team

Our free version is based upon the [Ortleius](https://www.Ortelius.io/) open source project. DeployHub Team can be used from the hosted site or installed on premise. It is a strategic and fully open source supply chain catalog that integrates with your DevOps tools. It supports unlimited endpoints, versions, deployments and users. Sign-up at [deployhub.com](https://www.deployhub.com/microservice-dashboard/). This version does not include the agentless deployment engine or Group access controls.

### DeployHub Pro

For additional security features, agentless deployments and support, DeployHub Pro includes extended Users and Group access controls as well as more granular _Domains_.

Unique to DeployHub Pro are "Divisional Domains." These _Domains_ allow you to expand and model your environments based on your organizational top-down structure. It also gives you the ability to restrict microservice read/write access to only certain Groups of Users.

DeployHub Pro also provides integration to tools such as Bugzilla, GitHub Issues and Jira for tracking your complete value stream from change request to final endpoint. It also includes 'smart' calendars for scheduling deployments.
