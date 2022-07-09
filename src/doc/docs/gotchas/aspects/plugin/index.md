!!! question "Should I use this aspect?"

    No. You should use [plugin solutions](https://www.jetbrains.com/help/mps/plugin.html) instead.

!!! warning "A reference to a key in action context parameters is out of search scope."

    You need to add a dependency to [MPSCommonDataKeys](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.actions%28MPS.Platform%2F%29%2F%7EMPSCommonDataKeys).
    This class extends [PlatformDataKeys](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.actionSystem%28MPS.IDEA%2F%29%2F%7EPlatformDataKeys)
    and this class extends [CommonDataKeys](CommonDataKeys).

!!! warning "My action is not visible."

    You have to add it to an ActionGroup that can be attached at differenct places such as the context menu or the build menu. 
    All of the action context parameters that are marked as required have to be available and the isApplicable block must
    return true for an action to be visible. For debugging purposes you can set "always visible" to true to check if your
    action is registered at all. You also need to have a standalone descriptor in your model for it to work. Additionaly,
    the solution kind should be set to Other in the Java tab of the solution properties ([official documentation](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups)).

!!! hint "I want to merge models."

    Use the language `de.itemis.mps.modelmerger` (experimental) from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I want to check the structure of a node."

    Use the language `de.slisson.mps.structurecheck` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I want to store different states/versions of a node inside the model."

    Use the language `de.itemis.mps.nodeversioning` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).


!!! hint "I want to create new SContainmentLink for non-existent role[^1]."
    It can be created through [MetaAdapterFactory](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel.adapter.structure%28MPS.Core%2F%29%2F%7EMetaAdapterFactory).

!!! question "How to I check if a model is a generator model, a test model etc.?"
    Call the corresponding method in [SModelStereotype](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel%28MPS.Core%2F%29%2F%7ESModelStereotype).

!!! question "How do I add imports to a model?"

    Use the class [ModelImportHelper](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.project%28MPS.Platform%2F%29%2F%7EModelImportHelper) and call [addImport](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.project%28MPS.Platform%2F%29%2F%7EModelImportHelper.addImport%2528org.jetbrains.mps.openapi.model.SModel%2529).

!!! question "How do facets work?"

    <img src="../../../img/facets.png" alt="facets" />

    Red rectangles: marker facets
    
    - do not define depdencies on other facets
    - known to MPS Make Process and are available for user
    - User can define where his/her own facet should fit in and decide if they require some facet.

    Usage:

    - Targets act as filters working on a stream of data delivered to them,
    - The data flowing along targets is called *resources*.
    - Resources are represented as Java tnterfaces and tuples,

!!! question "How can a change the default project directory?"

    Put the following code in an application plugin:
    ```java
    // set default project location 
    string defaultProjectDir = Paths.get(System.getProperty("user.home"), "NewProjectDir").toString();
    GeneralSettings.getInstance().setDefaultProjectDirectory(defaultProjectDir);
    ```

