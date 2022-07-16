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

    Known bug (MPS-32350. Pressing ++f5++ helps.

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

??? question "What is the best way to improve the autocomplete description of concepts?"

    > As you can see in the screenshot, the concepts of both opening braces are indistinguishable.

    > ![autocompletion myUnion](autocompletion_myUnion.png)

    > By changing the short description in the concept structure, I can change the description.

    > 1. What's the best format to improve these descriptions?
    > 2. And is this way the correct/best one to change the autocomplete concept description?

    > ![concept BracketInitializer](bracketInitializer_concept.png)

    > ![autocompletion int16](autocompletion_int16.png)

    {{ question_by('aquapp') }}

    In general, it's up to the users and specific context to decide there what makes sense to put to the description text. Usually it should provide additional semantic information to those not familiar with the language to help them to pick up right concept from the code completion menu.

    Short description in the concept is the original, simple way to provide static description in the code completion menu. You can also add your own substitute action in the substitute menu of the concept (Editor aspect) to get the full control over the code completion menu and be able to generate the text dynamically based on the context.
    
    ![DataItem SubstituteMenu](DataItem_substituteMenu.png){width="800px"}
    
    ![data autocompletion](data_autocompletion.png){width="800px"}

    {{ answer_by('wsafonov') }}

??? question "How do I set the cursor to the first editable cell?"

    > ![editable cell and error_cell](editable_cell_error_cell.png)

    > - (A) What it looks like after creation
    > - (B) Initial situation with cursor at (1): pressing "Enter" leads to (C)

    > The problem is, that in (C) the cursor is at (2), right before a read-only cell and thus editing or moving to the next cell is not possible. I would like to have, that the cursor jumps to the first editable cell, which is at position (3)
    
    > Structure of the new node in (C):

    > ![concept:compoundInitializerMember](compoundInitializerMember_concept.png)

    > Editor of the new node in (C):

    >  ![example c:node editor](example_c_node_editor.png)

    Usually, you would set the "attracts focus" property of the cell, where the cursor should be positioned, to "attractsFocus" or "FirstEditableCell".
    But, since (C.2 and C.3) are error-cells, the default behaviour is to set the cursor in front of the first error cell, which is (C.2).
    
    Therefore, change the first part of your editor to a querylist cell (A), which references the "member" in the cell properties (B) and set the read-only property on the querylist.

    ![new editor for CompoundInitializerMember](CompoundInitializerMember_editor_new.png)

    {{ contribution_by('aquapp') }}

!!! question "How do I programmatically collapse editor cells?"

    Call `#!java EditorCell_Collection.fold()/unfold()`. You can check if is foldable by calling `#!java EditorCell_Collection.isFoldable()`.

!!! question "How can I can hide ("show if") a custom cell in the editor?"

    > Custom cells expect only a cell provider in the inspector, but don't offer the possibility to specify other attributes to set e.g. "show if". How can I hide a custom cell under a specific condition? (MPS-33195)

    The meta model actually allows to specify the “show if” (and other attributes) on a custom cell and the generator will generate the correct code for it. It is just not included in the editor for the inspector. You can use the reflective editor to specify the condition.

    Since these attributes are "totally hidden" and you need this knowledge to find them, the alternative for a better visibility is to surround the custom cell with a collection and set the "show if" on the collection.

    {{ contribution_by('aquapp') }}

!!! question "Is there a callback/hook when an editor tab is closed?"

    > When closing an editor tab, MPS removes the highlighting from all nodes in the editor. I.e., when an editor is opened again for the same root node all highlighting is gone.
    
    > In my code, I want to react on this editor-close event. Is there are way to implement a callback or hook which is called when an editor tab is closed?

    You can register an EditorComponentCreateListener, that also receives an editorComponentDisposed event ([example](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/ide/bookmark/BookmarksUIComponent.java#L71-L84)).

!!! question "Where can I find all key mappings for the editor?"

    Windows and mac shortcuts for editor actions can be found in [MPSEditorActions.xml](https://github.com/JetBrains/MPS/blob/master/workbench/mps-editor/source_gen/jetbrains/mps/ide/editor/actions/MPSEditorActions.xml).


!!! question "How can I access an icon stored in a concept?"

    Create a new EditorCell for it: 
    ```java
    EditorCell_Image.createImageCell(context, node, {
        EditorContext context, SNode node => GlobalIconManager.getInstance().getIconFor(concept); 
    })
    ```

[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)