---
title: "Split"
linkTitle: "Split"
weight: 99
description: >
  Take a source string and split it into substrings.
---

### Split

_split_ takes a source string and splits into a number of substrings. The split is performed at the specified character sequence. The resulting strings are returned in a list of strings.

**Usage:**

String.split(seq)

or

split(String,seq);

**Returns:**

Array. A List of Strings.

**Example:**
~~~
set mystr=&quot;/this/is/an/example&quot;;

set dirs=${mystr.split(&quot;/&quot;)};

foreach (d: $dirs) {

echo &quot;dir=${dirs[$d]}&quot;;

}

Result:

dir=this

dir=is

dir=an

dir=example
~