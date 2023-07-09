# Actions

## Build Assistant

> ^^com.mbeddr.mpsutil.buildassistant^^

This language adds actions to make or rebuild models/modules or projects and includes their
dependencies. They don't have shortcuts. You can only invoke them through the *Find Actions* menu.

## Generic Actions

> ^^com.mbeddr.mpsutil.genericactions^^

As the name already implies, this language adds some new generic actions:

- **Decrease MPS Editor Font Size**: Decreases the font size in the editor settings and updates all editors (ctrl + -).
- **Increase MPS Editor Font Size**: Increases the font size in the editor settings and updates all editors (ctrl + +).
- **Reset MPS Editor Font Size**:: Reset the font size to the default size (ctrl + 0, 13 pixels)
- **File Manager in Output Folder**: A new action in the context menu of models that opens the path of the generated files.
  This action won't work if the model does not create output files.
- **File Manager in Module Folder**: A new action in the context menu of modules that opens the module's path.

## Node Access

> ^^com.mbeddr.mpsutil.nodeaccess^^

This language adds a new group of actions called *Copy/Paste Special* to the editor popup that opens when right-clicking
in the editor:

- **Copy Node as XML**: Serializes the selected node to XML and copies it to the system clipboard.
- **Paste XML Node**: Deserializes a previously copied node and inserts it next to the selected node.
- **Copy Node Info to Clipboard**: Copies information (project, module, model, node, URL) about a node to the system
  clipboard.

## Print

> ^^com.mbeddr.mpsutil.print.pluginSolution^^

This language adds a new action to the general MPS *File* menu. Print the current editor with the action *Print Editor*. If the operating system permits it, you can use create a PDF from the editor with this action.

## Refactoring

> ^^com.mbeddr.mpsutil.refactoring^^

This language adds support for a projection mode switcher and refactoring actions.

### Projection Mode Switcher

The mbeddr platform has a group *Projection* which is a top-level menu in MPS:

![projection menu](projection_menu.png)

A projection mode switcher can be declared containing push hint options where you reference the hints from an existing ConceptEditor context hints container. Add the action in the *Add to Menu/Button Group* section.

It adds a toggle to this menu/button group that toggles the referenced editor hint in the editors. When you only
want to enable it for a specific concept, add a concept to *only in editor with instance of*.

![example: projection mode switcher](projection_mode_switcher_example.png)

### Refactoring Action

The concept [RefactoringAction](http://127.0.0.1:63320/node?ref=1fc20ffe-f35b-4791-a0b7-d706bad5c49a%2Fr%3A18d75373-a465-46d0-9749-aacc22a947bc%28com.mbeddr.mpsutil.refactoring%2Fcom.mbeddr.mpsutil.refactoring.structure%29%2F7518061998923573137) can create an action for a [simple refactoring](https://www.jetbrains.com/help/mps/mps-refactoring.html). Specify the title of the action with *caption* and the keyboard shortcut in *shortcut*. Declare refactoring parameters in *parameters*. A few different choosers are available in the refactoring dialog for the value of the parameters:

- *string*: chooser for selecting a text
- +node*: chooser for selecting a node using a filter. The filter is a function with a list of nodes to refactor as a parameter and
  should return a new filtered sequence of nodes.
- *project tree node*: chooser for selecting a node from the project tree


