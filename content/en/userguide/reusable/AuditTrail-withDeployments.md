
## Audit Trail

The Audit Trail displays audit entries for any changes that impact this _Object_. 

- Comment: Click on 'Comment' to add information. There is a field above the list labeled "Say something about this _Object_" that can have written comments placed into it, or files can be attached to the comment.  Entering text into this field activates the Add Message button. Click to save the comment as a line in the list.  

- Add Files to Comments: Click on the paperclip icon to add a file to the message.  Once done, click on the "Add Message" button. These attachments can later be retrieved by clicking on the paperclip icon which then displays the name of the file within a list. Choose the file to download it into the your default Download directory on your local computer.

## Deployment Audits

For deployment audits, select a deployment number to see the details including:

| Access            | Description                                       |
|-------------------|---------------------------------------------------|
| **Log**           | The output of the deployment.                     |
| **Files**         | Any files or objects deployed.                    |
| **Step Duration** | Deployment Steps with time required to execute.   |
| **Feedback Loop** | Shows what was updated starting from _Component_. |

When using the internal DeployHub deployment engine, all log output is automatically persisted with the _Application Version_ and _Component Version_. 

If you are using another deployment solution, you can persist the log via the CI/CD workflow. The output from the deployment can be passed to the CLI to be persisted with the _Application Version_ and _Component Versions_. Learn more about the [CI/CD CLI Integration](/userguide/integrations/ci-cd_integrations/)


