---
title: "DeployHub Integrations"
linkTitle: "DeployHub Integrations"
weight: 49
description: >
  Integrating DevOps tools with DeployHub for CI/CD, messaging and infrastructure.
---

## Intro to Integrations

DeployHub has an open architecture with many out of the box integrations with other DevOps tools. You can incorporate the use of tools such as Ansible or Helm, add Slack or deploy to WebSphere or Salesforce with our built-in _Actions_ or create _Custom Actions_ using [DMScript](/userguide/dmscript/).  In addition, you can use DeployHub's [RESTfull APIs](/userguide/restapi/)to interact with the DeployHub Objects for integration into external systems, or execute on a continuous delivery trigger.

## Types of Integrations

Integrations can be created using:

- [_Notifiers_](/userguide/customizations/2-define-notifiers/) for calling, Email, Slack or Hipchat.
- [_Actions_ and _Custom Actions_](/userguide/customizations/2-define-your-actions/) for deploying and managing Infrastructure Components like Tomcat or WebSphere or performing deployments with Helm, Ansible or Cloud Foundry.
- [_Data Sources_](/userguide/profeatures/2-data-sources/) for connecting to outside data such as Change Request systems like Jira, Git or Bugzilla.
- [_APIs_](/userguide/restapi/) for creating continuous delivery plug-ins for continuous configuration management.

{{% include "userguide/reusable/ListofActions.md" %}}  
