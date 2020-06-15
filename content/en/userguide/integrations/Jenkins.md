---
title: "Jenkins Build Engine"
linkTitle: "Jenkins Build Engine"
weight: 68
description: >
  Calling DeployHub from Jenkins for microservice tracking.
---

A Jenkins Build Job communicates with DeployHub, passing log and results. Any time a DeployHub deployment is performed from Jenkins, the _Application Version_ and _Environment_ are required, by name, i.e. Application;1, Environment. If the names are not unique, the domain name must be included, i.e. DomainName.Application;1.

## Jenkins _Build Jobs_ and Components

A Jenkins Build Job Run creates a Build Job Number stored in a DeployHub _Component_. A field named 'Last Build Number' is updated every time a Build Job is executed. The DeployHub Jenkins plug-in has a "notify only" mode for when a build has been done. Clicking on "Endpoints and Builds" will show all of the builds that have been done for that _Component_. Clicking on a Build Number will open a pop-up with the build log that has been pulled from Jenkins.

## Build Job Run

An execution of Jenkins is called a Build Job Run, and DeployHub can be called at any step during the execution. It can build files, call DeployHub to perform a deployment, build more files, call DeployHub again, etc. This can be done in any order, in separate runs, or all together.

Jenkins build logs can be viewed directly from inside the DeployHub URL, minimizing the amount of browser activity required. For example, a user can see a build artifact on a target _Endpoint_ and open the details of the generating build directly from the _Endpoint_ details page.

If the 'Always Deploy' flag is set to Yes on a Component, it makes no difference if the version of the Component is different or the same as the one on the _Endpoint_; the _Component_ is deployed to the _Endpoint_. If the 'Always Deploy' flag is set to No, the version on the _Endpoint_ and the version of the _Component_ must be different for the _Component_ to be deployed. However, even if the version on the _Endpoint_ and the version of the _Component_ are the same, if the Last Build Number in the _Component_ is different than the last build number in Jenkins, the _Component_ will be deployed.

## Groovy Library for Jenkins

The pre and post logic of DeployHub gives a tremendous amount of flexibility, whether used alone or in tandem with Jenkins as a Groovy Pipeline Library. Jenkins can call DeployHub to perform:

- Continuous Configuration Management: The process of automatically versioning microservices with their consuming _Applications_. Jenkins notifiies DeployHub when a new Job has been started at which point DeployHub pulls the build job information into DeployHub's database.
- Approvals: Track an Approval, with audit, between Jenkins and DeployHub.
- Moves:  Allows Jenkins to tell DeployHub to push a new update from one state to the next.
- Deploy: Allows Jenkins to tell DeployHub when the deployment needs to be executed.
- Shared Logs: Centralize logs between DeployHub and Jenkins.

### Installation

Update your Jenkins Configure System - Global Pipeline Libraries to load the DeployHub Groovy Library from Git.

![Jenkins Setup](/userguide/images/jenkins-setup.png)

### Resources

- [Git Repo - jenkinsci/deployhub-plugin](https://github.com/jenkinsci/deployhub-plugin)
- [Groovy Doc](/groovydoc/DefaultPackage/deployhub.html)

#### Example Pipeline

This example will create a new _Component Version_ for the _Application Version_ listed in the pipeline.  Then it will update the _Attributes_ of the _Component Version_ with information from Jenkins.

``` groovy
@Library('deployhub') _


 def app="ChiliUptimeApp"
 def environment=""
 def cmd=""
 def url="http://192.168.3.116:8181"
 def user="admin"
 def pw="admin"
 def dh = new deployhub();

 node {
    stage('Clone sources') {
        git url: 'https://github.com/DeployHubProject/Uptime-Jenkins-Pipeline.git'
    }

    stage ('Build') {
      def url="https://console.deployhub.com"
      def user="DHUSER"
      def pw="DHPASSWORD"
      def comp="GLOBAL.CSC589.chili.Development.bowl"
      def application="GLOBAL.CSC589.chili.Development.ChiliUptimeApp"  
      def appver = "1"
      def version = "0.1.0-109"
      def imagename = "chili-bowl"
      def String[] envs = ["GLOBAL.CSC589.chili.Development.Dev"]
      def endpoint = "GLOBAL.CSC589.chili.k8s"

      echo "${url}";
      echo "${comp}";
      echo "${version}";

      // create component version
      compid = dh.newComponentVersion(url, user, pw, comp, "", version);
      echo "Creation Done " + compid.toString();

      // update attrs
      def attrs = [
      buildnumber: env.BUILD_ID,
      ComponentType: "Helm Chart",
      Category: "Deploy",
      AlwaysDeploy: "Y",
      DeploySequentially: "Y",
      'creds["helmrepo"]': "ec2user",
      Chart: "stable/heartbeat",
      ChartVersion: "1.0.0",
      ChartNamespace: "dev1",
      'image.tag': "1.0.0"
     ];

      echo "${attrs}";
      data = dh.updateComponentAttrs(url, user, pw, comp, "", version , attrs);
      echo "Update Done " + data.toString();

      data = dh.newApplication(url, user, pw,application,appver, envs);
      echo "New Application " + data.toString();
      appid = data[0];

      data = dh.addCompVer2AppVer(url, user, pw, appid, compid);

      attrs = [
      appvar: "1234"
     ];
      echo "${attrs}";
      data = dh.updateApplicationAttrs(url, user, pw, application, appver , attrs);
      echo "App Attr Update Done " + data.toString();

      attrs = [
      envvar: "XXYY"
     ];
      echo "${attrs}";
      data = dh.updateEnvironmentAttrs(url, user, pw, envs[0], attrs);
      echo "Env Attr Update Done " + data.toString();

      attrs = [
      epvar: "WWW"
     ];
      echo "${attrs}";
      data = dh.updateEndpointAttrs(url, user, pw, endpoint, attrs);
      echo "Endpoint Attr Update Done " + data.toString();
  }

```

For more information see:

- [Building Your Domain Catalog - Tasks in this Domain](/userguide/first-steps/2-defining-domains/)
- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
