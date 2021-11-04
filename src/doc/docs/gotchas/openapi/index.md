!!! hint "I want to get the Editor font."
    Use `jetbrains.mps.nodeEditor.EditorSettings#getDefaultEditorFont()`

!!! hint "I want to subscribe to editor changes."
    Check out [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009846039/comments/360002369420).

!!! hint "I want to create new SContainmentLink for non-existent role[^1]."
    Can be created through MetaAdapterFactory.

!!! hint "I need to get the text of an EditorCell."

    Call `EditorCell.renderText().getText()`.

!!! hint "I need to get all available intentions for a node."

    Call `IntentionsManager.getInstance().getAvailableIntentions()`.

!!! hint "I need to get the output path for a solution."

    Call `myModule.getModuleDescriptor() as SolutionDescriptor.getOutputPath()`


[^1]:[How to create new SContainmentLink for non-existent role?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009473300-How-to-create-new-SContainmentLink-for-non-existent-role-) 