---
title: "Now"
linkTitle: "Now"
weight: 83
description: >
  Get the current data and time. 
---



## now

Returns a Date object representing the current date and time. Note, the current date and time is taken from that of the executing deployment engine, not of the _Endpoint_ running the web interface.

**Usage:**

now()

**Returns:**

Date Object

**Example:**

set d = now();

echo &quot;The time now is $d&quot;;

echo &quot;Epoch is ${d.to\_int()}&quot;;

Result:

The time now is Wednesday, April 06, 2016 15:41:50

Epoch is 1459953710

**See Also:**

date()
