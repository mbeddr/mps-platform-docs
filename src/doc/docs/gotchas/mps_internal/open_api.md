!!! question "How do I get an icon for a concept?"

    Call `GlobalIconManager.getInstance().getIconFor(concept)`.

!!! question "How can you copy a language without the new one having duplicate model IDs?"

    Try the following code:

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

!!! question "How can a change the default project directory?"

    Put the following code in an application plugin:
    ```java
    // set default project location 
    string defaultProjectDir = Paths.get(System.getProperty("user.home"), "NewProjectDir").toString();
    GeneralSettings.getInstance().setDefaultProjectDirectory(defaultProjectDir);
    ```

!!! question "How to execute an MPS action programmatically?"

    Use `ActionUtils` to create an event and to run the action:
    
    ```java
    # cast to EditorContext class
    DataContext dataContext = DataManager.getInstance().getDataContext(((EditorContext) editorContext).getNodeEditorComponent()); 
    AnActionEvent event = ActionUtils.createEvent(ActionPlaces.EDITOR_TAB, dataContext); 
    ActionUtils.updateAndPerformAction(action<openHtmlReport>, event);
    ```
    
    Since this is based on IDEA components, we need to get the `getNodeEditorComponent`, which is not part of the openapi. That's why we need to downcast it to the EditorComponent class.

    Note: `action<…>` comes from the `jetbrains.mps.lang.plugin` language.

!!! question "How to "shutdown" MPS programmatically?"

    In normal conditions one can use `#!java ApplicationManager.getApplication().exit()`. If this doesn't work an exception
     may be thrown on purpose. 

!!! question "How do I modify an MPS model without creating an undo entry?"
> Example: Setting a property (=flag) via a button.

    Execute: `#!java repository.getModelAccess().executeUndoTransparentCommand()`

!!! question "How do I work with temporary models?"

    ```
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

!!! question "How can I react to selection changes in the editor?"

    `#!java editorContext.getSelectionManager().addSelectionListener(new SingularSelectionListenerAdapter() { ... })`

!!! question "How can I delete a model in a module programmatically?"

    Get the model-to-be-deleted as SModel (interface) and use `#!java new ModelDeleteHelper(model).delete();`
    For more context see: [DeleteModeHelper](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/workbench/actions/model/DeleteModelHelper.java)

!!! question "How can I add a language to the "Used Languages" settings of a model programmatically?"

    - Module level: `#!java ((AbstractModule) moduleA).addDependency(moduleB.getModuleReference(), false)`
    - Model level: `#!java new ModelImports(model).addUsedLanguage(language)`

    To get the language from a reference, you can call: `MetaAdapterFactory.getLanguage(moduleRef)`.

!!! question "Can a node-ptr point to non-root nodes?"

    Yes: `#!java node-ptr/Integer->parseInt->radix/`

!!! question "How can I create a MPS Language programatically and add it to the current project?"

    `#!java NewModuleUtil.createLanguage`