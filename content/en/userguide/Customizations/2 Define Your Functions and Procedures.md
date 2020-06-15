---
title: "Procedures and Functions"
linkTitle: "Procedures and Functions"
weight: 34
description: >
  Customizing your Deployments with Procedures and Functions.
---
## Procedures and Functions

_Procedures_ and _Functions_ are the steps that make up an _Action_. If you have not worked with _Actions_, read about them in them in the [Customize your Actions Chapter](/userguide/customizations/2-define-your-actions/).

_Functions_ and _Procedures_ are used by _Actions_ to define custom installation logic of a _Component_ or perform any type of Pre or Post Action. Using _Actions_, _Functions_ and _Procedures_ allows you to be as creative as needed to meet the unique needs of your implementation.

The difference between _Procedures_ and _Functions_ is a _Procedures_ execute a process but does not return a value. A _Function_ returns a value. _Procedures_ and _Functions_ can be:

- Written in DMScript (DeployHub's Deployment Scripting Language). DMScript ships with several pre-installed _Procedures_ and _Functions_. You can also create custom _Procedures_ and _Functions_ and add them to the _Activities_ that can be used when creating a _Components_ installation logic. See the [DMscript Chapter](/userguide/dmscript/) for details.
- A script written in any scripting language supported by the Deployment Engine's operating system and held locally to the Deployment Engine.
- A script written in any scripting language supported by the target _Endpoint's_ operating system and located on the target _Endpoint_.
- A script written in any scripting language supported by the target _Endpoint's_ operating system and held locally to the Deployment Engine. When invoked, the script is automatically copied to the target _Endpoint_ and executed there.

A _Function_ or _Procedure_ can be one of four types:

_Procedure_ Types

| Procedure | Description |
| --- | --- |
| _**DMScript Procedure in Repository**_ | A _Procedure_ is written in DMScript and stored in a file located in an external _Repository._ |
| _**DMScript Procedure in Database**_ | A _Procedure_ is written in DMScript and stored in the DeployHub Database (a "Stored Procedure"). |
| _**Procedure Provided by Local External Script or Program**_ | A _Procedure_ is written in any Scripting Language that can be executed by the operating system on which the DeployHub Deployment Engine is installed. Executes locally to the Deployment Engine. |
| _**Procedure Provided by Remote External Script or Program**_ | A _Procedure_ is written in any Scripting Language that can be executed by the target _Endpoint's_ operating system. Executes on the target _Endpoint._ By Checking the "Copy to Remote" flag, the script can be held locally to the Deployment Engine and copied to the target _Endpoint_ at the point of execution. |

_Function_ Types

| Function | Description |
| --- | --- |
| _**DMScript Function in Repository**_ | A _Function_ is written in DMScript and stored in a file located in an external _Repository._ |
| _**DMScript Function in Database**_ | A _Function_ is written in DMScript and stored in the DeployHub Database (a "Stored Procedure"). |
| _**Function Provided by Local External Script or Program**_ | A _Function_ is written in any Scripting Language that can be executed by the operating system on which the DeployHub Deployment Engine is installed. Executes locally to the Deployment Engine. |
| _**Function Provided by Remote External Script or Program**_ | A _Function_ is written in any Scripting Language that can be executed by the target _Endpoint's_ operating system. Executes on the target _Endpoint._ By Checking the "Copy to Remote" flag, the script can be held locally to the Deployment Engine and copied to the target _Endpoint_ at the point of execution. |

Selecting the _Procedure/Function_ kind will show other fields relevant to that particular kind (for example "Copy to Remote" will only appear for kind "Remote External Script or Program". Fill in the fields and then click OK to create the new _Procedure/Function_.

## The _Functions_ and _Procedures_ List View for Adding or Deleting

From the _Functions_ and _Procedures_ menu option to the left of the DeployHub main panel, you will be taken to a list of all available _Functions_ and _Procedures_ which you have access to based on the _Domain_. You can also use the Filter bar, represented by a funnel icon, to reorder your _Functions_ and _Procedures_ List View.  You can filter on:

- Domain
- Name
- Type (_Function_ or _Procedure_)

The _Function_ or _Procedure_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add Function | Allows you to Add a new _Function_. |
| Add Procedure | Allows you to Add a new _Procedure_.|
| Export | Allows you to Export an existing _Function_ or _Procedure_. Used to transfer _Functions_ and _Procedures_ between DeployHub installations, and allows you to check them into a source repository.
| Import | Takes a previously exported _Function_ or _Procedure_ and re-imports it. Will maintain the original _Function_ or _Procedure_ name regardless of the name of the import file (.re). To change the Name of the _Function_ or _Procedure_, update the "action name="[new name]" inside the .re file that was exported. Duplicate names are allowed as long as they are defined using a different _Domain.|
| Delete | Deletes the selected item. |

From the _Action_ List View, double click on the _Action_ to view to see all Details.

## Using the _Function_ or _Procedure_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Function_ or _Procedure_.

| Details | Description |
| --- | --- |
| **Name** | A unique Name that identifies the _Function_ or _Procedure_ |
| **Summary** | A brief description of what the _Function_ or _Procedure_ does. |
| **Category** | Categories are used to arrange _Function_ or _Procedure_ in an orderly manner. Assigning a Category to an _Function_ or _Procedure_ allows lists of Categories to be used throughout DeployHub. Clicking on an individual Category expands the list and shows all _Function_ or _Procedure_ that belong to that Category. You can add a new Category by simply adding it to the list using the entry field. |
| **Owner Type** | User or Group |
| **Owner** | The _User_ or _Group_ name of the _Function_ or _Procedure's_ owner. The default owner is the _User_ who created the _Function_ or _Procedure_. |
| **Created** | An auto generated date when the _Function_ or _Procedure_ was created (read-only). |
| **Modified** | An auto generated date when the _Function_ or _Procedure_ was last modified (read-only). |
| **Description** | A more detailed Description of the _Function_ or _Procedure_.
|**Kind**| Select _Function_ or _Procedure_.|
|**Display Name**| An alternative Name if required.  If not used defaults to the "Name".|
| _**Filepath**_ | The filepath to the script to be executed, which includes the name of the script. This appears for all but the "DMScript Procedure in Database" Kind of _Procedure_ or _Function_. |
| _**Allocate Terminal**_ | If checked, this sets up a pseudo-terminal. This is for Unix/Linux targets only when operating over SFTP transfer protocol. It controls the behavior of executed programs if they operate differently with or without an allocated terminal. Note that any program running with this flag set and which calls _isatty_ will receive a return code of _true_. |
| _**Copy to Remote**_ | A checkbox that causes DeployHub to copy the procedure script from the directory indicated by the filepath field on the localhost machine to the target machine. The procedure is then executed there. In Windows, it is placed into c:\Windows\System32. On Linux/Unix, it is placed into /tmp. This only appears for _Procedures_/_Functions_ that are of the Kind 'Procedure/Function provided by remote external script or program'. |
| _**Result is Expr**_ | Available only for _Functions._ If this box is checked then the return value from the function is interpreted as DMScript.Thus, if the _Function_ returns this as its standard output:
set a = {"x" => "1", "y" => "2"}; If "result is expr" is checked, an array is created called "a" with two elements - key "x" will be value "1" and key "y" will be value "2".  This is used in various _Functions_. For example, the "listservices" _Function_ which lists the services on a Windows server returns the list into an array using this mechanism. |

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Function_ or _Procedure_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Function_ or _Procedure_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Allows _Users_ to see the _Function_ or _Procedure_. If the _User_ does not belong to a _Group_ in the View Access list, the _Function_ or _Procedure_ will not appear in the List View. |
|**Change**| Allows _User_ to change the _Function_ or _Procedure_ characteristics i.e. Name, Summary, etc. |
|**Execute**| Allows _Users_ to execute this _Function_ or _Procedure_. |

NOTE: **DeployHub Team** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your User Groups, you will need to upgrade to **DeployHub Pro.**

{{% include "userguide/reusable/AuditTrail.md" %}}

## Input Parameters – External Procedure/Function

A list of arguments can be made available for the _Procedure/Function_. To create a new Argument, go to the Flows menu, select a _Procedure/Function_ in the tree structure, and click the Args tab. Select the Plus (+) icon to add a new argument to the table, or click the pencil icon to edit an Argument selected in the table. The content and layout of the Args Tab will differ depending on the type of _Procedure/Function_.

## Type: External Procedure/Function

There are two sections to the Args tab for External _Procedures_ or _Functions_ (either local or remote). These sections allow you to construct a command line from the arguments passed to the _Procedure/Function_. The section titled 'Inputs to this Function/Procedure' contains the following fields:

| Field | Description |
| --- | --- |
| _**Name**_ | Name of the Argument. The Name must start with a letter and must only include A-Z, a-z, 0-9 and \_ (underscore). No spaces or dashes are allowed in the name. |
| _**Type**_ | Values are Entry or Checkbox. This determines how the "input" to the _Procedure_ or _Function_ is rendered when it is dropped into the _Action Editor_. |
| _**Present**_ | Type: EntryThe text that will be prepended to the value should the argument be provided. For example, for a "filename" argument the _Present_ flag could be set to –f. If filename is provided then the argument will become –f "<filename>".

Type: CheckboxThe text that will appear if the checkbox is selected. For example, if _Present_ is set to –checked then the argument will become –checked should the checkbox be checked. |
| _**Missing**_ | Type: EntryThe value that will be inserted should the argument not be provided. Only used if "Required" (see below) is false. If the optional argument is not provided then the _Missing_ text is substituted. For example, for a "filename" argument the _Missing_ flag could be set to –nofile. If no filename is provided then the argument will become –nofile.

Type: CheckboxThe text that will appear if the checkbox is not selected. For example, if Missing is set to –notchecked then the argument will become ‑notchecked should the checkbox be unchecked. |
| _**Preserve With (Pad)**_ | _Preserve With "" When Not Present_ ensures that the argument occupies its positional parameter regardless of whether it is a null-length string or not. For example, if the command line ismyscript ARG1 ARG2 ARG3if ARG2 is a null-length string then myscript would be called with: myscript ARG1 ARG3Padding (or preserving) will mean the script is invoked like this: myscript ARG1 **""** ARG3This feature is useful if the script always requires the same parameters to be in the same position on the command line. |
| _**Required**_ | Indicates the argument is required for the _Procedure/Function_. This is used when dropping the _Procedure/Function_ into the Action Editor. Any Argument marked as being "Required" is highlighted and cannot be left blank. |

The section titled 'Additional command line switches for program below' allows for the creation of "fixed" command line switches or other attributes that you wish to have present on the generated command line. These can be created by clicking on the plus sign (+) icon and adding text.

Each "Additional Command Line Switch" can include variables and these will be expanded when the command line is constructed and executed. These variables can be attributes stored against a DeployHub Object (such as _Endpoint, Environment, Application,_ or _Component_) or can be _Global Variables_ that are set by _Additional Parameters_ to the invoking Task. See Chapter 1 (Domains) for more information on adding _Additional Parameters_ to _Tasks_.

Each "Additional Command Line Switch" will be "padded" (surrounded by implicit quotes) and will be treated as a single argument when the command line is constructed. If you want to have separate flags and variables (for example –homedir $SERVDIR (where SERVDIR is an attribute held against the Target _Endpoint_) then you will need to create two "Additional Command Line Switches" – one for –homedir and one for $SERVDIR.

All the input parameters and the Additional Command Line Switches will appear above the resulting command line in dotted boxes. To construct the command line, simply drag and drop the boxes in the order required to build the command line.

## Type: DMScript

There is only a single section to the Args tab for DMScript _Procedures_ or _Functions_ (either _in Repository_ or _in Database_).

The section titled 'Inputs to this Function/Procedure' contains the following fields:

| Field | Description |
| --- | --- |
| _**Name**_ | Name of the Argument. The Name must start with a letter and must only include A-Z, a-z, 0-9 and \_ (underscore). No spaces or dashes are allowed in the name. |
| _**Type**_ | Values are Entry or Checkbox. This determines how the "input" to the _Procedure_ or _Function_ is rendered when it is dropped into the _Action Editor_. |
| _**Required**_ | Indicates the argument is required for the Procedure. This is used when dropping the Procedure/Function into the Action Editor. Any Argument marked as being "Required" is highlighted and cannot be left blank. |

Entered Parameters will be accessible as variables within the DMScript Procedure/Function. Checkbox values are passed as true (1) if the checkbox is selected, false (0) otherwise. You can therefore use DMScript constructs like this:

```bash
if ($myval) {

// myval checkbox is checked

} else {

// myval checkbox is NOT checked

}
```

To see if the checkbox named "myval" is checked or not

{{% include "userguide/reusable/AuditTrail.md" %}}

## Body Section

For Procedures/Functions defined as being "DMScript in Database" an additional "Body" tab is presented which allows the "stored" DMScript to be viewed and edited. Clicking on the "Body" tab will show the DMScript associated with the Procedure/Function. This is presented with syntax highlighting (it is optional and is set on by default).

```bash
action name {

}
```

or

```bash
function name(arg1,arg2) {

}
```

NOTE: The DMScript "header" for the Procedure or Function is implicit from the Args tab and should not be entered. This means you should just edit the "Body" of the Script and not attempt to add either.

To Edit the DMScript body, click on the pencil icon in the top-right of the Body Tab. You'll see an edit area (into which text can be typed) and a menu bar with icons and drop-downs:

- The Floppy Disk Icon is the "Save" button. This parses the DMScript for errors and, if none are found, saves the DMScript. If there any syntax errors, they are highlighted in the body of the text.
- The Binoculars Icon is the "Search" button. Clicking this icon opens a search/replace dialog.
- The Arrow Icon is a "go to line" button. Clicking the icon opens a dialog which allows a line number to be entered and moves the cursor to that line.
- The undo and redo Icons are for recent edits.
- Font Size Icon makes the text bigger or smaller as needed.
- The Paintbrush Icon switches the syntax icon on and off.
- The Eraser Icon resets the syntax highlighting and causes the editor to re-parse and re-highlight the entered text.
- The Paragraph Marker Icon switches on word wrapping.

Enter or change the DMScript body in the main editor window. Double clicking on an opening or closing brace will highlight both the selected brace and its matching brace. Clicking OK will check the DMScript for syntax errors and – if none are found – will close the window. If any issues are found, the cursor is placed onto the line in error and the error message is shown on the line under the editor window. It is not possible to save DMScript with such syntax errors.

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
| _**Kind**_ |<ul style="list-style-type: none;"><li>Options include:</li><li>_Function/Procedure Provided by Local External Script or Program_ An external script (written in any programming or scripting language) that is invoked when the _Function_/_Procedure_ is called. The script is resident on the same machine as the deployment engine or can be referenced from that machine via a shared drive or UNC path. An additional Filepath field will appear if this option is chosen. Filepath is the location on the deployment engine where the script can be located.</li><li>_Function/Procedure Provided by Remote External Script or Program_ An external script (written in any programming or scripting language) that is invoked when the _Function/Procedure_ is called. The script is resident on the target _Endpoint_ unless "Copy to Remote" is checked (see below) in which case the path should refer to a directory on the same machine as the deployment engine (or can be referenced from that machine via a shared drive or UNC path) and the script is then "pushed" onto the target _Endpoint_ and executed there. If the script is pushed onto a Windows server, the script is placed into the c:\Windows\System32 folder. On a Unix or Linux system, it's placed into the /tmp directory.</li><li>All scripts that ship with DeployHub are placed into the $DMHOME\scripts directory on the deployment engine server. It would be a good idea to place any customized scripts into that directory as well, and always enter $DMHOME\scripts into the Filepath field (see below) when using _Copy to Remote_.</li><li>An additional Filepath field will appear if _Function_/_Procedure Provided by Remote Script or Program_ is chosen. The Filepath is the location either on the remote (target) _Endpoint_ (copy to remote not checked) _or_ on the deployment engine (copy to remote checked) where the script can be located.</li><li>_DMScript Function/Procedure in Repository_ A _Procedure_ or _Function_ written in DMScript and stored in an external repository. This means the script can be under version control. Additional fields will appear if this option is chosen: Repository: The name of the repository where the script can be located.</li><li>Filepath: The full path to the file in the repository containing the script.NOTE: Since the only option is "filepath", the Repository definition must include all the other properties required to locate the script.</li><li>_DMScript Function/Procedure in Database_A _Procedure/Function_ written in DMScript and stored in the DeployHub Database.</li></ul> |
| _**Display Name**_ | The name that appears on the icon that represents the _Procedure_/_Function_ within a Workflow. Defaults to the value of the _Name_ field if not supplied. |
| _**Filepath**_ | The filepath to the script to be executed, which includes the name of the script. This appears for all but the "DMScript Procedure in Database" Kind of _Procedure_/_Function_. |
| _**Allocate Terminal**_ | If checked, this sets up a pseudo-terminal. This is for Unix/Linux targets only when operating over SFTP transfer protocol. It controls the behavior of executed programs if they operate differently with or without an allocated terminal. Note that any program running with this flag set and which calls _isatty_ will receive a return code of _true_. |
| _**Copy to Remote**_ | A checkbox that causes DeployHub to copy the procedure script from the directory indicated by the filepath field on the localhost machine to the target machine. The procedure is then executed there. In Windows, it is placed into c:\Windows\System32. On Linux/Unix, it is placed into /tmp. This only appears for _Procedures_/_Functions_ that are of the Kind 'Procedure/Function provided by remote external script or program'. |
| _**Result is Expr**_ | Available only for _Functions._ If this box is checked then the return value from the function is interpreted as DMScript.
 Thus, if the _Function_ returns this as its standard output:

```set a = {"x" => "1", "y" => "2"};```

 If "result is expr" is checked, an array is created called "a" with two elements - key "x" will be value "1" and key "y" will be value "2".

 This is used in various _Functions_. For example, the "listservices" _Function_ which lists the services on a Windows server returns the list into an array using this mechanism. |

To delete a _Procedure/Function_, right click on it in the tree structure and select "Delete this Procedure".

## Archiving

Any time a _Procedure_ or _Function_ is changed, an archived version is saved within DeployHub. In the tree structure beneath the Function or Procedure, and within the Domain, there will be a copy of the Function/Procedure with all Access removed, using the original name followed by '_archived'. Every time the Function/Procedure is changed, another one will appear with the name followed by an incremented number ('_archived\_1', '_archived\_2', etc.).
