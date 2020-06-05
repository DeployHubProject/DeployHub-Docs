---
title: "CircleCI Orb"
linkTitle: "CircleCI Orb"
weight: 56
description: >
  Using the CircleCI Orb with DeployHub.
---

## The DeployHub CircleCI Deployment Orb

DeployHub integrates with CircleCI to support continuos configuration management of microservices built into your CircleCI pipeline. DeployHub integrates with CircleCI to enrich the CI/CD pipeline around microservices.  
Critical to the process is the ability to perform configuration management, versioning and tracking of microservices across clusters and teams.  DeployHub's CircleCI orb includes the ability to perform automated version and dependency management of microservices tracking application and microservice relationships, their versions and their deployment meta data.

## DeployHub tasks and the CircleCI deployment orb

The DeployHub CircleCI orb calls DeployHub to perform:

| Task | Description |
| --- | --- |
| **ApproveJob** | Allows CircleCI to call DeployHub's approval process to approve an application version to be moved to the next stage of the pipeline.  The approval occurs as the UserID is passed from CircleCI to DeployHub. Depending on your DeployHub configuration, you may need to call the ApproveJob. This would happen if an approval gate is defined in DeployHub.  CircleCI will pass the application version and the 'Move' task to DeployHub.|
| **MoveJob** | Executes the DeployHub 'Move' task which promotes or demotes an application version to a different pipeline state. |
| **Microservice_version_update_job** |  Automatically increments the version number of a microservice and the application prior to deployment.  Tracks dependency relationships between microservices and applications to create dependency maps.|
| **DeployJob**| Deploys an application version to a specified environment. CircleCI will pass the application version name and environment to DeployHub.|

 You do not need to use the 'ApproveJob 'or 'MoveJob' tasks. The use of these tasks is determined by how you define your CircleCI pipeline.  If you are using Approvals in CircleC, the ApproveJob records the approval information as part of the microservice deployment meta.  A 'Move' process tracks where the microservice and application versions are in the pipeline.  You would generally perform a 'Move' and then a 'Deploy.'  Using the Microservice_version_update_job is recommended before the DeployJob.  This allows DeployHub to perform your versioning, configuration management, dependency mapping and comparisons.  The DeployJob calls on DeployHub's back in release engine to move the objects to endpoints (clusters for example.)

## Installing the CircleCI Deployment Orb

To start using the DeployHub CircleCI Deployment Orb, you will need to create a .circleci/config.yml to define your workflow to CircleCI for that project. That workflow will define calls to the DeployHub jobs and define the variables such as Application Version, Environment, UserID and Password that will be passed to the DeployHub  CircleCI Orb.

For a full description, go to the [CircleCI Orb Registry](https://circleci.com/orbs/registry/orb/deployhub/deployhub-orb)

### Two-way communication and shared logging

DeployHub and CircleCI have a two-way logging communication.  The DeployHub CircleCI Deployment orb includes the ability for all logs about software deployments to be reported in both solutions.  CircleCI can report to DeployHub when deployments are ready to be executed, with DeployHub reporting back the status of the deployment. For most users, CircleCI remains their primary location to find results and logs.
