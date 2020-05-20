---
title: "Endpoint Object"
linkTitle: "Endpoint Object"
weight: 52
description: >
 Get an Endpoint Object.   
---

The _Endpoint_ (_server, container, VM/Cloud Image_) object represents where a deployment will be sent. An _Endpoint_ object can be retrieved by accessing the servers array from an _Environment_ or more typically by running a psloop. This iterates through the current _Endpoint_ list, pushing an _Endpoint_ object onto the stack each time through the loop. This _Endpoint_ object can be referenced by $server.

The following properties can be accessed for an _Endpoint_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Endpoint_ id, as used in the database. |
| name | String | _Endpoint_s name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Endpoint_ is contained. |
| owner | Object | User or UserGroup that owns the _Endpoint._ |
| hostname | String | Hostname (if set) or name otherwise. |
| basedir | String | Base Directory for Deployments. |
| type | String | _Endpoint_ Type, ie: windows, unix, as400 etc. |
| credential | Object | The Credential Object used to access this _Endpoint_. |
| _Components_ | Array | An Array of _Component_ Objects – the _Component_s currently installed on this _Endpoint_. |
| creator | User | User Object representing the user who created this _Endpoint_. |
| modifier | User | User Object representing the user who last modified this _Endpoint_. |
| ctime | Date | Date Object representing the date/time the _Endpoint_ was created. |
| mtime | Date | Date Object representing the date/time the _Endpoint_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name. |

The following methods can be called on the _Endpoint_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| append(path1,path2) | String | Appends path2 to path1, returning the combined path formatted according to the _Endpoint_ type. See append in the previous section for more information. |
| appendstd(path1,path2) | String | Appends path2 to path1, returning the combined path formatted according to the _Endpoint_ type. See appendstd in the previous section for more information. |
| basename(path) | String | Returns the filename _Component_ of the specified path. The structure of the path is based on the _Endpoint_ type. |
| dirname(path) | String | Returns the directory path _Component_ of the specified path. The structure of the path (and the returned String) is based on the _Endpoint_ type. |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Endpoint_. Parameter is the attribute name. |
| deptime(_Component_) | Date | Returns a Date object representing the last time the specified _Component_ was deployed to the _Endpoint_. Returns null if the _Component_ is not currently on the _Endpoint_. |

Note, that the _owner_ attribute returns an _Object_. Such objects have their own attributes.

So, for example, one can get the owner name of an _Endpoint_ by writing:

~~~
set owner = ${server.owner};

echo ${owner.name};

or, more simply:

echo ${server.owner.name};
~~~