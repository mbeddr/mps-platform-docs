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
    - For  SPreference Pages: They are project plugins, so you can find them through `#!java ProjectPluginManager.getPlugins` and call `#!java dispose`
    or you could unregister the preference pages itself. For example:
    ```java
    list<BaseProjectPlugin> plugins = new arraylist<BaseProjectPlugin>(copy: ProjectPluginManager.getInstance(ProjectHelper.toIdeaProject(#project)).getPlugins());
    plugins.findFirst({~it => it.toString().startsWith("com.mbeddr.core.codereview.plugin.Codereview_ProjectPlugin"); }).getPrefsComponents().get(0).getPages().get(0).unregister();
    ```
    
    For preference forms: they can be found through `#!java Configurable.APPLICATION_CONFIGURABLE.getPoint().getExtensionList` and removed by calling `#!java unregisterExtension`.

!!! question "How can you replace the logical view on the left side with a custom one?"


    Use the class `com.mbeddr.mpsutil.projectview`. You can find a example that replicates the _logical view_ [in mbeddr](http://127.0.0.1:63320/node?ref=r%3Ab2f3d5f9-b81e-4589-95e8-d5be28f6e48f%28com.mbeddr.mpsutil.projectview.views.plugin%29%2F8309912865649309798&project=com.mbeddr.mpsutil).

??? question "How to tell which IntelliJ version MPS runs with?"

    > Given I want to know, which version of [IntelliJ Community](https://github.com/JetBrains/intellij-community) my MPS is built from.
    > How to tell?

    The easiest way to get the correct platform for an MPS version is by running ant in the root of your MPS sources:

    `ant -f build/getDependencies.xml download-platform`

    It will place the platform in `mps-platform` of the repository and its automatically imported into the intellij project where can read the sources and also step into them when debugging.

    In case you're looking at an RCP: `/build.number` provides this information and more, eg `idea.platform.build.number=MPS-203.7717.56`.

    The platform version is part of the build information e.g. MPS-211.7442.1291

    To get the baseline version e.g. 211: `#!java ApplicationInfo.getInstance().getBuild().getBaselineVersion()`

    To get the full version e.g. 211.7442.1291: `#!java ApplicationInfo.getInstance().getBuild().currentVersion().asString()`

??? question "How can you show a custom project view instead of the MPS logical view?"

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

!!! question "How can you customise the `New Roots` (mbeddr.platform) or `New dialog` of MPS/mbeddr?"

    `#!java CreateRootFilterEP.getInstance().addFilter`

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