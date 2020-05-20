---
title: "Hipster Store Tutorial"
linkTitle: "Hipster Store Tutorial"
weight: 6
description: >
  Tyring out DeployHub using the Hipster Store Example.
---

## The Hipster Store Tutorial

This _Hipster Store_ tutorial introduces you to the most basic concepts behind DeployHub and it allows you to run a deployment in our hosted Kubernetes cluster (Google.) In DeployHub terminology, the _Hipster Store_ is both an _Application_ and a _Domain_. We will first review the Hipster Store _Domain_ and then review the _Application_ and related _Components_.

## Step 1 – Review the Hipster Store Domains

Domains serve as the basic structure of your microservice catalog. Developers use Domains to organize microservices based on &#39;solution spaces&#39; allowing them to both share their services and find others. The Hipster Store is defined using several _Domains._ The first is our high-level Company _Domain_ called "Vintage LLC".

To view the _Domains_:

- Click on the "_Domains_" menu and select "Hipster Store" from the Tree view.
- Click on the General tab.
- You will see the following:

![](RackMultipart20200511-4-zk9mjm_html_95ee7ac3d4043ec1.jpg)

The _Hipster Store Domain_ is a _Sub-Domain_ of Vintage LLC. It itself includes 6 _Sub-Domains_ that organize microservices by their common &#39;solution space&#39; from _Ad Service_ to _Recommendation Service_. Another sibling _Domain_ called _Purchase Processing_ is also available and it includes 5 additional _Sub-Domains_ that organize microservices into other solution spaces. As you will see later, the Hipster Store depends on some of the _Purchase Processing_ services. In this example, all _Sub-Domains_ of the Vintage LLC company have full read/write access. With DeployHub Pro, you can restrict read/write access to _Domains_.

## Step 2 – Review the Hipster Store Domain Tasks

Domains can include _Tasks_. A _Task_ defined to a _Domain_ is applied to all _Sub-Domains_. _Sub-Domains_ can override the _Tasks_ of the parent _Domain_.

- Click on the Vintage LLC Domain in the Tree view.

- Select the _Tasks_ sub menu item.

You will see that the high-level _Domain_ of Vintage LLC has no _Tasks_. If a _Task_ is defined at this level, it can be overridden by the _Task_ at the _Sub-Domain_.

![](RackMultipart20200511-4-zk9mjm_html_cf36f0f989b46e1c.jpg)

Now select the Hipster Store _Domain_ in the tree view and select the _Tasks_ Sub Menu. You will see it uses two _Tasks_. A &#39;_Deploy_&#39; Task can a &#39;_Version_&#39; Task.

![](RackMultipart20200511-4-zk9mjm_html_572bca86919cd2d1.jpg)

These _Tasks_ are required in order to allow DeployHub to deploy _Components_ and track _Versions_. If you drive down deeper and look at the _Tasks_ in the Ad Service, you will see it has only one Deploy _Task_. This is because objects in this _Domain_ are _Components_, and _Components_ are _Versioned_ independent of an _Application Version._

## Step 3 – Review a Deploy

_Applications_ are a collection of _Components_ that are released as a complete software solution. _Releases_ are a collection of _Applications_ that should be rolled out together – sometimes called a &#39;Release Train.&#39; Note: DeployHub Team does not have access to define _Releases_.

- Click on the Deploy Menu Item to display _Applications, Components_ and _Releases_.

The first list you see are all _Application Base Versions_ and _Application Versions_ organized by their associated _Domains_.

![](RackMultipart20200511-4-zk9mjm_html_9d3273742534c09b.jpg)

The first time you define an _Application,_ it is referred to as the _Application Base Version._ When you change the _Application_, you create a new _Application Version._ New _Application Versions_ arecreated by a new _Component_, new _Component Version_ or updates to any of the low-level deployment attributes. _Applications_ are assigned and deployed to _Environments._

**Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

**Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

## Step 4 – Review an Application&#39;s Components

_Applications_ are a collection of _Components_. A _Component_ can be a microservice, a binary object, a database update or any other custom object that is required by the _Application_.

- Double Click on the first _Application_ in the list: Hipster Store: July 4th. You will see a &#39;blueprint&#39; of all microservices consumed by this _Application_.

![](RackMultipart20200511-4-zk9mjm_html_ef8865ac82f85d43.jpg)

This is the _Base Version_ of the July 4th Hipster store. We you setup DeployHub for your Application, you will create a _Base Version_. Once defined, you can call DeployHub from your CD Pipeline to automatically increment new versions of your Application anytime an updated microservice is pushed across the pipeline.

## Step 5 – Review a Map of all Versions of the Hipster Store

The Hipster Store has 4 versions. There are differences between each version. The Hipster Store Map shows all the Versions and the versions of the microservices they consume. To see the entire Map, click on the &#39;Map&#39; sub-menu from the Application list.

- Click on _Application_ in the left menu.
- Select the &#39;Map&#39; sub-menu. You will be displayed a full map of all versions of the Hipster Store and their associated microservices.

![](RackMultipart20200511-4-zk9mjm_html_97d54cea8b8ad3aa.jpg)

Alternatively, you can view a single Version of the Hipster Store Map by selecting the check-box in the Application list and then clicking on the Map sub-menu.

## Step 6 – Review a Component

_Components_ contain the actual artifacts (files and scripts) of the _Application,_ along with Pre and Post _Actions_ that defines how the microservice is deployed to the cluster. _Components_ change over time, and so DeployHub uses a _Component Base Versions_ and subsequent _Component Versions._ This is the same versioning logic that applies to _Application Base Versions_ and _Application Versions._

- Click on _Component_ option in the left menu. You will be shown a list of all Components.
- You will be shown a list of _Components_ based on the _Domain_. You can filter _Components_ by:
  - _Domain_
  - _Environment_
  - _Last Deployed_
  - _Results_
  - _Versions_
- Filter your list by clicking in the search bar and selecting "Domian" and then "GLOBAL.Chasing Horses LLC.Vintage LLC.Hipster Store.Ad Service" from the Search bar. This will show you all the _Components_ available in the Ad Service _Domain_.
- Double click on "Ad Service: 1\_2\_2\_77" and then right mouse click on the Item Icon – select "Edit Details." This will show the deployment meta data required for the release of this _Component_. Anyone how uses this _Component_ will automatically bring forward all the necessary information for a deployment.

![](RackMultipart20200511-4-zk9mjm_html_d751450dd4146972.jpg)

This information is versioned and any change to it will create a new _Component Version_.

A _Component_ may include more than a single file or file type and therefore contains _Component Items. Component Types_ and _Endpoint Types_ make sure that only certain kinds _Components_ are applied to their appropriate _Endpoints_ during a deployment, i.e. one to a cluster and another to a database server.

- **Component Base Version** : Objects within DeployHub that contain the files and procedures that are deployed to _Endpoints_.

- **Component Version** : A child of the _Component Base Version_ that represents changes.

- **Component Item** : _Component Versions_ contain one or more _Component Items_, which reference the actual deployed files and scripts. Each _Component Item_ references a _Repository_ so that a _Component Version_ can contain files from many different sources. These _Component Items_ are linked together within a _Component Version_ to determine the order deployed
