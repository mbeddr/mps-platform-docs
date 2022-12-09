---
tags:
- openapi
---

!!! question "How do you get an icon for a concept?"

    ```java
    GlobalIconManager.getInstance().getIconFor(concept)
    ```

!!! question "How can you copy a language without the new one having duplicate model IDs?"

    ```java
    { =>
    SModule sm = module/module1;
    SModule tm = module/module2;

    map<SNode, SNode> node = new hashmap<SNode, SNode>;

    foreach aspect in LanguageAspect.values {
        SModel s = aspect.get((Language) sm);
        SModel t = aspect.get((Language) tm);
        if(s != null && t!= null) {
            foreach r in new arraylist<SNode>(copy: t.getRootNodes()) {
                ((node<>) r).detach;
            }
            foreach r in CopyUtil.copyAndPreserveId((((sequence<SNode>) s,getRootNodes())).toList, node) {
                t.addRootNode(r)
            }
        }
    }
    }.invoke()
    ```

!!! question "How can you change the default project directory?"

    Put the following code in an application plugin:
    ```java
    // set default project location 
    string defaultProjectDir = Paths.get(System.getProperty("user.home"), "NewProjectDir").toString();
    GeneralSettings.getInstance().setDefaultProjectDirectory(defaultProjectDir);
    ```

!!! question "How can you execute an MPS action programmatically?"

    Use [ActionUtils](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.workbench.action%28MPS.Platform%2F%29%2F%7EActionUtils) to create an event and to run the action:
    
    ```java
    # cast to EditorContext class
    DataContext dataContext = DataManager.getInstance().getDataContext(((EditorContext) editorContext).getNodeEditorComponent()); 
    AnActionEvent event = ActionUtils.createEvent(ActionPlaces.EDITOR_TAB, dataContext); 
    ActionUtils.updateAndPerformAction(action<openHtmlReport>, event);
    ```
    
    Since this is based on IDEA components, we need to get the `getNodeEditorComponent`, which is not part of the openapi. That's why we need to downcast it to the EditorComponent class.

    Note: `action<…>` comes from the ^^jetbrains.mps.lang.plugin^^ language.

!!! question "How to shutdown MPS programmatically?"

    In normal conditions one can use `#!java ApplicationManager.getApplication().exit()`. If this doesn't work, an exception
     can be thrown on purpose. 

!!! question "How can you react to opening and closing of projects?"

    Register a {{ mps_url("jetbrains.mps.project.ProjectManagerListener") }} in a plugin via the class 
    {{ mps_url("jetbrains.mps.project.ProjectManager") }}.

!!! question "How do you change a model without creating an undo entry?"

    > Example: Setting a property (=flag) via a button.

    ```java
    repository.getModelAccess().executeUndoTransparentCommand()
    ```

!!! question "How do you work with temporary models?"

    ```java
    try { 
    undo-transparent command with this.mpsProject.getRepository() {
    tmpModel = TemporaryModels.getInstance().createReadOnly(TempModuleOptions.forDefaultModule());
    tmpModel.addRootNode(type);
    TemporaryModels.getInstance().addMissingImports(tmpModel);
    }
    // do something with the node
    } finally {
        undo-transparent command with this.mpsProject.getRepository() {
            tmpModel.removeRootNode(type);
            TemporaryModels.getInstance().dispose(tmpModel);
        }
    }
    ```

!!! question "How can you react to selection changes in the editor?"

    ```java
    editorContext.getSelectionManager().addSelectionListener(new SingularSelectionListenerAdapter() { ... })
    ```

!!! question "How can I delete a model in a module programmatically?"

    Get the model-to-be-deleted as SModel (interface) and use `#!java new ModelDeleteHelper(model).delete();`
    For more context see: [DeleteModeHelper](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/workbench/actions/model/DeleteModelHelper.java)

!!! question "How can you add a language to the *Used Languages* settings of a model programmatically?"

    - Module level: `#!java ((AbstractModule) moduleA).addDependency(moduleB.getModuleReference(), false)`
    - Model level: `#!java new ModelImports(model).addUsedLanguage(language)`

    To get the language from a reference, you can call: `MetaAdapterFactory.getLanguage(moduleRef)`.

!!! question "Can a node pointer point to non-root nodes?"

    Yes, for example:

    ```java
    node-ptr/Integer->parseInt->radix/
    ```

!!! question "How can you create an MPS Language programmatically and add it to the current project?"

    ```java
    NewModuleUtil.createLanguage(namespace, rootPath, project, saveProject)
    ```

!!! question "How do I save my project(s)?"

    Use `SRepository.saveAll()`.

    For a single project, e.g. `ProjectHelper.getProjectRepository(project).saveAll();`

    For all opened projects, e.g.
    
    ```Java
    foreach project in com.intellij.openapi.project.ProjectManager.getInstance().getOpenProjects() { 
      jetbrains.mps.ide.project.ProjectHelper.getProjectRepository(project).saveAll(); 
    }
    ```

    {{ contribution_by('aquapp') }}