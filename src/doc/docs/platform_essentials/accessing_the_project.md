There are a lot of of different ways to get the MPS/IntelliJ project, some of them are hacks that should be avoided. This page
only lists the recommended approaches on purpose. There are only a few useful methods in the project class. Namely, access to scope, repository, and core components. The idea is that user-triggered actions take what's necessary (e.g. a command lock) and then the code down the execution path shall not care to take one.

## What Are the Different Project Classes?

- *com.intellij.openapi.project.Project*: a [project](https://plugins.jetbrains.com/docs/intellij/project.html) in the IntelliJ platform. There are [different ways](https://plugins.jetbrains.com/docs/intellij/project.html#how-to-get-a-project-instance) to access the project instance, most of them are not available in MPS. Every time you interact with the IntelliJ platform, you need this class.
- *org.jetbrains.mps.openapi.project.Project*: the MPS equivalent of a project. It provides access to the repository, its name and modules, and to the model access class for reading and writing models
- *jetbrains.mps.project.Project*:  MPS Project abstraction. The project may rely on the idea Project or not. It has a scope and a corresponding project repository to store modules in it.
- *jetbrains.mps.project.ProjectBase*: MPS Project basic implementation. This project is tied to the MPS platform and gives access to the MPS core platform and components it comprises.
- *jetbrains.mps.project.MPSProject*: represents a project based on the idea platform project. It is in use in MPS as an IDEA plugin. The method `getProject()` returns the IntelliJ project.
- *jetbrains.mps.project.StandaloneMPSProject*: this class is for MPS as a standalone IDE. `#project` on the MPS console returns an instance of this class.

## Places

There are a few different places where you might need access to a project. Not all of them can access it.

### Actions

[Actions](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups) provide access to the MPS/IntelliJ project,
the project frame, her information via action context parameters. The official documentation also explains the classes that 
need to be imported to access those. The available actions can be found on the page [[reference-actions|Actions | Reference]].
There is no need to convert between different project classes because all parameters are available.

### Editor

This is also explained on the Specific Languages blog: [How to get the current MPS project from within the editor](https://specificlanguages.com/posts/how-to-get-current-project-from-editor/). Components in the IntelliJ platform can implement the interface [DataProvider](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.actionSystem%28MPS.IDEA%2F%29%2F%7EDataProvider)
to provide data that can be accessed through the [DataManager](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.ide%28MPS.IDEA%2F%29%2F%7EDataManager) class. A common data provider is the editor component, actions also support the DataManager:

```java
Component editorComponent = (Component) editorContext.getEditorComponent();
MPSProject project = MPSDataKeys.MPS_PROJECT.getData(DataManager.getInstance().getDataContext(component));
```
This is the recommended way to access the project in the editor or in Java Swing component cells. The following simpler approach
also works but depends on implementation details that might change in the future:

```java
Project project = ProjectHelper.getProject(editorContext.getRepository());
```

For most features like transformation menus, style sheets, and action maps, the editor context is available.

### Intentions

Intentions always have the `editorContext` available and can access the project the same way as the editor. If you need to
access the project or other context information, you might also want to consider using an action instead. Actions can be shown
in the right-click menu of the editor if you need them closer to the editor.

### Tests

In tests, the `project` expression is available, although it should be rarely needed except when invoking the generator or resolving
nodes through the global repository.

### Plugin Solution/Plugin Aspect

If you need access the project object, you can use a project plugin where an `MPSProject` instance is available in the init and dispose block.
The instance can be passed to other classes as well. To get the IntelliJ project use `#!java ProjectHelper.toIdeaProject(project)`.

### Other Places

Some low-level code, like behaviors, are not supposed to start a command or interact with the UI (where some dialogs require the project/IDE frame). There's always a project for user-triggered actions, and this is the moment proper command access gets started, and various UI stuff happens. It's wrong to invoke some behavior that would try to guess the project down the road. Normally, there also should not be a need to access the project in the generator.

### Code to Avoid

- guessing the project through `#!java ProjectManager.getInstance().getOpenedProjects()`
- guessing the project through the owners of `(MPSModuleRepository) (model/.getRepository())`
- accessing the project in an application plugin
- guessing the IntelliJ project through the WindowManager class

When you need to access the model from a different thread ([concurrent access](https://www.jetbrains.com/help/mps/open-api-accessing-models-from-code.html#concurrentaccess)) it might be tempting to write the following code that doesn't work:

```java
command with node.model/.getRepository() {
    
}
```

It will fail with the following exception: `GlobalModelAccess does not support actions that require a command to run. One needs a project to run such actions`. In those cases, it is possible to access the project and write `project.getRepository()`. Use one of the mentioned methods and don't guess the project. Ask yourself: do I need to invoke the code here or is there a better place to invoke it?

### Exceptions

- [Model listeners](https://jetbrains.github.io/MPS-extensions/extensions/utils/model-listener/) don't have access to the project.
- The project is necessary for project-wide find usage/project scope.
- The class [ProjectHelper](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.project%28MPS.Platform%2F%29%2F%7EProjectHelper) can be used to convert between different projects, SRepository instances, and frames.