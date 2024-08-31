---
title: "Using"
linkTitle: "Using"
weight: 118
description: >
  Manipulate the context or the stack for the statements body.
---

## Using

_Using_ affects either the context or the stack for the statements in its body. Can be used to:

- Set the stream that standard output and standard error will be redirected to or to receive a file read or base64encode operation.

- Create a new _DropZone_ for scripted checkout and deployment.
- Push a _Component_ onto the stack and filter _Endpoint_s.
- Push an _Application_ onto the stack for processing.
- Push an _Environment_ onto the stack for processing.

### Using Stream

Using "Stream" pushes a stream object onto the stack and executes the body. Any standard output or standard error resulting from the body execution are written into the stream. The stream can then be manipulated by subsequent calls.

#### Example 1

Checkout a file from a repository and convert it to base64:

```bash
checkout(repository: 'example\_rep', pattern: 'demo1.zip');

using stream $configzip {

read(file: 'demo1.zip');

}

set b64=${configzip.base64encode()};
```

A stream object should always begin with a $ symbol. The first time a stream is referenced it is automatically created. Subsequent "using stream" statements will re-use the same stream object if it has previously been referenced.

A stream can contain binary data. Streams can be used to create files and can also receive base64decoded data.

### Using DropZone

Creates a new _DropZone_ (an area on the _Endpoint_ on which the DeployHub deployment engine is running). Typically, _DropZones_ are created for each _Component_ and the _Component_ items are pulled from their associated repositories into these _DropZones_. The using _DropZone_ statement creates a new _DropZone_ and allows files within that _DropZone_ to be created, modified and pushed to target _Endpoint_s without affecting any other files in the_Component DropZones_.

#### Example 2

Given an input file "servers.xml" that looks like this:

```bash
\<deployhub\>;

\<server name="server1" type="unix" /\>;

\<server name="server2" type="windows" /\>;

\<server name="server3" type="as400" /\>;

\</deployhub\>;

Change server2 to be of type "unix", and deploy the file:

using DropZone 'DeployHub' {

checkout(repository: 'local', pattern: 'servers.xml');

modify(modifier: 'xml', file: 'servers.xml') {

set\_attribute(xpath: "/deployhub/server[@name=server2]/@type", value: "unix");

}

transfer;

}
```

### Using Component

Pushes the named _Component_ onto the stack and reduces _Endpoint_ set to those containing the _Endpoints_ on which the _Component_ resides:

```bash

using Component 'Component1' {
echo ${Component.name};
deploy;
 }
```

### Using Application

Pushes the named _Application_ onto the stack. Note, during a deployment operation (or a stand-alone task executed by right-clicking an _Application_) the selected _Application_ is already on the stack. You can specify "using _Application_" when running _DMScript_ that is not part of a deployment activity or to place another _Application_ onto the stack for processing.

_Application_ names can be qualified by prepending as many domain names as is necessary to uniquely identify the _Application_.

### Using Environment

Pushes the named _Environment_ onto the stack and sets the _Endpoint_ set to the _Endpoint_s within the_Environment_. Note, during a deployment operation (or a stand-alone task executed by right-clicking an_Environment_) the selected_Environment_is already on the stack. You can specify "using_Environment_" when running_DMScript_that is not part of a deployment activity or to place another_Environment_ onto the stack for processing.

_Environment_ names can be qualified by prepending as many domain names as is necessary to uniquely identify the _Environment_.

#### Returna

Returns from an action or returns a value from a _Function_.

return; // _action_
return expression; // _Function_
