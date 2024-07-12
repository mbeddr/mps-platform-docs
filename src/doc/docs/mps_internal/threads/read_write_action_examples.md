---
comments: true
tags:
- internals
- examples
---

These actions use the IntelliJ platform or access MPS models and need additional locks because they are running on a different thread. Especially MPS read and write locks should be available in every language aspect, and manually locking isn't necessary.

## Example of Actions That Require MPS Locks

### Write Actions

- reload/add/remove/modify
    - projects
    - modules
    - models

### Read Actions

- resolve node references
- read nodes/models/modules

### Read Actions in EDT

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

## Examples of Actions That Require Idea Locks

Useful methods:

- Read action: `#!java Applicationmanager.getApplication.runReadAction()`
- Read action allowed: `#!java ApplicationManager.getApplication().assertReadAccessAllowed()`
- Write action: `#!java Applicationmanager.getApplication.runWriteAction()`
- Write action allowed: `#!java ApplicationManager.getApplication().assertWriteAccessAllowed()`

### Write Actions

- VFS-related actions
    - refresh files
    - create/remove directories
    - create/modify/delete/copy files
- paste data
- create facets

### Read Actions

- find files
- get a list of file editors

### Actions Executed in EDT 

They are executed in the lambda of `#!java ApplicationManager.getApplication().invokeLater/invokeAndWait)`.

- update tools
- show progress bars for long-running actions
- update text in Java Swing components
- dispose of UI components
- rebuild components
- start a make process
- save projects/modules
- update toolbars
- show dialogs
- update the project pane
- perform refactorings
- unload models

### Actions That Are Executed on a Pooled Thread

They are executed in the lambda of `#!java ApplicationManager.getApplication().executeOnPooledThread`

- set breakpoints on startup
- preview the generated text for nodes