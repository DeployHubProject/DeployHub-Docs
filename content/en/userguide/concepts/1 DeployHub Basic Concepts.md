---
title: "Basic Concepts"
linkTitle: "Basic Concepts"
weight: 1
description: >
  Understanding DeployHub Core Objects.
---

## DeployHub Core Objects

_Applications, Components_ and _Domains_ are key concepts that DeployHub uses to version independently deployable objects like microservices, map their relationships, and release them to _Endpoints_ (clusters, cloud, physical, etc.).

For releasing _Components_, DeployHub uses an agentless architecture that is designed to support both a modern architecture of containers as well as legacy systems. And if you have already invested time and effort around solutions like Helm or Ansible to update your cluster, great! We can call those external solutions to perform the update and provide all the microservice configuration mapping and version information. DeployHub also has plug-ins to continuous delivery pipelines that supports continuous configuration management as part of your release process.

## Application and Component Overview

Unique to DeployHub is its ability to version and map the individual parts of a software _Application._ An _Application_ is a complete software solution that is comprised of individual _Components._ For example, if you are a bank, you might have a Teller _Application_ made up of hundreds of microservices. In DeployHub terms, the Teller _Application_ is one software solution or 'Application' regardless of the number of _Components_ it consumes. _Applications_ and _Components_ are assigned to a Domain.

## Domain Catalog Overview

DeployHub is unique in the way in incorporates the use of a Domain Catalog to support a microservice domain driven design. Domains are used to organize and share microservices across teams reducing redundant coding and encouraging reuse.

DeployHub organizes your shared or private microservices and reusable components via Domains. Domains support the creation of catalogs where developers can go to find and share reusable objects of any type (microservices, scripts, web components, SQL.) Domains are defined to meet your unique requirements as no two organizations are alike in terms of structure. Domains are organized based on 'problem spaces,' geographical divisions, and security. Building a Domain Driven Design is a key step in achieving a successful microservices implementation. Without Domains, microservices and reusable objects are not easily shared across teams.

The lowest level Domain is a _Life Cycle Domain._ A Life Cycle Domain includes steps that can integrate with your external Continuous Delivery (CD) Pipeline orchestration tools.

## Navigation

All navigation is done via the left hand navigation menu. This menu will take you to Applicaiton, Component and Domain dashboards as well as the ability to setup Repositories, Data Sources, CD Engines and other objects.  

## Upper Right Hand Corner Icons

- **Person Icon** : Clicking on the Person Icon in the group of icons on the upper far right displays information about the current User, which can be changed. A new password can also be entered for the User.

- **Question Mark Icon** : Clicking on the Question Mark Icon on the upper far right takes the User to the web page containing all the online documentation for DeployHub.

- **Logout:** Clicking on the logout button on the farthest upper right causes the User to be logged out of DeployHub and immediately returned to the login window in the browser.

- **Home Icon** : Clicking on the Home Icon in the group of icons on the upper far right, or clicking on any Domain in the tree structure at any time, causes three tabs to appear on the right side:

- **To Do List** : This contains all Requests for the current _User_ that are created by _Request Tasks_ as well as pending _Calendar_ entries.
- **Timeline** : All activity within the DeployHub installation for the current User.
- **Global Reports** : These are a series of reports.

  - _Endpoint_ Inventory Report: This list of the assets deployed to each _Endpoint_ in the system, including _Files, Components, Applications, Environments, Dates,_ and _Users._
  - File Audit Trace: Allows for the selection of a file on the local user's machine, and returns all related deployments as well as Dates, _Applications_, _Components_, and _Endpoints_.
  - Audit of the files deployed to _Endpoints_: This report shows the differences between the files on _Endpoints_ compared to what was deployed.
  - Success/Failed Deployments per _Environment_ Report: The number of successful and failed deployments per _Environment._ It includes the Deployment Number, _Environment_ deployed to, _Application_ and _Components,_ date deployed, and each _Endpoint_ deployed to along with all files.

- **Delivery Pipeline** : This tab only appears when a Domain containing _Life Cycle Sub-Domain_ has been selected. It is used to define your continuous delivery process.
