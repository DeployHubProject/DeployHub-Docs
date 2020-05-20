---
title: "Application"
linkTitle: "Application"
weight: 8
description: >
  Get Application Base Version or Version data.
---


### Application

The _Application_ object represents either a Base _Application_, an _Application Version,_ or a Release. In **DeployHub Pro** there is always an _Application_ on the stack representing the _Application_/_Release_ being deployed referenced by $_Application_. You can also retrieve an _Application_ using the get_Application__Function_ or push an _Application_ onto the Stack via using _Application_.

NOTE: A _Release_ is a DeployHub Pro Object. It is of the _type__Application_. The release property indicates if the object represents a Release.

The following properties can be accessed for an _Application_ object:

| **Property** | **Type** | **Description** |

| id | Integer | _Application_ id, as used in the database. |
| --- | --- | --- |
| name | String | _Application_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Application_ is contained. |
| owner | Object | User or UserGroup that owns the _Application._ |
| parent | Object | The Base _Application._ |
| predecessor | Object | Predecessor _Application Version_ (the version on which this version is based). |
| _Release_ | Boolean | true if object is a _Release_, false otherwise. |
| _Applications_ | Array | Array of _Application_ objects if the object is a _Release_  a list of the consituent _Applications_. If the object is not a _Release_, this returns null. |
| _Components_ | Array | Array of _Component_ objects (keyed by _Component_ name) which make up this _Application._ |
| approvals | Array | Array of strings (approved/rejected) keyed by domain name for which the _Application_ is approved/rejected. |
| requests | Array | Array of _Change Request_ objects associated with this _Application_. |
| creator | User | User Object representing the user who created this _Application_. |
| modifier | User | User Object representing the user who last modified this _Application_. |
| ctime | Date | Date Object representing the date/time the _Application_ was created. |
| mtime | Date | Date Object representing the date/time the _Application_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name |

The following methods can be called on the _Application_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| children(all) | Array | Returns an array of _Application_ objects representing the descendants of this _Application_. If the parameter _all_ is passed as true then the returned array includes all the descendants of the immediate descendants recursively. If the parameter _all_ is omitted or passed as false then the return array only includes the immedate descendants. |
| versions(all) | Array | Synonym for children. Works identically. |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Application_. Parameter is the attribute name. |
| requests(onlyForApp) | Array | Returns an Array of _Change Request_ objects. If onlyForApp is not specifed or passed as false then this is identical to accessing the requests attribute. If onlyForApp is specfied as true then only the change request records associated with the _Application_ itself are returned Note: No change request which is only associated with a consituent _Component_ is returned. This allows you to differentiate between change requests associated with the _Application_ and any of its _Components_. |
| latest(branchname) | Object | Returns the latest _Application Version_ of this _Application_. If branchname is specified then the returned _Application_ Object is the latest version on the specified branch. |

Attributes such as _owner_ and _parent_ return _Objects_. These objects have their own attributes. So, for example, one can get the owner name of an _Application_ by writing:

```bash

set owner = ${_Application_.owner};

echo ${owner.name};

or, more simply:

echo ${_Application_.owner.name};

Get _Application_ Approval Status:

set approvals = ${_Application_.approvals};

foreach(a: $approvals) {

echo "$a : ${approvals[$a]}";

}

// e.g.:

// Test : approved

// Prod : rejected
```

Since the array is keyed on the domain name, you can easily check if the app is approved for a particular domain:

```bash
set approvals = ${_Application_.approvals};

if (${approvals["Test"]} = "approved") {

// _Application_ is approved for Test Domain

}
```

Or you can use dot notation (assuming the target domain name does not contain spaces):

```bash
set approvals = ${_Application_.approvals};

if (${approvals.Test} = "approved") {

// _Application_ is approved for Test Domain

}
```

To iterate through the _Component_s that make up the _Application_:

```bash
set Components = ${Application.Components};

echo "This Application has ${Components.length()} Components";

iterate(c: $Components) {

echo "Component ${c.name} (id ${c.id})";

}
```
