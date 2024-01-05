---
title: "Helm for Container Deployments"
linkTitle: "Helm for Container Deployments"
weight: 306
description: >
  Using Helm to execute deployments as an _Action_.
---

Helm is called to replace the DeployHub default processing engine for performing container deployments. When DeployHub executes the release process, it will call the Helm Chart you have defined as your _Custom Action_ at the _Component_ level.  DeployHub includes the version of the Helm chart as part of its overall configuration data.

## Helm and Key Value Pairs

In order to support a consistent Helm deployment across Cluster _Endpoints_ and _Environments_ (Dev, Test, Prod) Key value pair substitution is performed. When a Helm chart is used, DeployHub will pull your Helm Chart in the .tgz format from either a public or private Chart Museum. It then expands it out into a separate directory location where Helm is executed. This location is defined by the DeployHub Endpoint which you define (see "Connecting a DeployHub _Endpoint_ to your Kubernetes Cluster through Helm" below).

DeployHub will then create an override values file which contains all the specific key value pairs defined at the _Endpoint_, _Environment_, _Component_ or _Application_ in this order of precedence. For example, if the same key value pairs are defined at the _Endpoints_ as well as the _Application_, the _Endpoint_ key values are used.

The override values file passes the Key value definitions Helm 'upgrade' command.  This process allows a single Helm chart to be reused across all deployments, supporting the needed key value pairs for each deployment.

If you would like to create a hermetic Helm Chart stored in the DeployHub database, use the following key value:

```bash
helmcapture=Y
```

This must be defined at any level, i.e., _Endpoint_, _Environment_, _Component_ or _Application_.

## Connecting a DeployHub _Endpoint_ to your Kubernetes Cluster through Helm

DeployHub' deployment engine comes pre-installed with Helm.  For this reason you should use the deployment engine as the "localhost" _Endpoint_ for your deployments.  This Helm install on the "localhost" _Endpoint_ needs to know how to connect to your Kubernetes Cluster.

 Mount your ".kube/config" file to the DeployHub deployment engine Docker container to provide the connection.  The additional parameter to the docker run command for the DeployHub container exposes the Kubernetes config file to the Helm install in DeployHub.  The following is an example of the additional parameter:

```bash
-v ~/.kube:/home/omreleng/.kube:Z
```

For more information on starting the DeployHub Container see:

- [SaaS Sign-up and Reverse Proxy](/userguide/installation-and-support/0-saas-and-reverse-proxy/)
- [DeployHub On-Premise Installation](/userguide/installation-and-support/0-on-premise-installation-for-team/)
- [DeployHub Pro On-Prem Installation](/userguide/installation-and-support/0-on-premise-installation-for-pro/)

### Connection to a Cloud Kubernetes Cluster

In order to connect to Kubernetes cluster running on a cloud provider, an authentication between DeployHub and the cloud provider must be made.  Each cloud provider has a different set of parameters used to authenticate. Once authenticated, DeployHub will execute Helm in the same across all the cloud providers enabling reuse of the Helm Charts without the need to update them.

#### Connecting to a Google Kubernetes Cluster

| Key                                 | Value                        | Command                                                                                     |
|-------------------------------------|------------------------------|---------------------------------------------------------------------------------------------|
| gcloud.compute.zone                 | compute zone for the cluster | gcloud config set compute/zone <zone>                                                       |
| gcloud.container.cluster            | cluster name                 | gcloud config set container/cluster and gcloud container clusters get-credentials <cluster> |
| gcloud.core.account                 | account name                 | gcloud config set core/account <account>                                                    |
| gcloud.core.disable_usage_reporting | disable reporting            | gcloud config set core/disable_usage_reporting <disable_usage_reporting>                    |
| gcloud.core.project                 | project name                 | gcloud config set core/project <project>                                                    |
| gcloud.oauth.account                | service account name         | gcloud auth activate-service-account <account>                                              |
| gcloud.oauth.keyfile                | key file for service account | gcloud auth activate-service-account --key-file=<keyfile>                                   |

#### Connecting to a Amazon Kubernetes Cluster

| Key                       | Value                            | Command                                                                 |
|---------------------------|----------------------------------|-------------------------------------------------------------------------|
| eks.aws_access_key_id     | access key id                    | aws --profile default configure set aws_access_key_id  <key_id>         |
| eks.aws_secret_access_key | secret key                       | aws --profile default configure set aws_secret_access_key <access_key>  |
| eks.region                | region the cluster is running in | aws eks --region <region> update-kubeconfig --name <cluster> <optional> |
| eks.cluster               | cluster name                     | aws eks --region <region> update-kubeconfig --name <cluster> <optional> |
| eks.optional              | additional options               | aws eks --region <region> update-kubeconfig --name <cluster> <optional> |

#### Connecting to a Azure Kubernetes Cluster

| Key                  | Value                                 | Command                                                                               |
|----------------------|---------------------------------------|---------------------------------------------------------------------------------------|
| aks.serviceprincipal | service principal                     | az login --service-principal -u <serviceprincipal> -p <certificate> --tenant <tenant> |
| aks.certificate      | certificate for the service principal | az login --service-principal -u <serviceprincipal> -p <certificate> --tenant <tenant> |
| aks.tenant           | tenant for the service principal      | az login --service-principal -u <serviceprincipal> -p <certificate> --tenant <tenant> |
| aks.resourcegroup    | resource group for the cluster        | az aks get-credentials --resource-group <resourcegroup> --name <cluster>              |
| aks.cluster          | cluster name                          | az aks get-credentials --resource-group <resourcegroup> --name <cluster>              |

#### Using an existing context

