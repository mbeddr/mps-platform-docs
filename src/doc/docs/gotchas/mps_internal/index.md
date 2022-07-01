!!! question "How to I start using MPS' Open API?"
    Specific Languages Blog &mdash; [The simplest way to use MPS Open API](https://specificlanguages.com/posts/simplest-way-to-use-mps-open-api/){target=_blank}

!!! question "How to I get MPS core components from code?"

    From the console:
    ``` Java
    MPSProject p = ((MPSProject) #project); 
    Platform host = (Platform) p.getPlatform();
    #print host.findComponent(MakeServiceComponent.class);
    ```
!!! question "How to I convert between different Project classes?"
    Use the class [ProjectHelper](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.project%28MPS.Platform%2F%29%2F%7EProjectHelper).

!!! warning "I want to change something inside a SModule such as adding a dependency but can't find the right method."
    Try casting it to [AbstractModule](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.project%28MPS.Core%2F%29%2F%7EAbstractModule) first.

!!! question "How does class loading work in MPS?"
    See [this comment](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.classloading%28MPS.Core%2F%29%2F9026887257679817888),
    [Dependencies and Classpath in MPS](https://github.com/mbeddr/mbeddr.core/wiki/MPS:-Deps-and-Classpath) and [classloading issues](https://github.com/mbeddr/mbeddr.core/wiki/Misc-Topics#classloading-issues).


!!! question
!!! question "Is there a way to start two instances of MPS, each with its own cache/state?"

    You can create a copy of you MPS installation and edit the idea.properties file in the bin directory. 
    Changing idea.system.path should allows you start a second instance with dedicated caches/state. 
    If you don’t want to share any configuration also update idea.config.path.

!!! question "How do I get an icon for a concept?"

    Call `GlobalIconManager.getInstance().getIconFor(concept)`.

!!! question "Where can I find builtin icons?"

    IntelliJ IDEA icons are declared in the class [AllIcons](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.icons%28MPS.IDEA%2F%29%2F%7EAllIcons).
    MPS icons are declared in the class [MPSIcons](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.icons%28MPS.Platform%2F%29%2F%7EMPSIcons).

!!! info "I have settings that I want to save globally[^1]."

    Preferences can be only used at the project level. Use the workaround described in [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/115000568670-Create-and-access-a-single-Preference-Component-which-is-common-for-all-projects)
    or save your values in the global IntelliJ IDEA [Registry](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.util.registry%28MPS.IDEA%2F%29%2F%7ERegistry).
    More information about the Registry can be found in [this Stack Overflow post](https://stackoverflow.com/questions/28415695/how-do-you-set-a-value-in-the-intellij-registry).
    It can also be shown programmatically by calling `new RegistryUi().show()`.

!!! question "How can I call make or rebuild?"
    
    Use need to use [MakeActionImpl](http://127.0.0.1:63320/node?ref=r%3Acfccec82-df72-4483-9807-88776b4673ab%28jetbrains.mps.ide.make.actions%29%2F8610665572788515237). Example usuages
    can be found in the same model.

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

!!! question "How to I add widgets to the status bar? (memory indicator, save transient models...)"

    Have a look at [this answer](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360001511080/comments/360000230120). 
    Make sure to call this code from a [project plugin](https://www.jetbrains.com/help/mps/plugin.html#custompluginparts(projectplugin,applicationplugin)).

!!! question "How to I display a message in the status bar? (left bottom corner)"
    Note: The message might not be visible by calling from the console, because the rebuild of the model already shows a message:
    `WindowManager.getInstance().getStatusBar(ProjectHelper.toIdeaProject(#project))`

!!! question "How can I register an IntelliJ extension?"

    Find the interface you want to add an extension on [this page](https://plugins.jetbrains.com/docs/intellij/extension-point-list.html).
    The corresponding interface has a static field `EP_NAME`. If the interface is implemented in Kotlin it might have a static field `Companion` with a `getEP_NAME()` method. Extend this interface (EX) and register it through the extension point.
    Example: `Interface.EP_NAME.getPoint().registerExtension(new Ex())`

!!! question "How can I add a status bar widget?"

    Implement the interface `StatusBarWidgetFactory` and register it through the StatusBarWidgetFactory.EP_NAME extension point.

!!! question "How can I react to selection changes in the editor?"

    editorContext.getSelectionManager().addSelectionListener(new SingularSelectionListenerAdapter() { ... })

!!! question "How to I add model imports and used languages programmatically?"
    Specific Languages Blog &mdash; [Adding model imports and used languages programmatically](https://specificlanguages.com/posts/adding-model-imports-and-used-languages-programmatically/){target=_blank}

!!! question "How do I run MPS code from the command line/CI?"
    - Specific Languages Blog &mdash; [Running MPS code from command line](https://specificlanguages.com/posts/2021-02/09-running-mps-code-from-command-line/){target=_blank}
    - Specific Languages Blog &mdash; [Running code in MPS on CI](https://specificlanguages.com/posts/2022-02/28-running-code-in-mps-on-ci/){target=_blank}

!!! question "How can I render a node as text?"
    Specific Languages Blog &mdash; [Rendering a node as text](https://specificlanguages.com/posts/2022-02/04-rendering-node-as-text/){target=_blank}

!!! question "How can I associate additional information with a node?"
    Specific Languages Blog &mdash; [Associating additional information with a node](https://specificlanguages.com/posts/2022-02/07-associating-information-with-a-node/){target=_blank}

!!! question "How does shrinking of absolute paths work?"
    Specific Languages Blog &mdash; [Shrinking of absolute paths](https://specificlanguages.com/posts/2022-02/24-shrinking-of-absolute-paths/){target=_blank}

[^1]: https://mps-support.jetbrains.com/hc/en-us/community/posts/115000568670-Create-and-access-a-single-Preference-Component-which-is-common-for-all-projects
