
## HipChat Details

DeployHub allows you to send notifications using _Notifiers_ via HipChat Groups, Topics, or Room features. Notifications are defined to _Components_ and _Applications_ and inform the recipient(s) of the _Component_ or _Applications_ deployment's success or failure.   

| Field                 | Description                                                                                                                                         |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **HTML**              | If checked, will send email in HTML format.                                                                                                         |
| **HTML Override**     | If checked will indicate the value can be overridden. This is used for 'scripted' notifications where the action editor includes a 'notify' action. |
| **Logfile**           | The location of the log results between DeployHub and HipChat.                                                                                      |
| **Logfile Encrypted** | The Logfile can be hidden in the DeployHub database.                                                                                                |
| **Logfile Override**  | The Logfile location can be changed.                                                                                                                |
| **Webhook**           | The url for the group chat, topic chat, or chat room.                                                                                               |
| **Webhook Encrypted** | The Webhook can be hidden in the DeployHub database.                                                                                                |
| **Webhook Override**  | The Webhook can be changed.                                                                                                                         |

Assign your HipChat _Notifier_ to an _Application_ or _Component_ from the Details section of the _Application_ or _Component_ Dashboard. For more information see:

- [ _Components_](/userguide/2-define-components/)
- [ _Applications_](/userguide/2-defining-applications/)
