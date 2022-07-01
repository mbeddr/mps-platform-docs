!!! question "How to can I go to the declaration of an intention when I open the intention menu?"
    Select the intention and click the arrow/press right arrow key -> Go to intention declaration.

!!! question "How do I execute an action as an intention?"
    Add the action to the action group [ActionsAsIntentions](http://127.0.0.1:63320/node?ref=r%3A9832fb5f-2578-4b58-8014-a5de79da988e%28jetbrains.mps.ide.editor.actions%29%2F6893431717880497466).

!!! hint "I want to group my intentions and give them names."

    Use the language `com.mbeddr.mpsutil.intentions` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/). 
    It is also possible to split the description into multiple literals. The first literal will then be used to group intentions.
    ![intention description](intention_description.png)
    ![intention description grouping](intention_description_result.png)

!!! hint "I need to get all available intentions for a node."

    Call `IntentionsManager.getInstance().getAvailableIntentions()`.

!!! question "How can I make intentions visible?"
    Specific Languages Blog &mdash; [Making intentions visible](https://specificlanguages.com/posts/2021-02/10-making-intentions-visible/){target=_blank}

!!! question "How can I show a submenu in the intentions menu?"
    Specific Languages Blog &mdash; [Showing a submenu in the intentions menu](https://specificlanguages.com/posts/2022-01/27-intention-submenu/){target=_blank}