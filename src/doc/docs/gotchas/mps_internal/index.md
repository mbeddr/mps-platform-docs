# CoreComponent

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

!!! question "What interesting MPS utility classes can I use in my code?"
    - [DirUtil](http://127.0.0.1:63320/node?ref=r%3Af8580193-afc4-4673-a635-d4757ca591cf%28jetbrains.mps.internal.make.runtime.util%29%2F6106640680373200863) - directory related utilities
    - [MatchingUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.lang.pattern.util%28MPS.Core%2F%29%2F%7EMatchingUtil) - check if two nodes match
    - [SubtypingUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.newTypesystem%28MPS.Core%2F%29%2F%7ESubtypingUtil) - subtyping related utilities
    - [CopyUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel%28MPS.Core%2F%29%2F%7ECopyUtil) - utility for copying models, nodes etc.
    - [FileUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7EFileUtil) - file related utilities
    - [JavaNameUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7EJavaNameUtil) utilities related to java naming
    - [NameUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7ENameUtil) - name related utilities such as pluralizing or escaping strings
    - [CopyPasteUtil](http://127.0.0.1:63320/node?ref=r%3A84719e1a-99f6-4297-90ba-8ad2a947fa4a%28jetbrains.mps.ide.datatransfer%29%2F6299533519672638253)/[TextPasteUtil](http://127.0.0.1:63320/node?ref=r%3A84719e1a-99f6-4297-90ba-8ad2a947fa4a%28jetbrains.mps.ide.datatransfer%29%2F6299533519672652334) - copy paste related utilities
    - [ActionUtils](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.workbench.action%28MPS.Platform%2F%29%2F%7EActionUtils) - action related utilities; can be used to execute an action programmatically
    - [NewModuleUtil](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895904ab%28jetbrains.mps.ide.newSolutionDialog%29%2F5890305283801268194) - utilities related to created new modules such as creating solutions or languages
    - [TemporaryModels](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel.tempmodel%28MPS.Core%2F%29%2F%7ETemporaryModels) - utilities for creating temporary models
    - [UIUtil](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.util.ui%28MPS.IDEA%2F%29%2F%7EUIUtil) - utilities related to the Intellij UI such as checking for dark mode (isUnderDarcula()).
    - [PathManager](http://127.0.0.1:63320/node?ref=r%3A067fd2c9-d009-4506-91db-a69992d65964%28jetbrains.mps.tool.common%29%2F4774692914340655529)/[PathManager](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.application%28MPS.IDEA%2F%29%2F%7EPathManager) - classes for getting all kind of paths such as the plugins folder or the log folder.

!!! warning "I want to change something inside a SModule such as adding a dependency but can't find the right method."
    Try casting it to [AbstractModule](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.project%28MPS.Core%2F%29%2F%7EAbstractModule) first.

!!! question "How does class loading work in MPS?"
    See [this comment](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.classloading%28MPS.Core%2F%29%2F9026887257679817888),
    [Dependencies and Classpath in MPS](https://github.com/mbeddr/mbeddr.core/wiki/MPS:-Deps-and-Classpath) and [classloading issues](https://github.com/mbeddr/mbeddr.core/wiki/Misc-Topics#classloading-issues).

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
