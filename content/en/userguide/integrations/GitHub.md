---
title: "Git Repo Integration"
linkTitle: "Git Repo Integration"
weight: 310
description: >
  Integrating with Git Repos such as  GitHub or GitLab 
---

![Git](/userguide/images/git.png)

DeployHub supports [GitHub](https://github.com/) or [GitLab](https://about.gitlab.com/) in the following ways.

1. The collection of Git information for security purposes. 
2. A binary Repository for retrieving artifacts to deploy such as binaries or scripts.
3. GitHub Issue Tracking. A bridge connects a GitHub issue with a DeployHub Change Request.

## The Collection of GitHub Metrics and Metadata

DeployHub stores the Git Metrics and Metadata for informational, mapping and computational purposes.  This is done for any Git Repository, such as GitHub, GitLab etc.

DeployHub integrates with Git using the [CI/CD Command Line Interface](/guides/userguide/integrations/ci-cd_integrations/) (CLI). For every _Component Version_, the CLI gathers and stores the following:

| Field in Git Details Section | Description                                                     |
|------------------------------|-----------------------------------------------------------------|
| Git Commit                   | Git commit that triggered the CI job (DERIVED IF NOT SPECIFIED) |
| Git Repo                     | Git repo that triggered the CI job (DERIVED IF NOT SPECIFIED)   |
| Git Tag                      | Git tag in the git repo (DERIVED IF NOT SPECIFIED)              |
| Git Url                      | Full url to the git repo (DERIVED IF NOT SPECIFIED)             |
| Purl                         | Purl for the _Component Version_ (DERIVED IF NOT SPECIFIED)     |


| Key in Key Value Configuration | Description                                                                    |
|--------------------------------|--------------------------------------------------------------------------------|
| Git Branch                     | Git branch in the git repo (DERIVED IF NOT SPECIFIED)                          |
| Git Branch Create Commit       | Git commit that the branch was created from (DERIVED IF NOT SPECIFIED)         |
| Git Branch Create Timestamp    | Timestamp of when the branch was created (DERIVED IF NOT SPECIFIED)            |
| Git Branch Parent              | The parent branch for the current branch (DERIVED IF NOT SPECIFIED)            |
| Git Commit Authors             | List of committers for the repo (DERIVED IF NOT SPECIFIED)                     |
| Git Committers Cnt             | Count of Git Commit Authors (DERIVED IF NOT SPECIFIED)                         |
| Git Commit Timestamp           | Timestamp of the current commit (DERIVED IF NOT SPECIFIED)                     |
| Git Contrib Percentage         | Git Committers Cnt / Git Total Committers Cnt * 100 (DERIVED IF NOT SPECIFIED) |
| Git Lines Added                | Lines added since the previous commit (DERIVED IF NOT SPECIFIED)               |
| Git Lines Deleted              | Lines deleted since the previous commit (DERIVED IF NOT SPECIFIED)             |
| Git Lines Total                | Total line count for the branch (DERIVED IF NOT SPECIFIED)                     |
| Git Org                        | Organization for the repo (DERIVED IF NOT SPECIFIED)                           |
| Git Repo Project               | Project name part of the repository url (DERIVED IF NOT SPECIFIED)             |
| Git Total Committers Cnt       | Total committers working on this repo                                          |

These values are displayed for every _Component Version_ and viewable from the _Component Detail_ dashboard.



## Git as a Binary Repository

You can configure DeployHub to call out to a Git Repo to pull deployable artifacts (binaries, scripts, etc.) as part of your deployment.  The process will check out your deployable artifacts based on commit, branch or tag specified. You will need to configure DeployHub with a file system DeployHub _Repository_ that will pull the files need for the deployment.  You will also need to create a "Git Checkout" _Procedure_ and _Action_.  

**Step 1 - Create a DeployHub File System _Repository_**

DeployHub can use Git as a binary repository for retrieving deployable objects as part of the deployment process.  To do this you will first need to define GitHub as a connected _Repository_ Object from within DeployHub. This connection will be used by as part of the deployment process using a _Procedure_ and a _Action_. For information on setting up File System as a binary repository see [Connect Your Repositories](/userguide/advanced-features/deployments/2-define-repositories/).

Once you have completed this step, you are ready to create a new _Procedure_ that performs the check out from the GitHub repository.

**Step 2 - Create your Git Checkout _Procedure_ for your _Action_**

_Procedures_ are called by _Actions_ to execute deployment logic. A pre-defined DeployHub _Procedure__is available from the [DeployHub Git Repo](https://github.com/DeployHubProject/DeployHub-Pro/tree/main/procedures). This where you will find the most current version of this _Procedure_. For more information on creating_Procedures see [Functions and Procedures](/userguide/advanced-features/deployments/2-define-your-functions-and-procedures/).

From the DeployHub Git Repo, pull the file named **GitCheckout.re**

Once downloaded, you will need to Import it into DeployHub from the Func/Procs List View. Navigate to the List View by selecting the Func/Procs menu option on the left hand side of the DeployHub main panel. From the Func/Procs List view select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the GitCheckout.re file.  Next, select your _Domain_ and upload the _Procedure_ into the DeployHub. You are now ready to create your _Action_.

**Step 3 - Create your _Action_ for the Git Checkout _Procedure_**

Once you have imported your GitCheckout.re _Procedure_, you can define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the DeployHub main panel. Use the +Add option to create a new _Action_ for you _Procedure_. Name the new _Action_ **GitCheckAction** (no spaces). See [Customize Your Actions](/userguide/integrations/intro-to-integrations/) for more information on creating _Actions_.

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the GitCheckOut _Procedure_. Drag it onto the area under _Start._ A pop-up dialog box will open for you to complete the following parameters:

_GitCheckout_ Parameters

| **Field**      | Value        | Description                                                                                                                                                                                     |
|----------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Title**      | Not Required | Name of the step in your deployment workflow. Use "Git Checkout."                                                                                                                               |
| **Summary**    | Not Required | Enter a summary of this step.                                                                                                                                                                   |
| **Git Repo**   | $GIT_URL     | This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level.                                                                    |
| **Git Commit** | $GIT_COMMIT  | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.                                                                       |
| **To Dir**     | $GIT_DIR     | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

At this point the _Action_ is ready to be used by anyone with access (based on _Domain_ and _Group_ options).
Note: Because this _Action_ is reusable, no _Component_ variables are defined. This is performed at the _Component_ level.

**Step 4 - Assign the GitCheckoutAction to your _Component_ to be deployed**

For each _Component_ you will need to define the variable values for $GIT_URL, $GIT_COMMIT and $GIT_DIR that the GitCheckoutAction will use at the_Component_ level. The values will be passed to the GitCheckoutAction at deploy time. See [the _Components_ chapter](/userguide/2-define-components/) for more information.

**Step 5 - Set Your _Component_ Attributes_**

The following variables must be added to the Attributes Section for all  _Components_ using the GitCheckoutAction _Pre Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name  | Value Description                                                                                                                                                                               |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **GIT_URL**    | This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level.                                                                    |
| **GIT_COMMIT** | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.                                                                       |
| **GIT_DIR**    | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

## GitHub Issues and DeployHub Change Request

DeployHub can reference the Git issues to track Change Request for _Components_ and _Applications_. This enables the Git issues to be viewed from a _Component_ or _Application_ using the DeployHub  _Change Request_ section from the _Component_ or _Application_. If you have a _Release_ defined, these GitHub issues will be rolled up from the _Component_ and _Application_ to the _Release_.

For more information see [Tracking Jira, Bugzilla and Git Issue](/userguide/integrations/jira-bugzilla-and-git-issues/).


