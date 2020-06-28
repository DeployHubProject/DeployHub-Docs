---
title: "Helm"
linkTitle: "Helm"
weight: 64
description: >
  Using Helm to execute deployments as an Action.
---

Helm standardizes the process of creating your container image. It is an agentless solution that can be called via a DeployHub 'Custom Action.' Helm provides a broad set of pre-defined Helm "Charts." A Helm Chart is a reusable script that simplifies the creation of your container image. When DeployHub executes the release process, it will call the Helm Chart you have defined as your Custom Action. What DeployHub offers is the versioning around your container content, what was released, including the version of the Helm Chart.  DeployHub tracks all the configuration of your release and tracks the version changes to the configuration, including Helm.

Helm is called as a DeployHub "Custom Action." A _Custom Action_ can replace the usual DeployHub deployment processing by calling an external script that performs its own deployment activities. _Custom Actions_ can be used when you want an external tool to perform the delivery step of the deployment process. This will be the case for Helm. To use Helm, you will need to import two Helm Procedures and Define an Action that can be reused across all teams.

## Importing the DeployHub Helm Procedures

To use Helm, you will need to import the most current DeployHub Helm Procedures from GitHub. There will be two:

- _WriteEnv2Toml.re_ - This Procedure takes all the attributes from DeployHub Environments, Applications, Endpoints and Components and writes them to a file readable by the Helm Procedure.
- _HelmUpgrade.re_ – This Procedure performs a Helm upgrade/install of the Helm Chart.

Download them from:

[Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Flows_ menu and then navigate to the _Function &amp; Procedures_ tab. Select your Domain, such as '_Global_ Domain,' and right click for the Menu. Choose _Import a Function or Procedure into this Domain._ Upload the two Procedures one at a time into the DeployHub database.

## Creating a Custom Action for Helm

Once you have imported your Helm Procedures, you can define your Custom Action. Change to the Workflow tab on the right pane. Select your Domain and right click. This will give you the option to create a "New Action in this Domain."

Name the new Action "HelmChart" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the two Procedures. Drag them onto the area under _Start._   The order should be _WriteEnv2Toml_, _HelmUpgrade_

### _WriteEnv2File_ Parameters

No fields are required for _WriteEnv2File_.

### _HelmUpgrade_ Parameters

| Field | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **RspFile** | $RspFile | The results from the WriteEnv2Toml.re Procedure |
| **Chart** | $(Chart) | The Helm Chart to be used during the deployment |
| **Release Name** | $(component.name) | The name of the release |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values. Because this new Action is reusable, no Component variables are defined.

## Assign the HelmChart Action to a Component

For each Docker Component you will need to define the variable values. Values are specified when you create a new Docker _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from DeployHub will be passed along to Helm's values.yml file at execution time.

Docker component items have the following attributes, none of which are required:

| Field | Description |
| --- | --- |
| **BuildId** | The build ID from the build system such as Quay or DockerHub |
| **BuildUrl** | Build URL for the build system |
| **Chart** | Helm chart for the component |
| **Chart Version** | Version of the Helm chart |
| **Chart Name Space** | Namespace for the Helm chart to deploy to |
| **Operator** | Kubernetes Operator |
| **DockerBuildDate** | Timestamp for the Docker Build |
| **DockerSha** | SHA for the Docker Image |
| **DockerRepo** | URL for the Docker Registry |
| **GitCommit** | Git Commit that triggered the Build |
| **GitRepo** | Git Repo Name |
| **GitTag** | Git Tag such as 'Master' or 'v1.5.0' |
| **GitUrl** | URL to the Git Repository |
| **BuildNumber** | Build Job Number for CI/CD |
| **Build Job** | Build Job name for CI/CD |
| **ComponentType** | Name of the Component Type |
| **ChangeRequestDS** | Name of the Change Request Datasource |
| **Category** | Name of the Components Category |
| **AlwaysDeploy** | Y/N |
| **DeploySequentially** | Y/N |
| **BaseDirectory** | Base Directory for the Component |
| **PreAction** | Name of the Pre-Action |
| **PostAction** | Name of the Post-Action |
| **CustomAction** | Name of the Custom-Action |
| **Summary** | Component Summary or Description |

or more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
