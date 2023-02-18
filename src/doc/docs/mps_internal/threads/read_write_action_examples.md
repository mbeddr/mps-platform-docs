---
tags:
- internals
- examples
---

These actions use IntelliJ platforms or access MPS models and need additional locks because of the location where they
are used. Especially MPS read and write locks should be available in every language aspect and manually locking isn't necessary.

## Example of actions that require MPS locks

### Write actions

- reload/add/remove/modify
    - projects
    - modules
    - models

### Read actions

- resolve node references
- read nodes/models/modules

### Read actions in EDT

- select a node in the tree view
- clear the marks in the highlight manager
- move nodes refactoring
- resolve node references and open them in the editor
- run the model checker
- rebuild editor components
- paste nodes
- select nodes in the editor
- recreate opened MPS editors
- show the completion menu
- re-highlight nodes

## Examples of actions that require IDEA locks

Useful methods:

- Read action: `#!java Applicationmanager.getApplication.runReadAction()`
- Read action allowed: `#!java ApplicationManager.getApplication().assertReadAccessAllowed()`
- Write action: `#!java Applicationmanager.getApplication.runWriteAction()`
- Write action allowed: `#!java ApplicationManager.getApplication().assertWriteAccessAllowed()`

### Write actions

- VFS related actions
    - refresh files
    - create/remove directories
    - create/modify/delete/copy files
- paste data
- create facets

### Read actions

- find files
- get a list of file editors

### Actions executed on EDT 

They are executed in the lambda of `#!java ApplicationManager.getApplication().invokeLater/invokeAndWait)`.

- update tools
- show progress bars for a long-running actions
- update text in swing components
- dispose UI components
- rebuild components
- start a make process
- save projects/modules
- update toolbars
- show dialogs
- update the project pane
- perform refactorings
- unload models

### Actions that are executed on a pooled thread

They are executed in the lambda of `#!java ApplicationManager.getApplication().executeOnPooledThread`

- set break points on startup
- preview the generated text for nodes