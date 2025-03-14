---
comments: true
hide:
- toc
tags:
- standalone
- customization
---

RCP stands for Rich Client Platform and means creating a custom MPS version with your selection of plugins and custom branding.
[Building standalone IDEs for your languages | MPS](https://www.jetbrains.com/help/mps/building-standalone-ides-for-your-languages.html)
explains this topic in detail.

When building an RCP, you can consider three operating systems: Windows, Mac, and Linux.It is recommended to have a Windows RCP and, depending on the user base,
also a Mac RCP. Ideally, you only have to create them once, and don't have any issues. In practise, some (native) libraries
or tools might not be available on other systems. Additionally, for Macs, signing the application and supporting different
architectures such as the M1 chip, means some extra work.

!!! warning "A plugin is incompatible with the current RCP version."
    
    [Fixing the 'Plugin incompatible with the current [CUSTOM RCP] version' error](https://specificlanguages.com/posts/plugin-incompatible-with-current-version/){{ blog('sl') }}

!!! question "How can you customize the welcome screen in an RCP?"

    - [Customizing your RCP welcome screen: removing unwanted tabs](https://specificlanguages.com/posts/2022-06/13-simplifying-welcome-screen/){{ blog('sl') }}
    
    The used library [xml-patch](https://github.com/dnault/xml-patch/) uses XPath path selectors. [https://devhints.io](https://devhints.io/xpath) has a cheat sheet for the syntax. 
    
    - [Customizing your RCP welcome screen: stripping down even further](https://specificlanguages.com/posts/2022-06/14-simplifying-welcome-screen-even-further/){{ blog('sl') }}
    - [A fully custom welcome screen](https://specificlanguages.com/posts/2022-06/16-custom-welcome-screen/){{ blog('sl') }}

!!! question "How can you reduce the size of an RCP?"

    - Remove all packaged plugins that you don't need.
    - Use a JBR version without JCEF if you don't need an embedded browser (*jbr_nomod*).

!!! question "How can I deactivate a preference page?"

    - Remove the plugin that contains the preference page.
    - `SPreference` pages are project plugins. You can find them through `#!java ProjectPluginManager.getPlugins` and then call `#!java dispose`
    , or you could unregister the preference pages themselves. For example:
    ```java
    Project ideaProject = ProjectPluginManager.getInstance(ProjectHelper.toIdeaProject(#project);
    list<BaseProjectPlugin> plugins = new arraylist<BaseProjectPlugin>(copy: ideaProject.getPlugins());
    BaseProjectPrefsComponent component = plugins.findFirst({~it => it.toString().startsWith("path_to_your._ProjectPlugin"); }).getPrefsComponents()  get(0);
    component.getPages().get(0).unregister();
    ```
    
    For preference forms: they can be found through `#!java Configurable.APPLICATION_CONFIGURABLE.getPoint().getExtensionList` and removed by calling `#!java unregisterExtension`.

!!! question "How can you replace the logical view on the left side with a custom one?"


    Use the language ^^com.mbeddr.mpsutil.projectview^^ from {{ mps_extensions() }}. You can find an example that replicates the _logical view_ [in mbeddr](http://127.0.0.1:63320/node?ref=r%3Ab2f3d5f9-b81e-4589-95e8-d5be28f6e48f%28com.mbeddr.mpsutil.projectview.views.plugin%29%2F8309912865649309798&project=com.mbeddr.mpsutil).

??? question "How can you tell which IntelliJ version MPS runs with?"

    > Which version of [IntelliJ Community](https://github.com/JetBrains/intellij-community) is my MPS built from? How can I know?

    {{ mbeddr() }}: The easiest way to get the correct platform for an MPS version is by running ant in the root of your MPS sources:

    `ant -f build/getDependencies.xml download-platform`

    It will place the platform in the folder *mps-platform* of the repository and is automatically imported into the IntelliJ project where you can read the sources and step into them when debugging.

    If you're looking at an RCP: `build.number` and `build.txt` provide this information and more, for example, `idea.platform.build.number=MPS—203.7717.56`.

    The platform version is part of the build information, for example, `MPS—211.7442.1291`.

    To get the baseline version, for example, 211, programmatically: `#!java ApplicationInfo.getInstance().getBuild().getBaselineVersion()`

    To get the full version, for example, 211.7442.1291, programmatically: `#!java ApplicationInfo.getInstance().getBuild().currentVersion().asString()`

??? question "How can you show a custom-implemented project view instead of the MPS logical view?"
    
    Assume that you built the view with ^^com.mbeddr.mpsutil.projectview^^:    

    ```java
    ApplicationManager.getInstance().invokeLater(new Runnable() { 
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

!!! question "How can you customize the *New Roots* (mbeddr.platform) or *New dialog* of MPS/mbeddr?"

    ```java
    CreateRootFilterEP.getInstance().addFilter
    ```

!!! question "How can you change or turn off the exception submission dialog?"

    - Remove all error handlers like [this](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/jetbrains/mps/ide/blame/IntelliJReporterReplacer.java#L34-L36).
    - Remove `<appender name="DIALOG" class="com.intellij.diagnostic.DialogAppender">` from the log.xml file. This change will also turn off error pop-ups in the IDE, where you can see the exception. Note: There were some [changes related to the logging configuration](https://www.jetbrains.com/help/mps/migration-guide.html#changesinloggingconfiguration) in MPS 2022.2, where this answer is not valid anymore.

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
    *plugins* folder of the RCP. You can enable the color scheme by default with the following code in an application plugin:
    
    ```
    EditorColorsScheme colorScheme = EditorColorsManager.getInstance().getAllSchemes().asSequence.findFirst({~it => it.getDisplayName() :eq: "[NAME_OF_YOUR_SCHEME]"; }); 
    EditorColorsManager.getInstance().setGlobalScheme(colorScheme);
    ```

!!! question "How do you deactivate an MPS/IntelliJ tool window?"

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

    The example is based on the project view:

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
    ```

!!! question "How can you configure the default settings in the RCP?"

    Some configurations can be done in the build scripts itself (e.g. the splashscreen). If you know the class that's responsible for a setting, you can invoke the corresponding code in an application or project plugin. Examples:

    AdvancedSettings.getInstance().setBoolean("mps.make.include.dependencies", false); // don't build dependencies when calling make
    EditorSettings.getInstance().setSyncWithModelOnSelectionChange(true); // discard unsaved changes in the editor when the selection changes
    LayoutWatchdog.DEFAULT_MAX_LAYOUTING_OPERATIONS = 10000000; //
    DiffSettingsUtil.setTrackMovedNodesDiffOption(true); // visualize nodes in the diff view differentially when only the order changes.

    The alternative is to [provide a custom path](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#change-ide-dirs) to a [configuration directory](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#config-directory) and include the configuration XML files in this directory.