# Misc Topics

## Limitations to PLE when generating variant aware code

#### Introduction
The current PLE approach only generates a single variant. The generated artifacts aren't variant aware. We want to enable the that the generated code can contain #if statements to generate all variants at once. When we want to do this we have to limit variability to elements where we can represent this in the generated C code. The main problem is that presence conditions can't be applied to all nodes in the model.

##### What does not work?

In additions to elements with a cardinality of 1 there are other items that can't be removed from the AST with presence conditions:

- Parameters of a function
- Arguments from function calls
- Additional declarations of for loops
- variable   initializers
- expressions in array/user defined type initializers
- Arguments of function macros (global function declarations)


##### Code smells

- Replacement of `functioncall` expr where parent is expression statement
    + Replace complete statement to generate readable code

