!!! hint "I need feature X for the editor."

    Have a look at the [full extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/#editor) of [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I need hyperlinks."

    Use `com.mbeddr.mpsutil.hyperlink` from [mbeddr platform](http://mbeddr.com/platform.html).

!!! question "How do I create clickable links?"
    - Specific Languages Blog &mdash; [Creating clickable URL links in the editor](https://specificlanguages.com/posts/basic-editors/clickable-url-links/){target=_blank}
    - Specific Languages Blog &mdash; [More clickable URL links](https://specificlanguages.com/posts/basic-editors/more-clickable-url-links/){target=_blank}

!!! question "Is it possible to access the selected value of one swing component from inside another swing component?"

    Yes it is. More info in [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360007728759/comments/360001510479).

!!! hint "Explain the different menu related terms."

    - Menu definitions
        - have two "flavours" named and default
        - can be defined in transformation or substitute menus
    - Default menu
        - Default substitution: will replace the default menu that MPS shows ++ctrl+space++ or ++cmd+space++
        - Transformation menu: Define UI actions that will be shown in various locations
            - In implementation the menu is defined as a list of sections.
            - Each section contains a list of menu parts for a set of locations.
            - At runtime the menu parts and locations are used to generate the content of the completion menu.
            - The content of completion menu is called menu items.
        - Parameterized action: allows to calculate a list of elements of a specific type to be shown  in the completion menu
            - calculates all elements for the substitution menu
            - has influence on the node creation
            - defines the selection where the cursor should be placed
        
!!! warning "Highlighting of constraint errors in inspector doesn't work."

    Known bug ([MPS-32350](https://youtrack.jetbrains.com/issue/MPS-32350)). Pressing ++f5++ helps.

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

!!! hint "How can I set editor hints?"

    - push editor hint vs. EditorHintToggleAction and vs. initial editor hints
        - you can set hints via editorContext.getEditorComponent().getUpdater()
            - explicit hints for nodes
            - initial hints globally ( --> behaves similar to "pushed" hints)
        - via Right Click --> push Editor Hints and select a specific one.
        - via an [com.mbeddr.mpsutil.refactoring.rt.util.EditorHintToggleAction](http://127.0.0.1:63320/node?ref=8f16104e-22e6-406d-8251-ef9688474557%2Fr%3Aab202a93-2128-4d4d-ab72-2fb787f2aec3%28com.mbeddr.mpsutil.refactoring.rt%2Fcom.mbeddr.mpsutil.refactoring.rt.util%29%2F4189697348346196613) (e.g. in action declarations)
            - They are not visible in the push Editor hints menu.
            - If you need the same behavior e.g. in intentions, you can use code from there (via [ConceptEditorHintSettingsComponent.HintsState](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.hintsSettings%28MPS.Editor%2F%29%2F%7EConceptEditorHintSettingsComponent))
        - Explicit hints for nodes and hints via “EditorHintToggleAction”/ ”ConceptEditorHintSettingsComponent.HintsState” are not obvious

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

!!! question "How do I get a Project instance for an ActionEvent?"
    ```
    button.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
        Project mpsProject = UiUtils.getMpsProjectFromActionEvent(e);
        }
    }
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

!!! question "What happens when I press ++f5++ in the editor?"
    Specific Languages Blog &mdash; [++f5++ in editor](https://specificlanguages.com/posts/2022-03/09-f5-in-editor/){target=_blank}

!!! info "Explain all cell related variables."

    A cell takes up a specific amount of space in the editor component(width and height).
    
    - padding-left/right/top/bottom  - a floating point number, which specifies the padding of a text cell, i.e. how much space will be between cell's text and cell's left and right sides, respectively.
    - inset = representation of the borders of an element. It specifies the space that an element must leave at each of its edges.
    - baseline = the line upon which most letters sit 
    - ascent = The recommended distance above the baseline for singled spaced text.
    - descent = The recommended distance below the baseline for singled spaced text.
    - height = ascent + descent
    - gap = space between cells in a collection. There is a left and right gap.
[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)