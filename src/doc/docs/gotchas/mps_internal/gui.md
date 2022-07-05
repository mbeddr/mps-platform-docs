!!! question "Where can I find an overview of the user interface?"
    It can be found in the IntelliJ IDEA [documentation](https://www.jetbrains.com/help/idea/guided-tour-around-the-user-interface.html).
    A more technical explanation can be found in the IntelliJ Platform Plugin SDK [documentation](https://plugins.jetbrains.com/docs/intellij/user-interface-components.html).

!!! question "How do I add messages to the right side of the window?"

    In IntelliJ IDEA it is called [error stripe](https://www.jetbrains.com/help/rider/Code_Analysis__Status_Indicator.html),
    in MPS [MessagesGutter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EMessagesGutter):
    ``` Java
    jetbrains.mps.nodeEditor.EditorComponent component = ((EditorComponent) editorContext.getEditorComponent()); 
    NodeHighlightManager highlightManager = component.getHighlightManager();
    highlightManager.mark(message);
    ```

!!! question "How can I add things to the left of the editor? (e.g. breakpoints, go subclasses etc.)"

    The component is called [LeftEditorHighlighter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.leftHighlighter%28MPS.Editor%2F%29%2F%7ELeftEditorHighlighter).
    A checker has to be implemented that can show messages in this component (example: [OverrideMethodsChecker](http://127.0.0.1:63320/node?ref=r%3Afa4569a3-1bd4-4159-97bc-db03b3aeff88%28jetbrains.mps.java.platform.highlighters%29%2F8432634623182578830)).

!!! question "How to I add an icon to the status bar?"

    Have a look at the the implementation of the [transient models widget](https://github.com/JetBrains/MPS/blob/d08cbd361a26e8339c8bb5aaa90ce29508c0f908/plugins/mps-make/source_gen/jetbrains/mps/ide/make/actions/TransientModelsWidget.java#L26) and
    its initialisation in [TransientModelsNotification](https://github.com/JetBrains/MPS/blob/d08cbd361a26e8339c8bb5aaa90ce29508c0f908/plugins/mps-make/source_gen/jetbrains/mps/ide/make/actions/TransientModelsNotification.java#L34).

!!! question "What parts of the IntelliJ Platform SDK can't be used in MPS because they are not supported?"

    Everything related to text files: [Documents](https://plugins.jetbrains.com/docs/intellij/documents.html),
    [PSI files](https://plugins.jetbrains.com/docs/intellij/psi-files.html), [Templates](https://plugins.jetbrains.com/docs/intellij/templates.html), QuickDoc,
    [IDE Features Trainer](https://plugins.jetbrains.com/plugin/8554-ide-features-trainer), CodeSmellDetector and [Custom Language Support](https://plugins.jetbrains.com/docs/intellij/custom-language-support.html).

!!! question "How do I add an action to the menu bar of a tool window?"

    Example:
    ```Java
    ToolWindow window = ToolWindowManager.getInstance(myProject).getToolWindow(ToolWindowId.PROJECT_VIEW);
    if (window != null) {
        window.setTitleActions(titleActions);
    }
    ```

!!! question "How can I have clickable icons in the left editor margin?"
    Specific Languages Blog &mdash; [Clickable icons in the left editor margin](https://specificlanguages.com/posts/2022-02/18-clickable-icons-in-left-editor-margin/){target=_blank}

!!! question "Are there alternatives to message boxes?"
    Specific Languages Blog &mdash; [Use notification balloons instead of message boxes](https://specificlanguages.com/posts/notification-balloons-instead-of-message-boxes/){target=_blank}

!!! question "What IDEA UI elements are available?"
    Specific Languages Blog &mdash; [Polished UI for free: IDEA UI components](https://specificlanguages.com/posts/2022-02/09-idea-ui-components/){target=_blank}

!!! question "How do I create menu items with checkboxes?"
    Specific Languages Blog &mdash; [Extended actions: Checkboxes](https://specificlanguages.com/posts/2022-03/16-extended-actions-checkboxes/){target=_blank}

!!! question "How can I retrieve all opened windows in [split screen mode](https://www.jetbrains.com/help/idea/using-code-editor.html#split_screen)?"

    ```java
    FileEditorManagerEx.getInstanceEx(ProjectHelper.toIdeaProject(#project)).getSplitters().getWindows()
    ```