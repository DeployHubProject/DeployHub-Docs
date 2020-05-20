---
title: "Directory Name"
linkTitle: "Directory Name"
weight: 44
description: >
  Get the directory name from a full directory path. 
---

### Dirname

Returns the directory part of a full directory path, calculating the directory part of the string according to the optional systemtype parameter **.** If the systemtype is not specified then the system type is taken from the _Endpoint_ currently on the stack. If no _Endpoint_ is on the stack, an exception is thrown.

_dirname_ is also a method that can be called on a _Endpoint_ object. In this case, the system type is taken from the _Endpoint_ itself.

**Usage:**

```bash
dirname(path [,systemtype])

or

_Server_.dirname(path)

Returns:

String: The directory part of the passed path.
```

**Example:**

```bash
set res = dirname("C:\temp\myfolder\myfile.txt, &#39;windows&#39;");

//

// res is C:\temp\myfolder

//

set res = dirname(&#39;$2$DKA200:[FERDU01.TEST]vmsfile.txt&#39;, &#39;vms&#39;);

//

// res is $2$KDA200:[FERDU01.TEST]

//
```

**See Also:**

basename()
