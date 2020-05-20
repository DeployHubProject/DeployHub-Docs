---
title: "Procedures and Functions"
linkTitle: "Procedures and Functions"
weight: 12
description: >
  Customizing your Deployments with Procedures and Functions.
---

## Procedures and Functions

_Procedures_ and _Functions_ are the steps making up an _Action_. They allow you to define the installation logic of a _Component_. _Procedures_ do not return a value while _Functions_ do_._ The _Procedures_ and _Functions_ tab is under the _Flows_ Main Menu Item.

## Adding and Deleting Custom Procedures and Functions

You can add and configure user-defined _Functions_ or _Procedures_ by going to the Flows menu and selecting the Functions and Procedures tab. This will display a list of _Domains_ and _Life Cycle__Sub-Domains_. Right click on the _Domain_ where it is to be located and select either &quot;New Procedure in this Domain&quot; or &quot;New Function in this Domain&quot;.

A _Procedure_ can be one of four types:

| Procedure | Description |
| --- | --- |
| _**DMScript Procedure in Repository**_ | A _Procedure_ is written in DMScript and stored in a file located in an external _Repository._ |
| _**DMScript Procedure in Database**_ | A _Procedure_ is written in DMScript and stored in the DeployHub Database (a &quot;Stored Procedure&quot;). |
| _**Procedure Provided by Local External Script or Program**_ | A _Procedure_ is written in any Scripting Language that can be executed by the operating system on which the DeployHub Deployment Engine is installed. Executes locally to the Deployment Engine. |
| _**Procedure Provided by Remote External Script or Program**_ | A _Procedure_ is written in any Scripting Language that can be executed by the target _Endpoint&#39;s_ operating system. Executes on the target _Endpoint._ By Checking the &quot;Copy to Remote&quot; flag, the script can be held locally to the Deployment Engine and copied to the target _Endpoint_ at the point of execution. |

A _Function_ can be one of four types:

| Procedure | Description |
| --- | --- |
| _**DMScript Function in Repository**_ | A _Function_ is written in DMScript and stored in a file located in an external _Repository._ |
| _**DMScript Function in Database**_ | A _Function_ is written in DMScript and stored in the DeployHub Database (a &quot;Stored Procedure&quot;). |
| _**Function Provided by Local External Script or Program**_ | A _Function_ is written in any Scripting Language that can be executed by the operating system on which the DeployHub Deployment Engine is installed. Executes locally to the Deployment Engine. |
| _**Function Provided by Remote External Script or Program**_ | A _Function_ is written in any Scripting Language that can be executed by the target _Endpoint&#39;s_ operating system. Executes on the target _Endpoint._ By Checking the &quot;Copy to Remote&quot; flag, the script can be held locally to the Deployment Engine and copied to the target _Endpoint_ at the point of execution. |

