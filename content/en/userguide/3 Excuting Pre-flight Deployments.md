---
title: "Pre-Flight Deployments"
linkTitle: "Pre-Flight Deployments"
weight: 48
---

## Pre-flight Deployments

Performing a pre-flight of your deployment tests the deployment logic and access availability. Pre-flights reduce errors especially when initially defining your _Application_ and the associated _Components_.

A series of checks is performed by DeployHub as soon as an _Environment_ is selected from the list in the dialog box. If there are problems, DeployHub prevents the deployment from taking place. For instance, when the _User_ initiating the deployment doesn&#39;t have permission to deploy to the selected _Environment_, or when the _Calendar_ for the selected _Environment_ has another deployment scheduled. If problems are found, the OK button is greyed out and an error message is displayed. Otherwise the window will disappear and messages concerning the deploy will be visible by clicking first on the _Timeline_ tab, and then clicking on the topmost Deployment Number in the resulting list. A window will appear with seven tabs:

| Tab | Description |
| --- | --- |
| Files | Files display all files that have been deployed during the execution of the deployment. Error messages may appear after the deployment has begun concerning things that DeployHub is not aware of during the initial check, such as missing files in a _Repository_ or an _Endpoint_ being offline. |
| Log | This tab displays all information concerning the progress of the deployment, including _Repositories_ that are being accessed, files that are being deployed, which _Endpoints_ are being deployed to, etc. As it progresses, clicking on the button in the upper right side of the button with the double-arrow icon will redraw this tab, allowing the _User_ to follow the progress of the deployment. |
| Activities | This tab contains a list of all the steps that made up the deployment. Each step&#39;s number is listed, along with the activity, such as deployment, post Action, etc. |
| Change Requests(DeployHub Pro Only) | The Change Request tab shows enhancement requests and bugs that have been assigned to the selected _Application_. These will have been assigned to the _Application_ earlier from one or more popular bug tracking systems, such as Bugzilla, Github, and Jira. |
| General | This tab contains 8 basic fields with basic information concerning the deployment; _Application_ Name, _Environment_ Name, Deployed By, Stared, Finished, Time Taken, Exit Code (0 for a successful deployment, an error code for any failed deployment), and Exit Status (error text for any failed deployment). |
| Report | This tab shows bar and pie graphs which represent the time taken for each deployment step. |
| Feedback Loop | This tab displays a graphical representation of the DeployHub objects that were used in the deployment process, beginning with _Change Requests_ and moving through _Components_, _Applications_, and _Environments_. Each object is represented by a different colored box containing the objects name, with arrows to show which _Components_ belong to which _Applications_, which _Applications_ were deployed to each _Environment_, etc. |

NOTE: The information in all four tabs will be updated during the display, so clicking on the tabs will redraw them as the deploy progresses.
