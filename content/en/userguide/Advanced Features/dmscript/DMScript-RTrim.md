---
title: "RTrim"
linkTitle: "RTrim"
weight: 94
description: >
  Turn the given value into a String and remove any trailing whitespace.
---

_rtrim_ turns the given value into a String and removes any trailing whitespace characters before returning the result.

### Usage

String.rtrim()

Or

rtrim(String)

### Returns

String: The passed string with any trailing whitespace removed.

### Example

```bash
set a = "Hello From ";

echo "$a DeployHub Pro";

echo "${a.rtrim()} DeployHub Pro";

Result:

Hello From DeployHub Pro

Hello From DeployHub Pro
```
