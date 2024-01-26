---
title: "Deployment Frequency"
linkTitle: "Deployment Frequency"
weight: 40
description: >
  Deployment frequency of an _Application_ per _Environment_
---

The Deployment Frequency is a count of the number of times a _Application_ is deployed to an _Environment_ per month.  _Application Versions_ are grouped together using the _Application Base Version_.  This grouping is equivalent to an _Application_.

## Setup

In order for DeployHub to track the Deployment Frequency you must record when a deployment happens for an _Application Version_ and to
which _Environment_ it happened for.  The DeployHub CLI can be used to record the deployment.  Using the CLI enables the Workflow tool,
Jenkins, GitHub, or GitLab, to tell DeployHub when it performs a deployment.

### Recording a Deployment with the Ortelius CLI

DeployHub uses the Command Line Interface from the [Ortelius Open Source project](https://www.ortelius.io) incubating at the Linux Foundation. See [Installing the CLI](/userguide/installation-and-support/0-commandlineinterface) for CI/CD Setup instructions.  

The CLI accepts a json file that defines the _Application Version_, _Environment_ and deployment return code. 
The _Application Version_ is an existing application version that was created manually or earlier in your pipeline.  
The _Environment_ the environment, Dev, QA or Prod, that the _Application Version_ was deployed to.  The deployment
return code is 0 for successful deployment or 1 for failed deployment.

#### Deploy.json File

```json
{
 "application": "GLOBAL.Online Store Company.Hipster Store.Test.Hipster Store;Labor Day Sale;1_2_10_2",
 "environment": "GLOBAL.Online Store Company.Hipster Store.qa3-windows",
 "rc": 0
}
```

#### Running the CLI

The following variables should be set at the beginning of your Pipeline.

| Variable | Value                  | Description                                                                              |
|----------|------------------------|------------------------------------------------------------------------------------------|
| DHURL    | URL to DeployHub Login | The URL used to access DeployHub.                                                        |
| DHUSER   | UserID                 | The ID used to log into DeployHub                                                        |
| DHPASS   | password               | The password used to log into DeployHub. This can encrypted based on the CI/CD solution. |

Example

```bash
export DHURL=https://deployhub.example.com
export DHUSER=Stella99
export DHPASS=password
```

```bash
dh deploy --deploydata deploy.json --logdeployment
```

#### Results

In the DeployHub web UI, navigate to the _Application_ list view.  You will see that the _Application Version_ has been deployed to
_Environment_ with a _Deployment_ number.  The _Deployment_ number is generated by the CLI.  

The Deployment Frequency report is accessible by selecting an _Application Version_ in the list view, then menu item `Reports -> Deployment Frequency`.

![Deployment Frequency](/deployment-frequency.png)

The data time the top and bottom graphs are the same but use different visualizations in order to under the the Deployment Frequency.  
The graphs are interactive, so float-overs and clicking on the labels will highlight and filter the data.