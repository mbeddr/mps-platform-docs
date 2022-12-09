---
tags:
- standalone
- customization
---

RCP stands for Rich Client Platform. The topic is explained in [Building standalone IDEs for your languages | MPS](https://www.jetbrains.com/help/mps/building-standalone-ides-for-your-languages.html).

!!! warning "A plugin is incompatible with the current RCP version."
    
    Specific Languages blog: [Fixing the 'Plugin incompatible with the current [CUSTOM RCP] version' error](https://specificlanguages.com/posts/plugin-incompatible-with-current-version/)

!!! question "How can you customize the welcome screen in an RCP?"

    - Specific Languages blog: [Customizing your RCP welcome screen: removing unwanted tabs](https://specificlanguages.com/posts/2022-06/13-simplifying-welcome-screen/)
    
    The used library [xml-patch](https://github.com/dnault/xml-patch/) uses XPath path selectors. A cheat sheet for the syntax can be found [here](https://devhints.io/xpath). 
    
    - Specific Languages blog: [Customizing your RCP welcome screen: stripping down even further](https://specificlanguages.com/posts/2022-06/14-simplifying-welcome-screen-even-further/)
    - Specific Languages blog: [A fully custom welcome screen](https://specificlanguages.com/posts/2022-06/16-custom-welcome-screen/)

!!! question "How can you reduce the size of an RCP?"

    - Remove all packaged plugins that you don't need
    - Use a JBR version without JCEF if you don't need an embedded browser (jbr_nomod).

!!! question "How can I deactivate a preference page?"

    - Remove the plugin that contains the preference page.
    - For `SPreference` pages: they are project plugins, so you can find them through `#!java ProjectPluginManager.getPlugins` and then call `#!java dispose`
    or you could unregister the preference pages itself. For example:
    ```java
    Project ideaProject = ProjectPluginManager.getInstance(ProjectHelper.toIdeaProject(#project);
    list<BaseProjectPlugin> plugins = new arraylist<BaseProjectPlugin>(copy: ideaProject.getPlugins());
    BaseProjectPrefsComponent component = plugins.findFirst({~it => it.toString().startsWith("path_to_your._ProjectPlugin"); }).getPrefsComponents()  get(0);
    component.getPages().get(0).unregister();
    ```
    
    For preference forms: they can be found through `#!java Configurable.APPLICATION_CONFIGURABLE.getPoint().getExtensionList` and removed by calling `#!java unregisterExtension`.

!!! question "How can you replace the logical view on the left side with a custom one?"


    Use the class ^^com.mbeddr.mpsutil.projectview^^ from {{ mps_extensions() }}. You can find an example that replicates the _logical view_ [in mbeddr](http://127.0.0.1:63320/node?ref=r%3Ab2f3d5f9-b81e-4589-95e8-d5be28f6e48f%28com.mbeddr.mpsutil.projectview.views.plugin%29%2F8309912865649309798&project=com.mbeddr.mpsutil).

??? question "How can you tell which IntelliJ version MPS runs with?"

    > Given I want to know, which version of [IntelliJ Community](https://github.com/JetBrains/intellij-community) my MPS is built from.
    > How can I know?

    {{ mbeddr() }}: The easiest way to get the correct platform for an MPS version is by running ant in the root of your MPS sources:

    `ant -f build/getDependencies.xml download-platform`

    It will place the platform in the folder *mps-platform* of the repository and is automatically imported into the intelliJ project where you can read the sources and also step into them when debugging.

    In case you're looking at an RCP: `/build.number` provides this information and more, eg `idea.platform.build.number=MPS—203.7717.56`.

    The platform version is part of the build information e.g. MPS—211.7442.1291

    To get the baseline version e.g. 211, programatically: `#!java ApplicationInfo.getInstance().getBuild().getBaselineVersion()`

    To get the full version e.g. 211.7442.1291, programatically: `#!java ApplicationInfo.getInstance().getBuild().currentVersion().asString()`

??? question "How can you show a custom implemented project view instead of the MPS logical view?"
    Assume that the view was build with ^^com.mbeddr.mpsutil.projectview^^:    

    ```java
    SwingUtilities.invokeLater(new Runnable() { 
        public void run() {
            list<AbstractProjectViewPane> viewsToRemove = new linkedlist<AbstractProjectViewPane>;
            ProjectView projectView = ProjectView.getInstance(project.getProject());
            foreach paneID in projectView.getPaneIds() {
            if (paneID.endsWith(ProjectViewHelper.YOUR_PROJCET_VIEW_ID)) {
            if (!projectView.getCurrentViewId().equals(paneID)) {
            projectView.changeView(paneID);
            }
            } else if (this.viewsToKeep.asSequence.any({~it => paneID.endsWith(it); })) {
            continue;
            } else {
            viewsToRemove.add(projectView.getProjectViewPaneById(paneID));
            }
            }
            viewsToRemove.forEach({~it =>
            projectView.removeProjectPane(it);
            it.dispose();
            });
            ProjectPane.getInstance(project).activate();
        }
        })
    ```

!!! question "How can you customise the *New Roots* (mbeddr.platform) or *New dialog* of MPS/mbeddr?"

    ```java
    CreateRootFilterEP.getInstance().addFilter
    ```

!!! question "how to change (or turn off) the exception submission dialog?"

    - Remove all error handlers like [this](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/ide/blame/IntelliJReporterReplacer.java#L34-L36).
    - Remove `<appender name="DIALOG" class="com.intellij.diagnostic.DialogAppender">` from the log.xml file. This will also disable the error pop ups in the IDE where you can see the exception.

!!! question "Where can you find the latest MPS and IntelliJ icons?"

    - MPS: [mps-icons](https://github.com/JetBrains/MPS/tree/master/workbench/mps-icons/source)
    - IntelliJ: [Icons list](https://jetbrains.design/intellij/resources/icons_list/)

!!! question "How can you restart MPS programmatically?"

    ```java
    ApplicationEx app = ApplicationManagerEx.getApplicationEx(); 
    app.restart(true,true);
    ```

!!! question "How can I install a custom editor color scheme?"

    Follow the guideline [Export IntelliJ editor themes as plugins | JetBrains blog](https://blog.jetbrains.com/platform/2017/12/export-intellij-editor-themes-as-plugins/) to export a jar file. You can copy this JAR file to the
    *plugins* folder of the RCP. You can enable the color scheme by default with the following code in an applicaiton plugin:
    
    ```
    EditorColorsScheme colorScheme = EditorColorsManager.getInstance().getAllSchemes().asSequence.findFirst({~it => it.getDisplayName() :eq: "[NAME_OF_YOUR_SCHEME]"; }); 
    EditorColorsManager.getInstance().setGlobalScheme(colorScheme);
    ```

!!! question "How to you disable an MPS/Intellij tool window?"

    ```Java
    Project ideaProject = ProjectHelper.toIdeaProject(project);

    // MPS tool 
    BaseTool mpsTool = ideaProject.tool<YourTool>; 
    if (mpsTool != null && mpsTool.isAvailable()) {
        mpsTool.makeUnavailable();
    }

    // IntelliJ Tool

    /* The toolID can be found through ToolWindowManager.getInstance(ProjectHelper.toIdeaProject(#project)).getToolWindowIds().asSequence on the console*/
    ToolWindow toolWindow = ToolWindowManager.getInstance(ideaProject).getToolWindow(toolID)
    if(toolWindow.isAvailable()) {
        toolWindow.remove();
    }
    ```


!!! question "How do you add an action to the menu bar of an IntelliJ tool window?"

    Example base on the project view:

    ```Java
    ToolWindow window = ToolWindowManager.getInstance(myProject).getToolWindow(ToolWindowId.PROJECT_VIEW);
    if (window != null) {
        window.setTitleActions(titleActions);
    }
    ```

!!! question "How can you set the position of a tool window?"

    Example based on the MPS inspector:
    
    ```Java
    InspectorTool inspectorTool = ideaProject.getComponent(InspectorTool.class); 
    if (inspectorTool != null) {
        ToolWindow inspectorToolWindow = inspectorTool.getToolWindow();
        inspectorToolWindow.setAnchor(ToolWindowAnchor.RIGHT, null);
    }