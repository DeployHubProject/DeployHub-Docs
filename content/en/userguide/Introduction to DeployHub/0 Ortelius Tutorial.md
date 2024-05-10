---
title: "Ortelius Tutorial"
linkTitle: "Ortelius Tutorial"
weight: 3 
description: >
  Explore Ortelius Domains, Components, Applications, Open-Source Inventory, and Environments.
---
This tutorial uses the Ortelius project to walk you through the basic concepts of Continuous Security Intelligence. DeployHub Team is based on the [Ortelius](https://ortelius.io) Open-Source project, incubating at the [Continuous Delivery Foundation](https://cd.foundation). This free SaaS version of Ortelius is hosted by DeployHub, and is also referred to as DeployHub Team. 

## Signing Up and Getting Started

When you [signup for DeployHub Team](https://www.deployhub.com/deployhub-team/), you are asked for basic information, your UserID/Password, Company and Project names. Your UserID/Password and Company name are unique.  Your Project will be a _Subdomain_ under your Company _Domain_.

DeployHub Team is accessible through the following url:

[https://console.deployhub.com/dmadminweb/Home](https://console.deployhub.com/dmadminweb/Home)

Login using the UserID and Password you used when you signed up for DeployHub. Check your email for your login information. 

Upon logging into DeployHub, you will be given an option to select your Company Name Domain, or the Open Source Domain. The Open Source Domain is prepopulated with data so you can take a tour.  Select the Open Source Domain to start exploring. 

![Sign into a Domain](/userguide/images/domainsignin.jpg)

## Explore Domains

_Domains_ serve as the basic structure of organizing Continuous Security Intelligence. Developers use _Domains_ to catalog their _Components_ based on 'solution spaces.' Organizing your software supply chain in this way allows for _Components_ to be easily shared.

_Domains_ are not folders. They serve as a method for creating fully qualified names of Objects within DeployHub to keep things organized.  _Domains_ also manage security and Tasks.  When you assign security options and Tasks at the _Domain_ level, any child _Subdomain_ inherits the value. A child _Subdomain_ can override a parent _Domain_ value. 

You can explore the _GLOBAL.open source_ Domain to learn how Continuous Security Intelligence is organized.  In DeployHub terminology, the _GLOBAL.open source_ Domain has multiple _Subdomains_.

### Take a Tour of _Domains_:

1) From the left hand side menu, select _Domains_ to see the child _Subdomains_. You will see Linux Foundation, NPM, Golang, Maven as a few of the options. Click on Linux Foundation to expand the chart to view further _Subdomains_.

2) You will see the Linux Foundation includes the CDF and OpenSSF as _Subdomains_. Under the CDF, you will see the child _Subdomain_ Ortelius. Select Ortelius to see the _Subdomains_ associated to the Ortelius project. These _Subdomains_ represent different releases of Ortelius.

For More information on Domains see - [Building _Domains_](/userguide/first-steps/2-defining-domains/)

## Explore Components

_Components_ are artifacts, binaries, database SQL, files or any deployable artifact. _Components_ are assigned to _Applications_. This assignment allows for the aggregation of data from the _Components_ to the _Applications_ that consume them, providing unified Software Bill of Materials reports and Application Security Posture reports.  

### Take a Tour of _Components_

1) From the left hand side menu, select "_Components_". Using the filter option, choose _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ to view all of the _Components_ consumed by the Ortelius open source project. 

![Ortelius Domain](/userguide/images/OrteliusDomainSelection.jpg)

<br>

2) Notice that the first item in the list is _ms-compitem-crud;main_. "Main" indicates the base version of this _Component_. The subsequent items in the list shows the changes from the "Main" branch.

![Components](/userguide/images/OrteliusComponentMain.jpg)

<br>

3) Generate a Comparison Report between two _Component_ versions. Checkmark any two versions and select the _Compare_ option from the list menu  to see their differences.

![Compare Components](/userguide/images/componentlist.jpg)

4) View a _Component_ Software Bill of Materials (SBOM) Report. When your _Component_ build executes, Ortelius will generate an Software Bill of Material using the tool of your choice. DeployHub then cross references the known vulnerabilities to the packages. The report shows a timestamp to record the point in time the vulnerabilities were found. This is a static view of the known vulnerabilities at build time. 

![Component SBOM](/userguide/images/SBOM-component.jpg)


5) Sort Components by "Completed." "Completed" indicates the _Component_ has been deployed to end users. From the _Component_ list view, click on "Completed" to sort. Select a _Component_ in the completed list to view its Security Posture and current vulnerabilities. DeployHub provides updates to vulnerabilities every 30 minutes. 

