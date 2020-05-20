---
title: "Octal"
linkTitle: "Octal"
weight: 84
description: >
  Convert any value into an octal representation. 
---

### octal

octal converts any value that can be converted into an integer (boolean, integer, a string containing only numeric characters or a date) into an octal representation. An optional base parameter specifies the base to be used when converting the string. If no base parameter is given, base defaults to 10.

**Usage:**

value.octal([base])

or

octal($value[,base])

Where:

base is the base to be used when performing the conversion.

**Returns:**

String.

**Examples:**

Convert a Unix file permission mask (-rwxrwxrwx) into its Octal equivalent suitable for a chmod operation.

set perms=&quot;-rwxr-xr-x&quot;;

echo &quot;perms is $perms&quot;;

// Convert to binary by substituting 0 for � and then anything

// that isn&#39;t a 0 gets converted to a 1.

set b = ${perms.regsub(&quot;-&quot;,&quot;0&quot;).regsub(&quot;[^0]&quot;,&quot;1&quot;)};

// Convert to octal by converting the string using base 2.

echo &quot;chmod ${b.octal(2)}&quot;;

Result:

perms is -rwxr-xr-x

chmod 755

**See Also:**

hex(), decimal()