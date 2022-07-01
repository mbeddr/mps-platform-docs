## CommonDataKeys

| name                    | description                                                                                       | Available in MPS   |
|-------------------------|---------------------------------------------------------------------------------------------------|--------------------|
| CARET                   | Returns caret instance (in host or injected editor, depending on context).                        | :no_entry:         |
| EDITOR                  | Returns currently focused editor instance.                                                        | :no_entry:         |
| EDITOR_EVEN_IF_INACTIVE | Returns editor even if focus currently is in find bar.                                            | :no_entry:         |
| EDITOR_VIRTUAL_SPACE    | Returns whether the current location relates to a virtual space in an editor.                     | :no_entry:         |
| HOST_EDITOR             | Returns reference to host editor instance, in case EDITOR key is referring to an injected editor. | :no_entry:         |
| NAVIGATABLE             | Returns `Navigatable` instance.                                                                   | :no_entry:         |
| NAVIGATABLE_ARRAY       | Returns several navigatables, e.g.                                                                | :no_entry:         |
| PROJECT                 | Returns project if project node is selected (in project view)                                     | :white_check_mark: |
| PSI_ELEMENT             | Returns PsiElement instance.                                                                      | :no_entry:         |
| PSI_FILE                | Returns currently selected PsiFile instance.                                                      | :no_entry:         |
| VIRTUAL_FILE            | Returns VirtualFile instance.                                                                     | :white_check_mark: |
| VIRTUAL_FILE_ARRAY      | Returns several VirtualFile instances, e.g.                                                       | :white_check_mark: |

## PlatformDataKeys

| name                         | description                                                                                                                 | Available in MPS |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------|------------------|
| ACTIONS_SORTER               | Deprecated. use ActionPromoter                                                                                              | :no_entry:       |
| CONTENT_MANAGER              |                                                                                                                             |                  |
| CONTEXT_COMPONENT            | Returns Component currently in focus, DataContext should be retrieved for.                                                  ||     |
| CONTEXT_MENU_POINT           | Returns Point to guess where to show context menu invoked by key.                                                           ||     |
| COPY_PROVIDER                |||     |     |
| CUT_PROVIDER                 |||     |     |
| DELETE_ELEMENT_PROVIDER      |||     |     |
| DOMINANT_HINT_AREA_RECTANGLE |||     |     |
| EXPORTER_TO_TEXT_FILE        |||     |     |
| FILE_EDITOR                  |||     |     |
| FILE_TEXT                    | Returns the text of currently selected file/file revision                                                                   ||     |
| HELP_ID                      | Returns help id.                                                                                                            ||     |
| IS_MODAL_CONTEXT             | Returns Boolean. TRUE if action is executed in modal context and Boolean. FALSE if action is executed not in modal context. ||     |
| MODALITY_STATE               |||     |     |
| NONEMPTY_CONTENT_MANAGER     |||     |     |
| PASTE_PROVIDER               |||     |     |
| PREDEFINED_TEXT              |||     |     |
| PROJECT_CONTEXT              | Returns project if project node is selected (in project view)                                                               ||     |
| PROJECT_FILE_DIRECTORY       |||     |     |
| SEARCH_INPUT_TEXT            |||     |     |
| SELECTED_ITEM                | Returns single selection item.                                                                                              ||     |
| SELECTED_ITEMS               | Returns multi selection items.                                                                                              ||     |
| SOURCE_NAVIGATION_LOCKED     |||     |     |
| SPEED_SEARCH_COMPONENT       |||     |     |
| STATUS_BAR                   |||     |     |
| TOOL_WINDOW                  |||     |     |
| TREE_EXPANDER                |||     |     |
| UI_DISPOSABLE                |||     |     |