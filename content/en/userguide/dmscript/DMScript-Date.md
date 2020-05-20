---
title: "date"
linkTitle: "date"
weight: 40
description: >
  Contructs and returns a Date from the given values.
---



### Date

Constructs and returns a Date Object from the given values.

**Usage:**
~~~
date(Year,Month,Day[,Hour[,Min[,Sec]]])

or

date(SecsSinceEpoch)

  Where:

  Year: Is the Year (1970 onwards)

  Month: Is the Month (1-12)

  Day: Is the Day of the Month (1-31)

  Hour: Optional: The Hour of the Day (0-23)

  Min: Optional: The Minute of the Hour (0-59)

  Sec: Optional: The Second of the Minute (0-59)

  SecsSinceEpoch: Is the number of seconds since Midnight January 1st, 1970.

Returns:

Date Object
~~~

**Example:**
~~~

set res = date(2014,1,2,23,30,12);

echo &quot;date is $res&quot;;

Result:

date is Thursday, January 02, 2014 23:30:12


The year _Component_ of the date has to be 1970 or later. Dates containing earlier years are not supported. Attempts to create a date with a year earlier than 1970 will result in an exception being thrown. This can be caught with a try/catch block.
~~~
