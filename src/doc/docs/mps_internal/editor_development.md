---
comments: true
tags:
- internals
- ui
alias: editor-dev
---

## Terminology

- *Edited node*: the (root) node of the editor component, or the currently selected node in the editor
- *Cell*: The MPS editor consists of cells that can contain other cells or UI elements like texts or buttons.
- *Root cell*: the top-most cell of the editor component
- *Big cell*: A cell is big if it's the top-most cell in the editor for an associated node. Example: in the plus expression[left + right], the surrounding collection would be the big cell for the plus expression node.

A few terms are also common in typography or are encountered in web development.

- *Padding-left/right/top/bottom* is a floating point number, which specifies the padding of a text cell, that's, how much space is between the cell's text and the cell's left and right sides, respectively.
- *Inset* is the size of the element's borders. It specifies the space that an element must leave at its edges. In some editor cells, it corresponds to the so-called padding of the editor cell.
- The *baseline* is the line upon which most letters sit ([other explanation](https://fonts.google.com/knowledge/glossary/baseline)).
- *Ascent* is the recommended distance above the baseline for a single-spaced text ([other explanation](https://fonts.google.com/knowledge/glossary/ascenders_descenders)).
- *Descent* is the recommended distance below the baseline for a single-spaced text ([other explanation](https://fonts.google.com/knowledge/glossary/ascenders_descenders)).
- A *gap* is a space between cells in a collection. There's a left and right gap. The [punctuation properties](https://www.jetbrains.com/help/mps/editor.html#punctuationproperties.) influence it.

This graphic from [towardsdatascience.com](https://towardsdatascience.com/8-useful-tree-data-structures-worth-knowing-8532c7231e8c)
explains some tree structure terminology:

![tree_structure](https://miro.medium.com/max/975/1*PWJiwTxRdQy8A_Y0hAv5Eg.png)

## EditorComponent

The class EditorComponent implements the MPS editor. A few similar classes/interfaces exist:
[jetbrains.mps.openapi.editor.EditorComponent](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.openapi.editor%28MPS.Editor%2F%29%2F%7EEditorComponent) is the interface that provides the API for interacting with the editor component.
[jetbrains.mps.nodeEditor.EditorComponent](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EEditorComponent) contains the actual implementation. It has some subclasses where only [jetbrains.mps.editor.HeadlessEditorComponent](http://127.0.0.1:63320/node?ref=r%3A2af017c2-293f-4ebb-99f3-81e353b3d6e6%28jetbrains.mps.editor.runtime%29%2F7398401354080376432)
is interesting. Use this editor component in the headless mode. Create instances of this editor component
to render the node tree as a projection-specific text, render the node tree as a picture, and call some editor-specific actions, for example, substitute
and other use cases ([source](http://127.0.0.1:63320/node?ref=r%3A2af017c2-293f-4ebb-99f3-81e353b3d6e6%28jetbrains.mps.editor.runtime%29%2F8425027850913231105)).

When you initialize an editor component, you can provide an [editor configuration](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.configuration%28MPS.Editor%2F%29%2F%7EEditorConfiguration). The property *notifies* informs the editor component to send out
[EditorComponentCreateListener](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.highlighter%28MPS.Editor%2F%29%2F%7EEditorComponentCreateListener) notifications. The property is set to true for MPS IDE editors and the inspector and false for other scenarios. Some languages in {{ mps_extensions() }} need this flag to be true to activate the languages.

The editor component extends [JComponent](https://docs.oracle.com/en/java/javase/11/docs/api/java.desktop/javax/swing/JComponent.html), has [antialiasing enabled](https://github.com/JetBrains/MPS/blob/e5db64ce7b7a419b0ea746dfa0d2f1e7bfabcf72/editor/editor-runtime/source/jetbrains/mps/nodeEditor/EditorComponent.java#L224), and has a left margin of 15 pixels and a top margin of 10 pixels. The gap between the content and the scrollbars is 15 pixels. The editor contains objects of type [EditorCell](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.cells%28MPS.Editor%2F%29%2F%7EEditorCell), arranged in a tree structure. You can right-click in the editor and select *Language Debug* --> *Show Cell in Explorer* to show the currently selected cell in the cell explorer tool. The editor component is responsible for the editor's content and interacts with the type-checking thread, the highlighter (left highlighter column but also the message gutter on the right side).

## Left Highlighter

The left editor highlighter contains the buttons for folding editor cells and other buttons such as *implements interface* and
*overrides method*. Two different ways of adding new information to the highlighter exist:

1. Add a new checker to the highlighter ([example](http://127.0.0.1:63320/node?ref=r%3A59f5b892-a6eb-4a9b-9c81-ecffc10026ee%28jetbrains.mps.ide.highlighters.behavior%29%2F1401464578585771758)). The checker can only contribute an icon and a tooltip to the main column.
2. Add a new column ([example](http://127.0.0.1:63320/node?ref=r%3Af509a650-cbd9-47e7-b2a0-79f49c562c0b%28jetbrains.mps.vcs.annotate%29%2F5393486658546720417)). It's more difficult to implement, but you can fully customize the column.

![left highlighter](images/left_highlighter.png)

### UpdateSession

As the name already implies, the class updates the editor. It registers dependencies between nodes, registers big cells, updates child cells, and can return attributed cells. It also gives access to the EditorCellFactory through *getCellFactory()*. It can be accessed through
*Updater.getCurrentUpdateSession*. Read the [JavaDoc](https://github.com/JetBrains/MPS/blob/master/editor/editor-api/source/jetbrains/mps/openapi/editor/update/UpdateSession.java) to understand
how dependencies in the editor work.

## EditorContext

The editor context provides access to editor-related objects like the editor component, editor component state, selection manager,
context assistant manager, and editor panel manager.

!!! info "The EditorContext gets destroyed when the editor is laid out again and can serve as a key in an editor cache."

- *getRepository()*: returns an object of type [SRepository](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.module%28MPS.OpenAPI%2F%29%2F%7ESRepository)
- *getSelectedNode()*: returns the currently selected node in the editor
- *selectWRTFocusPolicy* sets the focus for a cell or node based on its focus policy defined in the *attracts focus* item in the common
section in the editor's inspector (wrt stands for *with respect to*). 
- *select*: selects the node in the editor
- *getSelectedCell()*: returns the selected cell in the editor component
- *flushEvents()*: processes all pending model events, such as property changes and adding/removing children. This method is called
at the start of the *selectX* methods, and sometimes you have to call it when not all changes to the model are visible.
- *getContextCell()*: returns the cell of *runWithContextCell* or the current select cell
- *getSelectionManager()*: returns the class that's responsible for handling editor selections
- *getEditorPanelManager()*: returns a class that can open MPS editors for nodes through *openEditor(node)*

## EditorCell

An EditorCell is a rectangle that has a position(*x* and *y*) and a dimension (*width* and *height*) that can draw anything in the editor (overwrite *paintContent*).
To request a relayout of the cell, call *requestRelayout* or call *relayout* to laid it out directly. Editor cells support saving additional information (user objects)
by calling the methods *putUserObject(key, value)* and *getUserObject()*. [Cell actions](https://www.jetbrains.com/help/mps/editor.html#cellactions) for action maps.

To manually set the style of a cell, call `cell.getStyle().set(attribute, value)`. Warnings, errors, and other messages are also directly attached to cells.
You can access them through *getMessages*. The resulting list is sorted from less important to the most important messages, so the most important
messages are appended to the end of this list. *getSubstituteInfo* and *setSubstituteInfo* can influence [the substitution of nodes](https://www.jetbrains.com/help/mps/transformation-menu-language.html#substitutemenus). For example, these methods can be useful in tables in {{ mps_extensions() }} where you might want to customize the behavior.

When MPS copies a node to the clipboard, it copies the node itself and a textual representation. The method *renderText()*
is used for the latter case as it renders the cell and its descendants as text.

*getCellContext* and *setReferenceCell* can modify the EditorCellContext. The first method returns non-null values for any big and non-big cells if their parent changes the context (e.g., the parent collection cell pushes down some additional hints).
You can use the CellInfo instance to remember the cell to find it later in (another instance of) the editor.

When you enter text next to a cell (side transformation), the editor adds a new [EditorCell_StHint](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.sidetransform%28MPS.Editor%2F%29%2F%7EEditorCell_STHint). You can access it through
`EditorCell_STHint.getSTHintCell(node, editorComponent`). A [sideTransformInfo](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F779128492853369165) attribute saves
the information about the side and cell id of the hint cell.

### Custom Cells

Extend one of the existing EditorCell implementations like EditorCell_Collection or EditorCell_Constant to use as the basis for the new
cell. Override the *paintContent* method to draw custom stuff in the editor (e.g., [EditorCell_DropDown](http://127.0.0.1:63320/node?ref=r%3A2da81fb8-b6c6-47b8-8c70-4c760b6faf63%28de.itemis.mps.editor.dropdown.runtime%29%2F8584963402264447319) in {{ mps_extensions() }}).
If you need a custom implementation of the *relayout* method, you can override *relayoutImpl* from EditorCell_Basic, for example:

```java
@Override
protected void relayoutImpl() {
myWidth = myImages.getHeight();
myHeight = myImages.getWidth();
}
```

### Manipulation/Traversal

- [CellTraversalUtil](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.openapi.editor.cells%28MPS.Editor%2F%29%2F%7ECellTraversalUtil): navigation of the editor cell tree. The method *iterateTree* returns an iterator that you can use to iterate through a tree.
- [CellFinderUtil](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.cells%28MPS.Editor%2F%29%2F%7ECellFinderUtil)
- [CellFinder](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.messageTargets%28MPS.Editor%2F%29%2F%7ECellFinder)
- [EditorUtil](http://127.0.0.1:63320/node?ref=r%3A2a70cba0-4dc5-4697-986d-5cba44622d22%28de.itemis.mps.editor.diagram.runtime%29%2F1670655850626359511) in {{ mps_extensions() }}.

### Folding

[Code folding](https://www.jetbrains.com/help/mps/working-with-source-code.html#code_folding) mainly affects cells of type
[EditorCell_Collection](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.cells%28MPS.Editor%2F%29%2F%7EEditorCell_Collection). Call `collection.fold()` to fold the collection and `collection.unfold()` to unfold it. The position
of the folded cells will stay the same in the folded state and will be recalculated when the collection is unfolded. When a cell is folded, it's in a collapsed state. To get the folded collection for a child cell, call `CellTraversalUtil.getFoldedParent`. To check if it's folded, call
`CellTraversalUtil.isCellUnderFoldedCollection`.

### CellLayout

The [celllayout language](https://jetbrains.github.io/MPS-extensions/extensions/editor/celllayout/) in {{ mps_extensions() }} has a layout engine and replaces the MPS layout engine when you use styles of the language. If you want to understand the first language, study the [MPS implementations](https://github.com/JetBrains/MPS/tree/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cellLayout) of the
different layouts first. The [MPS documentation](https://www.jetbrains.com/help/mps/editor.html#celllayouts) describes
the different layouts.
What are the advantages of the cell layout language concerning the MPS layouts?

Layouting happens from the root to the leaves. That means children are
asked for their preferred/min/max size, but the parent sets the size and
the child has to fit into that size.

This behavior gives more control over the resulting layout, such as:

- Rich text (or any indent layout) can be wrapped to fit into the size of
  a table column. The indent layout always wraps at the right
  margin line.
- making a horizontal line as wide as the cell above/below or as wide as the page
- Having additional cells on the right of a rich text without them being
  pushed over the right margin (the text wraps earlier).
- In a diagram, the content of a box can fit the size of the box.
  This is especially useful if sub-diagrams exist in the box. In the past,
  this was only possible with some ugly hacks.

You can use a CSS-like box model for setting border sizes and  margins on cells and respecting them in the layout.
MPS allows only borders of size 1 by default.

This framework is compatible with the existing layouts in MPS.
That means implementations for horizontal, vertical,
vertical-grid, and indent layouts exist that support this new architecture. You don't need to change anything.
You can still use the MPS editor language.

You can also have custom layouts based on the default MPS layout
architecture. This framework can handle them in a parent cell
(for example, margin comments) or child cell (e.g., math).

{{ contribution_by('slisson') }}

### EditorCellContext

The editor cell context contains the used [editor hints](https://www.jetbrains.com/help/mps/editor-hints.html) and optional information
about the property edited by the cell. It also contains the node location in the tree. It is used to specify the location for both transformations and substitutions. Usually, the same node is transformed and substituted, but when creating a menu for an empty cell, the transformations are collected for the parent. In contrast, substitutions are collected for the (non-existent) child.

!!! info "The EditorCellContext gets destroyed on the editor relayout but is recreated and can be used as a key in an editor cache."

The class [EditorCellFactory](https://github.com/JetBrains/MPS/blob/master/editor/editor-api/source/jetbrains/mps/openapi/editor/cells/EditorCellFactory.java) is also used to create new editor cells and manipulate the cell context. Read its JavaDoc to understand more about
its methods. To access the EditorCellContext through the EditorContext call

```java
editorContext.getEditorComponent().getUpdater().getCurrentUpdateSession().getCellFactory().getCellContext()
```

## Selection

The [selection manager](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.selection%28MPS.Editor%2F%29%2F%7ESelectionManagerImpl) handles the selection stack. A new selection object is pushed onto the stack when [extending the selection](https://www.jetbrains.com/help/mps/selecting-text-in-the-editor.html#select-text).
When [shrinking the selection](https://www.jetbrains.com/help/mps/selecting-text-in-the-editor.html#select-text), the selection is removed (pop selection)
from the stack. The deepest selection refers to the top of the stack. To get the current selection, call *getSelection*. To unselect everything, call *clearSelection*. A few different *setSelection* methods exist that work with nodes or cells. The [JavaDoc](https://github.com/JetBrains/MPS/blob/master/editor/editor-api/source/jetbrains/mps/openapi/editor/selection/SelectionManager.java) explains them.
A selection contains the following information and methods:

 - The selection info (*getSelectionInfo()*) is persisted and is used to restore the selection when the editor is reopened.
 - Use *canExecuteAction* and *executeAction* to execute an action for the selected cells. The available actions are listed in the enum
[CellActionType](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.openapi.editor.cells%28MPS.Editor%2F%29%2F%7ECellActionType). The different types are implemented as actions in plugin solutions, for example, the action [SelectLocalHome](http://127.0.0.1:63320/node?ref=r%3A9832fb5f-2578-4b58-8014-a5de79da988e%28jetbrains.mps.ide.editor.actions%29%2F7791284463049070003) calls `#!java editorComponent.getSelectionManager().getSelection().executeAction(CellActionType.SELECT_LOCAL_HOME)`.

A few built-in selections exist:

- [EditorCellLabelSelection](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.selection%28MPS.Editor%2F%29%2F%7EEditorCellLabelSelection): a selection for EditorCell_Label cells that supports ranges. A trivial selection in this context is a selection instance where the start equals the end of the selection.
- [EditorCellSelection](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.selection%28MPS.Editor%2F%29%2F%7EEditorCellSelection): a selection of a single editor cell. The selection also selects the caret position.
- [NodeRangeSelection](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.selection%28MPS.Editor%2F%29%2F%7ENodeRangeSelection): a selection from a first node to a second one. 

In {{ mps_extensions() }}, there are some more selections:

- [LinearSelection](http://127.0.0.1:63320/node?ref=r%3A176c6aa3-c2ff-4c24-bd16-d09e7c304982%28de.itemis.mps.selection.runtime.linear%29%2F5751937855976553027): a selection that is used for the mouse selection language 
- [MultilineSelection](http://127.0.0.1:63320/node?ref=r%3Aea46d830-b6c1-459f-bca3-d44c20d00c02%28de.slisson.mps.editor.multiline.cells%29%2F4950521006212361787): a selection used in the multiline language
- [RichtextSelection](http://127.0.0.1:63320/node?ref=r%3A3e994831-9e2b-4a2c-a757-02d48f0caeb5%28de.slisson.mps.richtext.runtime.selection%29%2F2983918873756936849): a selection used in the rich text language
- [TableRangeSelection](http://127.0.0.1:63320/node?ref=r%3A2a738fcb-23b4-4d1d-9f52-870528559e28%28de.slisson.mps.tables.runtime.selection%29%2F8034681417260815117): for table selection from a start column/row to an end column/row.
- [GraphSelection](http://127.0.0.1:63320/node?ref=r%3A7fc96130-6279-4a55-aeeb-422a6879539d%28de.itemis.mps.editor.diagram.runtime.jgraph%29%2F4854440943569238589): a selection used inside diagrams

## Editor Extensions

The editor can be enhanced throw editor extensions. Implement the class [EditorExtensions](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.openapi.editor.extensions%28MPS.Editor%2F%29%2F%7EEditorExtension)
and register it through a project plugin. An example of the mouse listener plugin:

```Java
project plugin MouseListenerPlugin {
    private final EditorExtension selectionListener = new EditorExtension() {

        @Override
        public boolean isApplicable(@NotNull() EditorComponent p0) {
            true;
        }

        @Override
        public void install(@NotNull() EditorComponent editorComponent) {
            DragSelectionMouseListener.getOrCreateInstance(((EditorComponent) editorComponent)).install();
        }

        @Override
        public void uninstall(@NotNull() EditorComponent editorComponent) {
            DragSelectionMouseListener.getInstance(((EditorComponent) editorComponent)).?uninstall();
        }
    };

    init(project)->void {
        EditorExtension extension = this.selectionListener;
        ProjectHelper.toIdeaProject(project).?getComponent(EditorExtensionRegistry.class).?registerExtension(extension);
    }

    dispose(project)->void {
        DragSelectionMouseListener.uninstallAll();
        EditorExtension extension = this.selectionListener;
        ProjectHelper.toIdeaProject(project).?getComponent(EditorExtensionRegistry.class).?unregisterExtension(extension);
    }
}
```

In this example, a new mouse and mouse motion listener are registered/unregistered:

```java
public void install() { 
  getEditorComponent().addMouseListener(this); 
  getEditorComponent().addMouseMotionListener(this); 
} 
 
public void uninstall() { 
  getEditorComponent().removeMouseListener(this); 
  getEditorComponent().removeMouseMotionListener(this); 
  instances.removeKey(getEditorComponent()); 
}
```

### Caching

When possible, try to cache objects/calculations. The editor component, a node, or EditorCellContext can be used, for example, as the keys in a map that represents the cache. You can use a weak hash map
as the backing data structure ([Guide to WeakHashMap in Java](https://www.baeldung.com/java-weakhashmap)): `#!java
map<EditorComponent, YourListener> instances = new weakHashMap<EditorComponent, YourListener>;` To let the garbage collector
delete a referenced editor component in the listener when it is not needed anymore, and store it in a weak reference: `#!java myEditorComponent = new WeakReference<EditorComponent>(editorComponent)`

### Disposing of Resources

Register a dispose-listener for the editor component and execute your *uninstall* method in the body:

```java
editorComponent.addDisposeListener(new EditorComponent.EditorDisposeListener() {
    public void editorWillBeDisposed(EditorComponent editorComponent) {
        editorComponent.removeDisposeListener(this);
        uninstall();
    }
})
```

Make sure to also call it in the *dispose* method of your application/project plugin. Failing to dispose of the allocated resources can 
lead to class reloading issues and memory leaks.

## Painting

[EditorCell_Basic](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.cells%28MPS.Editor%2F%29%2F%7EEditorCell_Basic) overwrites *paintComponent* and calls *paintCell* to paint the cell itself + *paintDecorations* to draw
borders and messages in the editor. *paintCell* fills the background of the cell and paints the selection if necessary.
Afterward, the method *paintContent* is called, which is the method that gets overridden most of the time. All the *paintX*
methods have a [Graphics](https://docs.oracle.com/javase/7/docs/api/java/awt/Graphics.html) object that can be cast to a [Graphics2D](https://docs.oracle.com/javase/7/docs/api/java/awt/Graphics2D.html) object if necessary. The old documentation at Oracle is still a good starting point
to learn more about [2d Graphics in Java](https://docs.oracle.com/javase/tutorial/2d/index.html). To find examples in MPS,
search for global usages of the [Graphics](http://127.0.0.1:63320/node?ref=6354ebe7-c22a-4a0f-ac54-50b52ab9b065%2Fjava%3Ajava.awt%28JDK%2F%29%2F%7EGraphics) class.

Editor components support additional painting through the methods *addAdditionalPainter* and *removeAdditionalPainter*. They
allow registering/unregistering objects of the class [AdditionalPainter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EAdditionalPainter).
The highlighting of the currently selected line and red highlighting of the breakpoint line is implemented that way.

## Additional Reference

- [Editor language generation API](https://www.jetbrains.com/help/mps/editor-language-generation-api.html)