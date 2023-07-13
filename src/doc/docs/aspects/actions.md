---
title: Action Aspect
hide:
- toc
tags:
- aspect
---

# [Action Aspect](https://www.jetbrains.com/help/mps/editor-actions.html)

The action aspect defines node factories and copy/paste related handlers.

!!! question "Are node factories used when calling new node<Concept>?"

    No. [Editor Actions | MPS](https://www.jetbrains.com/help/mps/editor-actions.html#node_factories) contains more information.

!!! question "Where can you find all key mappings for the editor?"

    [MPSEditorActions.xml](https://github.com/JetBrains/MPS/blob/master/workbench/mps-editor/source_gen/jetbrains/mps/ide/editor/actions/MPSEditorActions.xml)
    contains Windows and Mac shortcuts for editor actions.


??? question "Why is a custom action map not executed on a *CellModel_Collection*?"

    > I can reference an action map from an editor collection cell in MPS.

    > ![cellmodel collection: inspector](cellmodell_collection_inspector.png){width="300px"}

    > However, my defined actions are never executed when the editor is used. Why is this so, and how to fix it?

    **Reason for the Problem**
    
    In general, the applied actions should be invoked and executed.
    However, depending on the content of the collection cells, MPS might generate some default actions which will override your custom actions.
    
    **Example**
    
    You have a read-only model access cell inside the collection cell:

    ![alias and read-only modelaccess](alias_and_ro_model_access.png){width="600px"}
    
    In this case, the internal MPS generator for `CellModel_ReadOnlyModelAccessor` will automatically generate and register some default actions like [delete/backspace  ](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959029f%28jetbrains.mps.lang.editor.generator.baseLanguage.template.main%40generator%29%2F1225901389718), which in the end, will prohibit your custom action from being applied.
    
    **Solution**

    You can use the cell explorer (*Language Debug* --> *Show Cell in Explorer*) to see which actions are defined for a cell.
    Deactivate the automatically applied action with the help of custom editor cells([CellModel_CustomFactory](http://127.0.0.1:63320/node?ref=r%3Af4f3736e-6da2-4bf6-9b34-06696f46bc70%28de.slisson.mps.richtext.customcell.structure%29%2F2490242408670732052)). You can use `CellModel_CustomFactory` to wrap the cells in your collection which generate unwanted actions and deactivate them.
    
    ![custom factory cell delete actions](custom_factory_cell_delete_actions.png){width="600px"}

    {{ contribution_by('arimer') }}

!!! question "Can you create a copy-paste handler/paste wrapper for arbitrary concepts?"

    Yes, the handlers can be created for any concept, e.g. ClassConcept. You don't have to use the language containing the handler in the model.

!!! question "How can I call the copy-and-paste handler programmatically?"

    - Copy: `#!java DataTransferManager.getInstance().preProcessNode()`
    - Paste: `#!java DataTransferManager.getInstance().postProcessNode()`

    [CopyPasteUtil](http://127.0.0.1:63320/node?ref=r%3A84719e1a-99f6-4297-90ba-8ad2a947fa4a%28jetbrains.mps.ide.datatransfer%29%2F6299533519672638253) can help you with those two actions.

!!! warning "I have an interface `IStatement `and two concepts `StatementA`, and `StatementB`, that implement the interface. I paste a node of concept `StatementA` into a node of concept `StatementB` into a role that accepts `IStatement`. Why is the paste wrapper not called?"

    A paste wrapper only modifies the pasted node if it can change the source concept to the target concept
    and if the pasted node is not already an instance of the target concept. In the described case, the node of concept `StatementA` is already
    an instance of `IStatement`, and the paste wrapper is not called.