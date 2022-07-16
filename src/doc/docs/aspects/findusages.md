---
title: FindUsages aspect
---

# FindUsages aspect

Custom finders for finding related nodes can be implemented in this aspect.

!!! warning "I click `Find usages` in the context menu of a node, and it doesn't find anything."

    The standard search scope is the project. Try to expand it to global in the find usages settings. Also check that
    you are using the correcting finders in the Finders section of the settings. 

!!! warning "I want to execute find usage more than once, but the result tab gets overridden."

    Select the option `Open in new tab` in the section `View` options of the preferences or pin the result tabs by right-clicking and selecting `Pin Tab?.

!!! question "How to restrict the scope of a `Finder` execution?"

    > I am using this [finder](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959035b%28jetbrains.mps.lang.findUsages.structure%29%2F2005690715325995353) and would like to restrict the scope from `global`, to lets say `project`. 

    > How do I do this?
    
    You can pass any `FindUsages Scope` implementation to the expression, for instance the {{ mps_url("@mps.ide.findusages.model.scopes.ProjectScope") }}:

    ```java    
    SearchResults results = execute finders(NodeUsages, node, new ProjectScope(project), <default>);
    ```