---
title: "Component Object"
linkTitle: "Component Object"
weight: 30
description: >
  Get a Component Object. 
---

The _Component_ object represents either a _Base Component_ or a _Component_ Version. When deploying an _Application_, _Components_ are pushed onto the stack after each _Endpoint_. They can also be pushed onto the stack by using a comploop, retrieved from an _Application_ by using ${_Application_._Components_} or retrieved by calling _get_Component_.

The following properties can be accessed for a _Component_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Component_ id, as used in the database. |
| name | String | _Component_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Component_ is contained. |
| owner | Object | User or UserGroup that owns the _Component._ |
| parent | Object | The Base _Component._ |
| predecessor | Object | Predecessor _Component_ Version (the version on which this version is based). |
| items | Array | An array of _Component_ Item objects. These represent the items that make up this _Component_. |
| servers | Array | An array of _Endpoint_ objects. These are the _Endpoint_s to which this _Component_ has been deployed. |
| requests | Array | Array of _Change Request_ objects – the change requests associated with this _Component_. |
| lastbuild | Integer | The last build number for this _Component_. 0 if never built. |
| creator | User | User Object representing the user who created this _Component_. |
| modifier | User | User Object representing the user who last modified this _Component_. |
| ctime | Date | Date Object representing the date/time the _Component_ was created. |
| mtime | Date | Date Object representing the date/time the _Component_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name |

Attributes such as _owner_ and _parent_ return _Objects_. These objects have their own attributes. So, for example, one can get the owner name of a _Component_ by writing:

**Examples:**
~~~
set owner = ${_Component_.owner};

echo ${owner.name};

or, more simply:

echo ${_Component_.owner.name};
~~~