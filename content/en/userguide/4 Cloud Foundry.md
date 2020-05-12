---
title: "Cloud Foundry"
linkTitle: "Cloud Foundry"
weight: 58
---
## Cloud Foundry

Cloud Foundry is an open source cloud platform as a service (PaaS) on which developers can build, deploy, run and scale applications on public and private cloud models.

Developers interact with Cloud Foundry by running a command line tool (cf) which then interacts with the Cloud Foundry _Endpoin_t. To deploy a new _Application_ (or to make changes to an existing _Application_) developers uses the &quot;cf push&quot; command to upload the _Application_ to the Cloud Foundry _Endpoint_.

Cloud Foundry supports multiple &quot;spaces&quot;. Each space can be configured individually and can be used as different target types (for example, Dev, Test, and Production).

Since DeployHub is an agentless solution, it can deploy to Cloud Foundry by executing the cf command automatically as part of the deployment process. It can extract your DeployHub _Application_ code from any _Repository_ and push the changes up to the Cloud Foundry _Endpoint_. It can then track which version of the _Application_ is installed in which Cloud Foundry space.

Installing Cloud Foundry&#39;s cf Command Line Interface (cf CLI) on the same server as DeployHub allows the execution cf commands easily. An _Application_ contains one or more _Components_, any one of which can have a _Custom Action_ containing a cf command that targets the designated Clound Foundry _Endpoint_. For instance, a Cloud Foundry application named my\_app could be started by writing a script named startMyApp.sh that looks like:

```bash
#!/bin/sh

cf api https://myexample.com
cf auth myname mypassword
cf target -o myorg -s myspace
cf push `my_app` -c null
```

If this script resides within the /scripts directory of the DeployHub installation, it can be called by putting &quot;/scripts/startMyApp.sh&quot; into a Procedure, placing it within an _Action_, and putting the name of the _Action_ into a _Component&#39;s Custom Action_ field. Deploying the _Application_ that contains the _Component_ causes the _Action_ to be called, which runs the script and starts the Cloud Foundry _Application_ named my\_app.

Cloud Foundry is ideal for Blue-Green deployment strategies. In such a scenario, Production is mirrored across two distinct environments - &quot;blue&quot; and &quot;green&quot;. End Users point to one of these _Environments_ whilst deployments are made to the other. Once testing is complete on the deployed _Environment_, users are switched over to this _Environment_ and the deployment is performed again to the other _Environment_. This maximizes uptime and minimizes the risks in performing a _Rollback_.

DeployHub supports such a Blue-Green deployment strategy. Both _Environments_ can be targeted individually as part of two separate deployments or you can deploy to both with DeployHub deploying to the second _Environment_ automatically following successful test and switch-over.
