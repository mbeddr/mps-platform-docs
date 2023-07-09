---
tags:
- internals
- intellij
---

# IntelliJ SDK

## Existing Documentation

The best place to learn more about the IntelliJ platform is the [IntelliJ Platform SDK documentation](https://plugins.jetbrains.com/docs/intellij/welcome.html).
Two additional resources are also helpful if you want to understand how IntelliJ plugins are written ([Introduction to creating IntelliJ IDEA plugins](https://developerlife.com/2020/11/21/idea-plugin-example-intro/)) and how the IDEA threading model works([Advanced guide to creating IntelliJ IDEA plugins](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/)).

Some parts of MPS are different from the IntelliJ platform, so those chapters are irrelevant: [PSI](https://plugins.jetbrains.com/docs/intellij/psi.html) + all text editor-specific code and [custom languages support](https://plugins.jetbrains.com/docs/intellij/custom-language-support.html).

!!! question "Where can you find a list of all IntelliJ registry entries?"

    You find them in [registry.properties](https://github.com/JetBrains/intellij-community/blob/master/platform/util/resources/misc/registry.properties).

!!! question "How can I access the recent projects list more easily?"

    - [A better "Recent Projects" menu](https://specificlanguages.com/posts/2022-03/22-better-recent-projects/){{ blog('sl') }}

!!! question "How can I create a class/component that MPS loads on demand?"

    Create a [lightweight service](https://plugins.jetbrains.com/docs/intellij/plugin-services.html#light-services) using the
    [@Service](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.components%28MPS.IDEA%2F%29%2F7879151873219801267) annotation. An example service *MyService* could then be accessed through `#!java ApplicationManager.getApplication().getService(MyService.class)`

!!! question "How do you add a custom action to a toolbar?"

    It is assumed that this is a toolbar group that is populated with custom actions. There is an `addJavaAction` that can be used in the ActionGroupDeclaration (example from [IETS3](http://127.0.0.1:63320/node?ref=r%3Ae3e5593b-dfcd-4a2e-b10f-f1ed4a43f093%28org.iets3.core.expr.plugin.plugin%29%2F4189697348346388716)), which lets you add objects of type AnAction like the ToggleAction in the example. You can circumvent the MPS action declarations this way.

    It is enough to extend AnAction and implement [CustomComponentAction](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.actionSystem.ex%28MPS.IDEA%2F%29%2F%7ECustomComponentAction) for custom swing components. Before implementing this, search the IntelliJ/MPS code base for such classes. There are, for example, [TextFieldAction](https://github.com/JetBrains/intellij-community/blob/master/platform/vcs-api/src/com/intellij/openapi/vcs/ui/TextFieldAction.java) and [JButtonAction](https://github.com/JetBrains/intellij-community/blob/master/platform/vcs-impl/src/com/intellij/util/ui/JButtonAction.kt). Search for [Button|Text|..]Action in MPS to find such instances and look for existing components in the UI that look like the ones you need.

     [Actions | IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/basic-action-system.html) contains
     the general documentation for IntelliJ actions.

!!! question "How to make messages in the [messages view](https://www.jetbrains.com/help/mps/logging.html) clickable?"

    Technically, the messages view is an MPS tool unrelated to the IntelliJ platform. The message statement has a throwable parameter that you can used to attach exceptions. In the generator, there is `genContext.show error <messageText> -> <node>` which takes a message and a node. In MPS 2022.3, there is also support for a `hintObject` in the message statement so you can jump directly to a node, model, or module.


## Message Bus and Listeners (Message Interface)

Reference:

  - [IntelliJ Messaging Infrastructure](https://plugins.jetbrains.com/docs/intellij/messaging-infrastructure.html)
  - [Declarative registration of Plugin Listeners](https://plugins.jetbrains.com/docs/intellij/plugin-listeners.html)

You can use a message bus to listen for IntelliJ or custom events and send out events. You connect and subscribe to different topics through listeners.
You don't have to store and remove each listener you added; you can disconnect from the bus. Find topics on the
MPS console with the following code:

```java
#nodes<scope = global>.ofConcept<StaticFieldDeclaration>.where(
    {~it => it.type.isInstanceOf(ClassifierType) && it.type:ClassifierType.?classifier.?name.?equals("Topic"); 
    }
)
```

Example:

```java
class MessageBusExample {
    void connect() {
      this.busConnection = ideaProject.getMessageBus().connect();
      FileEditorManagerListener myListener = new FileEditorManagerListener() { // implement listener (1)
        @Override
        public void selectionChanged(@NotNull() FileEditoManagerEvent event) {
          // code
        }
      };
      this.busConnection.subscribe(FileEditorManagerListener.FILE_EDITOR.MANAGER, myListener);       
    }
}
```

1. You have to implement `selectionChanged` for this listener.