| Key             | Value        | Command                                      |
|-----------------|--------------|----------------------------------------------|
| kubectl_context | context name | kubectl config use-context <kubectl_context> |

## Additional Helm Key/Values

| Key                               | Description                                                                                      |
|-----------------------------------|--------------------------------------------------------------------------------------------------|
| helm_exe                          | use helm2 for Helm V2 executable. Default is Helm V3                                             |
| helmrepo.url                      | url to the chart repo (from Component Definition)                                                |
| helmrepo.username or helmrepouser | user name used to login into the repo with                                                       |
| helmrepo.password or helmrepopass | password user to login into the repo with                                                        |
| chart                             | chart to use (from Component Definition)                                                         |
| chartversion                      | version of the chart.  Default latest (from Component Definition)                                |
| chartnamespace                    | namespace to use for the deployment (from Component Definition)                                  |
| helmopts                          | additional options for the helm upgrade                                                          |
| helmtemplateopts                  | additional options for the helm template                                                         |
| helmcapture                       | y/n for uploading a hermetic version of the chart and values to DeployHub stored by deploy log # |

## Helm and _Custom Actions_

Helm is called as a DeployHub [_Custom Action_](/userguide/customizations/2-define-your-actions/). To use Helm, you will need to import two Helm files as DeployHub _Procedures_ and define them to your _Custom Action_. This Helm _Custom Action_ can then be assigned to your Container _Components_. See [_Procedures and Functions_](/userguide/customizations/2-define-your-functions-and-procedures/) and  [Customize Actions](/userguide/customizations/2-define-your-actions/) to learn more. The following steps will create your Helm _Custom Action_.

### Step 1 - Download and Import the Helm scripts as _Procedures_

Download the the most current DeployHub Helm Procedures from the [DeployHub Git Repo](https://github.com/DeployHub/DeployHub/blob/master/procedures/). There will be two:

- **WriteEnv2Toml.re**:  This _Procedure_ takes all the attributes from DeployHub _Environments_, _Applications_, _Endpoints_ and _Components_ and writes them to a file readable by the Helm _Procedure._

- **HelmUpgrade.re** – This _Procedure_ performs a Helm upgrade/install of the Helm Chart.

### Step 2 - Create your _Procedures_

Once downloaded, you will need to Import the scripts into DeployHub as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the DeployHub Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the WriteEnv2Toml.re and HelmUpgrade.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into DeployHub. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

### Step 3 - Create your _Action_ for Your Helm _Procedures_

Once you have imported your WriteEnv2Toml.re and HelmUpgrade.re files as _Procedures_, you can define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the DeployHub Main Menu panel.

Use the +Add option to create a new _Action_ for you _Procedure_. In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new _Action_ **HelmChart** (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the WriteEnv2Toml.re and HelmUpgrade.re imported _Procedures_.  Drag them onto the area under "Start". The order should be _WriteEnv2Toml_, _HelmUpgrade_.

No Parameter fields are required for _WriteEnv2File_.

When you drag the HelmUpgrade _Procedure_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

| Field     | Value        | Description                                   |
|-----------|--------------|-----------------------------------------------|
| **Title** | Not Required | Name of the step in your deployment workflow. |
| **Summary** | Not Required | Enter a summary of this step. | |
| **RspFile** | $RspFile | The results from the WriteEnv2Toml.re Procedure |
| **Chart** | $(Chart) | The Helm Chart to be used during the deployment |
| **Release Name** | $(component.name) | The name of the release |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each _Component_ that uses the _Action_ will need to define specific values. Because this new _Action_ is reusable, no _Component_ variables are defined at the _Action_ level.

## Assign the Helm Chart Action to a Component

Create your new _Component_ from the _Component_ Dashboard. See [Defining _Components_](/userguide/publishing-components/2-define-components/).  For each container _Component_ you will need to define the variable values. Values are specified when you create a new container _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from DeployHub will be passed along to Helm's values.yml file at execution time. For more information on defining your container _Component_ see [Container Specific Data Definition](/userguide/publishing-components/2-define-components/#container-specific-data-definition).

## Storing and Retrieving a Hermetic Helm Chart

In order to create an 'airtight' Helm deployment, DeployHub takes the generated Helm overrides file created during a Helm deployment and executes the Helm template command to find the container images that were referenced. All container image digests are captured and stored in the DeployHub database along with the Helm Chart and all key values used in a specific deployment.  To turn on this option, the following key value pair must be defined at  any level, i.e., _Endpoint_, _Environment_, _Component_ or _Application_.

```bash
helmcapture=Y
```

Once stored in the DeployHub database, you can retrieve the hermetic Helm Chart, key value pairs and all container digests to repeat the exact deployment utilizing Helm manually.

### Retrieving and Running the Helm Chart Manually

To re-execute a Helm deployment manually, you will retrieve all captured data in a zip file (Helm Chart, all container digest, and key values ). To retrieve the data and generate a zip file, execute the following curl command if using the SaaS:

```bash
curl "https://console.deployhub.com/dmadminweb/API/helmchart/<DeploymentNumber>?format=zip"-o Helmchart.zip
```

where:
Deployment Number is the Number of the Deployment displayed in the DeployHub dashboard for the Application.

Helmchart.zip is the name of the zip file you want to create.

If you are using an on premise version use the following command:

```bash
curl "http://<myDeployHub>/dmadminweb/API/helmchart/<DeploymentNumber>?format=zip"-o Helmchart.zip
```

where:
myDeployHub is your on premise DeployHub Server.

Deployment Number is the Number of the Deployment displayed in the DeployHub dashboard for the Application.

Helmchart.zip is the name of the zip file you want to create.
