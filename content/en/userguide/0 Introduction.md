---
title: "Why Use DeployHub"
linkTitle: "Why Use DeployHub"
weight: 1
description: >
  DeployHub - Continuous Security Intelligence
---

## Why Use DeployHub

DeployHub is a Continuous Security Intelligence solution designed for decoupled architectures. DeployHub  monitors and collects DevSecOps data from the CI/CD pipeline for every artifact. It unifies the data generated across your pipeline, offering a consolidated security profile of the software delivered to end users. With DeployHub’s integrated security intelligence, you can quickly respond to vulnerabilities and issues, gaining a clear view of how a vulnerable package is used, which applications depend on it, and where it has been deployed.  

![Supply Chain Catalog](/userguide/images/supplychaincatalog.png/)

DeployHub is based on the open-source Continuous Delivery Foundation project, [Ortelius.io](https://ortelius.io)

### Decoupled Environments and "Logical" Applications

A crucial concept in modern architecture security is the "logical _Application_." It's essential to understand the security posture of the solution you deliver to end users, which depends on all its underlying _Components_. DeployHub manages logical _Application Versions_ within a decoupled architecture, offering a comprehensive view of the software's security posture as delivered to end users. By providing detailed information at the _Component_ level, DeployHub can efficiently aggregate an _Application's_ security posture, generating application-level SBOMs, CVEs, audit reports, and deployment locations.

DeployHub surveils the DevSecOps pipeline to automatically gather security and DevOps data for all _Components_. DeployHub captures DevSecOps data when a _Component_ has been published, creating a new version for each release. It then creates new _Application Versions_ for all impacted 'logical' _Applications_.

## Versioning - DeployHub's Secret Sauce

DeployHub versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, DeployHub provides insights into that versions security posture including:

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

 _Application Versions_ are based on a collection of _Component Versions_. If a new version of a _Component_ is built or registered, DeployHub auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all _Components_, the _Application_ version is consuming
- An _Component_ and aggregated _Application_ SBOM
- An _Component_ and _Application_ CVE
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history
- Log history
- Where the new _Component_ is running
- Trends (Deployment time, success failure rates)
- An _Application_ security posture report


## Other Core Features

**Package Vulnerability Search** Discover where a vulnerability is running across all endpoints. DeployHub can show you which logical _Applications_ are consuming a vulnerable package, and where it is deployed. 

**Dependency maps:** Shows you the 'logical' view of your _Application_ and which _Components_ are consumed. Once you begin decoupling monolithic software, you need to track who is using each independently deployed _Component_. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

**Application Level SBOMs and CVE:** DeployHub aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled.

**Blast Radius:** Know your _Component_ impact before you ever deploy. DeployHub can provide predictive insights showing what _Applications_ will be impacted by an updated service. DeployHub provides this data in clear maps of dependent _Applications_ and services. The blast radius also shows what _Components_ and _Applications_ are impacted by a vulnerability for rapid response. 

 **Improved incident response:** DeployHub makes it easy to find the owner of _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** DeployHub is automated via your CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed.

**Domain-Driven-Design:** The DeployHub Domain structure organizes your software supply chain to encourage reuse and sharing across development teams.

## DeployHub Team - Free Version

A free version of DeployHub is available and based upon the [Ortleius](https://www.Ortelius.io/) open source project. DeployHub Team can be used from the hosted site or installed on premise. It is a strategic and fully open source continuous security intelligence system that integrates with your DevOps tools. It supports unlimited endpoints, versions, and users. [Learn more](/userguide/0-ortelius-tutorial/). 

## DeployHub Pro

For additional security features and support, DeployHub Pro includes extended Users and Group access controls as well as more granular _Domains_.

Unique to DeployHub Pro are "Divisional Domains." These _Domains_ allow you to expand and model your environments based on your organizational top-down structure. It also gives you the ability to restrict read/write access to only certain Groups of Users.


### DeployHub Pro's Agentless Delivery

If you do not have a centralized solution for automating deployments, DeployHub can help. DeployHub Pro includes a deployment engine for pushing _Components_ to your _Endpoints_ (Clusters, Cloud, etc.) using an agentless architecture. The deployment engine can support containers, DB Updates, and file updates (.dll, .jar, Apex files, Lamda functions, Terraform, z/OS objects, etc.)

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

