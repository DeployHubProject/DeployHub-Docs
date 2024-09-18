---
title: "Custom DeployHub Pro Actions"
linkTitle: "Custom DeployHub Pro Actions"
weight: 301
description: >
  Customizing integrations with DeployHub Pro Actions.
---

## Using DeployHub Pro Actions for Custom Integrations

DeployHub Pro has an open architecture with many out of the box integrations with other DevOps tools. You can incorporate the use of tools such as Ansible or Helm, add Slack or deploy to WebSphere or Salesforce with our built-in _Actions_ or by creating _Custom Actions_ using any scripting languages.  In addition, you can use [DMScript](/userguide/advanced-features/dmscript/) which has pre-built access to the DeployHub Pro Objects.  [RESTfull APIs](/userguide/advanced-features/restapi/) are also available to interact with the DeployHub Pro Objects for integration into external systems, or execute on a continuous delivery trigger.

## Types of Actions

Actions can be created using:

- [_Notifiers_](/userguide/advanced-features/deployments/2-define-notifiers/) for calling, Email, Slack or Hipchat.
- [_Actions_ and _Custom Actions_](userguide/advanced-features/deployments/2-define-your-actions/) for deploying and managing Infrastructure Components like Tomcat or WebSphere or performing deployments with Helm, Ansible or Cloud Foundry.
- [_Data Sources_](/userguide/advanced-features/deployments/2-data-sources/) for connecting to outside data such as Change Request systems like Jira, Git or Bugzilla.
- [_APIs_](/userguide/advanced-features/restapi/) for creating continuous delivery plug-ins for continuous configuration management.

{{% include "userguide/reusable/ListofActions.md" %}}  
