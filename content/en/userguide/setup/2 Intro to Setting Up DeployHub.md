---
title: "Setting up DeployHub"
linkTitle: "Setting up DeployHub"
weight: 1
---

## Setting up DeployHub

Following are the items you must define to DeployHub to get started:

1. **Create a**_**Domain**_**:** Define your catalog by creating a _Domain_ hierarchy for sharing. As a SaaS user, your high-level _Domain_, and your _Pipeline Stages_, are automatically created. If you are using an on-premise version, you need to first create your _Domain_, and define your _Pipeline Stages_. To get started, you only need one Life Cycle _Stage_ in your _Pipeline_.
2. **Add your**_**Credentials**_**.** If you are going to access a _Repository_ or _Data Source_, you need to specify the _Credentials_. In addition, the recipient _Endpoints_ will need security _Credentials_.
3. **Add your**_**Repositories**_. DeployHub needs to be told where to pull files and containers. It is best to add your _Repository_ before you begin defining your _Components_ as you will need to specify a _Repository_ for your _Component_.
4. **Define your**_**Environment**_**and**_**Endpoints**_. This will define where you are sending the _Application_.
5. **Define your deployment Actions** – calling Helm for example for a container deployment.
6. **Define your**_**Components**_ and create your _Application_.
7. **Schedule your**_**Application**_**deployment** or push it on demand.

![DeployHub Setup](/userguide/setup/DeployHubSetup-Infographics.png)