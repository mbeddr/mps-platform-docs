!!! warning "I click Find usages in the context menu of a node, and it doesn't find any usages."

    The standard search scope is the project. Try to expand it to global in the find usages settings. Also check that
    you are using the correcting finders in the Finders section of the settings. 

!!! warning "I want to execute find usage multiple times but the results tab gets overridden, and I can't compare results."

    Check the option "Open in new tab" in the section View options of the preferences or pin the result tabs by right
    clicking and selecting "Pin Tab".

!!! question "How to restrict the scope of a Finder execution?"

    > I am using this [finder](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959035b%28jetbrains.mps.lang.findUsages.structure%29%2F2005690715325995353) and would like to restrict the scope from `global`, to lets say `project`. 

    > How do I do this?

    You can pass any FindUsages Scope implementation to the expression for instance the `ProjectScope` from [here](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.ide.findusages.model.scopes%28MPS.Core%2F%29%2F%7EProjectScope), e.g.
    ```java    
    SearchResults results = execute finders(NodeUsages, node, new ProjectScope(project), <default>);
    ```