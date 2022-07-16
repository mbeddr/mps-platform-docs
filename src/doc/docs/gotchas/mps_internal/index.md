!!! warning "My project is not a project"

    > I want to call `GenerationCheckHelper.checkModelsBeforeGenerationIfNeeded` to check my model. It that takes a `Project` but my `Project` that I get  as an action context isn't the correct project. The type system complains that it's not the correct class. 
    >
    > How do I get the correct project class?

    The two `Project` interfaces  are always a source of confusion. Essentially one comes from the IntelliJ platform and the other one holds MPS specific parts of the project.

    `com.intellij.openapi.project.Project`:  The project from the platform is stores basic information like the folder where the project is located and give access to project plugins for instance.
    
    `jetbrains.mps.project.Project`: MPS specific aspects of a project like model access or the repository. It also gives access to the modules (languages and solutions) of the project.
    
    To get the *MPS Project* from a *Idea Project* use `ProjectHelper.fromIdeaProject`.
    
    To the a *Idea Project* from the *MPS Project* case the interface to `MPSProject`, if you only have a `jetbrains.mps.project.Project`, and then call `getProject` on it.

    {{ contribution_by('coolya') }}

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

!!! question "Is there a way to start two instances of MPS, each with its own cache/state?"

    You can create a copy of you MPS installation and edit the idea.properties file in the bin directory. 
    Changing idea.system.path should allows you start a second instance with dedicated caches/state. 
    If you don’t want to share any configuration also update idea.config.path.


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

!!! question "How can I retrieve nodes of other models and modules?"

    `model.nodesIncludingImported` returns all nodes including the ones from other models that are currently imported. 


