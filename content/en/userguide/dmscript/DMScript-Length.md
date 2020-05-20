---
title: "Length"
linkTitle: "Length"
weight: 76
description: >
  Get the length of the associated object.  
---



### length

length returns a number indicating the length of the associated object. When called with a String it returns the number of characters in the string. When called from an Array it returns the number of elements in the Array. When called with a Stream it returns the size of the Stream in bytes.

**Usage:**

String.length()

Or

length(String)

Array.length()

Or

length(Array)

Stream.length()

Or

length(Stream)

**Returns:**

Integer representing the number of characters (String), elements (Array) or bytes (Stream) in the passed object.

**Examples:**

set mystr=&quot;Hello There&quot;;

echo &quot;String length is ${mystr.length()}&quot;;

set list={&quot;a&quot;, &quot;b&quot;, &quot;c&quot;};

echo &quot;Array length is ${list.length()}&quot;;

using _DropZone_ &quot;temp&quot; {

checkout(repository: &quot;Openmake\_Demo.demorep2&quot;,pattern: &quot;demo1.zip&quot;);

set filelist = ${_DropZone_.files};

echo &quot;file size = ${filelist[&#39;demo1.zip&#39;].size}&quot;;

using stream $mystream {

read(file: &quot;demo1.zip&quot;);

}

echo &quot;stream size is ${mystream.length()}&quot;;

}

Result:

String length is 11

Array length is 3

INFO: Checked out demo1.zip;0

file size = 36675

stream size is 36675

**See Also:**

substr(), regsub(), sum()