![CompletedComponents](/userguide/images/completed.jpg)



6) View the _Components_ details including the OpenSSF Scorecard Results, current known vulnerabilities, and Overall _Component_ Security Posture. 

![Components Scorecard](/userguide/images/componentOpenSSFSC.jpg)


![Components Swagger](/userguide/images/readme-swagger.jpg)


![Components Vulnerabilities](/userguide/images/newvulnerabilities.jpg)


7) View the Blast Radius of a _Component_. The Blast Radius shows you what 'logical' applications are impacted by a vulnerability, anomaly, or update. From the _Component_ detail screen, scroll to the bottom to see the Dependency Map. You will see this map shows the versions of the Ortelius "logical" _Application_ that are using this version of the _Component_. 


![Component Map](/userguide/images/component-map.jpg)

<br>

For More information on Components see - [Publishing _Components_](/userguide/publishing-components/)

## Explore Applications

An _Application_ is a collection of _Components_ that make up a complete software solution.  DeployHub manages the Logical _Application_ aggregating _Component_ data up to the application-level. 

### Take a Tour of _Applications_

1) From the left hand side menu, select "_Applications"_. If you have completed the above steps, you will still be in the _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ Domain. 


2) Notice that the first item in the list is _ortelius_ without a assigned Version number. This indicates the main branch of the Ortelius _Application_. Select "Completed" from the list menu options to sort by all versions of Ortelius that have been released. 

![Application List](/userguide/images/app-list.jpg)

<br>

3) Generate a Comparison Report between two _Application_ versions. Checkmark any two versions and select the _Compare_ option from the list menu  to see their differences.

![Compare Applications](/userguide/images/app-compare-select.jpg)

Results:

![Compare Application Results](/userguide/images/app-compare.jpg)


4) View an aggregated _Application_ Software Bill of Material report. An _Application_ SBOM is a report that shows all of the _Application's_ _Component_ SBOM data, with duplicates removed. When a _Component_ is updated, DeployHub automatically creates a new version of all _Applications_ consuming the _Component_, with a new aggregated SBOM. DeployHub then cross references all of the _Application's_ _Components_ packages with the known vulnerabilities. The report shows a timestamp to record the point in time the vulnerabilities were found. This is a static view of the known vulnerabilities at build time for the _Application_ with SBOM details. If you are required to produce an SBOM for governance purposes, you can provide your consumers with access to the DeployHub platform allowing them to 'self serve' and track your _Application's_ security posture.  

![Export SBOM](/userguide/images/exportSBOM.jpg)


5) View the _Application_ details including:
- List of _Components_ the _Application Consumes
- List of OS packages from the SBOM report
- List of current vulnerabilities 

![Application details](/userguide/images/application-detials.jpg)


6) View the _Applications_ overall security compliance. This report shows the security activities that are associated with the DevSecOps pipeline. 

![Compliance Run](/userguide/images/run-compliance.jpg)

Results:

![Compliance Results](/userguide/images/compliance-results.jpg)



Learn More at  [Packaging _Applications_](/userguide/packaging-applications/)


## Explore Open-Source Inventory

DeployHub allows you to search your entire inventory of _Components_ for open-source packages. Rapidly responding to vulnerabilities requires you know precisely where your exposure to the vulnerability is running, and what _Components_ need to remediated. 

### Take a Tour of Open-Source Inventory

1) Search for Package using the "Package Search" menu option from the _Application_ list view. 

![Package Search Menu](/userguide/images/packagesearchmenu.jpg)


2) Enter the package you wish to search for such as "Spring." 

![Package Search Menu](/userguide/images/spring-search.jpg)

Results:

![Package Search Menu](/userguide/images/spring-results.jpg)



## Conclusion

There are many other features of DeployHub that we did not get to cover on this short test drive. However, you should have the basic understanding of the major Objects and concepts needed to get you started.  What we did not cover that you may want to view are:

[Environments and Endpoints](/userguide/first-steps/2-define-your-credentials/) - Environments and Endpoints can be used to:
-  execute deployments using DeployHub's internal agentless deployment engine
-  associate an artifact repo to your _Application_ 
-  connect your external deployment tools, called from your CI/CD deployment step, to DeployHub. 

Another important topic is integrating with your CD pipeline.  See [Using DeployHub with CI/CD](/userguide/integrations/ci-cd_integrations/) on how you can include gathering all DevSecOps data.

We will leave you with how to setup DeployHub for your installation.  See [First Steps](/userguide/first-steps/), for getting your setup completed. Once you have your setup complete you can start continuously gathering your software supply chains security intelligence. 


