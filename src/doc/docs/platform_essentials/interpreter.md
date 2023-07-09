---
tags:
- mbeddr
- iets3
alias: interpreter
---

The interpreter lets you interpret code on the fly. You can use it instead of the standard approach by writing an MPS generator and executing the code this way (e.g., executing Base Language code). The result of invoking the interpreter is a Java object.

![interpreter: KernelF test case](interpreter_testcase.gif){width="600px"}

In the GIF, you can see the interpreter executing a test case that contains assertions written with [KernelF](https://voelter.de/data/books/kernelf-designEvoUse.pdf). The MPS generator isn't involved in the execution at all.

## Creating an Interpreter

To create a new interpreter, create a solution containing the interpreter and import the language `com.mbeddr.mpsutil.interpreter`.
Make sure to set the solution kind to `Other` in the module properties.

![interpreter: Solution Kind configuration](interpreter_solution.png)

Now create a new model inside your solution, create the new interpreter, and give it a name. The category should be `arithmetic` so that other interpreters of this category can also use this interpreter, but you can also use different categories. A [demo Java interpreter](http://127.0.0.1:63320/node?ref=r%3A6de0fec9-28ce-4092-a00d-c37c6ae81d03%28com.mbeddr.mpsutil.javainterpreter.plugin%29%2F902624672040616048) exists in mpsutils (mbeddr) that uses the  category `java`. You don't have to set the evaluated languages: they are automatically calculated based on the declared evaluators.

In the related interpreter section, you can define that the current interpreter should run before or after another interpreter. [An example](http://127.0.0.1:63320/node?ref=r%3A2864d21d-eb2b-488f-a943-a765959cab0a%28org.iets3.core.expr.collections.interpreter.plugin%29%2F8448265401168630270) from KernelF: interpreter of the collections operations should run first because it reduces them to more straightforward statements. The lambda and base interpreter should run afterward.

The type mappings section can declare mappings from types that implement the [IType](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1234971358450) interface to either a Java type or another custom type that implements the [IType](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1234971358450) interface.

![KernelF: expression simple interpreter](exprSimpleInterpreter.png)

An evaluator consists of a left and right side: the left side is a concept that should be interpreted. In the inspector, you can set *cacheValues* to true to enable caching. When the interpreter reaccesses the same value, the cached value is returned instead of recalculating it. Unchecking *Tools* --> *Enable Interpreter Cache* in the main menu can turn off the interpreter cache.

![evaluator of literals concept](literals_evaluator.png){width="600px"}

The right side contains an expression or a block and must return a value. The *node* expression refers to the currently evaluated expression. A few expressions start with *#*. Their corresponding short descriptions explain them. Use the *#->* expression to call functions (search for usages globally).
The right side can return a Java object (including null) or call another interpreter with one of the #-expressions. Another interesting expression is the *env* expression. Use this array to save values for other evaluators. The key must be a node. If you don't have a node, you can use a helper class with static dummy nodes as keys. An example could be a dot expression where the operation needs to access the operand, e.g., `"hello".startswith("he")`. `startswith()` is the operation, `"hello"` is the operand:

![evaluator of startswith concept](startswith_evaluator.png)

When the current interpreter is not suitable for interpreting the current node, use the expression *tryOtherInterpreter* to use the next interpreter to interpret the current node:

![try other interpreter expression](tryOtherInterpreter.png)

Use the *castUp* expression to cast a Java (Base Language) expression to a type.
For example, if the expression is of type Number (*numberInput*) and the target type is float,
`numberInput.floatValue()` would be called.
The *$* expression returns the concept's type. Use it for type mappings and child-type constraints you enter in the middle of evaluators. For example, the evaluator of a modulo operator might require that the left and right expressions are of type integer. Otherwise, the evaluator shouldn't be used:

![evaluator of modulus](mod_evaluator.png){width="600px"}

Use the *context* expression to access the interpreter configurations, the cache, and the root interpreter, and contains some other useful. You can, for example, use it to access the environment from a Java class by executing a method with the context as a parameter. Then you can access the environment by calling `context.getEnvironment()`. The environment can be nested by calling `push` and `pop`. The interpreter uses the topmost environment in the stack. Use the is-evaluable expression (#?) to check if an evaluator for a specific node is available.

## Code Coverage

There's also support for code coverage inside the editor. Code coverage checks which part of the code the interpreter has visited. For more information, consult the [Wikipedia page](https://en.wikipedia.org/wiki/Code_coverage). You can find out, for example, which parts of the code aren't covered by tests:

![example: code coverage](example_coverage.png)

There's support for coverage of single nodes but also branches. An example of a concept that uses branches in the data flow is the if and else blocks of an if statement. To register branches, use the *register branches* statement. To visit a branch, use the *branch* statement. When visiting a node, the node, the node's concept, and the evaluator are automatically marked as covered. For the children of the node, there's the *list coverage* statement which visits a list of nodes, and the simple *cover* statement. The former is, for example, used for the elements of a map literal. The coverage information can be accessed and set through the *coverage* variable.

![evaluator of if expression](if_evaluator.png)

## Calling the Interpreter

For IETS3 use the class `IETS3ExprEvalHelper`. If you can't use this class, use the following code:
```java
class Coverage {
    void test() {
        ICoverage coverage = null; // your implementation
        ContextImpl ctx = new ContextImpl();
        InterpreterEvaluationHelper helper = new InterpreterEvaluationHelper(INTERPRETER_CATEGORY);
        return helper.evaluateWithContextAndCoverage(expr, getInterpreter(), ctx, coverage);
    }
}
```

Other methods don't need coverage, a context object, etc. etc. The easiest way is to call `helper.evaluate` which returns a Java expression.

## Final Notes

The interpreter doesn't support multithreading. It can also be slow when called too many times.

It's also recommended not to call the interpreter from the generator when searching for interpreters. MPS might deadlock because it starts indexing. You might get away with it by calling the interpreter inside the runnable of `DumbService.getInstance(project).suspendIndexingAndRun()`. You can't return the value from the runnable, but you can assign it in a method of an object outside the runnable.

## Examples

- KernelF: [ExprBaseInterpreter](http://127.0.0.1:63320/node?ref=r%3A31fd8edf-66c5-44d7-84a8-5940badb4d17%28org.iets3.core.expr.base.interpreter.plugin%29%2F553080662195419964)
- Mbeddr: [JavaInterpreterBase](http://127.0.0.1:63320/node?ref=r%3A6de0fec9-28ce-4092-a00d-c37c6ae81d03%28com.mbeddr.mpsutil.javainterpreter.plugin%29%2F902624672040616048)
