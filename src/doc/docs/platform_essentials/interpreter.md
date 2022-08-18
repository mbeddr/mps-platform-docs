The interpreter let you interpret code on the fly. You can use it instead of the normal approach by writing an MPS generator and executing the code this way (e.g. executing baselanguage code). The result of invoking the interpreter is a Java object.

![interpreter: KernelF test case](interpreter_testcase.gif){width="600px"}

In the GIF you can see the interpreter executing a test case that contains assertions that are writing with [KernelF](https://voelter.de/data/books/kernelf-designEvoUse.pdf). The MPS generator isn't involved in the execution at all.

## Creating an interpreter

First you have to import the language `com.mbeddr.mpsutil.interpreter`.
Now create a new interpreter and give it a name. The category should be `arithmetic` so that other interpreters of this category can also use this interpreter but you can also use other categories. There is, for example a [demo Java interpreter](http://127.0.0.1:63320/node?ref=r%3A6de0fec9-28ce-4092-a00d-c37c6ae81d03%28com.mbeddr.mpsutil.javainterpreter.plugin%29%2F902624672040616048) in mpsutils(mbeddr) that uses its own category `java`. You don't have to set the evaluated languages: they are automatically calculated based on the declared evaluators.

In the related interpreter section, you can define that the current interpret should run before or after another interpreter. [An example](http://127.0.0.1:63320/node?ref=r%3A2864d21d-eb2b-488f-a943-a765959cab0a%28org.iets3.core.expr.collections.interpreter.plugin%29%2F8448265401168630270) from KernelF: the collections operations should be interpreted first because they are reduced to simpler statements. The lambda and base interpreter should be run afterwards.

The type mappings section can declare mappings from types that implement the [IType](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1234971358450) interface to either a java type or another custom type that implements the [IType](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1234971358450) interface.

![KernelF: expression simple interpreter](exprSimpleInterpreter.png)

An evalutator consists of a left and right side: the left side is a concept that should be interpreted. In the inspector, you can set *cacheValues* to true to enabling caching. When the same value is accessed again, the cached value is returned instead of recalculation a value. The interpreter cache can be disabled by unchecking *Tools*-->*Enable Interpreter Cache* in the main menu.

![evaluator of literals concept](literals_evaluator.png){width="600px"}

The right side contains is an expression or a block and must return a value. The *node* expression refers to the currently evaluated expression. There are a few expressions starting with '#', that are explained in their corresponding short descriptions. The '#->' expression is used to call functions (search for usages globally).
The right side can return a Java object (including null) or call another interpreter with one of the #-expressions. Another interesting expressions is the *env* expression. It's an array that can be used to save values for other evalulators. The key must be a node. If you don't have a node available, you can also use a helper class with static dummy nodes as keys. An example could be a dot expression where the operation needs to access the operand e.g. `"hello".startswith("he")`. `startswith()` is the operation, `"hello"` is the operand:

![evaluator of startswith concept](startswith_evaluator.png)

In case that the current interpreter is not suitable for interpreting the current node, the expression *tryOtherInterpreter* can be used to use the next interpreter to interpret the current node:

![try other interpreter expression](tryOtherInterpreter.png)

The *castUp* expression can be used to case a Java (baselanguage) expression to a type.
For example, if the expression is of type Number (numberInput) and the target type is float,
`numberInput.floatValue()` would be called.
The *$* expression returns the type of a concept. It can be used for type mappings but also for child type constraints that can be entered in the middle of evaluators. For example: the evalator of a modulo operator might require that the left and right expressions are of type integer otherwise the evaluator shouldn't be used:

![evaluator of modulus](mod_evaluator.png){width="600px"}

The *context* expression can be used to access the interpreter configurations, the cache, the root interpreter and contains some other useful. It can, for example, be used to access the environment from a Java class by executing a method with the context as a parameter. Then the environment can be accessed by calling `context.getEnvironment()`. The environment can be nested by calling `push` and `pop`. The topmost environment in the stack is used. The is evaluable expression (#?) can be used to check if there is an evaluator available for a specific node.

## Code coverage

There's also support for coverage that's displayed inside the editor. Code coverage checks which part of the code was executed by the interpreter. For more information, consult the [Wikipedia page](https://en.wikipedia.org/wiki/Code_coverage). This way you can, for example, find out which parts of the code aren't covered by tests:

![example: code coverage](example_coverage.png)

There's support for coverage of single nodes but also branches. An example for branches would be, for example, the if and else block of an if statement. To register branches use the *register branches* statement. To visit a branch, use the *branch* statement. When visiting a node, the node, the node's concept and the evaluator are automatically marked as covered. For the children of the node, there's the *list coverage* statement which visits a list of nodes and there's also the simple *cover* statement. The former is, for example, used for the elements of a map literal. The coverage information can be accessed and set through the *coverage* variable.

![evaluator of if expression](if_evaluator.png)

## Tracing in KernelF

To follow the executing of an interpreter, the execution trace is helpful. Right-click an interpreted node and click *Show Trace*. The Trace explorer now opens in the lower left corner. When you click onww of the lines in the trace explorer, the node in the editor gets replaced by the trace. The trace can be manipulated through the *trace expression*.

![trace tool](trace_tool.gif)

## Nix handling in KernelF

KernelF doesn't allow returning null values
(intermediate null values that are caught by the same or other evaluators are fine).
Instead it supports so called nix handlers (there's an [nixHandler extension point](http://127.0.0.1:63320/node?ref=r%3A6c6155f0-4bbe-4af5-8c26-244d570e21e4%28org.iets3.core.expr.base.plugin%29%2F2417394483934994140)). The default handler for KernelF is [DefaultNixHandler](http://127.0.0.1:63320/node?ref=r%3A6c6155f0-4bbe-4af5-8c26-244d570e21e4%28org.iets3.core.expr.base.plugin%29%2F2417394483935015244).
A nix value (interface [INixValue](http://127.0.0.1:63320/node?ref=r%3A5db517a0-f62d-4841-a421-11bb7269799d%28org.iets3.core.expr.base.shared.runtime%29%2F3889855429449824409)) repesents an empty (nothing) value. There is, for example, a [DefaultNix](http://127.0.0.1:63320/node?ref=r%3Aac28053f-2041-47f6-806b-ecfaca05a64a%28org.iets3.core.expr.base.runtime.runtime%29%2F3889855429449859911) class, for dates there's [EmptyDateRangeValue](http://127.0.0.1:63320/node?ref=r%3Aa9ac3767-b241-4aa4-a973-d04bb5ce184c%28org.iets3.core.expr.datetime.runtime%29%2F5551088970758352208). The handler has a method *process* that can be used to handle values that might be nix. To use this feature. To use this feature call `new NixSupport(Object value node<> node {NixSupport => Object} calculator).run()` where the calculator returns the value:

![examples: nix support](nix_support_examples.png)

## Calling the interpreter

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

There are also methods which don't need coverage, a context object and so forth. The easiest method is `helper.evaluate` which returns a Java expression.

## Final notes

The interpreter doesn't support multithreading. It can also be slow when called too many times. 

It's also recommended to not call the interpreter from the generator because when searching for interpreters, MPS might deadlock because it starts indexing. You might get away with it by calling the interpreter inside the runnable of `DumbService.getInstance(project).suspendIndexingAndRun()`. You can't return the value from the runnable, but you can assign it in a method of an object that's outside the runnable.

## Examples

- KernelF: [ExprBaseInterpreter](http://127.0.0.1:63320/node?ref=r%3A31fd8edf-66c5-44d7-84a8-5940badb4d17%28org.iets3.core.expr.base.interpreter.plugin%29%2F553080662195419964)
- Mbeddr: [JavaInterpreterBase](http://127.0.0.1:63320/node?ref=r%3A6de0fec9-28ce-4092-a00d-c37c6ae81d03%28com.mbeddr.mpsutil.javainterpreter.plugin%29%2F902624672040616048)
