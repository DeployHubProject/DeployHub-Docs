---
title: "Conditionals"
linkTitle: "Conditionals"
weight: 31
description: >
  Use Conditional Expressions to evaluate true or false. 
---

## Conditional Expressions

Use the _Conditional Expressions_ "if" and "else" as a general expression evaluator to see if it equates to true (non-zero) or false (zero). If the expression equates to true, then the block associated with the "if" is executed. If the expression equates to false, then the block associated with the "else" is executed. The "else" part of the expression is optional.

### Example 1

```bash
set a=10;

if ($a<10) {

echo "a is less than 10";

} else {

echo "a is greater than or equal to 10";

}

This will echo "a is greater than or equal to 10"

You can also use "C-Style" conditional expressions to check if a variable equates to zero (false) or non-zero (true);

set a=0;

set b=1;

if ($a) {

echo "this will not echo";

}

if ($b) {

echo "this will echo";

}

```

NOTE: in _DMScript_ the braces are mandatory when constructing a conditional expression, even if there is only one statement to execute.

_If_ can also be used to filter the current _Endpoint list_. For example, an _Environment_ may contain 10 _Endpoint_s. The_Endpoint list_is this complete list of_Endpoint_associated with the_Component_on the stack. You can use the_if_expression to reduce this list to_Endpoints_matching the specified criteria. For example, if you use_IF_with an expression of ATVAL='Y' then any code attached to the_then_part of the if will operate only on_Endpoints_with an attribute of ATVAL that is equal to Y. Similarly, any actions attached to the_else_part of the_if_statement will operate only on_Endpoints__without_ an attribute of ATVAL or with an ATVAL attribute that is not equal to Y.

When using an _if_ expression in this way, both the _then_ and _else_ parts can be executed with different server sets in each block.

### Example 2

```bash
if ($HAS\_MY\_SERVICE = "Y") {
 // this block only executes for Endpoints

// with the HAS\_MY\_SERVICE attribute set to "Y"

servicectl($SERVICE\_NAME,"stop"); // stop the service
 }
 ```