Selecting the _Procedure/Function_ kind will show other fields relevant to that particular kind (for example &quot;Copy to Remote&quot; will only appear for kind &quot;Remote External Script or Program&quot;. Fill in the fields and then click OK to create the new _Procedure/Function_.

## Body Tab

For Procedures/Functions defined as being &quot;DMScript in Database&quot; an additional &quot;Body&quot; tab is presented which allows the &quot;stored&quot; DMScript to be viewed and edited. Clicking on the &quot;Body&quot; tab will show the DMScript associated with the Procedure/Function. This is presented with syntax highlighting (it is optional and is set on by default).

action name {

}

or

function name(arg1,arg2) {

}

NOTE: The DMScript &quot;header&quot; for the Procedure or Function is implicit from the Args tab and should not be entered. This means you should just edit the &quot;Body&quot; of the Script and not attempt to add either.

To Edit the DMScript body, click on the pencil icon in the top-right of the Body Tab. You&#39;ll see an edit area (into which text can be typed) and a menu bar with icons and drop-downs:

- The Floppy Disk Icon is the &quot;Save&quot; button. This parses the DMScript for errors and, if none are found, saves the DMScript. If there any syntax errors, they are highlighted in the body of the text.
- The Binoculars Icon is the &quot;Search&quot; button. Clicking this icon opens a search/replace dialog.
- The Arrow Icon is a &quot;go to line&quot; button. Clicking the icon opens a dialog which allows a line number to be entered and moves the cursor to that line.
- The undo and redo Icons are for recent edits.
- Font Size Icon makes the text bigger or smaller as needed.
- The Paintbrush Icon switches the syntax icon on and off.
- The Eraser Icon resets the syntax highlighting and causes the editor to re-parse and re-highlight the entered text.
- The Paragraph Marker Icon switches on word wrapping.

Enter or change the DMScript body in the main editor window. Double clicking on an opening or closing brace will highlight both the selected brace and its matching brace. Clicking OK will check the DMScript for syntax errors and – if none are found – will close the window. If any issues are found, the cursor is placed onto the line in error and the error message is shown on the line under the editor window. It is not possible to save DMScript with such syntax errors.

## Args Tab – External Procedure/Function

A list of arguments can be made available for the _Procedure/Function_. To create a new Argument, go to the Flows menu, select a _Procedure/Function_ in the tree structure, and click the Args tab. Select the Plus (+) icon to add a new argument to the table, or click the pencil icon to edit an Argument selected in the table. The content and layout of the Args Tab will differ depending on the type of _Procedure/Function_.

## Type: External Procedure/Function

There are two sections to the Args tab for External _Procedures_ or _Functions_ (either local or remote). These sections allow you to construct a command line from the arguments passed to the _Procedure/Function_. The section titled &#39;Inputs to this Function/Procedure&#39; contains the following fields:

| Field | Description |
| --- | --- |
| _**Name**_ | Name of the Argument. The Name must start with a letter and must only include A-Z, a-z, 0-9 and \_ (underscore). No spaces or dashes are allowed in the name. |
| _**Type**_ | Values are Entry or Checkbox. This determines how the &quot;input&quot; to the _Procedure_ or _Function_ is rendered when it is dropped into the _Action Editor_. |
| _**Present**_ | Type: EntryThe text that will be prepended to the value should the argument be provided. For example, for a &quot;filename&quot; argument the _Present_ flag could be set to –f. If filename is provided then the argument will become –f &quot;\&lt;filename\&gt;&quot;.

Type: CheckboxThe text that will appear if the checkbox is selected. For example, if _Present_ is set to –checked then the argument will become –checked should the checkbox be checked. |
| _**Missing**_ | Type: EntryThe value that will be inserted should the argument not be provided. Only used if &quot;Required&quot; (see below) is false. If the optional argument is not provided then the _Missing_ text is substituted. For example, for a &quot;filename&quot; argument the _Missing_ flag could be set to –nofile. If no filename is provided then the argument will become –nofile.

Type: CheckboxThe text that will appear if the checkbox is not selected. For example, if Missing is set to –notchecked then the argument will become ‑notchecked should the checkbox be unchecked. |
| _**Preserve With (Pad)**_ | _Preserve With &quot;&quot; When Not Present_ ensures that the argument occupies its positional parameter regardless of whether it is a null-length string or not. For example, if the command line ismyscript ARG1 ARG2 ARG3if ARG2 is a null-length string then myscript would be called with: myscript ARG1 ARG3Padding (or preserving) will mean the script is invoked like this: myscript ARG1 **&quot;&quot;** ARG3This feature is useful if the script always requires the same parameters to be in the same position on the command line. |
| _**Required**_ | Indicates the argument is required for the _Procedure/Function_. This is used when dropping the _Procedure/Function_ into the Action Editor. Any Argument marked as being &quot;Required&quot; is highlighted and cannot be left blank. |

The section titled &#39;Additional command line switches for program below&#39; allows for the creation of &quot;fixed&quot; command line switches or other attributes that you wish to have present on the generated command line. These can be created by clicking on the plus sign (+) icon and adding text.

Each &quot;Additional Command Line Switch&quot; can include variables and these will be expanded when the command line is constructed and executed. These variables can be attributes stored against a DeployHub Object (such as _Endpoint, Environment, Application,_ or _Component_) or can be _Global Variables_ that are set by _Additional Parameters_ to the invoking Task. See Chapter 1 (Domains) for more information on adding _Additional Parameters_ to _Tasks_.

Each &quot;Additional Command Line Switch&quot; will be &quot;padded&quot; (surrounded by implicit quotes) and will be treated as a single argument when the command line is constructed. If you want to have separate flags and variables (for example –homedir $SERVDIR (where SERVDIR is an attribute held against the Target _Endpoint_) then you will need to create two &quot;Additional Command Line Switches&quot; – one for –homedir and one for $SERVDIR.

All the input parameters and the Additional Command Line Switches will appear above the resulting command line in dotted boxes. To construct the command line, simply drag and drop the boxes in the order required to build the command line.

## Type: DMScript

There is only a single section to the Args tab for DMScript _Procedures_ or _Functions_ (either _in Repository_ or _in Database_).

The section titled &#39;Inputs to this Function/Procedure&#39; contains the following fields:

| Field | Description |
| --- | --- |
| _**Name**_ | Name of the Argument. The Name must start with a letter and must only include A-Z, a-z, 0-9 and \_ (underscore). No spaces or dashes are allowed in the name. |
| _**Type**_ | Values are Entry or Checkbox. This determines how the &quot;input&quot; to the _Procedure_ or _Function_ is rendered when it is dropped into the _Action Editor_. |
| _**Required**_ | Indicates the argument is required for the Procedure. This is used when dropping the Procedure/Function into the Action Editor. Any Argument marked as being &quot;Required&quot; is highlighted and cannot be left blank. |

Entered Parameters will be accessible as variables within the DMScript Procedure/Function. Checkbox values are passed as true (1) if the checkbox is selected, false (0) otherwise. You can therefore use DMScript constructs like this:

if ($myval) {

// myval checkbox is checked

} else {

// myval checkbox is NOT checked

}

To see if the checkbox named &quot;myval&quot; is checked or not

## Timeline Tab

This tab displays log file entries for deployments that used this _Procedure_/_Function_, including deployment number, _Environment_, and how many days ago the deployment (hours for all of today&#39;s deployments) took place. Click on the &#39;Click to see earlier items&#39; link to see all of the entries.

## Timeline Comments

Users can add comments to these entries by clicking on the &#39;Comment&#39; link within each entry, which opens a text entry field just below the deployment information. Users can also click on the Subscribe link in each entry of the list, which allows the User to receive information about the selected deployment. Any comments added to the deploymentwill appear in the Timeline column of the subscriber&#39;s home page.

A field labeled &quot;Say something about this Procedure?&quot; is above all of the deployment lines for such comments. Files can be attached as well. Entering text here activates the Add Message button. Click to save the comment as a new audit entry.

## Adding Documents to the Timeline

Clicking on the paperclip button next to the Add Message button brings up a file explorer, which allows multiple files to be selected and attached to the comment.

Comments with files attached are shown with a paperclip. Clicking on the paperclip expands the audit entry to show those as hyperlinks. Clicking on the link will download the file. This process is browser-specific.

## Access Tab

This tab contains _Groups_ and the _Users_ that have access to this _Procedure/Function_. Click on a _Group_ name in the Available Groups list. Drag this into one of the lists to allow the _Users_ to View, Change, or Execute the currently selected _Procedure/Function_. If the _Procedure/Function_ is already part of a parent _Action_ then no check is yet the _Procedure/Function_ still runs.

Access includes:

| Access | Description |
| --- | --- |
| _**View**_ | Allows the _User_ to see the _Procedure/Function_. If the _User_ does not belong to a _Group_ in the View Access list, the _Procedure/Function_ will not appear in the tree structure. |
| _**Change**_ | Allows the _User_ to changes the _Procedure&#39;_s/_Function&#39;s_ characteristics i.e. Name, Summary, etc. |
| _**Execute**_ | Allows _Users_ to execute this _Procedure/Function_. |

## General Tab

The General tab is where the basic information about the _Function_ or _Procedure_ is defined. This information includes:

| Field | Description |
| --- | --- |
| _**Name**_ | Name of the _Function_/_Procedure._ This cannot be the same as a reserved word within DMScript (see the DMScript chapter), as it will cause a syntax error when executed. |
| _**Summary**_ | A short description of the _Function_/_Procedure._ |
| _**Category**_ | The category in which the _Function/Procedure_ can be found under the Activities pane on the Action Editor. |
| _**Owner Type**_ | The default owner is the _User_ who created the _Function/Procedure_. When editing this field, the _Owner Type_ field is available which includes _Owner_ and _Group_ as choices. Selecting one of these causes the Owner field to display either _Users_ or _Groups_ to choose from. |
| _**Created**_ | The date and time the _Function_/_Procedure_ was created. Read Only. |
| _**Modified**_ | The date and time that the _Function_/_Procedure_ was last modified. Read Only. |
| _**Description**_ | A brief description of the Procedure/Function. |
| _**Kind**_ |<ul style="list-style-type: none;"><li>Options include:</li><li>_Function/Procedure Provided by Local External Script or Program_ An external script (written in any programming or scripting language) that is invoked when the _Function_/_Procedure_ is called. The script is resident on the same machine as the deployment engine or can be referenced from that machine via a shared drive or UNC path. An additional Filepath field will appear if this option is chosen. Filepath is the location on the deployment engine where the script can be located.</li><li>_Function/Procedure Provided by Remote External Script or Program_ An external script (written in any programming or scripting language) that is invoked when the _Function/Procedure_ is called. The script is resident on the target _Endpoint_ unless &quot;Copy to Remote&quot; is checked (see below) in which case the path should refer to a directory on the same machine as the deployment engine (or can be referenced from that machine via a shared drive or UNC path) and the script is then &quot;pushed&quot; onto the target _Endpoint_ and executed there. If the script is pushed onto a Windows server, the script is placed into the c:\Windows\System32 folder. On a Unix or Linux system, it&#39;s placed into the /tmp directory.</li><li>All scripts that ship with DeployHub are placed into the $DMHOME\scripts directory on the deployment engine server. It would be a good idea to place any customized scripts into that directory as well, and always enter $DMHOME\scripts into the Filepath field (see below) when using _Copy to Remote_.</li><li>An additional Filepath field will appear if _Function_/_Procedure Provided by Remote Script or Program_ is chosen. The Filepath is the location either on the remote (target) _Endpoint_ (copy to remote not checked) _or_ on the deployment engine (copy to remote checked) where the script can be located.</li><li>_DMScript Function/Procedure in Repository_ A _Procedure_ or _Function_ written in DMScript and stored in an external repository. This means the script can be under version control. Additional fields will appear if this option is chosen: Repository: The name of the repository where the script can be located.</li><li>Filepath: The full path to the file in the repository containing the script.NOTE: Since the only option is &quot;filepath&quot;, the Repository definition must include all the other properties required to locate the script.</li><li>_DMScript Function/Procedure in Database_A _Procedure/Function_ written in DMScript and stored in the DeployHub Database.</li></ul> |
| _**Display Name**_ | The name that appears on the icon that represents the _Procedure_/_Function_ within a Workflow. Defaults to the value of the _Name_ field if not supplied. |
| _**Filepath**_ | The filepath to the script to be executed, which includes the name of the script. This appears for all but the &quot;DMScript Procedure in Database&quot; Kind of _Procedure_/_Function_. |
| _**Allocate Terminal**_ | If checked, this sets up a pseudo-terminal. This is for Unix/Linux targets only when operating over SFTP transfer protocol. It controls the behavior of executed programs if they operate differently with or without an allocated terminal. Note that any program running with this flag set and which calls _isatty_ will receive a return code of _true_. |
| _**Copy to Remote**_ | A checkbox that causes DeployHub to copy the procedure script from the directory indicated by the filepath field on the localhost machine to the target machine. The procedure is then executed there. In Windows, it is placed into c:\Windows\System32. On Linux/Unix, it is placed into /tmp. This only appears for _Procedures_/_Functions_ that are of the Kind &#39;Procedure/Function provided by remote external script or program&#39;. |
| _**Result is Expr**_ | Available only for _Functions._ If this box is checked then the return value from the function is interpreted as DMScript.
 Thus, if the _Function_ returns this as its standard output:

set a = {&quot;x&quot; =\&gt; &quot;1&quot;, &quot;y&quot; =\&gt; &quot;2&quot;};

 If &quot;result is expr&quot; is checked, an array is created called &quot;a&quot; with two elements - key &quot;x&quot; will be value &quot;1&quot; and key &quot;y&quot; will be value &quot;2&quot;.

 This is used in various _Functions_. For example, the &quot;listservices&quot; _Function_ which lists the services on a Windows server returns the list into an array using this mechanism. |

To delete a _Procedure/Function_, right click on it in the tree structure and select &quot;Delete this Procedure&quot;.

## Archiving

Any time a _Procedure_ or _Function_ is changed, an archived version is saved within DeployHub. In the tree structure beneath the Function or Procedure, and within the Domain, there will be a copy of the Function/Procedure with all Access removed, using the original name followed by &#39;\_archived&#39;. Every time the Function/Procedure is changed, another one will appear with the name followed by an incremented number (&#39;\_archived\_1&#39;, &#39;\_archived\_2&#39;, etc.).
