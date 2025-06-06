---
comments: true
tags:
- reference
- intellij
alias: reference-actions
---

This page lists which data keys are available when you declare [actions](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups).
[MPSCommonDataKeys](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.actions%28MPS.Platform%2F%29%2F%7EMPSCommonDataKeys) are always available, [MPSEditorDataKeys](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.ide.editor%28MPS.Editor%2F%29%2F%7EMPSEditorDataKeys) is only
available in node editors. [MPSDataKeys](http://127.0.0.1:63320/node?ref=86441d7a-e194-42da-81a5-2161ec62a379%2Fjava%3Ajetbrains.mps.workbench%28MPS.Workbench%2F%29%2F%7EMPSDataKeys) are only available in certain places such as project panes.

## CommonDataKeys

This class lists common data keys used as parameter for actions.

| name                    | description                                                                                           | Available in MPS   |
|-------------------------|-------------------------------------------------------------------------------------------------------|--------------------|
| CARET                   | Returns a caret instance (in host or injected editor, depending on context).                          | :no_entry:         |
| EDITOR                  | Returns the currently focused editor instance.                                                        | :no_entry:         |
| EDITOR_EVEN_IF_INACTIVE | Returns an editor even if the focus currently is in the find bar.                                     | :no_entry:         |
| EDITOR_VIRTUAL_SPACE    | Returns whether the current location relates to a virtual space in an editor.                         | :no_entry:         |
| HOST_EDITOR             | Returns a reference to host an editor instance in case the *EDITOR* key refers to an injected editor. | :no_entry:         |
| NAVIGATABLE             | Returns a `Navigatable` instance.                                                                     | :no_entry:         |
| NAVIGATABLE_ARRAY       | Returns several navigatables, e.g.                                                                    | :no_entry:         |
| PROJECT                 | Returns a project if a project node is selected (in project view)                                     | :white_check_mark: |
| PSI_ELEMENT             | Returns a `PsiElement` instance.                                                                      | :no_entry:         |
| PSI_FILE                | Returns the currently selected `PsiFile` instance.                                                    | :no_entry:         |
| VIRTUAL_FILE            | Returns a `VirtualFile` instance.                                                                     | :white_check_mark: |
| VIRTUAL_FILE_ARRAY      | Returns several `VirtualFile` instances                                                               | :white_check_mark: |

## PlatformDataKeys

This class extends *CommonDataKeys* and adds new keys that deal with the IntelliJ platform itself.

| name                         | description                                                                                                                                                         | Available in MPS   |
|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| ACTIONS_SORTER               | Deprecated. use ActionPromoter                                                                                                                                      | :no_entry:         |
| CONTENT_MANAGER              | Returns the managing class that's responsible for the current component's content                                                                                   | :no_entry:         |
| CONTEXT_COMPONENT            | Returns the component that's currently in focus.                                                                                                                    | :white_check_mark: |
| CONTEXT_MENU_POINT           | Returns a point to guess where to show the context menu invoked by a key.                                                                                           | :no_entry:         |
| COPY_PROVIDER                | Returns the copy provider responsible for copying data.                                                                                                             | :white_check_mark: |
| CUT_PROVIDER                 | Returns the cut provider responsible for cutting data.                                                                                                              | :white_check_mark: |
| DELETE_ELEMENT_PROVIDER      || :white_check_mark:                                                                                                                                                  |
| DOMINANT_HINT_AREA_RECTANGLE | Returns the position and dimension of a hint.                                                                                                                       | :no_entry:         |
| EXPORTER_TO_TEXT_FILE        || :no_entry:                                                                                                                                                          |
| FILE_EDITOR                  | Returns the file                                                                                                                                                    | :white_check_mark: |
| FILE_TEXT                    | Returns the text of the currently selected file/file revision                                                                                                       ||
| HELP_ID                      | Returns help id.                                                                                                                                                    | :white_check_mark: |
| IS_MODAL_CONTEXT             | Returns Boolean. TRUE if action is executed in modal context and Boolean. FALSE if action is executed not in modal context.                                         | :white_check_mark: |
| MODALITY_STATE               | See: [Modality and invokeLater() - IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/general-threading-rules.html#modality-and-invokelater) |                    | :white_check_mark:                                                                                                          |
| NONEMPTY_CONTENT_MANAGER     | Returns a non-empty managing class that's responsible for the current component's content                                                                           | :no_entry:         |
| PASTE_PROVIDER               | Returns the paste provider responsible for pasting data.                                                                                                            | :white_check_mark: |
| PREDEFINED_TEXT              | Returns a predefined text value.                                                                                                                                    | :no_entry:         |
| PROJECT_CONTEXT              | Returns a project if a project node is selected (in the project view).                                                                                              | :no_entry:         |
| PROJECT_FILE_DIRECTORY       || :white_check_mark:                                                                                                                                                  |
| SEARCH_INPUT_TEXT            || :no_entry:                                                                                                                                                          |
| SELECTED_ITEM                | Returns a single selected item.                                                                                                                                     | :white_check_mark: |
| SELECTED_ITEMS               | Returns multiple selected items.                                                                                                                                    | :no_entry:         |
| SOURCE_NAVIGATION_LOCKED     || :no_entry:                                                                                                                                                          |
| SPEED_SEARCH_COMPONENT       | Returns the speed search component                                                                                                                                  | :no_entry:         |
| STATUS_BAR                   | Returns the status bar class                                                                                                                                        | :no_entry:         |
| TOOL_WINDOW                  | Returns the current tool window                                                                                                                                     | :white_check_mark: |
| TREE_EXPANDER                || :no_entry:                                                                                                                                                          |
| UI_DISPOSABLE                | Returns the class responsible for disposing of a UI component                                                                                                       | :no_entry:         |