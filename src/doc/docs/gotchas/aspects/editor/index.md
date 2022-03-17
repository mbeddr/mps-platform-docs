!!! hint "I need feature X for the editor."

    Have a look at the [full extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/#editor) of [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I need hyperlinks."

    Use `com.mbeddr.mpsutil.hyperlink` from [mbeddr platform](http://mbeddr.com/platform.html).

!!! question "How do I create clickable links?"
    - Specific Languages Blog &mdash; [Creating clickable URL links in the editor](https://specificlanguages.com/posts/basic-editors/clickable-url-links/){target=_blank}
    - Specific Languages Blog &mdash; [More clickable URL links](https://specificlanguages.com/posts/basic-editors/more-clickable-url-links/){target=_blank}

!!! question "Is it possible to access the selected value of one swing component from inside another swing component?"

    Yes it is. More info in [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360007728759/comments/360001510479).

!!! warning "Highlighting of constraint errors in inspector doesn't work."

    Known bug ([ticket](https://youtrack.jetbrains.com/issue/MPS-32350)). Pressing F5 helps.

!!! hint  "I need to delete non-existing children, references or properties from a node."

    Switch to the [reflective editor](https://www.jetbrains.com/help/mps/finding-your-way-out.html#reflectiveeditor) and remove the offending parts. There is also an enhancement script that can remove properties.

!!! question  "I want to include non child relations in Editor."
    Use `com.mbeddr.mpsutil.editor.querylist` from [mbeddr platform](http://mbeddr.com/platform.html).

!!! hint "I want to open the inspector programmatically."

    Call `editorContext.openInspector()`.
    - Specific Languages Blog &mdash; [Opening Inspector automatically](https://specificlanguages.com/posts/2022-03/01-opening-inspector-automatically/){target=_blank}
    - Specific Languages Blog &mdash; [Opening Inspector automatically: Selection listeners](https://specificlanguages.com/posts/2022-03/02-opening-inspector-automatically-selection-listeners/){target=_blank}
    - Specific Languages Blog &mdash; [Opening Inspector automatically: Editor extensions](https://specificlanguages.com/posts/2022-03/03-opening-inspector-automatically-editor-extensions/){target=_blank}

!!! hint "I want to open the editor for a node programmatically."

    Call `NavigationSupport.getInstance().openNode()`.

!!! hint "I want to set editor hints programmatically."

    Call `editorContext.getEditorComponent().getUpdater().addExplicitEditorHintsForNode()`.

!!! question "Is there a disadvantage by using the indent layout instead of the indent cell mode?"

    No. There used to be performance issues with bigger models that were fixed in [MPS 2021.1](https://blog.jetbrains.com/mps/2021/05/mps-2021-1-has-been-released/).

!!! question "How to find out where a substitute menu entry is coming from?"

    Use the Menu Trace Tool Window. More information can be found in the [official documentation](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html).

!!! hint "I want to override an arbitrary editor."

    Use the language `de.slisson.mps.conditionalEditor` from mps-extensions.

!!! hint "I want to get the font of an editor."

    Use `jetbrains.mps.nodeEditor.EditorSettings#getDefaultEditorFont()`

!!! hint "I want to subscribe to editor changes."

    Check out [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009846039/comments/360002369420).

!!! hint "I need to get the text of an EditorCell programmatically."

    Call `EditorCell.renderText().getText()`.

!!! question "How can find out if an editor cell is readonly?"

    Execute `ReadOnlyUtil.isCellsReadOnlyInEditor(this.editorComponent, new singleton<EditorCell>(editorCell))`.

!!! question "How do I get an editor for a node as a swing component?"

    ```
    HeadlessEditorComponent component = new HeadlessEditorComponent(#project.getRepository()); 
    component.editNode(node);
    return component;
    ```

!!! question "How to I get the selection/ selected node in the editor."

    Call `editorComponent.getSelectionManager().getSelection() / editorContext.getSelectedNode()`.

!!! question "How do I use empty text for empty cells?"
    Specific Languages Blog &mdash; [Use empty text for empty cells](https://specificlanguages.com/posts/basic-editors/use-empty-text-for-empty-cells/){target=_blank}

!!! question "How to get the current MPS project from within the editor?"
    Specific Languages Blog &mdash; [How to get the current MPS project from within the editor](https://specificlanguages.com/posts/how-to-get-current-project-from-editor/){target=_blank}

!!! question "How do I find all open editors?"
    Specific Languages Blog &mdash; [Finding all open editors](https://specificlanguages.com/posts/2022-03/10-finding-all-open-editors/){target=_blank}

!!! warning "The property value is invalid."
    Specific Languages Blog &mdash; [Invalid property values](https://specificlanguages.com/posts/2022-02/22-invalid-property-values/){target=_blank}

!!! question "What happens when I press F5 in the editor?"
    Specific Languages Blog &mdash; [F5 in editor](https://specificlanguages.com/posts/2022-03/09-f5-in-editor/){target=_blank}

[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)