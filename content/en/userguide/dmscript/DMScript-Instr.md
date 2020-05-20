---
title: "Instr"
linkTitle: "Instr"
weight: 74
description: >
  Search a string looking for the first instance of the specified string. 
---


### Instr

instr searches a string looking for the first instance of the specified search string. If the search string is located in the source string, then its starting position is returned. The first character in a string is position 0. If the search string cannot be found within the source string, instr returns -1.

**Usage:**

String.instr(searchString)

or

instr(String,searchString)

**Returns:**

Integer: An index position (starting at 0) representing the location of searchString within String. -1 if searchString does not appear in String.

**Example:**

set a=&quot;Hello There&quot;;

echo ${a.instr(&quot;The&quot;)}; // echoes 6

**See Also:**

substr(), regsub(), length()