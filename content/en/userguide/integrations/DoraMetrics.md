---
title: "DORA Metrics Reports"
linkTitle: "DORA Metrics Reports"
weight: 307
description: >
  Aggregated DORA Metrics for Decoupled Deployments
---

![Dora](/userguide/images/dora.png)

## DevOps Research and Assessment (DORA)

When DeployHub Pro is integrated into your CI/CD pipeline, it can capture metrics for DORA reporting. The two DORA metrics that DeployHub Pro captures are Deployment Frequency and Lead Time for Changes.

DeployHub Pro collects Dora Metrics on _Application Versions_ reporting the _Application_ Dora metrics in decoupled architectures. 

### Deployment Frequency

The DORA Deployment Frequency is how **often** an organization **successfully** releases to **production**.

The Deployment Frequency is a count of the number of times a _Application_ is deployed to an _Environment_ per month.  _Application Versions_ are grouped together using the _Application Base Version_.  This grouping is equivalent to an _Application_.

In order for DeployHub Pro to track the Deployment Frequency you must record when a deployment happens for an _Application Version_ and to which _Environment_ it happened for. 

#### Recording with DeployHub Pro Deployment Internal Engine

When using the internal DeployHub Pro deployment engine, all deployment frequency is automatically recorded by DeployHub Pro. 

#### Recording with External Deployment Engines

The DeployHub Pro CLI can be used to record the deployment. Using the CLI enables the Workflow tool, i.e. 
Jenkins, GitHub, or GitLab, to tell DeployHub Pro when it performs a deployment.See the [CI/CD Chapter](/userguide/integrations/ci-cd_integrations/) for more information and setup instruction


### Lead Time for Change

The Lead Time for Change is the amount of time from the developer performing a build of a Git commit which creates a _Component Version_ and when that _Component Version_ is deployed to an _Environment.  _Component Versions_ as packaged into an _Application Version_.  The _Application Version_ is used in the report since it aggregates all Git commits and deployments up from the _Component Versions_.  So the Lead Time will be
from the most recent Git commit to the most recent deployment to an _Environment_.

#### Recording with DeployHub Pro Deployment Internal Engine

When using the internal DeployHub Pro deployment engine, all deployment lead time for change is automatically recorded by DeployHub Pro. 

#### Recording with External Deployment Engines

The DeployHub Pro CLI can be used to record the deployment lead time for change. Using the CLI enables the Workflow tool, i.e. Jenkins, GitHub, or GitLab, to tell DeployHub Pro when it performs a deployment. See the [CI/CD Chapter](/userguide/integrations/ci-cd_integrations/) for more information and setup instructions. 