!!! question "How can I make an internal MPS editor being read-only?"

    > Given I want to make a contribution to a generator the `j.mps.lang.editor`.
    > When I download the [MPS source](https://github.com/JetBrains/MPS), open the project in MPS under `code`
    > and open `j.m.l.editor/SubstituteMenuPart_ReferenceScope_declare`, then I see the model being read-only. What can I do?

    You need to open MPS in IDEA (Community Edition is enough), compile and run it from there, then you can edit MPS sources. There are instructions in [README](https://github.com/JetBrains/MPS).

??? question "How do I do a fulltext search in MPS?"

    > I sometimes need a textual search which MPS doesn't provide out of the box.

    > In that situation, I am unsure of the concept and type of what I see, so a top-down search is not an option. Instead I would like to search for that string to have a starting point for my investigation.

    > Examples:

    > - I want to investigate in an editor in the user interface and don't want to reverse engineer what hints, editors and concepts lead to what I see.
    > - Behavioral view code, like custom cells, swing cells or querylists make it hard to figure out where the source logic of that is located.
    > - when the console shows something I don't understand, I'd like to see its context source code, so that I can figure out what to do next.

    **Option 0**: Use Language Debugging facilities of MPS instead.

    For built-in languages, MPS brings a load of dedicated debugging facilities:

    - Debugging **editor cells and nodes**: When you right-click an item in the editor, you can find a submenu "Language Debug".
    - Debugging **menu entries**: Select an item that you're curious in and press CMD+Alt+B (Ctrl+Alt+B) to open the _Menu Trace_ of it.
    - Setup and an IntelliJ and connect it to step through java code.

    **Option 1**: Search for literals from console.

    **Option 2**: Search through serialized Java.

    1. Set up IntelliJ with your project.
    2. Hit CMD+Shift+F (Ctrl+Shift+F) to search in path.
    3. When you found a class of interest, open it in MPS via CMD+N (Ctrl+N). The source node usually has a similar name.

    This is great for finding editor nodes, for example, if that java class is named `Vehicle_EditorBuilder`, your source node was an editor for the `Vehicle` concept.

    **Last Resort**: Search XML model directly

    Use this only if you have no Assembly and your project doesn't open. The serialized API is subject to change and using this should be the last barrier.

    Then I use `ack` on the command line to find the relevant models that contain this string. The output even contains the node id though, as in this example:

    ```
    $ ack "ack com.mbeddr.mpsutil.grammarcells"
    …
    <node concept="3bR9La" id="1aL6sVX49Cb" role="1SiIV1">
        <property role="3bR36h" value="false" />
        <ref role="3bR37D" to="90a9:F1NWDqq_DA" resolve="com.mbeddr.mpsutil.grammarcells.runtime" />
    </node>
    …
    ```

    Use `#!java new IdEncoder().parseNodeId("1aL6sVX49Cb")` to get the node id.
    This will print the corresponding node to console. Clicking it will open in in MPS:

    ```java
    #nodes.where({~it => 
    boolean equals = false; 
    try { 
        equals = it/.getNodeId().equals(new IdEncoder().parseNodeId("1aL6sVX49Cb")); 
    } catch (Exception e) { 
        <no statements> 
    } 
    return equals; 
    })
    ```

??? question "How to get rid of 'Error: Shall specify a repository to lock'?"
    > When accessing model properties in rendering code, I must encapsulate the model accessing code in a read action:
    
    > ![read action missing repository](read_action_missing_repository.png)
    
    > It always has an error "Error: Shall specify a repository to lock". How can I get rid of it?
    > What is a 'repository' and is there any documentation that explains the concept and how to use it correctly?

    {{ question_by('cwalesch') }}

    The repository is what is represented as the "modules pool" in the UI. It contains all the dependencies currently visible. At the moment there is only one global repository which causes several problems. MPS is slowly but steadily moving to project specific repositories. That would mean each project (window) of MPS would have it's own separate repository. 

    To get the repository you will need access to the project. e.g. the editor context will give you access to the repository: `editorContext.getRepository()`.
    
    In other cases for instance when you don't have an editor context directly available you need to make sure that from UI (action) you pass the project or repository though to the place where you need it.

    {{ answer_by('coolya') }}

??? question "How can I get an identifier of a node?"

    > Given I have a node myNode and I need to serialize something that identifies it.
    > When I serialize that something and then deserialize that identifier again, then I will find exactly that node.
    > How can I build such a thing?

    **Option 1**: PersistenceFacade Id

    Since the url does not look nice; you may use this combined string of model-id and node id that is used for the Url. For that, import the class `org.jetbrains.mps.openapi.persistence.PersistenceFacade` from the _MPS.OpenApi_ stub and run:
    
    ```java
    # serialize identifier
    string mySerializedId = SNodePointer.serialize(node/.getReference())
    
    # find node based on serialized identifier
    node<> myFoundNode = SNodePointer.deserialize(mySerializedId).resolve(repository)
    
    # then, node == myFoundNode
    ```

    **Option 2**: Url
    
    Import the `httpsupport` language and use `node.getURL`. This will be a url that you can use locally to open this node. It includes the node id and the model and thus is a pretty good globally unique id.
    
    This id is a local URL and looks odd though: `http://127.0.0.1:63320/node?ref=r%3A4bc03cd1-b1e3-49da-84da-f27e7062f6f7%28integrityOfUpdate%29%2F2209769512593382448&project=SecurityAnalyst`. Especially the code to find the node again based on this url contains some grepping then.
    
    **Option 3**: Node Id
    
    Use `#!java node/.getNodeId().toString()` it will yield the nodes id. Note that a nodeid is **only unique within this model**. If it should be globally unique, consider the next options.
    
    You could also deserialize this again somehow, but I don't have at hand, how.

    {{ contribution_by('abstraktor') }}

??? question "Where does MPS store preferences?"

    For a starting point, read [Directories used by the IDE](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html).
    `CONFIG_DIR` refers to the configuration directory. `WORKSPACE_FILE` refers to `$PROJECT/.mps/workspace.xml``

    - refactoring settings: `CONFIG_DIR/options/refactoringSettings.xml`
    - override/implement setttings: `WORKSPACE_FILE/OverrideImplementMethodComponent`
    - additional libraries: `CONFIG_DIR/options/AdditionalLibrariesManager.xml`
    - default search options: `WORKSPACE_FILE/DefaultSearchOptions3`
    - make configuration: `WORKSPACE_FILE/mpsMakeService`
    - code style settings: `CONFIG_DIR/options/codeStyleSettings.xml`
    - break point settings: `WORKSPACE_FILE/BreakpointViewSettings`
    - migration state: `WORKSPACE_FILE/MigrationProperties`
    - model validation settings: `CONFIG_DIR/options/mpsModelValidationSettings.xml`
    - concept editor settings: `WORKSPACE_FILE/ConceptEditorHintSettings`
    - node search history: `WORKSPACE_FILE/NodeEditorSearchHistory`
    - project libraries: `WORKSPACE_FOLDER/libraries.xml`
    - bookmarks: `WORKSPACE_FILE/BookmarksTool`
    - project view: `WORKSPACE_FILE/ProjectView`
    - blame dialog: `CONFIG_DIR/options/charismaBlameDialog.xml`
    - compiler settings: `WORKSPACE_FOLDER/compiler.xml`
    - model checker settings: `CONFIG_DIR/options/modelCheckerSettings.xml`
    - modules: `WORKSPACE_FOLDER/modules.xml`
    - project plugin settings: `WORKSPACE_FILE/ProjectPluginManager`
    - generation settings: `CONFIG_DIR/options/generationSettings.xml`
    - console history: `WORKSPACE_FILE/ConsoleHistory`
    - break points: `WORKSPACE_FILE/BreakpointManager`
    - bookmarks: `WORKSPACE_FILE/MPSBookmarkManager`
    - messages view tool settings: `WORKSPACE_FILE/MessagesViewTool`
    - usages view tool settings: `WORKSPACE_FILE/UsagesViewTool`
    - disabled intentions: `CONFIG_DIR/options/intentions.xml`
    - editor settings: `CONFIG_DIR/options/mpsEditor.xml`
    - migration trigger settings: `WORKSPACE_FILE/MigrationTrigger`

[^1]: https://mps-support.jetbrains.com/hc/en-us/community/posts/115000568670-Create-and-access-a-single-Preference-Component-which-is-common-for-all-projects
