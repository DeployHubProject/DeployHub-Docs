---
title: "Terms"
linkTitle: "Terms"
weight: 2
---

## DeployHub Terms

Following are the basic terms and concepts you need to configure your deployments using DeployHub. They are organized here in order of importance.

## Domains

_Domains_ provide a way to organize _Components, Applications_ and _Environments_. DeployHub _Domains_ can be modeled from your microservice domain driven design. Microservices, which are a type of _Component_, can be published to a _Domain_. _Applications_ are also defined to a _Domain_ and often use the same name. _Environments_ are assigned to a _Domain_. For example, _Domains_ that are defined with an _Application_ use assigned _Environments_ for deployments.

_Domains_ also include _Tasks_. _Tasks_ include Move, Approve, Version and Deploy. _Tasks_ can be called by external solutions via APIs for integration into your Continuous Delivery Pipeline. _Tasks_ are associated to any _Domain_ and can be defined as _Pre_ or _Post_. _Tasks_ are normally defined to _Life Cycle Sub-Domain_ and become part of your continuous delivery process.

_Domains_ have _Sub-Domains_. Sub-Domains inherit the characteristics of their parent _Domain_. _Sub-Domains_ can override their parent configurations. The lowest level Sub-Domain is _a Life Cycle Sub-Domain._

_Life Cycle Sub-Domains_ allow you to automate the push of your continuous deployments from development through production. DeployHub can be called by your Continuous Delivery engine (Jenkins, Bamboo, GitLab, CircleCI, Puppet Relay, Google CloudBuild or GitHub Actions) to perform the continuous deployment task across all states of your pipeline. If you are not using a Continuous Delivery orchestration engine, you can assign _Tasks_ to your _Life Cycle Sub-Domain_ to define a continuous deployment &#39;promotion&#39; process within DeployHub.

## Applications

Your software project will be defined by an _Application_. An _Application_ is a collection of _Components_ that make up a complete software release, including database objects, binary objects, microservices, and environment variables. An _Application_ can also be thought of as a software &#39;Project&#39; and may map directly to your version control repository. However, in DeployHub, your software project&#39;s _Components_ can come from many different locations if needed.

_Applications_ are deployed incrementally with DeployHub. It never does a &#39;monolithic&#39; style deployment. It only releases the changes. This means that only the new _Components_ are released when a deployment is pushed. DeployHub manages incremental deployments using a versioning engine.

_Applications_ can also be used to package a collection of _Components_, like microservices, that need to be released together.

## Components

_Components_ are assigned and consumed by an _Application_. _Components_ are the binaries, database updates, microservices (containers), etc. that make up an _Application_. _Components_ cannot be deployed and must be assigned to an _Application_ for it to be pushed out to an _Endpoint._ In other words, if a _Component_ is not being consumed, it should not be released.

## Components and Microservices

_Components_ map directly to an individual microservice. If you are building a continuous deployment process that deploys your microservice to a container, you will define your microservice as a _Component._ If you want your microservice _Component_ to be shared across your teams, you will need to publish your _Component_ to a _Domain_ that allows sharing. If it is defined to only your _Application,_ thenonly your team will be able to see it.

## Component and Application Relationships

There is a many to many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_. With DeployHub, _Components_ can be easily shared between _Applications_. DeployHub tracks and versions the _Component_ relationships including to which _Applications_ they have been assigned.

## Component and Application Versioning

DeployHub uses a back-in versioning engine to track all configurations of your software deployments. Your software deployment is configured within an _Application_. An _Application_ consists of one or more _Components_. Versioning tracks all changes in both your _Application_ and _Component_ attributes including low level information such as the _Action_ used to perform the installation, environment variables, and database schemas.

When you first define your _Application_ to DeployHub, you create an _Application_ _Base_ _Version_. Over time, as you update your code and deliver new features, each change to the _Application_ creates a new _Application Version_. _Application Versions_ package together all your _Components_ that make up your entire software product. Like _Application Versions_, there is an initial _Component__Base_ _Version_ and subsequent _Component Versions,_ which represent the updates over time. An _Application Base Version_ or _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Application_ or _Component Versions_. Otherwise they are identical types of objects.

When a new _Application Version_ iscreatedfrom either an _Application Base Version_ oranother _Application Version_, it inherits all previous _Components_ from its predecessor. The predecessor is determined when running a _Create Version Task_ for an _Application Version_. You can specify whether the new _Application Version_ inherits its _Components_ from the original _Application Base Version_, the latest _Application Version_, or a specific _Application Version_.

DeployHub uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

## Continuous Configuration Management

DeployHub uses _Component_ versioning data to perform intelligent incremental releases. This allows individual microservices to be deployed independently while continually keeping track of the new _Application Version_ that it creates when it is moved to an Endpoint (cluster for example.)

When integrated to a CD pipeline, DeployHub can be called to automatically &#39;Version&#39; the _Application_ when a new microservice that it depends on is updated.

## Dependency Management

DeployHub tracks each time a _Component_ is assigned to an _Application_. _Components_ can be assigned to many _Applications_. Using the backend versioning engine, DeployHub maps _Application Versions_ to _Component Versions_ allowing you to see who is using reusable services for impact analysis, audit and making data driven decisions to address issues and perform updates.

## Repository

