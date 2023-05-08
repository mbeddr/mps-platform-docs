---
title: Editor aspect
tags:
- aspect
---

# Editor aspect

The editor aspect defines the projectional editor of a concept.

- [official documentation](https://www.jetbrains.com/help/mps/editor.html)
- [old cheatsheet](http://dsl-course.org/jetbrains-mps-editor-aspect/)

## General

!!! question "What happens when you press ++f5++ in the editor?"

    {{ blog('sl',false) }}[F5 in editor](https://specificlanguages.com/posts/2022-03/09-f5-in-editor/)

!!! question "How can you delete non-existing children, references, or properties from a node?"

    Switch to the [reflective editor](https://www.jetbrains.com/help/mps/finding-your-way-out.html#reflectiveeditor) and remove the offending parts. There is also an [enhancement script](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590291%28jetbrains.mps.lang.structure.scripts%29%2F6066872190921237633) that can remove properties.

!!! question "Is there a way to prevent users from adding and removing elements in a list in the MPS editor? The elements in the list should still be editable, but adding/removing shouldn't be allowed?"

    There are 2 solutions:

    1. Use a querylist with empty insert/delete handlers.
    2. Create an action map/inline action cell with empty blocks for the actions `INSERT` and `INSERT_BEFORE`.

!!! warning "I've set a color of type java.awt.Color in a style property query but the color is different when using the darcula theme."

    The return type of those functions indicate that they return type is `java.awt.Color` but the generator maps these colors to [theme-dependent colors](https://github.com/JetBrains/MPS/blob/a7983f504496b4425057efd51d22ee099d76c311/workbench/mps-editor/source/jetbrains/mps/ide/editor/StyleRegistryIdeaImpl.java#L202). The only avoid to avoid this mappings is to use custom factories. More info about theme-dependent colors can be found [here](../../patterns/user_experience#dark-theme).

!!! question "What is the difference between an empty cell and a simple constant cell without any content?"

    Both cell work with an internal text line, but the `constant cell` supports more styling for the text line. This also results in different-looking cursors, I believe.
    
    `constant cell` supports the cell actions `LEFT, RIGHT, LOCAL`*`HOME/END,SELECT`*`RIGHT/LEFT, SELECT`*`LOCAL`*`HOME/END, COPY, PASTE, CUT` and `CLEAR_SELECTION` which it inherits from the internal label cell class. It has methods to validate the text (well, the only correct text is the specified text in the editor) and to synchronize the cell with the model (that means going back to the original text after editing the text).
    
    `empty cell` inherits from the internal basic cell which supports only left and right transformations (`LEFT_TRANSFORM`, `RIGHT_TRANSFORM`). It also doesn't support the `editable` style sheet item which means no support for editing the text.
    
    In a nutshell, `empty cell` is a very stripped-down version of a `constant cell` and also has a somewhat different implementation because of the different base class.

## Menus

!!! hint "Explain the different menu related terms."

    - **Menu definitions** have two flavours *named* and +default+ and can be defined in transformation or substitute menus.
    - **Default menu**
        - **Default substitutions** will replace the default menu that MPS shows.

            Shortcut: ++ctrl+space++ or ++cmd+space++
        - **Transformation menus**
            define UI actions that will be shown in various locations. The menu is defined as a list of sections.
            Each section contains a list of menu parts for a set of locations. 
            At runtime the menu parts and locations are used to generate the content of the completion menu.
            The contents of the completion menu are called menu items.
        - **Parameterized actions**
            allow to calculate a list of elements of a specific type to be shown in the completion menu.
            They calculate all elements for the substitution menu and have an influence on the node creation.
            Moreover, they definesthe selection where the cursor should be placed.

!!! question "How do you find out where a substitute menu entry is coming from?"

    Use the *Menu Trace Tool* window. More information can be found in [Menu Trace Tool Window | MPS](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html).

!!! question "How can you add smart references using the transformation menus?"

    F1RE Blog: [Adding smart references using transformation menus](https://www.f1re.io/transformation-menu-for-smart-references)

??? question "What's the best way to improve the autocomplete description of concepts?"

    > As you can see in the screenshot, the concepts of both opening braces are indistinguishable.

    > ![autocompletion myUnion](autocompletion_myUnion.png)

    > By changing the short description in the concept structure, I can change the description.

    > 1. What's the best format to improve these descriptions?
    > 2. Is this way the correct/best one to change the autocomplete concept description?

    > ![concept BracketInitializer](bracketInitializer_concept.png)

    > ![autocompletion int16](autocompletion_int16.png)

    {{ question_by('AlexeiQ') }}

    In general, it's up to the users and specific context to decide what makes sense to put to the description text. Usually it should provide additional semantic information to those not familiar with the language to help them to pick up the right concept from the code completion menu.

    The short description in the concept is the original, simple way to provide static description in the code completion menu. You can also add your own substitute action in the substitute menu of the concept (editor aspect) to get full control over the code completion menu and to be able to generate the text dynamically based on the context.
    
    ![DataItem SubstituteMenu](DataItem_substituteMenu.png){width="800px"}
    
    ![data autocompletion](data_autocompletion.png){width="800px"}

    {{ answer_by('wsafonov') }}

## Languages

!!! hint "I need a specific graphical notation/feature for the editor."

    Have a look at the [full extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/#editor) from {{ mps_extensions() }}.

!!! hint "I need hyperlinks."

    Use the language ^^com.mbeddr.mpsutil.hyperlink^^ from {{ mbeddr_platform() }}.

!!! question "How do you create clickable links?"

    - {{ blog('sl',false) }}[Creating clickable URL links in the editor](https://specificlanguages.com/posts/basic-editors/clickable-url-links/)
    - {{ blog('sl',false) }}[More clickable URL links](https://specificlanguages.com/posts/basic-editors/more-clickable-url-links/)

!!! question "How can you include non-child relations in the editor?."

    Use the language ^^com.mbeddr.mpsutil.editor.querylist^^ from {{ mps_extensions() }}.

## Editor declaration

!!! question "Is there a disadvantage by using the indent layout instead of the indent cell mode?"

    No. There used to be performance issues with bigger models that were fixed in [MPS 2021.1](https://blog.jetbrains.com/mps/2021/05/mps-2021-1-has-been-released/).

!!! question "How do you use an empty text for empty cells?"

    {{ blog('sl',false) }}[Use empty text for empty cells](https://specificlanguages.com/posts/basic-editors/use-empty-text-for-empty-cells/)


!!! hint "How can you set editor hints?"

    - you can set hints via `#!java editorContext.getEditorComponent().getUpdater()`
        - explicit hints for nodes
        - initial hints globally; they behave similar to pushed hints.
    - via right-click: push editor hints and select a specific one.

    - via an {{ mps_url("@mpsutil.EditorHintToggleAction") }} (e.g. in action declarations)
        - They are not visible in the push Editor hints menu.
        - If you need the same behavior e.g. in intentions, you can use code from there (via [ConceptEditorHintSettingsComponent.HintsState](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.hintsSettings%28MPS.Editor%2F%29%2F%7EConceptEditorHintSettingsComponent))
    - Explicit hints for nodes and hints via {{ mps_url("@mpsutil.EditorHintToggleAction") }}.
      The usage of [ConceptEditorHintSettingsComponent.HintsState](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.hintsSettings%28MPS.Editor%2F%29%2F%7EConceptEditorHintSettingsComponent%24HintsState) is not so obvious.


??? question "How do you set the cursor to the first editable cell?"

    > ![editable cell and error_cell](editable_cell_error_cell.png)

    > - **(A)** What it looks like after creation
    > - **(B)** Initial situation with cursor at **(1)**: pressing ++enter++ leads to **(C)**

    > The problem is, that in **(C)** the cursor is at **(2)**, right before a read-only cell and thus editing or moving to the next cell is not possible. I would like the cursor to jump to the first editable cell, which is at position **(3)**.
    
    > Structure of the new node in **(C)**:

    ```kroki-plantuml
    hide empty members
    
    class CompountInitializerMember {
    ..<color:blue>children</color>..
    <color:purple>expr</color>: Expression[1]
    ..<color:blue>references</color>..
    <color:purple>member</color>: Member[1]
    }
    @enduml
    ```

    > Editor of the new node in **(C)**:

    >  ![example c:node editor](example_c_node_editor.png)

    Usually, you would set the *attracts focus* property of the cell, where the cursor should be positioned, to `attractsFocus` or `FirstEditableCell`.
    But, since (**C.2** and **C.3**) are error cells, the default behaviour is to set the cursor in front of the first error cell, which is **(C.2)**.
    
    Therefore, change the first part of your editor to a querylist cell **(A)**, which references the "member" in the cell properties **(B)** and set the read-only property on the querylist.

    ![new editor for CompoundInitializerMember](CompoundInitializerMember_editor_new.png)

    {{ contribution_by('AlexeiQ') }}


!!! question "Is it possible to access the selected value of one swing component from inside another swing component?"

    Yes: [Is it possible to access the selected value of one swing component from inside another swing component? | MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/posts/360007728759/comments/360001510479)

!!! question "How can you access an icon stored in a concept?"

    Create a new *custom cell*: 

    ```java
    new AbstractCellProvider() {
        @Override
        public EditorCell createEditorCell(EditorContext p1) {
                EditorCell_Image.createImageCell(context, node, {
                    EditorContext context, SNode node => GlobalIconManager.getInstance().getIconFor(concept); 
                });
        }
    };
    ```

!!! question "How can you paint the background of certain editor cells with a different color based on analysis of the model?"

    - with the help of a conditional editor
    - by using the class `NodeHighlightManager`:

    ```java
    NodeHighlightManager highlightManager = this.editorComponent.getHighlightManager(); 
    EditorMessageOwner messageOwner = this.editorComponent.getHighlightMessagesOwner();
    (...)
    highlightManager.mark(((SNode) ref), HighlightConstants.INSTANCES_COLOR, "usage", messageOwner);
    ```

    The second approach has a better performance, because the highlighter runs asynchronously and not during the editor rebuild.

!!! question "How can you hide a custom cell in the editor? (*show if* property)"

    > Custom cells expect only a cell provider in the inspector, but don't offer the possibility to specify other attributes to set e.g. "show if". How can I hide a custom cell under a specific condition? (MPS-33195)

    The meta model actually allows to specify the *show if* property and other attributes on a custom cell and the generator will generate the correct code for it. It is just not included in the editor for the inspector. You can use the reflective editor to specify the condition.

    Since these attributes are hidden and you need this knowledge to find them, the alternative for a better visibility is to surround the custom cell with a collection and set the *show if* property on the collection.

    {{ contribution_by('AlexeiQ') }}

!!! question "How to you split child collections?"

    [Advanced editors: splitting child collection in editor](https://specificlanguages.com/posts/advanced-editors/splitting-child-collection-in-editor/){{ blog('sl') }}

## Inspector

- [Move rarely needed information to the Inspector](https://specificlanguages.com/posts/2022-02/10-move-rarely-needed-information-to-inspector/){{ blog('sl') }}

!!! question "How can you open the inspector programmatically?"
    ```java
    editorContext.openInspector()
    ```

    - {{ blog('sl',false) }}[Opening Inspector automatically](https://specificlanguages.com/posts/2022-03/01-opening-inspector-automatically/)
    - {{ blog('sl',false) }}[Opening Inspector automatically: Selection listeners](https://specificlanguages.com/posts/2022-03/02-opening-inspector-automatically-selection-listeners/)
    - {{ blog('sl',false) }}[Opening Inspector automatically: Editor extensions](https://specificlanguages.com/posts/2022-03/03-opening-inspector-automatically-editor-extensions/)

!!! question "How can you focus on a node in the inspector?"

    - [Focusing on a node in the inspector](https://specificlanguages.com/posts/2022-04/01-focusing-on-a-node-in-the-inspector/){{ blog('sl') }}

!!! warning "Highlighting of constraint errors in inspector doesn't work."

    Known bug (MPS-32350). Pressing ++f5++ helps.


## Open API

!!! question "How can you open the editor for a node programmatically?"

    ```java
    NavigationSupport.getInstance().openNode()
    ```

!!! question "How can you override an arbitrary editor?"

    Use the language ^^de.slisson.mps.conditionalEditor^^ from {{ mps_extensions() }}.

!!! question "How can you get the font of an editor?"

    ```java
    jetbrains.mps.nodeEditor.EditorSettings#getDefaultEditorFont()
    ```

!!! question "How can you subscribe to editor changes?"

    - [Add a tool that subscribes to editor changes | MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009846039/comments/360002369420).

!!! question "How do you get the text of an EditorCell programmatically?"

    ```java
    EditorCell.renderText().getText()
    ```

!!! question "How can you find out if an editor cell is readonly?"

    ```java
    ReadOnlyUtil.isCellsReadOnlyInEditor(this.editorComponent, new singleton<EditorCell>(editorCell))
    ```

!!! question "How do you get an editor for a node as a swing component?"

    ```java
    HeadlessEditorComponent component = new HeadlessEditorComponent(#project.getRepository()); 
    component.editNode(node);
    return component;
    ```

!!! question "How do you get a *Project* instance for an *ActionEvent*?"

    ```java
    button.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
        Project mpsProject = UiUtils.getMpsProjectFromActionEvent(e);
        }
    }
    ```


!!! question "How to you get the selection/ selected node in the editor?"

    ```java
    editorComponent.getSelectionManager().getSelection() / editorContext.getSelectedNode()
    ```

!!! question "How can you select a node in the editor?"

    ```java
    editorContext.getSelectionManager().setSelection/pushSelection
    // or
    editorContext.getNodeEditorComponent().selectNode()
    ```

!!! question "How to get the current MPS project from within the editor?"

    Specific Languages Blog: [How to get the current MPS project from within the editor](https://specificlanguages.com/posts/how-to-get-current-project-from-editor/)

!!! question "How do you find all open editors?"

    {{ blog('sl',false) }}[Finding all open editors](https://specificlanguages.com/posts/2022-03/10-finding-all-open-editors/)

!!! question "How do you programmatically collapse editor cells?"

    ```java
     EditorCell_Collection.fold()/unfold()

    // You can check if is foldable by calling:
    EditorCell_Collection.isFoldable()
    ```

!!! question "Is there a callback/hook when an editor tab closes?"

    > When closing an editor tab, MPS removes the highlighting from all nodes in the editor. I.e., when an editor is opened again for the same root node all highlighting is gone.
    
    > In my code, I want to react on this editor-close event. Is there are way to implement a callback or hook which is called when an editor tab is closed?

    You can register an [EditorComponentCreateListener](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.highlighter%28MPS.Editor%2F%29%2F%7EEditorComponentCreateListener), that also receives an editorComponentDisposed event ([example](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/ide/bookmark/BookmarksUIComponent.java#L71-L84)).

!!! question "Is there a utility class related to editor hints?"

    Yes, there is in {{ mbeddr() }}: {{ mps_url("@mbeddr.EditorHintHelper") }}.

[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)