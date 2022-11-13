## Actions

### Build assistant

> ^^com.mbeddr.mpsutil.buildassistant^^

This language adds actions to make or rebuild models/modules or projects and also include their
dependencies.

!!! question "TODO: Do the official actions already provide this capability?"

### Generic actions

> ^^com.mbeddr.mpsutil.genericactions^^

As the name already implies, this language adds some new generic actions:

- **Decrease MPS Editor Font Size**: decreases the font size in the editor settings and updates all editors (ctrl + -)
- **Increase MPS Editor Font Size**: increases the font size in the editor settings and updates all editors (ctrl + +)
- **Reset MPS Editor Font Size**:: reset the font size to the default size (ctrl + 0, 13 pixels)
- **File Manager in Output Folder**: a new action in the context menu of models that opens the path of the generated files.
  This action won't work if the model doesn't generate output files.
- **File Manager in Module Folder**: a new action in the context menu of modules that opens the path of th module.

### Node access

> ^^com.mbeddr.mpsutil.nodeaccess^^

This language adds a new group of actions called *Copy/Paste Special* to the editor popup that opens when right-clicking
in the editor:

- **Copy Node as XML**: serialize the selected node to XML and copy it to the system clipboard.
- **Paste XML Node**: deserialize a previously copied node and insert it next to the current selected node.
- **Copy Node Info to Clipboard**: copies some information (project, module, model, node, URL) about a node to the system
  clipboard.

### Print

> ^^com.mbeddr.mpsutil.print.pluginSolution^^

This language adds a new action to the general MPS *File* menu. The action *Print Editor* can be used to print the current
editor with a printer. If the operating system permits it, this action can also be used to create a PDF from the editor.

### Refactoring

> ^^com.mbeddr.mpsutil.refactoring^^

This language adds support for a projection mode switcher and refactoring actions.

#### Projection mode switcher

The mbeddr platform has a group *Projection* which is a top-level menu in MPS:

![projection menu](projection_menu.png)

A projection mode switcher can be declared containing push hint options where the hints are referenced from an existing ConceptEditor context hints container. The action
can be added in the *Add to Menu/Button Group* section editor.

This adds a toggle to this menu/button group that toggles the referenced editor hint in the editors. When it should only
be enabled for a specific concept, add a concept to *only in editor with instance of*.

![example: projection mode switcher](projection_mode_switcher_example.png)

#### Refactoring action

The concept [RefactoringAction](http://127.0.0.1:63320/node?ref=1fc20ffe-f35b-4791-a0b7-d706bad5c49a%2Fr%3A18d75373-a465-46d0-9749-aacc22a947bc%28com.mbeddr.mpsutil.refactoring%2Fcom.mbeddr.mpsutil.refactoring.structure%29%2F7518061998923573137) can create an action for a [simple refactoring](https://www.jetbrains.com/help/mps/mps-refactoring.html). The title of the action can be specified with *caption,* and the keyboard shortcut can
be defined in *shortcut*. Refactoring parameters can be specified in *parameters*. There are a few different choosers which will be shown in
the refactoring dialog for the value of the parameters:

- *string*: chooser for selecting a text
- +node*: chooser for selecting a node using a filter. The filter is a function which has a list of nodes to refactor as a parameter and
  should return a new filtered sequence of nodes.
- *project tree node*: chooser for selecting a node from the project tree


