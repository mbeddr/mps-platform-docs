---
comments: true
status: deprecated
tags:
- mbeddr
---

# Misc Topics

## Variants

### Limitations to Product Line Engineering When Generating Variant-Aware Code

The current PLE approach only generates a single variant. The generated artifacts aren't variant aware. We want to enable that generated code to contain *#if* statements to generate all variants simultaneously. When we want to do this, we have to limit variability to elements where we can represent this in the generated C code. The main problem is that presence conditions can't be applied to all nodes in the model.

### What Doesn’t Work?

Besides elements with a cardinality of 1, you can't remove some other items from the AST with presence conditions:

- parameters of a function
- arguments from function calls
- extra declarations of for loops
- variable initializers
- expressions in array/user-defined type initializers
- arguments of function macros (global function declarations)


#### Code Smells

- replacement of function call expression where the parent is an expression statement
    + replace complete statement to generate readable code

