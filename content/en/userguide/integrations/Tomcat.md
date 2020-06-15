---
title: "Tomcat"
linkTitle: "Tomcat"
weight: 74
description: >
  Executing deployments requiring a Tomcat Server.
---

_Actions_ for Tomcat Windows servers are pre-defined within DeployHub.  _Pre_ and _Post_ _Actions_ at the _Application_ definition level are used for stopping and starting the Tomcat server.

## New Action for the Ansible Playbook

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "TomcatStopAction" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the TomcatPreDeploy. Drag it onto the area under _Start._  

Repeat the same steps for creating your "_Tomcat Post Deploy_" _Action_.

### _TomcatPreDeploy_ and _TomcatPostDeploy_ Parameters

| _**Field**_ | Value | Description |
| --- | --- | --- |
| _**Title**_ | Not Required |
 |
| _**Summary**_ | Not Required |
 |
| _**Tomcat Service Name**_ | $TOMCAT_SERVICE_NAME| The service running Tomcat |
| _**Tomcat Root**_ | $TOMCAT_ROOT | Tomcat web root |
| _**Application Name**_ | $APPLICATION_NAME | Application name (based on the .war or .ear) |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values. Because this new Action is reusable, no Component variables are defined.

### Assign the TomcatStop amd TomcatStart Action to a Component

The _Component's_ _Pre-Action_ will be the TomcatStop which will stop Tomcat prior to the deployment of the war or ear.  The The _Component's_ _Post-Action_ will be the TomcatStart which will start Tomcat after the deployment has been completed.

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
