!!! warning "I can't enter the print statement."

    It can't be used in nested structures. Use it at the top level instead.

!!! question "How can you enter more than one statement into the console?"

    Enter an opening [curly brace](http://127.0.0.1:63320/node?ref=r%3A359b1d2b-77c4-46df-9bf2-b25cbea32254%28jetbrains.mps.console.base.structure%29%2F5464054275389846505) (this starts a new statement list in baselanguage) and enter your statements.

!!! question "How can you find all System.out.println statements?"

    [Code snippet:](https://gist.skadi.cloud/gist/13dECMxlPy0WVy1E6wBEUc)

    ![find print statements](find_print_statement.png)]

!!! question "#nodes, #models, #usages etc. don't show any result. What went wrong?"
    Make sure that your query is correct. You also have to set a scope for these statements in square brackets such as
    `#!java #nodes<scope = global>` to find all the nodes in the global scope.

!!! question "Is the console a regular root node?"

    Yes, it is of concept [ConsoleRoot](http://127.0.0.1:63320/node?ref=r%3A359b1d2b-77c4-46df-9bf2-b25cbea32254%28jetbrains.mps.console.base.structure%29%2F1583916890557930028)
    and is located in a temporary model. It is possible to open it in a normal tab. Right-click in the console (for example at the top) and click 
    *Show Node in Explorer*. Click the *ConsoleRoot* and it will open in a new tab (keyboard shortcuts such as run line won't work here).

!!! warning "After executing the current line, an error says that the console class wasn't found."

    This can happen when the compilation of the model of the console was not successful. It can happen if you import a custom generation
    plan into the console that disables some generators. It can also happen if you import a solution that doesn't have the java facet enabled
    or has a different solution kind such as *other*.

!!! question "What does the expression #internalMode do?"

    It tells you if the internal mode is activated. It can be achieved by calling [RuntimeFlags.setInternalMode(true)](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps%28MPS.Core%2F%29%2F%7ERuntimeFlags)
    or by setting a system variable. Start MPS with argument `#!properties -Dmps.internal=true` or add `#!properties mps.internal=true` to the *mps.vmoptions* file: use *Main menu* -> *Help* -> *Edit Custom VM Options*. The exact functionality of this flag can be found by looking at the [MPS source code](https://github.com/JetBrains/MPS/search?q=isInternalMode&type=code).
    One of the new action groups that it adds, is called *Internal*. There is also an Internal Actions Menu in Intellij IDE's. Consolute the [documentation](https://plugins.jetbrains.com/docs/intellij/internal-actions-intro.html)
    for more info.

!!! question "How do you open the selected node in console?"

    > Given I have a node selected in the editor. How can I select it to manipulate it in the MPS console?

    {{ question_by('aquapp') }}

    You can simply copy the node and paste it into the console:

    1. Copy a node in the editor (++cmd+c++ or ++ctrl+c++)
    2. Go to the console.
    3. Paste the content   (++cmd+v++ or ++ctrl+v++)
    4. MPS pastes a node reference that you can use to directly manipulate the node:

    ![console_node_reference](console_node_reference.png){width="600px"}

    {{ answer_by('coolya') }}