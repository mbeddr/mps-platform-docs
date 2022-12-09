---
tags:
- mbeddr
---

# Misc Topics

## Limitations to product line engineering when generating variant aware code

The current PLE approach only generates a single variant. The generated artifacts aren't variant aware. We want to enable the that the generated code can contain *#if* statements to generate all variants at once. When we want to do this we have to limit variability to elements where we can represent this in the generated C code. The main problem is that presence conditions can't be applied to all nodes in the model.

### What doesn't work?

In addition to elements with a cardinality of 1, some other items can't be removed from the AST with presence conditions:

- parameters of a function
- arguments from function calls
- extra declarations of for loops
- variable initializers
- expressions in array/user defined type initializers
- arguments of function macros (global function declarations)


#### Code smells

- replacement of *functioncall* expression where parent is expression statement
    + replace complete statement to generate readable code

