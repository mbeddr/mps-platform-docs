---
title: Editor Aspect
tags:
- aspect
---

# [Editor Aspect](https://www.jetbrains.com/help/mps/editor.html)

The editor aspect defines the projectional editor of a concept.

- [old cheatsheet](http://dsl-course.org/jetbrains-mps-editor-aspect/)

## General

To learn more about internal editor topics, visit [MPS Internals: Editor Development](editor_development.md).

!!! question "What happens when you press ++f5++ in the editor?"

    [F5 in editor](https://specificlanguages.com/posts/2022-03/09-f5-in-editor/){{ blog('sl') }}

!!! question "How can you delete non-existing children, references, or properties from a node?"

    Switch to the [reflective editor](https://www.jetbrains.com/help/mps/finding-your-way-out.html#reflectiveeditor) and remove the offending parts. There is also an [enhancement script](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590291%28jetbrains.mps.lang.structure.scripts%29%2F6066872190921237633) that can remove properties.

!!! question "Is there a way to prevent users from adding and removing elements in a list in the MPS editor? The elements in the list should still be editable, but adding/removing shouldn't be allowed."

    There are two solutions:

    1. Use a query list with empty insert/delete handlers.
    2. Create an action map/inline action cell with empty blocks for the actions `INSERT` and `INSERT_BEFORE`.

!!! warning "I've set a color of type java.awt.Color in a style property query, but the color is different when using the Darcula theme."

    The return type of those functions indicates that the return type is `java.awt.Color`, but the generator maps these colors to [theme-dependent colors](https://github.com/JetBrains/MPS/blob/a7983f504496b4425057efd51d22ee099d76c311/workbench/mps-editor/source/jetbrains/mps/ide/editor/StyleRegistryIdeaImpl.java#L202). The only avoid to avoid these mappings is to use custom factories. [[ux#dark-theme#references|here]]
    contains more information about theme-dependent colors.

!!! question "What is the difference between an empty cell and a simple constant cell without content?"

    Both cells work with an internal text line, but the `constant cell` supports more styling for the text line. The cursor also looks different.
    
    A constant cell supports the cell actions `LEFT, RIGHT, LOCAL`*`HOME/END,SELECT`*`RIGHT/LEFT, SELECT`*`LOCAL`*`HOME/END, COPY, PASTE, CUT`, and `CLEAR_SELECTION`, which it inherits from the internal label cell class. It has methods to validate the text (the only correct text is the specified text in the editor) and synchronize the cell with the model (that means returning to the original text after editing the text).
    
    The empty cell inherits from the  basic internal cell, which supports only left and right transformations (`LEFT_TRANSFORM`, `RIGHT_TRANSFORM`). It also doesn't support the `editable` style sheet item, which means no support for editing the text.
    
    An empty cell is a very stripped-down version of a constant cell and also has a somewhat different implementation because of the other base classes.

!!! question "I have actions for mouse clicks in my language, and they also trigger for right mouse clicks. Can we prevent that generally or by manually/programmatically detecting which mouse button fired the event?"

    No, the selection manager executes the click action for the selected cell. You will only get this information with the original MouseEvent that the editor does not forward to the editor cell. You can't restore the event. It would be possible to register a new mouse listener for the editor component through an [editor extension](http://mbeddr.com/mps-platform-docs/mps_internal/editor_development/#editor-extensions) that not only creates the click action for the selected cell but also saves the mouse button somewhere. The [EditorComponent](https://github.com/JetBrains/MPS/blob/7a96724d699774672a6bd4a6a402b6e643294f2d/editor/editor-runtime/source/jetbrains/mps/nodeEditor/EditorComponent.java#L472) contains the original implementation.

!!! question "I want to create a DSL using diagrams or a visual programming language. Are there any inspirations?"

    Have a look at [Visual Programming Languages - Snapshots | interfacevision.com](http://blog.interfacevision.com/design/design-visual-progarmming-languages-snapshots/). This page has a lot of examples of visual programming languages
    dating back to 1963 up to recent languages like Scratch. {{ mps_extensions() }}([documentation](https://jetbrains.github.io/MPS-extensions/extensions/editor/diagrams/)) supports diagrams, and you can use them as the base building block of a new language.

## [Menus](https://www.jetbrains.com/help/mps/transformation-menu-language.html)

[Transformation Menu Language | MPS documentation](https://www.jetbrains.com/help/mps/transformation-menu-language.html) describes
all the menus that can be influenced. If you use [Grammar Cells](https://jetbrains.github.io/MPS-extensions/extensions/editor/grammar-cells/)
from {{ mps_extensions() }}, transformation and substitution menus might not be needed at all. When you use the language, you
only need to use empty substitutions menus for concepts that shouldn't be substituable at all.

!!! hint "Explain the different menu-related terms."

    - **Menu definitions** have two flavors *named* and *default* and can be defined in transformation or substitute menus.
    - **Default menu**
        - **Default substitutions** will replace the default menu that MPS shows.

            Shortcut: ++ctrl+space++ or ++cmd+space++
        - **Transformation menus**
            define UI actions that show up in various locations. The menu consists of a list of sections.
            Each section contains a list of menu parts for a set of locations. 
            At runtime, the menu parts and locations decide the content of the completion menu.
            The contents of the completion menu are called menu items.
        - **Parameterized actions**
            allow calculating a list of elements of a specific type to be shown in the completion menu.
            They calculate all elements for the substitution menu and influence the node creation.
            Moreover, they define the selection of where the cursor should be placed.

!!! question "How do you find out where a substitute menu entry is coming from?"

    Use the *Menu Trace Tool* window. [Menu Trace Tool Window | MPS](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html) contains
    more information.

!!! question "How can you add smart references using the transformation menus?"

    [Adding smart references using transformation menus](https://www.f1re.io/transformation-menu-for-smart-references){{ blog('fire') }}


??? question "What's the best way to improve the autocomplete description of concepts?"

    > As you can see in the screenshot, the concepts of both opening braces are indistinguishable.

    > ![autocompletion myUnion](autocompletion_myUnion.png)

    > I can change the description by modifying the short description in the concept structure.

    > 1. What's the best format to improve these descriptions?
    > 2. Is this the correct/best way to change the autocomplete concept description?

    > ![concept BracketInitializer](bracketInitializer_concept.png)

    > ![autocompletion int16](autocompletion_int16.png)

    {{ question_by('AlexeiQ') }}

    Generally, it's up to the users and specific context to decide what makes sense to put into the description text. It should provide additional semantic information to those unfamiliar with the language to help them pick up the right concept from the code completion menu.

    The short description in the concept is the original, simple way to provide a static description in the code completion menu. You can also add your substitute action in the substitute menu of the concept (editor aspect) to get complete control over the code completion menu and to be able to generate the text dynamically based on the context.
    
    ![DataItem SubstituteMenu](DataItem_substituteMenu.png){width="800px"}
    
    ![data autocompletion](data_autocompletion.png){width="800px"}

    {{ answer_by('wsafonov') }}

## Languages

Many languages were developed over the years that help with creating better editor. Most of the language contain custom
editor cells that you can use the same way as standard cells such as constant or collections cells. You only
need to import the corresponding language in the editor aspect.

!!! hint "I need a specific graphical notation/feature for the editor."

    Have a look at the [complete extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/#editor) from {{ mps_extensions() }}.

!!! hint "I need hyperlinks."

    Use the language ^^com.mbeddr.mpsutil.hyperlink^^ from the {{ mbeddr_platform() }}.

!!! question "How do you create clickable links?"

    - [Creating clickable URL links in the editor](https://specificlanguages.com/posts/basic-editors/clickable-url-links/){{ blog('sl') }}
    - [More clickable URL links](https://specificlanguages.com/posts/basic-editors/more-clickable-url-links/){{ blog('sl') }}

!!! question "How can you include non-child relations in the editor?"

    Use the language ^^com.mbeddr.mpsutil.editor.querylist^^ from {{ mps_extensions() }}.

## Editor Declaration

This section contains some more advanced topics and questions when defining editors.

!!! question "Is there a disadvantage to using the indent layout instead of the indent cell mode?"

    No. There used to be performance issues with bigger models that were fixed in [MPS 2021.1](https://blog.jetbrains.com/mps/2021/05/mps-2021-1-has-been-released/).

!!! question "How do you use an empty text for empty cells?"

    [Use empty text for empty cells](https://specificlanguages.com/posts/basic-editors/use-empty-text-for-empty-cells/){{ blog('sl') }}


!!! hint "How can you set editor hints?"

    - You can set hints via `#!java editorContext.getEditorComponent().getUpdater()`
        - Set explicit hints for nodes.
        -   Set initial hints globally. They behave similarly to pushed hints.
    - Via right-click: Push editor hints and select a specific one.

    - Via an {{ mps_url("@mpsutil.EditorHintToggleAction") }} (e.g., in action declarations)
        - They are not visible in the push Editor hints menu.
        - If you need the same behavior, for example, in intentions, you can use code from there (via [ConceptEditorHintSettingsComponent.HintsState](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.hintsSettings%28MPS.Editor%2F%29%2F%7EConceptEditorHintSettingsComponent))
    - Set explicit hints for nodes and hints via {{ mps_url("@mpsutil.EditorHintToggleAction") }}.
      The usage of [ConceptEditorHintSettingsComponent.HintsState](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.hintsSettings%28MPS.Editor%2F%29%2F%7EConceptEditorHintSettingsComponent%24HintsState) is not so obvious.


??? question "How do you set the cursor to the first editable cell?"

    > ![editable cell and error_cell](editable_cell_error_cell.png)

    > - **(A)** What it looks like after creation
    > - **(B)** Initial situation with cursor at **(1)**: pressing ++enter++ leads to **(C)**

    > The problem is that in **(C)**, the cursor is at **(2)**, right before a read-only cell, and thus editing or moving to the next cell is impossible. I want the cursor to jump to the first editable cell at position **(3)**.
    
    > Structure of the new node in **(C)**:

    ```kroki-plantuml
@from_file:aspects/diagrams/first_editable_cell_compount_initializer_member.puml
    ```

    > Editor of the new node in **(C)**:

    >  ![example c:node editor](example_c_node_editor.png)

    Usually, you would set the *attracts focus* property of the cell, where the cursor should be positioned, to `attractsFocus` or `FirstEditableCell`.
    But, since (**C.2** and **C.3**) are error cells, the default behavior is to set the cursor in front of the first error cell, which is **(C.2)**.
    
    Therefore, change the first part of your editor to a query list cell **(A)**, which references the "member" in the cell properties **(B)**, and set the read-only property on the query list.

    ![new editor for CompoundInitializerMember](CompoundInitializerMember_editor_new.png)

    {{ contribution_by('AlexeiQ') }}


!!! question "Can the selected value of one Java Swing component be accessed from inside another Java Swing component?"

    Yes: [Is it possible to access the selected value of one Java Swing component from inside another Java Swing component? | MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/posts/360007728759/comments/360001510479)

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

!!! question "How can you paint the background of specific editor cells with a different color based on the analysis of the model?"

    - with the help of a conditional editor
    - by using the class `NodeHighlightManager`:

    ```java
    NodeHighlightManager highlightManager = this.editorComponent.getHighlightManager(); 
    EditorMessageOwner messageOwner = this.editorComponent.getHighlightMessagesOwner();
    (...)
    highlightManager.mark(((SNode) ref), HighlightConstants.INSTANCES_COLOR, "usage", messageOwner);
    ```

    The second approach performs better because the highlighter runs asynchronously, not during the editor rebuild.

!!! question "How can you hide a custom cell in the editor? (*show if* property)"

    > Custom cells expect only a cell provider in the inspector but don't offer the possibility to specify other attributes to set, for example, "show if." How can I hide a custom cell under a specific condition? (MPS-33195)

    The meta-model allows specifying the *show if* property and other attributes on a custom cell, and the generator will generate the correct code for it. The editor for the inspector doesn't include it. You can use the reflective editor to specify the condition.

    Since these attributes are not visible and you need this knowledge to find them, the alternative for better visibility is to surround the custom cell with a collection and set the *show if* property on the collection.

    {{ contribution_by('AlexeiQ') }}

!!! question "How do you split child collections?"

    [Advanced editors: splitting child collection in the editor](https://specificlanguages.com/posts/advanced-editors/splitting-child-collection-in-editor/){{ blog('sl') }}

!!! question "How can I show an editor cell only if the edited node/sub-nodes are currently the active selected nodes?"

    You can implement a cell similar to the cell [EditorCell_MathEnd](http://127.0.0.1:63320/node?ref=r%3A34f40b74-cb38-46ba-8e5b-13b443c803c4%28de.itemis.mps.editor.math.runtime%29%2F9204702729138147058) in {{ mps_extensions() }}.

## [Inspector](https://www.jetbrains.com/help/mps/mps-inspector.html)

As a language developer, you often use the inspector in the editor aspect to set styles, or change macros in the editor aspect.
Some projects use the inspector nearly not all, but it can be good solution to not clutter the editor:
[Move rarely needed information to the Inspector](https://specificlanguages.com/posts/2022-02/10-move-rarely-needed-information-to-inspector/){{ blog('sl') }}

!!! question "How can you open the inspector programmatically?"
    ```java
    editorContext.openInspector()
    ```

    - [Opening Inspector automatically](https://specificlanguages.com/posts/2022-03/01-opening-inspector-automatically/){{ blog('sl') }}
    - [Opening Inspector automatically: Selection listeners](https://specificlanguages.com/posts/2022-03/02-opening-inspector-automatically-selection-listeners/){{ blog('sl') }}
    - [Opening Inspector automatically: Editor extensions](https://specificlanguages.com/posts/2022-03/03-opening-inspector-automatically-editor-extensions/){{ blog('sl') }}

!!! question "How can you focus on a node in the inspector?"

    - [Focusing on a node in the inspector](https://specificlanguages.com/posts/2022-04/01-focusing-on-a-node-in-the-inspector/){{ blog('sl') }}

!!! warning "Highlighting constraint errors in the inspector doesn't work."

    Known bug (MPS-32350). Pressing ++f5++ helps.


## Open API

This section contains answers to code-related questions.

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

!!! question "How can you find out if an editor cell is read-only?"

    ```java
    ReadOnlyUtil.isCellsReadOnlyInEditor(this.editorComponent, new singleton<EditorCell>(editorCell))
    ```

!!! question "How do you get an editor for a node as a Java Swing component?"

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


!!! question "How do you get the selection/selected node in the editor?"

    ```java
    editorComponent.getSelectionManager().getSelection() / editorContext.getSelectedNode()
    ```

!!! question "How can you select a node in the editor?"

    ```java
    editorContext.getSelectionManager().setSelection/pushSelection
    // or
    editorContext.getNodeEditorComponent().selectNode()
    ```

!!! question "How do you find all open editors?"

    [Finding all open editors](https://specificlanguages.com/posts/2022-03/10-finding-all-open-editors/){{ blog('sl') }}

!!! question "How do you programmatically collapse editor cells?"

    ```java
     EditorCell_Collection.fold()/unfold()

    // You can check if it is foldable by calling:
    EditorCell_Collection.isFoldable()
    ```

!!! question "Is there a callback/hook when an editor tab closes?"

    > When closing an editor tab, MPS removes the highlighting from all nodes in the editor. I.e., when an editor is opened again for the same root node, all highlighting is gone.
    
    > In my code, I want to react to this editor-close event. Can a callback or hook be implemented, which the editor calls when an editor tab is closed?

    You can register an [EditorComponentCreateListener](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.highlighter%28MPS.Editor%2F%29%2F%7EEditorComponentCreateListener), that also receives an editorComponentDisposed event ([example](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/ide/bookmark/BookmarksUIComponent.java#L71-L84)).

!!! question "How can I customize the behavior when pressing the Tab key in the editor?"

    To override this behavior, you can specify the action `NEXT` in an [action map](https://www.jetbrains.com/help/mps/editor.html#actionmaps) ([MPS source reference](https://github.com/JetBrains/MPS/blob/dac7f125fdaae7739110073cd8b8bb7ade8fc49e/editor/editor-runtime/source/jetbrains/mps/nodeEditor/EditorComponent.java#L1809)). The default action is declared [here](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/EditorComponentActions.java#L57) with its default implementation in [NodeEditorActions](https://github.com/JetBrains/MPS/blob/dac7f125fdaae7739110073cd8b8bb7ade8fc49e/editor/editor-runtime/source/jetbrains/mps/nodeEditor/NodeEditorActions.java#L401)(it jumps to the next editable leaf of the editor cell tree).

!!! question "Is there a utility class related to editor hints?"

    Yes, there is in {{ mbeddr() }}: {{ mps_url("@mbeddr.EditorHintHelper") }}.


!!! question "I am using `NodeHighlightManager.mark()` to highlight AST nodes. MPS then uses the provided color for the cell's background and a slightly darker shade for an additional border. Can we change this, i.e., only paint the background, but not the border?"

    Yes, but you must create a class that extends DefaultEditorMessage and overwrites the [paintWithColor](https://github.com/JetBrains/MPS/blob/24918829bd8cb18afec7bfdfb5958d197608be1a/editor/editor-runtime/source/jetbrains/mps/nodeEditor/DefaultEditorMessage.java#L196) method. Line [203](https://github.com/JetBrains/MPS/blob/24918829bd8cb18afec7bfdfb5958d197608be1a/editor/editor-runtime/source/jetbrains/mps/nodeEditor/DefaultEditorMessage.java#L203) defined the color of the border. Instead of calling this method:
    
    ```java
    public void mark(SNode node, Color color, String messageText, EditorMessageOwner owner) {
    if (node == null) return;
    mark(new DefaultEditorMessage(node, color, messageText, owner));
    }
    ```

    You must initialize your message object and supply it to the mark method.


[^1]:[MPS forum - hierarchical tree structure and editing](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403918630290-hierarchical-tree-structure-and-editing)