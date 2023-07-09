---
title: FindUsages Aspect
hide:
- toc
tags:
- aspect
---

# FindUsages Aspect

- [official documentation](https://www.jetbrains.com/help/mps/find-usages.html#specificstatements)

Implement custom finders for discovering related nodes in this aspect.

!!! warning "I click *Find Usages* in the context menu of a node, and it doesn't find anything."

    The standard search scope is the project. Try to expand it to global in the find usages settings. Check also that
    you are using the correcting finders in the *Finders* section of the dialog. 

!!! warning "I want to execute *Find Usages* repeatedly, but the result tab gets overridden."

    Select the option *Open in new tab* in the section *View* of the *Find usages* preferences or pin the result tabs by right-clicking and selecting *Pin Tab*.

!!! question "How to restrict the scope of a *Finder* execution?"

    > I use this [finder](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959035b%28jetbrains.mps.lang.findUsages.structure%29%2F2005690715325995353) and would like to restrict the scope from *global* to *project*. 

    > How do I do this?
    
    You can pass any *FindUsages Scope* implementation to the expression, for instance, the {{ mps_url("@mps.ide.findusages.model.scopes.ProjectScope") }}:

    ```java    
    SearchResults results = execute finders(NodeUsages, node, new ProjectScope(project), <default>);
    ```

!!! question "How can I invoke the find usages manager programmatically without UI?"

    Use one of the methods in `#project.getComponent(FindUsagesmanager.class)`. If no project is available, you can use the deprecated method
    `FindUsagesManager.getInstance()`. If the function needs a Consumer, use the class
    [CollectConsumer](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F~CollectConsumer) , which adds the results to the provided collection. There is also the method `getResults()` to get back
    the collection.

!!! warning "A model doesn't support *fast usages* search."

    When specifying the scope, exclude models that don't support fast usages search (e.g., temporary models such as the console model).
    Models are only loaded when accessed, so keep the scope of the *find usages*.
    If you are filtering a global or similar scope, the following methods might be helpful: 
    
    - `#!java module.isPackaged()` to check for installed languages/solutions/devkits
    - `#!java model.isReadOnly()` to check if a model allows updates
    - `#!java SModelStereotype.isX()` to check if the model has a specific stereotype, e.g., the model is a test model