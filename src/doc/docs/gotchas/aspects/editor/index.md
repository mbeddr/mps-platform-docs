!!! hint "I need feature X for the editor."

    Have a look at the [full extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/#editor) of mps-extensions.

!!! hint "I need hyperlinks."

    Use com.mbeddr.mpsutil.hyperlink.

!!! question "Is it possible to access the selected value of one swing component from inside another swing component?"

    Yes it is. More info in [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360007728759/comments/360001510479).

!!! warning "The editor shows type system errors in the inspector that shouldn't be there anymore."

    Known bug. Pressing F5 helps.

!!! hint  "I need to delete non existing children, references or properties from a node."

    Switch to the reflective editor and remove the offending parts. There is also an enhancement script that can remove properties.

!!! question  "I want to include non child relations in Editor."
    Use querylist from mbeddr.platform.

!!! hint "I want to open the inspector."

    Call `editorContext.openInspector()`.

!!! hint "I want to open the editor for a node."

    Call `NavigationSupport.getInstance().openNode()`.

!!! hint "I want to set editor hints."

    Call `editorContext.getEditorComponent().getUpdater().addExplicitEditorHintsForNode()`.

!!! question "Is there a disadvantage by using the indent layout instead of the indent cell mode?"

    No. There used to be performance issues with bigger models that were fixed in MPS 2021.1

!!! question "How to find out where a substitute menu entry is coming from?"

    Use the Menu Trace Tool Window. More information can be found in the [official documentation](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html).

!!! hint "I want to override an arbitrary editor."

    Use the language `de.slisson.mps.conditionalEditor` from mps-extensions.

!!! hint "I want to get the font of editor."
Use `jetbrains.mps.nodeEditor.EditorSettings#getDefaultEditorFont()`

!!! hint "I want to subscribe to editor changes."
Check out [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009846039/comments/360002369420).

!!! hint "I need to get the text of an EditorCell."

    Call `EditorCell.renderText().getText()`.

[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)