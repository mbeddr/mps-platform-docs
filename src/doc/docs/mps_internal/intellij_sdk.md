---
tags:
- internals
- intellij
---

# IntelliJ SDK

## Existing documentation

The best place to learn more about the IntelliJ platform is the [IntelliJ Platform SDK documentation](https://plugins.jetbrains.com/docs/intellij/welcome.html).
Two additional resources are also helpful if you want to understand how IntelliJ plugins are written ([Introduction to creating IntelliJ IDEA plugins](https://developerlife.com/2020/11/21/idea-plugin-example-intro/)), and how the IDEA threading model works([Advanced guide to creating IntelliJ IDEA plugins](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/)).

Some parts of MPS are different to the IntelliJ platforms and therefore those chapters are not relevant: [PSI](https://plugins.jetbrains.com/docs/intellij/psi.html) + all text editor-specific code and [custom languages support](https://plugins.jetbrains.com/docs/intellij/custom-language-support.html)

!!! question "Where can you find a list of all IntelliJ registry entries?"

    They can be found in [registry.properties](https://github.com/JetBrains/intellij-community/blob/master/platform/util/resources/misc/registry.properties).

!!! question "How can I access the recent projects list more easily?"

    - [A better "Recent Projects" menu](https://specificlanguages.com/posts/2022-03/22-better-recent-projects/){{ blog('sl') }}

!!! question "How can I create a class/component that is loaded on demand?"

    Create a [lightweight service](https://plugins.jetbrains.com/docs/intellij/plugin-services.html#light-services) using the
    [@Service](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.components%28MPS.IDEA%2F%29%2F7879151873219801267) annotation. An example service *MyService* could then be accessed through `#!java ApplicationManager.getApplication().getService(MyService.class)`

## Message bus and listeners (message interface)

Reference:

  - [IntelliJ Messaging Infrastructure](https://plugins.jetbrains.com/docs/intellij/messaging-infrastructure.html)
  - [Declarative registration of Plugin Listeners](https://plugins.jetbrains.com/docs/intellij/plugin-listeners.html)

A message bus can be used to listen for IntelliJ or custom events and also sending out events. You connect and subscribe to different topics through listeners.
You don't have to store and remove each listener you added, you can just disconnect from the bus. Topics can be found on the
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