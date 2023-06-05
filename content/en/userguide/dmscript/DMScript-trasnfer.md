---
title: "To Json"
linkTitle: "To Json"
weight: 108
description: >
  Push files in the current DropZone to all Endpoints. 
---

_transfer_ pushes the files in the current _DropZone_ to all the _Endpoint_s in the current_Endpoint_set. transfer takes no parameters – all the files in the_DropZone_are pushed to every_Endpoint_in the current_Endpoint_set. You can limit the_Endpoint_set by placing the transfer in an if block to reduce the_Endpoint_set to those matching the specified expression. You can also use remove to remove files from the_DropZone_ before calling transfer.

_transfer_ is generally only required when writing custom actions. It is called implicitly during a conventional deployment. A pre action on a _Component_ can be used to modify the drop zone before the _Component_ is deployed.

**Example:**
Checkout files and transfer them to all the _Endpoint_s in the current_Endpoint_ set.

```bash
checkout(repository: "myrep", pattern: "\*.exe");
transfer;
```
