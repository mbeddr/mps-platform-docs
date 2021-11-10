!!! question "Should I use this aspect?"

    No. You should use plugin solutions instead.

!!! warning "References to keys in action context parameters are out of search scope."

    You need to add a dependency to [MPSCommonDataKeys](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.actions%28MPS.Platform%2F%29%2F%7EMPSCommonDataKeys).
    This class extends [PlatformDataKeys](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.actionSystem%28MPS.IDEA%2F%29%2F%7EPlatformDataKeys)
    and this class extends [CommonDataKeys](CommonDataKeys).

!!! warning "My action is not visible."

    You have to add it to an ActionGroup that can be attached at differenct places such as the context menu or the build menu. 
    All of the action context parameters that are marked as required have to be available and the isApplicable block must
    return true for an action to be visible. For debugging purposes you can set "always visible" to true to check if your
    action is registered at all. You also need to have a standalone descriptor in your model for it to work. Additionaly,
    the solution kind should be set to Other in the Java tab of the solution properties.

!!! hint "I want to merge models."

    Use the language `de.itemis.mps.modelmerger` (experimental) from mps-extensions.

!!! hint "I want to check the structure of a node."

    Use the language `de.slisson.mps.structurecheck` from mps-extensions.

!!! hint "I want to store different states/versions of a node inside of the model."

    Use the language `de.itemis.mps.nodeversioning` from mps-extensions.


!!! hint "I want to create new SContainmentLink for non-existent role[^1]."
Can be created through MetaAdapterFactory.


[^1]:[How to create new SContainmentLink for non-existent role?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009473300-How-to-create-new-SContainmentLink-for-non-existent-role-) 