Each _Component_ contains a pointer to where an artifact is stored in a _Repository_ or on a file system. When DeployHub performs the pre-deployment steps, it will retrieve the artifact from any location you specify. It pulls that artifact from the repository and creates a deployment package at deployment runtime. For this reason, it doesn&#39;t need to store the actual artifact in the DeployHub versioning engine. Each _Component_ is defined with a _Repository_ reference. Your _Repository_ can be any versioning solution such as Git, or a container registry such as Quay. A _Repository_ can also reference a file system.

## Environments and Endpoints

DeployHub sends an _Application Version_ to numerous container, virtual and physical _Endpoints_ simultaneously through the use of _Environments_. An _Environment_ is a DeployHub object which acts as a collection of _Endpoints_. An _Endpoint_ is a DeployHub object that represents a single container, virtual image, or physical server in an enterprise&#39;s IT environment targeted for deployment. An _Endpoint_ can be assigned many different _Environments_, and an _Environment_ can contain many different _Endpoints_.

## Component Types and Endpoint Mapping

Each _Component_ is assigned a _Type_ attribute. The _Type_ attribute allows you to specify to what kind of _Endpoint_ that the _Component_ should be installed. For example, a Database _Component_ is installed onto an Endpoint that has the corresponding Database _Type_ definition. A _Component_ is assigned a single _Type_, while an _Endpoint_ can be assigned multiple _Types_. For example, if your single _Endpoint_ needed to have both a database and your application binaries installed, it would be assigned both a &#39;Database&#39; and an &#39;Binary&#39; _Type_ attribute.

Mapping of _Component_ to _Endpoints_ is accomplished by assigning one or more _Component Types_ to each _Endpoint_ and assigning a single _Type_ attribute to the _Component._ When an _Application_ is deployed, each _Component_ within the _Application_ will be deployed to each _Endpoint_ if the _Component&#39;s __Type_ attribute matches one of the _Endpoint&#39;s__ Types_ attributes. DeployHub ships with standard Endpoint Types and allows you to define custom _Type_ attributes.

## Functions and Procedures

Deployments can be controlled programmatically at several levels throughout the deployment process, including at the _Component_ level. _Components_ can have _Actions_ assigned to them that can be run before and after a deployment. A _Custom Action_ allows a component to be deployed by an external tool such as Helm or by internal scripting. _Actions_ contain _Procedures_ and _Functions_ which are linked together in order to control the various parts of a deployment.

A Procedure or Function can be defined as:

- A DMScript running locally to the DeployHub Server. Procedures and Functions written in DMScript have access to the DeployHub Object Model along with the various built-in methods for connecting to external systems.
- An &quot;external&quot; script running locally to the DeployHub Server.
- An &quot;external&quot; script running on the _Endpoint_ to which the deployment is taking place.
- An &quot;external&quot; script which is located locally to the DeployHub Server but which is &quot;pushed&quot; to the Target _Endpoint_ automatically and execute there.

## Credentials

_Credentials_ are objects within DeployHub that contain username and password pairs for accessing the various object. These will be used to retrieve files, access _Endpoints_, execute actions, and deploy files. Each _Credential_ can be assigned to various objects within DeployHub, so that a single _Credential_ could be assigned to many _Endpoints_ if they all use the same username/password pair. _Credentials_ are primarily used for accessing _Endpoints_, but can be applied to any object in DeployHub requiring a user name and password to access.

## Data Sources

There may come a time when the need to acquire data outside of the DeployHub system becomes a necessity, such as an ODBC connection to Oracle. The _Data Source_ object in DeployHub is available for communicating with various sources of information such as databases, HTTP servers, FTP servers, etc., and can be used to take advantage of this kind of information, as well as many others.

## Notifiers

A _Notifier_ is sent to various recipients after a successful or failed deployment attempt. They are also sent when deployed files have been changed, a _Request__Task_ has been used, or that an _Endpoint_ is down, if these features have been activated on one or more _Endpoints_. _Notifier_s can be found under the _Notifiers_ tab, which is under the _Flows_ menu. DeployHub can use SMTP (Simple Mail Transfer Protocol), Slack and HipChat for this purpose. A _Notifier_ contains all of the technical information necessary to send notifications.

## Release

A _Release_ is only available in **DeployHub Pro**. A _Release_ is a collection of _Applications_ that must be deployed together, sometimes referred to as a &#39;Release Train.&#39;

## Audit Trail

The _Audit Trail_contains a complete audit history of any changes applied to _Environments, Endpoints, Applications,_ and _Components._ An _Application&#39;s Audit Trail_ shows all deployments that occurred. Comments and documents are also added to the _Audit Trail._

## Subscribing

You can subscribe to _Environments, Endpoints, Applications, and Components_. If your _User Group_ has &#39;Read&#39; access to these objects, you can subscribe to follow the activity and changes of any of these objects.

## Reverse Proxy

A _Reverse Proxy_ is used for SaaS users to add additional security to the hosted option. The _Reverse Proxy_ is installed on the inside of your firewall and contacts the DeployHub SaaS database to determine if a deployment is ready. The _Reverse Proxy_ is also a _Deployment Engine_.

## Deployment Engine

The work of managing deployment workflows is done by a _Deployment Engine_. The _Deployment Engine_ is included in your on-premise installation of DeployHub. If you are a SaaS user, this is part of your _Reverse Proxy_. You can run multiple _Deployment Engines_ to scale extremely large deployments.

You can also pass your deployment to an external deployment engine using a Custom Action.

## DropZone

DeployHub speeds up software deployments by using a file location to perform any pre-processing of the deployment, such as retrieving the needed artifacts from a _Repository_. This work is performed on the _Reverse Proxy Deployment Engine_, or for on premise installations, on the _Deployment Engine_.