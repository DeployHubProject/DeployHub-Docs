---
title: "Environment Object"
linkTitle: "Environment Object"
weight: 54
description: >
 Get an Environment Object.   
---

The _Environment Object_ represents a deployment target _Environment_. During a deployment, there is always an _Environment  Object_ on the stack representing the current deployment target _Environment_. This can be referenced by $_Environment_. An _Environment Object_ can also be retrieved using the _Get Environment Function_.

The following properties can be accessed for an _Environment_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Environment_ id, as used in the database. |
| name | String | _Environment_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Environment_ is contained. |
| owner | Object | User or UserGroup that owns the _Environment._ |
| basedir | String | Base directory for deployments. |
| _Endpoints_ | Array | Array of _Endpoint_ objects keyed by name. |
| _Applications_ | Array | Array of _Application_ Objects (_Application_s present in this _Environment_). |
| creator | User | User Object representing the user who created this _Environment_. |
| modifier | User | User Object representing the user who last modified this _Environment_. |
| ctime | Date | Date Object representing the date/time the _Environment_ was created. |
| mtime | Date | Date Object representing the date/time the _Environment_ was last modified. |
| parent | Object | Parent domain. |

The following methods can be called on the _Environment_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Environment_. Parameter is the attribute name. |
| deptime(_Application_) | Date | Returns a Date object representing the last time the specified _Application_ was deployed to the _Environment_. Returns null if the specified _Application_ is not currently on the _Endpoint_. |

Note, that attributes such as _owner_ and _parent_ return other _Objects_. These objects have their own attributes. So, for example, one can get the owner name of an _Environment_ by writing:

~~~
set owner = ${_Environment_.owner};

echo ${owner.name};

or, more simply:

echo ${_Environment_.owner.name};
~~~

Here is an example of retrieving the _Endpoints_ in the _Environment_:

~~~
set servers = ${_Environment_.servers};

iterate(s: $servers) {

echo &quot;server is ${s.name}&quot;;

echo &quot;hostname is ${s.hostname}&quot;;

}
~~~