!!! question "How can I replace the logical view on left side with a  custom one?"


    Use the class `com.mbeddr.mpsutil.projectview`. You can find a example that replicates the _logical view_ [in mbeddr](http://127.0.0.1:63320/node?ref=r%3Ab2f3d5f9-b81e-4589-95e8-d5be28f6e48f%28com.mbeddr.mpsutil.projectview.views.plugin%29%2F8309912865649309798&project=com.mbeddr.mpsutil).

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

!!! question "How can I open an MPS Editor Tab programmatically?"

     - `#!java EditorContext.getEditorPanelManager().openEditor(node)`

!!! question "How do I move a solution?"

    > Given I have a project with a test solution open and the solution is stored in `code/com.my/solutions/com.my.solution.to.move`, which is the wrong place. It should be `code/com.my/test/com.my.solution.to.move` instead.

    > I want to move the solution in the filesystem to its correct place. How can I move the solution without breaking the project?

    1. Move `code/com.my/solutions/com.my.solution.to.move` to `code/com.my.project/test/com.my.project.solution.to.move`.
    2. Close the MPS project and reopen it (no need to restart MPS).
    3. Re-add the `.msd` files as follows:
    3. On the workspace root node, right click and open the "Project Paths" (ALT+Return).
    4. Click on the red, old solution file and on `-`.
    6. Click on `+` and select the new location of this `.msd` file.
    7. Open your build script for ci tests and update the solution path in the project structure.

    {{ contribution_by('abstraktor') }}

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

??? question "How to guide through cleaning up after deleting a referenced node?"

    > Given I have a concept `Ball` and I have a reference `BallRef`.
    > When I have a `Ball` node and I have `BallRef`s to it all over my model.
    > When I delete the ball then I have a lot of dangling references.
    > How may I get guidance in cleaning up these dangling references?

    You can show a balloon that says for example:

    ```
    Deleting ball has left some dangling references
    _Show_, _Ignore_
    ```

    When clicking _show_, it will open a usage search for the deleted node using `ConsoleUtil.show`. This is implemented with a modellistener in a quite generic fashion.

    Here are a few insights:

    * Make sure to not show the node in the "searched for" part of the window. VCS will try to highlight it and run into an NPE (MPS 2019.3)
    * Consider cut+paste, or moving elements: These operations yield a removal event as well. Our approach is to hide the balloon again, once the node gets added again.

    ![DanglingReferenceHandler](DanglingReferenceHandler.png)

    {{ contribution_by('abstraktor') }}

??? question "How can I ensure that a jar is loaded exaclty once and then never again?"

    > I have a .jar that depends on a native libray (.dll/.so/...). To use it in an MPS plugin I have a stubs solution for it. Unfortunately, without further ado, MPS tries to reload the jar in some cases (e.g. after a rebuild). This will fail, because the JVM does not allow reloading of native libraries.
    
    > How can I avoid this problem?

    To prevent that MPS will ever (re-)load .jars / stubs of a solution, you can check the facet "IDEA Plugin" in the "Facets" tab of the solution properties. This will show another tab where you have to set the Plugin ID "com.intellij".

    Now we just have to ensure that the .jars can be found at runtime (i.e. they must be on the classpath). The simplest approach would be to put them into the "lib" directory of the application (e.g. MPS installation / your product RCP).

    {{ contribution_by('till-f') }}

??? question "How can I use an IntelliJ icon for my action?"

    > I want to use one of the icons shipped with IntelliJ for my own action (`jetbrains.mps.lang.plugin.structure.ActionDeclaration`). How can I reference the icon?

    You can use `IconLoader.getIcon(...)` at the hidden icon expression. Right-click the editor for the icon, use "show reflective editor" and enter the expression as shown in the screenshot:

    ![IconLoader](IconLoader.png)

    {{ contribution_by('till-f') }}

??? question "How to tell which IntelliJ version my MPS runs with?"

    > Given I want to know, which version of [IntelliJ Community](https://github.com/JetBrains/intellij-community) my MPS is built from.
    > How to tell?

    The easiest way to get the correct platform for an MPS version is by running ant in the root of your MPS sources:

    `ant -f build/getDependencies.xml download-platform`

    It will place the platform in `mps-platform` of the repository and its automatically imported into the intellij project where can read the sources and also step into them when debugging.

    In case you're looking at an RCP: `/build.number` provides this information and more, eg `idea.platform.build.number=MPS-203.7717.56`.

    The platform version is part of the build information e.g. MPS-211.7442.1291

    To get the baseline version e.g. 211: `#!java ApplicationInfo.getInstance().getBuild().getBaselineVersion()`

    To get the full version e.g. 211.7442.1291: `#!java ApplicationInfo.getInstance().getBuild().currentVersion().asString()`

??? question "How to use a Projection Mode Switcher to alter EditorComponent?"

    > I have a concept editor in which I use an EditorComponent A. Using the Projection-Item in the Menu-Bar of MPS I would like to switch to another EditorComponent B upon activation.

    First B must override A and the 'applicable concept' also must not differ.  Then for B in 'applicable in context' we must provide a 'concept editor context hint'.

    ![context hints tree layout](context_hints_tree_layout.png)

    This hint must also be referenced from a 'Projection Mode Switcher'.

    ![projection mode switcher](projection_mode_switcher.png)
    
    Afterwards you will find a new entry in the Projection-Menu.
    
    Hint when used with grammarcells: you have to 'disable component inlining' which can be activated by an intention at the position where the include of A happens. Also in any EditorComponent that inherits from A and A itself we cannot use 'grammarcells'.

    {{ contribution_by('dbinkele') }}

[^1]:[How to create new SContainmentLink for non-existent role?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009473300-How-to-create-new-SContainmentLink-for-non-existent-role-)