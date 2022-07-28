# IntelliJ SDK

- [Introduction to creating IntelliJ IDEA plugins](https://developerlife.com/2020/11/21/idea-plugin-example-intro/)
- [Advanced guide to creating IntelliJ IDEA plugins](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/)
    - IDEA thread modeling (for example: `invokeLater`), PSI, Virtual Files, Dynamic plugins, UI

!!! question "Where can you find a list of all IntelliJ registry entries?"

    They can be found in [registry.properties](https://github.com/JetBrains/intellij-community/blob/master/platform/util/resources/misc/registry.properties).

## Listeners and message bus

### Message bus (message interface)

- listens for IntelliJ events/messages
- connection and subscription for different topics through listeners
- Just disconnect, you have not to store and remove each listener you added.
- Reference
    - [IntelliJ Messaging Infrastructure](https://plugins.jetbrains.com/docs/intellij/messaging-infrastructure.html)
    - [Declarative registration of Plugin Listeners](https://plugins.jetbrains.com/docs/intellij/plugin-listeners.html)
- Topics
    - AppTopics
    - ProjectTopics
    - Further Topics (through MPS console with checkeddots imported)
        - `#!java #nodes<scope = global>.ofConcept<StaticFieldDeclaration>.where({~it => it.type.isInstanceOf(ClassifierType) && it.type:ClassifierType.?classifier.?name.?equals("Topic"); })`

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