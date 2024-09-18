---
title: "Why Use DeployHub Pro"
linkTitle: "Why Use DeployHub Pro"
weight: 1
description: >
  DeployHub Pro - Continuous Security Intelligence
---

## Why Use DeployHub Pro

DeployHub Pro is a Continuous Security Intelligence solution designed for decoupled architectures. DeployHub Pro  monitors and collects DevSecOps data from the CI/CD pipeline for every artifact. It unifies the data generated across the pipeline, offering a consolidated security profile of the software delivered to end users. With DeployHub Pro’s integrated security intelligence, IT Teams can quickly respond to vulnerabilities and issues, gaining a clear view of how a vulnerable package is used, which applications depend on it, and where it has been deployed.  

![Supply Chain Catalog](/userguide/images/supplychaincatalog.png/)

### Security Postures in Decoupled Environments

A crucial concept in decoupled architecture is the "<strong>logical</strong> _Application_." A logical _Application_ is a collection of independently deployed _Components_. Each _Component_ has its own Software Bill of Materials report, vulnerability status and security posture. In order to report the security posture of the entire solution delivered to end users, the _Component_ data must be aggregated to the _Application_ level. DeployHub Pro manages logical _Application Versions_ within a decoupled architecture, offering a comprehensive view of the software's security posture. DeployHub Provides logical _Application_ SBOMs, real-time _Application_ vulnerabilities, and compliance summaries, based on both the _Component_ and the aggregated logical _Application_. 

DeployHub Pro surveils the DevSecOps pipeline to automatically gather security and DevOps data for all _Components_. DeployHub Pro captures DevSecOps data when a _Component_ has been published, creating a new version for each release. It then creates new _Application Versions_ for all impacted 'logical' _Applications_.

## Versioning Critical Security Insights

DeployHub Pro versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, DeployHub Provides insights into that versions security posture including:

- Software Bill of Material
- OpenSSF Scorecard 
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

 _Application Versions_ are based on a collection of _Component Versions_. When a new version of a _Component_ is created, DeployHub Pro auto increments the _Component_ version and all consuming _Application_ versions.  The dashboard shows for each _Application_ version:

- A full map of all _Components_ the _Application_ version is consuming
- An aggregated _Application_ SBOM
- An _Application_ CVE report, with real-time updates
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history
- Log history
- Where the new _Component_ is running
- Trends (Deployment time, success failure rates)
- An _Application_ security posture report


## Core Features

**Package Vulnerability Search:**

 Discover where a vulnerability is running across all endpoints. DeployHub Pro shows which logical _Applications_ are consuming a vulnerable package, and how your runtime environments are at risk. 

**Dependency maps:** 

Understand _Component_ to _Application_ dependencies. DeployHub Pro presents the 'logical' view of an _Application_ with all _Component_ dependencies. 

**Application Level SBOMs and CVE:** 

DeployHub Pro aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled. DeployHub Pro makes it easy to respond to government Software Bill of Material reporting as defined in Executive Order 14028. 

**Blast Radius:**

See how a single _Component_ impacts consuming _Applications_. DeployHub Pro can provide predictive insights showing what _Applications_ will be impacted by an updated service. DeployHub Provides this data in clear maps of dependent _Applications_ and services. The blast radius also shows which _Components_ and _Applications_ are impacted by a vulnerability for rapid response. 

**Improved incident response:**

 DeployHub Pro makes it easy to find the owner of _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** 

DeployHub Pro is automated via the CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed.

**Domain-Driven-Design:**

 The DeployHub Pro Domain structure organizes the software supply chain to encourage reuse and sharing across development teams.

## Ortelius Open Source - Free Version

DeployHub Pro is based on the [Ortleius](https://www.Ortelius.io/) open source project, incubating at the [Continuous Delivery Foundation](https://cd.foundation). DeployHub Provides a hosted version of Ortelius, or an on premise installation. Ortelius is a free open source continuous security intelligence system that integrates with your DevOps tools. It supports unlimited endpoints, versions, and users. [Learn more](/userguide/0-ortelius-tutorial/). 

## DeployHub Pro Upgrade from Ortelius Open Source

For the enterprise that needs more control over the software supply chain, and deployment features, DeployHub Provides an upgrade that includes:

### Security Groups
For additional security features and support, DeployHub Pro extends Users and Group access controls, with LDAP, and more granular _Domains_ and _Subdomains_.

Unique to DeployHub Pro are "Divisional Domains." These _Domains_ allow IT Teams to model how DeployHub Pro organizes data based on a Domain Driven Design (DDD).  It also provides the ability to restrict read/write access to only certain Groups of Users.


### DeployHub Pro Agentless Delivery

DeployHub Pro can help IT Teams who do not use a centralized solution for automating deployments. DeployHub Pro includes a deployment engine for pushing _Components_ to _Endpoints_ (Clusters, Cloud, etc.) using an agentless architecture. The deployment engine can support containers and any type of file object including executables, jar files, Apex files, and Lamda functions.

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

