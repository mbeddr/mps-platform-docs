---
hide:
- toc
tags:
- interactive
- troubleshooting
---

!!! warning "I can't enter the print statement."

    Nested structures don't support it (MPS-34656). Use it at the top level instead. If you need to output multiple objects,
    save them to a list first and output the list at the top level.

!!! question "How can you enter more than one statement into the console?"

    Enter an opening [curly brace](http://127.0.0.1:63320/node?ref=r%3A359b1d2b-77c4-46df-9bf2-b25cbea32254%28jetbrains.mps.console.base.structure%29%2F5464054275389846505) (this starts a new statement list in Base Language) and enter your statements.

!!! question "How can you find all System.out.println statements?"

    [Code snippet:](https://gist.skadi.cloud/gist/13dECMxlPy0WVy1E6wBEUc)

    ![find print statements](find_print_statement.png)]

!!! warning "#nodes, #models, #usages, etc., don't show any result."
    Make sure that your query is correct. You must also set a scope for these statements in square brackets, such as
    `#!java #nodes<scope = global>`, to find all the nodes in the global scope.

!!! question "Is the console a regular root node?"

    Yes, it is an instance of [ConsoleRoot](http://127.0.0.1:63320/node?ref=r%3A359b1d2b-77c4-46df-9bf2-b25cbea32254%28jetbrains.mps.console.base.structure%29%2F1583916890557930028)
    and belongs to a temporary model. It is possible to open it in a regular tab. Right-click in the console (for example, at the top) and click 
    *Show Node in Explorer*. Click the *ConsoleRoot* to open it in a new tab  (keyboard shortcuts such as run line won't work here).

!!! warning "After executing the current line, an error says that the compiler couldn't find the console class."

    This error can happen when the console's compilation of the model is unsuccessful. It can happen if you import a custom generation
    plan into the console that turns off some generators. It can also occur if you import a solution that doesn’t enable the Java facet or has a different solution (e.g., *other*).

!!! question "What does the expression #internalMode do?"

    It tells you if the internal mode is activated. Activate it by calling [RuntimeFlags.setInternalMode(true)](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps%28MPS.Core%2F%29%2F%7ERuntimeFlags)
    or setting a system variable. Start MPS with argument `#!properties -Dmps.internal=true` or add `#!properties mps.internal=true` to the *mps.vmoptions* file: use *Main menu* -> *Help* -> *Edit Custom VM Options*. The [MPS sources](https://github.com/JetBrains/MPS/search?q=isInternalMode&type=code) contain references to this flag in various places.
    One of the new action groups that it adds is called *Internal*. There is also an Internal Actions Menu in the IntelliJ IDEA. Consult the [documentation](https://plugins.jetbrains.com/docs/intellij/internal-actions-intro.html)
    for more info.

!!! question "How do you open the selected node in the console?"

    > Given I have a node selected in the editor. How can I reference it to manipulate it in the MPS console?

    {{ question_by('AlexeiQ') }}

    You can copy the node and paste it into the console:

    1. Copy a node in the editor (++cmd+c++ or ++ctrl+c++)
    2. Go to the console.
    3. Paste the content   (++cmd+v++ or ++ctrl+v++)
    4. MPS pastes a node reference that you can use to manipulate the node directly:

    ![console_node_reference](console_node_reference.png){width="600px"}

    {{ answer_by('coolya') }}