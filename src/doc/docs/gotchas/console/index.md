!!! warning "I can't enter the print statement."

    It can't be used in nested structures. Use it at the top level instead.

!!! question "How can I enter more the one statement into the console?"

    Enter an opening curly brace (starts a new statement list in baselanguage) and enter your statements.

!!! question "How can I find all System.out.println statements?"

    ``` Java
    #show #instances<scope = project>(ExpressionStatement).where({~node =>
    node<ClassConcept> System = nodeRef@75295;
    node<InstanceMethodDeclaration> println = nodeRef@50206;
    node.expression.isInstanceOf(DotExpression) && node.expression:DotExpression.operand.isInstanceOf(StaticFieldReference)
    && node.expression:DotExpression.operand:StaticFieldReference.classifier :eq: System &&
    node.expression:DotExpression.operation.isInstanceOf(InstanceMethodCallOperation) &&
    node.expression:DotExpression.operation:InstanceMethodCallOperation.instanceMethodDeclaration :eq: println;
    })
    ```

!!! question "#nodes,#models, #usages etc. don't show any result. What did I do wrong"
    Make sure that your query is correct. You also have to set I scope for these statements in square brackets such as
    &#35;nodes&lt;scope = global&gt; to find all the nodes in the global scope.

!!! question "Is the console a regular root node?"

    Yes, it is of concept [ConsoleRoot](http://127.0.0.1:63320/node?ref=r%3A359b1d2b-77c4-46df-9bf2-b25cbea32254%28jetbrains.mps.console.base.structure%29%2F1583916890557930028)
    and is located in a temporary model. It is possible to open it in a normal tab. Right click in the console (for example at the top) and click 
    "Show Node in Explorer". Click the ConsoleRoot and it will open in a new tab (Keyboard shortcuts such as run line won't work here).

!!! warning "After executing the current line I get an error that the console class was not found?"

    This can happen when the compilation of the model of the console was not successful. Did you import a custom generation
    plan into the console that disables some generators? Did you import a solution that doesn't has the Java Facet checked
    or has a different solution kind such as "Other"?

!!! question "What does the expression #internalMode do?"

    It tells you if the internal mode is activated which can be achieved by calling [RuntimeFlags.setInternalMode(true)](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps%28MPS.Core%2F%29%2F%7ERuntimeFlags)
    or by setting a system variable. The exact functionality of this flag can be found by lookiing at the [MPS source code](https://github.com/JetBrains/MPS/search?q=isInternalMode&type=code).
    One of the new action groups that it adds, is called Internal. There is also an Internal Actions Menu in Intellij IDE's. Consolute the [documentation](https://plugins.jetbrains.com/docs/intellij/internal-actions-intro.html)
    for more info.