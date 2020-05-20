---
title: "XML Parse"
linkTitle: "XML Parse"
weight: 90
description: >
  Convert XML data into a DMScript array.
---

### xmlparse

xmlparse operates on a String. If the string contains valid XML data then this is converted into a _DMScript_ array. The following rules are applied:

- XML tags are converted to keys in the array
- The value associated with the key is the content of the XML tag (that is, the data between the opening and closing tags). If the tag is self-closing (i.e. like \&lt;this /\&gt;) then the value is a null length string.
- If the tag contains nested tags then the value is another array containing the values. This occurs recursively to any depth.
- Any repeating tag causes the value to become a list
- Any attributes in the tag are created as an array with the key being the tag name (preceded by a @ character) and the value being the value of the attribute.

**Usage:**

_String_.xmlparse()

or

xmlparse(string)

**Returns:**

Array: An encoded version of the passed XML string.

**Examples:**

_Parse an XML document and process it with DMScript:_

using stream $xmlstr {

echo &quot;\&lt;demo\&gt;&quot;;

echo &quot;\&lt;employees dept=\&quot;west\&quot;\&gt;&quot;;

echo &quot;\&lt;employee\&gt;&quot;;

echo &quot;\&lt;given\&gt;Mark\&lt;/given\&gt;&quot;;

echo &quot;\&lt;surname\&gt;Smith\&lt;/surname\&gt;&quot;;

echo &quot;\&lt;/employee\&gt;&quot;;

echo &quot;\&lt;employee\&gt;&quot;;

echo &quot;\&lt;given\&gt;Peter\&lt;/given\&gt;&quot;;

echo &quot;\&lt;surname\&gt;Jones\&lt;/surname\&gt;&quot;;

echo &quot;\&lt;/employee\&gt;&quot;;

echo &quot;\&lt;employee\&gt;&quot;;

echo &quot;\&lt;given\&gt;Kevin\&lt;/given\&gt;&quot;;

echo &quot;\&lt;surname\&gt;Doe\&lt;/surname\&gt;&quot;;

echo &quot;\&lt;/employee\&gt;&quot;;

echo &quot;\&lt;/employees\&gt;&quot;;

echo &quot;\&lt;/demo\&gt;&quot;;

}

set parsed = ${xmlstr.xmlparse()}; // convert to Array

echo &quot;parsed is ${parsed.to\_json()}&quot;; // Output the array as JSON

set employees = ${parsed.demo.employees.employee};

echo &quot;Employees:&quot;;

// Loop through the employee records in the array

for (i=0;$i\&lt;${employees.length()};i=$i+1) {

echo &quot;${employees[$i].given} ${employees[$i].surname}&quot;;

}

Result:

parsed is {&quot;demo&quot;:{&quot;employees&quot;:{&quot;@dept&quot;:&quot;west&quot;,&quot;employee&quot;:[{&quot;surname&quot;:&quot;Smith&quot;,&quot;given&quot;:&quot;Mark&quot;},{&quot;surname&quot;:&quot;Jones&quot;,&quot;given&quot;:&quot;Peter&quot;},{&quot;surname&quot;:&quot;Doe&quot;,&quot;given&quot;:&quot;Kevin&quot;}]}}}

Employees:

Mark Smith

Peter Jones

Kevin Doe

Since the \&lt;employee\&gt; tag repeats, xmlparse turns this repeating tag into a single list of arrays, each holding an employee record (given name and surname).

The line:

set employees = ${parsed.demo.employees.employee};

sets employees to be a list of these employee records. The number of employee records is given by:

${employees.length()}

We can therefore loop through each record like this:

for (i=0;$i\&lt;${employees.length()};i=$i+1) {

echo &quot;${employees[$i].given} ${employees[$i].surname}&quot;;

}

Which outputs each employee&#39;s given name and surname.

xmlparse is useful when calling external SOAP based APIs which may return embedded XML strings which need to be parsed before processing. See soap in this chapter for an example.


**Note:** xmlparse will throw an exception if the passed XML cannot be parsed for any reason. This will normally stop the script. You can use try/catch to catch such exceptions:
set test=&quot;\&lt;a\&gt;\&lt;b\&gt;hello\&lt;/b\&gt;\&lt;b\&gt;goodbye\&lt;/b\&gt;&quot;;try {// This will fail as there is no closing \&lt;/a\&gt; tag.set jsonvals = ${test.xmlparse()};} catch(ex) {echo &quot;exception caught!&quot;;echo $ex;}
 |
| --- | --- |