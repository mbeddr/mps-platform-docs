---
tags:
- internals
- ui
- intellij
---

- [Fixing ugly trees](https://specificlanguages.com/posts/2022-05/18-fixing-ugly-trees){{ blog('sl') }}
- [Centering dialogs](https://specificlanguages.com/posts/2022-05/24-centering-dialogs/){{ blog('sl') }}

!!! question "Where can you find an overview of the user interface?"
    It can be found in the IntelliJ IDEA [documentation](https://www.jetbrains.com/help/idea/guided-tour-around-the-user-interface.html).
    A more technical explanation can be found in the [IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/user-interface-components.html).

!!! question "What exactly is an MPS action? How do they work?"

    The [MPS actions](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups) compile down to [IntelliJ platform actions](https://plugins.jetbrains.com/docs/intellij/basic-action-system.html), so you actually see actions from MPS and the IntelliJ platform (e.g. Close Floating Navigation Bar). Most icon buttons like the buttons in the upper right corner, or the image buttons in the MPS tools are also IntelliJ buttons.

    Actions that can be enabled or disabled are of type [ToggleAction](https://plugins.jetbrains.com/docs/intellij/basic-action-system.html#useful-action-base-classes). They are used, for example, in KernelF in the run menu. There is a deprecated concept *addJavaAction* which
    lets you add IntelliJ actions when referencing actions in an MPS plugin.

    To disable actions, use the [[mpsutils_plugin_rcp#actions-filter|actionsfilter]] language. You can modify the shortcuts of actions locally in *Preferences->Keymap*.

!!! question "How can I find the source of an action?"

    There are a few different things that you could try:

    1. Guessing. If the caption contains, for example, the text "Clone", search for a root node that has the name Clone in it. Alternatively, you can try searching through the console: `#instances<scope = global>(ActionDeclaration).where({~it => it.caption.contains("Clone"); })`
    2. Search the MPS GitHub repository: https://github.com/JetBrains/MPS/search?q=clone+solution for commits or code mentioning your keywords. In this case, the action must be called "CloneModule" based on the first results.
    3. If you find a similar action in the same context menu, check the other actions/groups in the same module. In your case, you might have found the group [SolutionRefactoring](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895904a4%28jetbrains.mps.ide.actions%29%2F1223018726868) through the [RenameModule](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895904a4%28jetbrains.mps.ide.actions%29%2F3734045384532066586) action which contains your action.

    If the caption is not dynamic, number 1 usually works. If the action is located in the *MPS.IDEA* module, you will find it in the [IntelliJ community sources](https://github.com/JetBrains/intellij-community).

!!! question "How can you show modal dialogs for inputting text?"

    Use the class [com.intellij.openapi.ui.Messages](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.ui%28MPS.IDEA%2F%29%2F%7EMessages).

!!! question "How do you add messages to the right side of the window?"

    In IntelliJ IDEA it is called [error stripe](https://www.jetbrains.com/help/rider/Code_Analysis__Status_Indicator.html),
    in MPS [MessagesGutter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EMessagesGutter):
    ``` Java
    jetbrains.mps.nodeEditor.EditorComponent component = ((EditorComponent) editorContext.getEditorComponent()); 
    NodeHighlightManager highlightManager = component.getHighlightManager();
    highlightManager.mark(message);
    ```

!!! question "How can you add things to the left of the editor? (examples: breakpoints, go subclasses)"

    The component is called [LeftEditorHighlighter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.leftHighlighter%28MPS.Editor%2F%29%2F%7ELeftEditorHighlighter).
    A checker has to be implemented that can show messages in this component (example: [OverrideMethodsChecker](http://127.0.0.1:63320/node?ref=r%3Afa4569a3-1bd4-4159-97bc-db03b3aeff88%28jetbrains.mps.java.platform.highlighters%29%2F8432634623182578830)).

!!! question "How do you add an icon to the status bar?"

    Have a look at the implementation of the [transient models widget](https://github.com/JetBrains/MPS/blob/d08cbd361a26e8339c8bb5aaa90ce29508c0f908/plugins/mps-make/source_gen/jetbrains/mps/ide/make/actions/TransientModelsWidget.java#L26) and
    its initialization in [TransientModelsNotification](https://github.com/JetBrains/MPS/blob/d08cbd361a26e8339c8bb5aaa90ce29508c0f908/plugins/mps-make/source_gen/jetbrains/mps/ide/make/actions/TransientModelsNotification.java#L34).

!!! question "What parts of the IntelliJ Platform SDK can't be used in MPS because they are not supported?"

    Everything related to text files: [Documents](https://plugins.jetbrains.com/docs/intellij/documents.html),
    [PSI files](https://plugins.jetbrains.com/docs/intellij/psi-files.html), [Templates](https://plugins.jetbrains.com/docs/intellij/templates.html), QuickDoc,
    [IDE Features Trainer](https://plugins.jetbrains.com/plugin/8554-ide-features-trainer), CodeSmellDetector and [Custom Language Support](https://plugins.jetbrains.com/docs/intellij/custom-language-support.html).

!!! question "How can you have clickable icons in the left editor margin?"
    [Clickable icons in the left editor margin](https://specificlanguages.com/posts/2022-02/18-clickable-icons-in-left-editor-margin/){{ blog('sl') }}

!!! question "Are there alternatives to message boxes?"
    [Use notification balloons instead of message boxes](https://specificlanguages.com/posts/notification-balloons-instead-of-message-boxes/){{ blog('sl') }}

!!! question "What IDEA UI elements are available?"
    [Polished UI for free: IDEA UI components](https://specificlanguages.com/posts/2022-02/09-idea-ui-components/){{ blog('sl') }}

!!! question "How do you create menu items with checkboxes or combo boxes and make the actions findable?"
    
    - [Extended actions: Checkboxes](https://specificlanguages.com/posts/2022-03/16-extended-actions-checkboxes/){{ blog('sl') }}
    - [Extended actions: Combo boxes](https://specificlanguages.com/posts/2022-03/17-extended-actions-combo-boxes/){{ blog('sl') }}
    - [Extended actions: Making actions findable](https://specificlanguages.com/posts/2022-03/18-extended-actions-making-actions-findable/){{ blog('sl') }}

!!! question "How can you retrieve all opened windows in [split screen mode](https://www.jetbrains.com/help/idea/using-code-editor.html#split_screen)?"

    ```java
    FileEditorManagerEx.getInstanceEx(ProjectHelper.toIdeaProject(#project)).getSplitters().getWindows()
    ```