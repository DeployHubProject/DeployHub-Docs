---
title: "Helm"
linkTitle: "Helm"
weight: 64
---
## Helm

Helm standardizes the process of creating your container image. It is an agentless solution that can be called via a DeployHub &#39;Custom Action.&#39; Helm provides a broad set of pre-defined Helm &quot;Charts.&quot; A Helm Chart is a reusable script that simplifies the creation of your container image. When DeployHub executes the release process, it will call the Helm Chart you have defined as your Custom Action. What DeployHub offers is the versioning around your container content, what was released, including the version of the Helm Chart.  DeployHub tracks all the configuration of your release and tracks the version changes to the configuration, including Helm.

Helm is called as a DeployHub &quot;Custom Action.&quot; A _Custom Action_ can replace the usual DeployHub deployment processing by calling an external script that performs its own deployment activities. _Custom Actions_ can be used when you want an external tool to perform the delivery step of the deployment process. This will be the case for Helm. To use Helm, you will need to import two Helm Procedures and Define an Action that can be reused across all teams.

## Importing the DeployHub Helm Procedures

To use Helm, you will need to import the most current DeployHub Helm Procedures from GitHub. There will be two:

- _WriteEnv2Toml.re_ - This Procedure takes all the attributes from DeployHub Environments, Applications, Endpoints and Components and writes them to a file readable by the Helm Procedure.
- _HelmUpgrade.re_ – This Procedure performs a Helm upgrade/install of the Helm Chart.

Download them from:

[https://github.com/DeployHubProject/DeployHub-Pro/tree/master/procedures](https://github.com/DeployHubProject/DeployHub-Pro/tree/master/procedures)

Once downloaded, you will need to Import them into DeployHub as the Procedures. To import these Procedures login to DeployHub and select the _Flows_ menu and then navigate to the _Function &amp; Procedures_ tab. Select your Domain, such as &#39;_Global_ Domain,&#39; and right click for the Menu. Choose _Import a Function or Procedure into this Domain._ Upload the two Procedures one at a time into the DeployHub database.

## Creating a Custom Action for Helm

Once you have imported your Helm Procedures, you can define your Custom Action. Change to the Workflow tab on the right pane. Select your Domain and right click. This will give you the option to create a &quot;New Action in this Domain.&quot;

Name the new Action &quot;HelmChart&quot; (no spaces).

![HelmChart](RackMultipart20200511-4-mmhhr8_html_a638f5a2b049e534.png)

Now we are going to customize this Action. Go to the Workflow tab. You will see the &#39;Activity Hub&#39; on the Righthand side of your screen. Navigate to your Domain to find the two Procedures. Drag them onto the area under _Start._ This will bring up the Dialog box to enter the parameters. No fields are required for _WriteEnv2Toml_.

![WriteEnv2Toml](RackMultipart20200511-4-mmhhr8_html_ae653e05e2199802.png)

Repeat the process for the _HelmUpgrade_ Procedure and fill in the fields as follows:

| _**Field**_ | Value | Description |
| --- | --- | --- |
| _**Title**_ | Not Required |
 |
| _**Summary**_ | Not Required |
 |
| _**RspFile**_ | $RspFile | (The results from the WriteEnv2Toml.re Procedure) |
| _**Chart**_ | $(Chart) | (The Helm Chart to be used during the deployment) |
| _**Release Name**_ | $(component.name) | (The name of the Component) |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values. Because this new Action is reusable, no Component variables are defined.

## Assign the HelmChart Action to a Component

For each Docker Component you will need to define the variable values. Values are specified when you create a new Docker _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from DeployHub will be passed along to Helm&#39;s values.yml file at execution time.

Docker component items have the following attributes, none of which are required:

| _**BuildId**_ | The build ID from the build system such as Quay or DockerHub |
| --- | --- |
| _**BuildUrl**_ | Build URL for the build system |
| _**Chart**_ | Helm chart for the component |
| _**Chart Version**_ | Version of the Helm chart |
| _**Chart Name Space**_ | Namespace for the Helm chart to deploy to |
| _**Operator**_ | Kubernetes Operator |
| _**DockerBuildDate**_ | Timestamp for the Docker Build |
| _**DockerSha**_ | SHA for the Docker Image |
| _**DockerRepo**_ | URL for the Docker Registry |
| _**GitCommit**_ | Git Commit that triggered the Build |
| _**GitRepo**_ | Git Repo Name |
| _**GitTag**_ | Git Tag such as &#39;Master&#39; or &#39;v1.5.0&#39; |
| _**GitUrl**_ | URL to the Git Repository |
| _**BuildNumber**_ | Build Job Number for CI/CD |
| _**Build Job**_ | Build Job name for CI/CD |
| _**ComponentType**_ | Name of the Component Type |
| _**ChangeRequestDS**_ | Name of the Change Request Datasource |
| _**Category**_ | Name of the Components Category |
| _**AlwaysDeploy**_ | Y/N |
| _**DeploySequentially**_ | Y/N |
| _**BaseDirectory**_ | Base Directory for the Component |
| _**PreAction**_ | Name of the Pre-Action |
| _**PostAction**_ | Name of the Post-Action |
| _**CustomAction**_ | Name of the Custom-Action |
| _**Summary**_ | Component Summary or Description |
