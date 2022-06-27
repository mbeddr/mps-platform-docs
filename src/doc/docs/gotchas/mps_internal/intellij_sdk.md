# IntelliJ SDK

## Listeners and Message Bus

### Message Bus (Message Interface)

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
```java linenums="1"
this.busConnection = ideaProject.getMessageBus().connect();
FileEditorManagerListener myListener = new FileEditorManagerListener() { // implement listener (1)
    @Override
    public void selectionChanged(@NotNull() FileEditoManagerEvent event) {
        // my code
    }
}
this.busConnection.subscribe(FileEditorManagerListener.FILE_EDITOR.MANAGER, myListener);
```

1. `selectionChanged` must be implemented for this listener