---
title: "Basic Concepts"
linkTitle: "Basic Concepts"
weight: 1
---

## Getting Started - What You Need to Know

_Applications, Components_ and _Domai_ns are key concepts that DeployHub uses to version independently deployable objects like microservices, map their relationships, and release them to _Endpoints_ (clusters, cloud, physical, etc.).

For releasing _Components_, DeployHub uses an agentless architecture that is designed to support both a modern architecture of containers as well as legacy systems. And if you have already invested time and effort around solutions like Helm or Ansible to update your cluster, great! We can call those external solutions to perform the update and provide all the service to service relationship mapping and version information. DeployHub also has plug-ins to continuous delivery pipelines that supports continuous configuration management as part of your release process.

## Application and Component Overview

Unique to DeployHub is its ability to version and map the individual parts of a software _Application._ An _Application_ is a complete software solution that is comprised of individual _Components._ For example, if you are a bank, you might have a Teller _Application_ made up of hundreds of microservices. In DeployHub terms, the Teller _Application_ is one software solution or &#39;Application&#39; regardless of the number of _Components_ it consumes. _Applications_ and _Components_ are assigned to a Domain.

## Domain Catalog Overview

DeployHub is unique in the way in incorporates the use of a Domain Catalog to support a microservice domain driven design. Domains are used to organize and share microservices across teams reducing redundant coding and encouraging reuse.

DeployHub organizes your shared or private microservices and reusable components via Domains. Domains support the creation of catalogs where developers can go to find and share reusable objects of any type (microservices, scripts, web components, SQL.) Domains are defined to meet your unique requirements as no two organizations are alike in terms of structure. Domains are organized based on &#39;problem spaces,&#39; geographical divisions, and security. Building a Domain Driven Design is a key step in achieving a successful microservices implementation. Without Domains, microservices and reusable objects are not easily shared across teams.

The lowest level Domain is a _Life Cycle Domain._ A Life Cycle Domain includes steps that can integrate with your external Continuous Delivery (CD) Pipeline orchestration tools.

![LifeCycle Domain](RackMultipart20200511-4-q36m0e_html_a920de4b1ba0a194.png)
