---
title: "WebLogic"
linkTitle: "WebLogic"
weight: 76
---
## WebLogic

A DeployHub deployment can point to one or more _Repositories_ with artifacts (.ear, .jar, and .war files) making up a Weblogic application. These are referenced by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. These are deployed into a Weblogic server domain. A (Post) _Action_ is then executed which installs these artifacts into the Weblogic server. The user creates the _Action_, which itself contains _Procedures_ that can be downloaded via Google Groups at the following link:

[https://groups.google.com/forum/#!category-topic/deployhub-project/i0SOscsRW6I](https://groups.google.com/forum/#!category-topic/deployhub-project/i0SOscsRW6I).

Click the link, scroll down the resulting list, and click on Weblogic Deployment. Read the instructions for creating the _Procedures_ before importing and creating the _Action_.

## Download the WebLogic Procedures

Download the three files from the Google link. Place the deploywl.sh into the $DMHOME/engine/scripts directory on the location where DeployHub is installed, as per the instructions. Place the other two (export\_WeblogicDeploy.re and export\_WeblogicCredential.re) into any directory that can be accessed for importing into DeployHub.

- Click on the _Flows_ menu.
- Click on the _Functions_ and _Procedures_ tab
- Click on a Domain and select &quot;_Import a Function or Procedure into this Domain_&quot;.
- Click the &#39;Choose File&#39; button to navigate to the directory where the .re files are located.
- Select the export\_WeblogicCredential.re file and click the Open button.
- Click the Import button.
- Repeat for the _export\_WeblogicDeploy.re_ file.

Notice there are now two new _Procedures_ in the _Domain_, named &quot;WebLogicCredential&quot; and &quot;WebLogicDeploy,&quot; each with the Category of WebLogic.

## Create your Weblogic Action

- Right click on the _Actions_ tab in the same _Domain_ as the _Procedures._
- Select &quot;_New Action in this Domain_&quot;.
- In the _Workflow_ tab, scroll down the _Activities_ list on the right side and click on the plus sign next to the Weblogic Category.
- Click and drag the _Procedure_ that was just created named &quot;WebLogicCredential&quot; onto the Workspace.
- Click and drag the _Procedure_ named &quot;WebLogicDeploy&quot; onto the Workspace.
- Right click on the _Procedure(s)_ in the Workflow and fill in the parameters for each one according to the definitions on the Google Groups page.

Note: the WebLogicCredential Procedure can be left out of the Workspace if the WebLogicDeploy Procedure&#39;s username and password fields will be used to access the Weblogic server. Otherwise the selected Credential within the WebLogicCredential Procedure should contain the appropriate username and password.

Place the _Action_ within the _Application&#39;s Post Action_ field. The _Application_ should contain one or more _Components_ that have one or more _Component__Items_ that reference the artifacts that make up the Weblogic application. The _Application_ deploys its artifacts to the Weblogic server, and the Post _Action_ performs the installation.
