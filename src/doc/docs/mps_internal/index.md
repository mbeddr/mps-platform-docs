---
tags:
- internals
---

!!! question "How do you get started using MPS' Open API?"
    
    [The simplest way to use MPS Open API](https://specificlanguages.com/posts/simplest-way-to-use-mps-open-api/){{ blog('sl') }}

!!! question "How do you get MPS core components from code?"

    From the console:
    ``` Java
    MPSProject p = ((MPSProject) #project); 
    Platform host = (Platform) p.getPlatform();
    #print host.findComponent(MakeServiceComponent.class);
    ```

!!! info "I want to change something inside a *SModule*, such as adding a dependency, but I need help finding the right method."
    
    Try casting it to [AbstractModule](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.project%28MPS.Core%2F%29%2F%7EAbstractModule) first.

!!! question "Where can you find built-in icons?"

     The class [AllIcons](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.icons%28MPS.IDEA%2F%29%2F%7EAllIcons)
    declares all IntelliJ IDEA icons.
    The class [MPSIcons](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.icons%28MPS.Platform%2F%29%2F%7EMPSIcons) declares all MPS icons.

!!! question "How can you have settings that get saved globally?[^1]"

    You can use preferences only at the project level. Use the workaround described in [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/115000568670-Create-and-access-a-single-Preference-Component-which-is-common-for-all-projects)
    or save your values in the global IntelliJ IDEA [Registry](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.util.registry%28MPS.IDEA%2F%29%2F%7ERegistry).
    [This Stack Overflow post](https://stackoverflow.com/questions/28415695/how-do-you-set-a-value-in-the-intellij-registry)
    contains more information about the Registry.
    It can also be shown programmatically by calling `new RegistryUi().show()`.

!!! question "How can you call make or rebuild?"
    
    Use the class [MakeActionImpl](http://127.0.0.1:63320/node?ref=r%3Acfccec82-df72-4483-9807-88776b4673ab%28jetbrains.mps.ide.make.actions%29%2F8610665572788515237). You can find examples in the same model.

!!! question "How do you add widgets to the status bar? (for example, memory indicator, save transient models)"

    Have a look at [this answer](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360001511080/comments/360000230120). 
    Make sure to call this code from a [project plugin](https://www.jetbrains.com/help/mps/plugin.html#custompluginparts(projectplugin,applicationplugin)).

!!! question "How do you display a message in the status bar? (left bottom corner)"
    Note: The message might not be visible when executing the code from the console because the rebuild of the model overrides it with a new message:
    `WindowManager.getInstance().getStatusBar(ProjectHelper.toIdeaProject(#project))`

!!! question "How can I register an IntelliJ extension?"

    Find the interface you want to add an extension on [this page](https://plugins.jetbrains.com/docs/intellij/extension-point-list.html).
    The corresponding interface has a static field `EP_NAME`. If the interface is implemented in Kotlin, it might have a static field `Companion` with a `getEP_NAME()` method. Extend this interface (EX) and register it through the extension point.
    Example: `Interface.EP_NAME.getPoint().registerExtension(new Ex())`

!!! question "How can you add a status bar widget?"

    Implement the interface `StatusBarWidgetFactory` and register it through the StatusBarWidgetFactory.EP_NAME extension point.

!!! question "How do you add model imports and used languages programmatically?"
    [Adding model imports and used languages programmatically](https://specificlanguages.com/posts/adding-model-imports-and-used-languages-programmatically/){{ blog('sl') }}

!!! question "How can you run some MPS code from the command line/CI?"
    
    - [Running MPS code from the command line](https://specificlanguages.com/posts/2021-02/09-running-mps-code-from-command-line/){{ blog('sl') }}
    - [Running code in MPS on CI](https://specificlanguages.com/posts/2022-02/28-running-code-in-mps-on-ci/){{ blog('sl') }}

!!! question "How can you run generated code from within MPS?"

    [Run generated code from within MPS](https://specificlanguages.com/posts/2022-03/29-run-generated-code-from-within-mps/){{ blog('sl') }}

!!! question "How can you render a node as a text?"
    
    [Rendering a node as text](https://specificlanguages.com/posts/2022-02/04-rendering-node-as-text/){{ blog('sl') }}

!!! question "How can you associate more information with a node?"
     
    [Associating additional information with a node](https://specificlanguages.com/posts/2022-02/07-associating-information-with-a-node/){{ blog('sl') }}

!!! question "How does shrinking of absolute paths work?"
    
    [Shrinking of absolute paths](https://specificlanguages.com/posts/2022-02/24-shrinking-of-absolute-paths/){{ blog('sl') }}

!!! question "How can you retrieve nodes of other models and modules?"

    `model.nodesIncludingImported` returns all nodes, including those from other currently imported models. 

!!! question "How can you make an internal MPS editor read-only?"

    > I want to contribute to a generator in `j.mps.lang.editor`.
    > When I download the [MPS source](https://github.com/JetBrains/MPS), open the project in MPS under `code`,
    > and open `j.m.l.editor/SubstituteMenuPart_ReferenceScope_declare`, I see the model being read-only. What can I do?

    Open MPS in IDEA (Community Edition is enough), compile and run it from there, then you can edit MPS sources. There are instructions in [README](https://github.com/JetBrains/MPS).

??? question "How can you do a full-text search in the IDE?"

    > I sometimes need a textual search which MPS doesn't provide out of the box.

    > In that situation, I am still determining the concept and type of what I see, so a top-down search is not an option. Instead, I would like to search for that string to have a starting point for my investigation.

    > Examples:

    > - I want to investigate an editor in the user interface and avoid reverse engineering what hints, editors, and concepts lead to what I see.
    > - Behavioral view code, like custom cells, Java Swing cells, or query lists, makes it hard to figure out where the source logic of that is located.
    > - When the console shows something I don't understand, I'd like to see its context source code to figure out what to do next.

    **Option 0**: Use language debugging facilities of MPS instead.

    For built-in languages, MPS brings a load of dedicated debugging facilities:

    - Debugging editor cells and nodes: When you right-click an item in the editor, you can find a submenu *Language Debug*.
    - Debugging menu entries: Select an item you're curious about and press ++cmd+alt+b++/++ctrl+alt+b++ to open the *Menu Trace* of it.
    - Set up IntelliJ idea and connect it to step through Java code.

    **Option 1**: Search for literals from the console.

    **Option 2**: Search through serialized Java.

    1. Set up IntelliJ with your project.
    2. Hit ++cmd+shift+f++/++ctrl+shift+f++ to search in the path.
    3. When you find a class of interest, open it in MPS via ++cmd+n++/++ctrl+n++. The source node usually has a similar name.

    This option is great for finding editor nodes. For example, if that Java class is named *Vehicle_EditorBuilder*, your source node was an editor for the *Vehicle* concept.

    **Last Resort**: Search XML model directly.

    Use this only if you have no assembly and your project doesn't open. The serialized API is subject to change, and using this should be the last barrier.

    Then use *ack* (or a similar tool) on the command line to find the relevant models that contain this string. The output even contains the node ID, as in this example:

    ```
    $ ack "ack com.mbeddr.mpsutil.grammarcells"
    …
    <node concept="3bR9La" id="1aL6sVX49Cb" role="1SiIV1">
        <property role="3bR36h" value="false" />
        <ref role="3bR37D" to="90a9:F1NWDqq_DA" resolve="com.mbeddr.mpsutil.grammarcells.runtime" />
    </node>
    …
    ```

    Use `#!java new IdEncoder().parseNodeId("1aL6sVX49Cb")` to get the node ID.
    This line will print the corresponding node to the console. Clicking it will open in MPS:

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

??? question "How to eliminate the error: Shall specify a repository to lock?"

    > When accessing model properties in rendering code, you must encapsulate the model accessing code in a read action:
    
    > ![read action missing repository](read_action_missing_repository.png)
    
    > It always has an error "Error: shall specify a repository to lock". How can I get rid of it?
    > What is a 'repository' and is there any documentation that explains the concept and how to use it correctly?

    {{ question_by('cwalesch') }}

    The repository is what is represented as the "modules pool" in the UI. It contains all the dependencies currently visible. At the moment there is only one global repository which causes several problems. MPS is slowly but steadily moving to project-specific repositories. That would mean each project (window) of MPS would have its separate repository. 

    To get the repository you will need access to the project. e.g. the editor context will give you access to the repository: `editorContext.getRepository()`.
    
    In other cases, for instance,  when you don't have an editor context directly available you need to make sure that from UI (action) you pass the project or repository through to the place where you need it.

    {{ answer_by('coolya') }}

??? question "How can you get an identifier of a node?"

    > Given I have a node *myNode* and I need to serialize something that identifies it.
    > When I serialize that something and then deserialize that identifier again, then I will find exactly that node.
    > How can I build such a thing?

    **Option 1**: PersistenceFacade ID

    Since the URL does not look nice, you may use this combined string of model ID and node ID that is used for the URL. For that, import the class `org.jetbrains.mps.openapi.persistence.PersistenceFacade` from the _MPS.OpenApi_ stub and run:
    
    ```java
    # serialize identifier
    string mySerializedId = SNodePointer.serialize(node/.getReference())
    
    # find node based on the serialized identifier
    node<> myFoundNode = SNodePointer.deserialize(mySerializedId).resolve(repository)
    
    # then, node == myFoundNode
    ```

    **Option 2**: URL
    
    Import the `httpsupport` language and use `node.getURL`. This will be a URL that you can use locally to open this node. It includes the node ID and the model and thus is a pretty good globally unique id.
    
    This id is a local URL and looks odd though: `http://127.0.0.1:63320/node?ref=r%3A4bc03cd1-b1e3-49da-84da-f27e7062f6f7%28integrityOfUpdate%29%2F2209769512593382448&project=SecurityAnalyst`. Especially the code to find the node again based on this URL contains some grepping then.
    
    **Option 3**: Node Id
    
    Use `#!java node/.getNodeId().toString()` it will yield the node's id. Note that a node ID is only unique within this model. If it should be globally unique, consider option 1.

    {{ contribution_by('abstraktor') }}

??? question "Where does MPS store preferences?"

    For a starting point, read [Directories used by the IDE](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html).
    *CONFIG_DIR* refers to the configuration directory. *WORKSPACE_FILE* refers to *$PROJECT/.mps/workspace.xml*:

    - refactoring settings: *CONFIG_DIR/options/refactoringSettings.xml*
    - override/implement settings: *WORKSPACE_FILE/OverrideImplementMethodComponent*
    - additional libraries: *CONFIG_DIR/options/AdditionalLibrariesManager.xml*
    - default search options: *WORKSPACE_FILE/DefaultSearchOptions3*
    - make configuration: *WORKSPACE_FILE/mpsMakeService*
    - code style settings: *CONFIG_DIR/options/codeStyleSettings.xml*
    - breakpoint settings: *WORKSPACE_FILE/BreakpointViewSettings*
    - migration state: *WORKSPACE_FILE/MigrationProperties*
    - model validation settings: *CONFIG_DIR/options/mpsModelValidationSettings.xml*
    - concept editor settings: *WORKSPACE_FILE/ConceptEditorHintSettings*
    - node search history: *WORKSPACE_FILE/NodeEditorSearchHistory*
    - project libraries: *WORKSPACE_FOLDER/libraries.xml*
    - bookmarks: *WORKSPACE_FILE/BookmarksTool*
    - project view: *WORKSPACE_FILE/ProjectView*
    - blame dialog: *CONFIG_DIR/options/charismaBlameDialog.xml*
    - compiler settings: *WORKSPACE_FOLDER/compiler.xml*
    - model checker settings: *CONFIG_DIR/options/modelCheckerSettings.xml*
    - modules: *WORKSPACE_FOLDER/modules.xml*
    - project plugin settings: *WORKSPACE_FILE/ProjectPluginManager*
    - generation settings: *CONFIG_DIR/options/generationSettings.xml*
    - console history: *WORKSPACE_FILE/ConsoleHistory*
    - breakpoints: *WORKSPACE_FILE/BreakpointManager*
    - bookmarks: *WORKSPACE_FILE/MPSBookmarkManager*
    - messages view tool settings: *WORKSPACE_FILE/MessagesViewTool*
    - usages view tool settings: *WORKSPACE_FILE/UsagesViewTool*
    - disabled intentions: *CONFIG_DIR/options/intentions.xml*
    - editor settings: *CONFIG_DIR/options/mpsEditor.xml*
    - migration trigger settings: *WORKSPACE_FILE/MigrationTrigger*

!!! question "Where can you find information about environment/JVM variables that are set in MPS?"

    - [Advanced configuration | jetbrains.com](https://www.jetbrains.com/help/idea/tuning-the-ide.html)
    - [Configuring JVM options and platform properties](https://intellij-support.jetbrains.com/hc/en-us/articles/206544869-Configuring-JVM-options-and-platform-properties)
    - JVM
        - [IntelliJ JVM Options Explained](https://github.com/FoxxMD/intellij-jvm-options-explained)
        - [Java HotSpot VM Options](https://www.oracle.com/java/technologies/javase/vmoptions-jsp.html)
    - system properties
        - [Java system properties](https://docs.oracle.com/en/java/javase/18/docs/api/system-properties.html)
        - [System Properties for Java 2D](https://docs.oracle.com/javase/7/docs/technotes/guides/2d/flags.html) contains properties starting with `sun.java2d`.
        - [Networking System properties](https://docs.oracle.com/en/java/javase/16/core/networking-properties.html) contains properties starting with `java.net`.

[^1]: https://mps-support.jetbrains.com/hc/en-us/community/posts/115000568670-Create-and-access-a-single-Preference-Component-which-is-common-for-all-projects
