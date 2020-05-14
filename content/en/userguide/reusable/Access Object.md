## Access Tab

_Domains_, their contents and their _Sub-Domains_ are protected from unauthorized use and change via the _Access_ tab. This tab contains four lists, each of which grants a different type of access to _User_s who belong to the _User Group_s contained in the list. A fifth list contains a list of all _User Group_s, which can be dragged and dropped into each of the other four lists. By default the _Everyone_ Groupis assigned to each group at the GLOBAL domain level and this permission is then inherited by all _Sub-Domains_ and _Lifecycle States_. To restrict Access, remove the _Everyone_ Group from the desired Group list, and add only the Groups that should be given the appropriate access to the _Domain_.

These four types of access are as follows:

| Access | Description |
| --- | --- |
| _**View**_ | If a _User_ doesn&#39;t belong to a _User Group_ in the View Access list for the _Domain_, that _Domain_ will not appear in the tree structure. This keeps unauthorized _User_s from seeing the _Domain_ and helps simplify each _User&#39;s_ view of the DeployHub system. |
| _**Change**_ | This allows a _User_ who belongs to any _User Group_ in the list to change the attributes of the _Domain_ as well as to add/remove _Task_s from the _Domain_. |
| _**Read**_ | Performs no function for the _Domain_ itself but acts as an _Inherited Permission_ for objects created within the _Domain_. The exact meaning of &quot;Read&quot; will depend on the object created within the Domain. |
| _**Write**_ | Performs no function for the _Domain_ itself but acts as an _Inherited Permission_ for objects created within the _Domain_. The exact meaning of &quot;Write&quot; will depend on the object created within the Domain. |