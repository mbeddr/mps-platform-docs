## [Syntax Problems in the Editor](https://pythonprinciples.com/blog/getting-unstuck/#syntax-problems)

Because of the projectional editing approach, syntax problems don't exist in MPS. Sometimes it can be difficult to enter text though. A general approach that often works is to search for instances of a concept in the current project or globally to figure out how it works if there is no documentation provided for it.
Open a concept --> right-click --> *Find Usage Settings* --> Check *Concept Instances* and select the scope in which you want to find instances of
the concept.
The following list contains some common reasons why you might be stuck entering text:

### A [Constraint](https://www.jetbrains.com/help/mps/constraints.html) Prevents You From Entering Code

If you know the name of the concept, you can navigate to the constraints aspect to search for the reasons. In general, it is recommended
to allow users to enter text and tell them afterward that their action was incorrect or invalid at the inserted location than restrict them from
entering text at all. From a usability perspective, there is nothing more frustrating than not being able to enter information and not knowing
why you can't enter some text. Another solution would be to show text that can be entered in the code completion menu, in the side transformation popup, or some other place but disable the entries. Those entries then should contain descriptions that explain why the entries can't be selected at the moment.

### A Reference Can’t Be Entered Because of Its Scope

Please read the documentation about [scopes](https://www.jetbrains.com/help/mps/scopes.html) first.
A common mistake is to not add an import to the model that contains the node that should be referenced. Depending on how the scope works, you might
also need to add an *extends scope* in the dependencies tab of the module (e.g. needed for conditional editors) or the scoping is tied to some import mechanism (e.g. imports declarations in KernelF libraries).
References will still work if the target can't be found but will show an out-of-scope error. The error shouldn't be ignored though. Example: In a node test, you might try to reference a type system statement in the *has error* check while you want to use the *has type system error* check.

Partially related to scopes: sometimes it can be helpful to check why a certain item appears in the code completion menu to figure out why another item doesn't appear.
Open the code completion menu and press the mentioned shortcut at the bottom of the list to open the [menu trace tool](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html).

### Style Sheet Items/Actions Prevent Entering Text

For side transformations to work, cells must not have the *punctuation-left* or *punctuation-right* item set to false on the side where the side transformation should be available because otherwise text can't be entered because the cursor is not allowed at that position. To figure out the available input options and actions, right-click in the editor --> *Go To* --> *Editor Declaration* to open the corresponding editor of the concept. For more detailed information, right-click in the editor -> *Language Debug* --> *Show Cell in Explorer*. The cell explorer shows the full tree of editor cells that describe the currently opened editor.

![cell explorer](cell_explorer.png)

On the right side, you can see basic properties of the editor cell such as the referenced node or the position and dimension of the cell. The next section *Actions* shows the available editor actions that can be invoked. For example, the action *SELECT_LOCAL_END* is implemented as the action [SelectLocalEnd](http://127.0.0.1:63320/node?ref=r%3A9832fb5f-2578-4b58-8014-a5de79da988e%28jetbrains.mps.ide.editor.actions%29%2F7791284463049069924) and has a [keyboard shortcut](http://127.0.0.1:63320/node?ref=r%3A9832fb5f-2578-4b58-8014-a5de79da988e%28jetbrains.mps.ide.editor.actions%29%2F7791284463049111143) attached to it. The action is forwarded to the current selection in the editor through `#!java editorComponent.getSelectionManager().getSelection().executeAction(CellActionType.SELECT_LOCAL_END)` and can be handled in an [action map](https://www.jetbrains.com/help/mps/editor.html#actionmaps) in the editor aspect. For most actions, default implementations exist, that can be found in the MPS sources e.g. [LocalHome](https://github.com/JetBrains/MPS/blob/0814c19dff593eea167b669cf642dbdcc2679ca9/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cells/EditorCell_Label.java#L957C11-L957C11).
The last section deals with style items such as the text color or the focus policy. Some properties that are often important concerning debugging are
*punctuation-left*, *punctuation-right*, *editable* and *read-only* because they affect the ability to enter text.

### The Editing Is Supposed to Be Done Differently

Many ways exist to change MPS models. You can enter text directly in the editor or use

- [side transformations](https://www.jetbrains.com/help/mps/transformation-menu-language.html#sidetransformations) to make changes
- [context assistant](https://www.jetbrains.com/help/mps/context-assistant.html) buttons
- the [context actions tool](https://www.jetbrains.com/help/mps/context-actions-tool.html)
- [intentions](https://www.jetbrains.com/help/mps/mps-intentions.html)
- entries in the main menu to invoke actions
- the context menu of the editor to invoke actions
- buttons in the editor

Make sure to read the documentation or have a look at the implementation of the concepts of the used language to figure out how it works. As a last resort,
you can always use the MPS console to modify a model. Click a cell in the editor, use the copy shortcut, and paste it into the console. The node should be an instance of
PastedNodeReference and can be manipulated. For entering more complex nodes, the [quotation](https://www.jetbrains.com/help/mps/quotations.html) language can be used. Make sure to enter a curly brace in the console to start a Base Language statement block, so that you can enter multiple statements.

## Syntax Errors on Compilation

Before the generation fails, make sure to run the model checker to check if the model is in a valid state. Errors can still happen for various reasons:

### The Generator of the Language Has a Bug That Must Be Fixed

A common source of errors are cross-references to other models that are not handled
correctly. Wrong assumptions about which parts of the model are optional and which parts are mandatory often lead to incorrectly generated code. Depending on the target of the generator, the target language can also help with catching errors through the type system. Even if the code is not generated as part of a template fragment, the code in the generator shouldn't display any errors. For example: when a method is called that needs an argument of type string, don't call it with a different argument type in the template even if the parameter is replaced by a reference macro anyway. Casting nodes to a different concept should also be done carefully. An *as* cast will return null if the node can't be cast to the referenced concept.

### The Base Language Code Is Not Valid Java Code

Despite the similarities between Java and Base Language, they are not fully compatible. Read the page [MPS Java compatibility](https://www.jetbrains.com/help/mps/mps-java-compatibility.html) in the MPS documentation. Build scripts can also have a section *java options* which lets you select the used compiler. Some compilers deal with cyclic dependencies in the generated Java code better than others. That also means that the compilation will fail with some of them when switching the compiler by accident.

In rare cases, the generation fails because a variable is generated, that clashes with a variable in the current context e.g. variables named *node* or *_context* are good examples ([[generator_aspect#:~:text=which%20variable%20names%20aren%E2%80%99t%20available%20because%20they%20are%20used%20in%20the%20generator%3F|more info]]).
