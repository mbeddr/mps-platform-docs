---
comments: true
title: Plugin Aspect
tags:
- aspect
---

# [Plugin Aspect](https://www.jetbrains.com/help/mps/plugin.html)

> Plugins are a way to integrate your code with the MPS IDE functionality.
>
> — <cite>MPS documentation</cite>

This aspect is deprecated, use [plugin solutions](https://www.jetbrains.com/help/mps/plugin.html) instead. This page still
describes the content of this aspect because its languages are also used in the solution. The name of the solutions
ususally end in *.pluginSolution* or *.plugin*.

## General


??? question "How do facets work?"

    ![facets](images/plugin/facets.png)

    Red rectangles: marker facets
    
    - Do not define dependencies on other facets.
    - They are known to the MPS make process and are available for users.
    - You can define where your facet should fit in and decide if you require some facet.

    Usage:

    - Targets act as filters working on a stream of data delivered to them.
    - The data flowing along targets is called *resources*.
    - Resources are represented as Java interfaces and tuples.

??? question "How do I move a solution?"

    > Given I have a project with a test solution open and the solution is stored in `code/com.my/solutions/com.my.solution.to.move`, which is the wrong place. It should be `code/com.my/test/com.my.solution.to.move` instead.

    > I want to move the solution in the filesystem to its correct place. How can I move the solution without breaking the project?

    1. Move `code/com.my/solutions/com.my.solution.to.move` to `code/com.my.project/test/com.my.project.solution.to.move`.
    2. Close the MPS project and reopen it (no need to restart MPS).
    3. Add back the *.msd* files as follows:
    3. Right-click on the workspace root node and open *Project Paths* (++alt+return++).
    4. Click on the red, old solution file, and on *-*.
    6. Click on *+* and select the new location of this *.msd* file.
    7. Open your build script for CI tests and update the solution path in the project structure.

    {{ contribution_by('abstraktor') }}

??? question "How do you guide the user through cleaning up after deleting a referenced node?"

    > Given I have a concept `Ball` and I have a reference `BallRef`.
    > When I have a `Ball` node, and I have `BallRef`s to it all over my model.
    > When I delete the ball, then I have a lot of dangling references.
    > How may I get guidance in cleaning up these dangling references?

    You can show a balloon that says, for example:

    ```
    Deleting the ball has left some dangling references
    _Show_, _Ignore_
    ```

    When clicking *show*, it will open a usage search for the deleted node using `#!java ConsoleUtil.show`. This functionality is implemented with a model listener in a quite generic fashion.

    Here are a few insights:

    * Ensure not to show the node in the *searched for* part of the window. VCS will try to highlight it and run into an NPE (MPS 2019.3)
    * Consider cut and paste or moving elements: these operations also yield a removal event. Hide the balloon again once the node gets added again.

    ![DanglingReferenceHandler](images/plugin/dangling_reference_handler.png)

    {{ contribution_by('abstraktor') }}

??? question "How can you ensure that the IDE loads a JAR exactly once and never again?"

    > I have a JAR file that depends on a native library (.dll/.so). To use it in an MPS plugin, I have a stubs solution for it. Unfortunately, without further ado, MPS sometimes tries to reload the jar (e.g., after a rebuild) and it will fail because the JVM does not allow reloading of native libraries.
    
    > How can I avoid this problem?

    To prevent that MPS will ever (re-)load .jars / stubs of a solution, you can check the facet "IDEA Plugin" in the "Facets" tab of the solution properties. This facet will show another tab where you must set the Plugin ID `com.intellij`.

    We must ensure that the JARs can be found at runtime (i.e., they must be on the classpath). The most straightforward approach would be to put them into the application's *lib* directory (e.g., MPS installation / your product RCP).

    {{ contribution_by('till-f') }}

??? question "How can you use an IntelliJ icon for an action?"

    > I want to use one of the icons shipped with IntelliJ for my action (`jetbrains.mps.lang.plugin.structure.ActionDeclaration`). How can I reference the icon? (note: this question might be deprecated for modern MPS versions)

    You can use `IconLoader#getIcon` in the reflective editor. Right-click the editor for the icon, use `show reflective editor`, and enter the expression as shown in the screenshot:

    ![IconLoader](images/plugin/icon_loader.png)

    {{ contribution_by('till-f') }}

??? question "How to use a projection mode switcher to alter an editor component?"

    > I have a concept editor in which I use an EditorComponent $A$. Using the projection menu entry, I would like to switch to another editor component $B$ upon activation.

    First $B$ must override $A$, and the `applicable concept` also must not differ. Then for $B$ in `applicable in context`, we must provide a *concept editor context hint*.

    ![context hints tree layout](images/plugin/context_hints_tree_layout.png)

    This hint must also be referenced from a *Projection Mode Switcher*.

    ![projection mode switcher](projection_mode_switcher.png)
    
    Afterwards, you will find a new entry in the *Projection* menu.
    
    Hint when used with Grammar Cells: you have to *disable component inlining*, which can be activated by an intention at the position where the include of $A$ happens. Also, in any editor component that inherits from $A$ and $A$ itself, we cannot use Grammar Cells.

    {{ contribution_by('dbinkele') }}

??? question "How can I test extension point implementations?"

    This can be achieved using MPS APIs. MPS exposes the so-called `ExtensionRegistry` which gathers all registered extension points of the current project.

    Normally, to register an implementation of `extPointA`, you would define an extension point `myExtOfA` with a method `IextendA get() { ... }` returning the implementation of `IextendA`.
    However, this would always(!) load the extension point if it is part of your project.
    To test your implementation in solution `extPointA.tests`, add a class`myExtAImpl`in the solution which implements `Extension<IextendA>`.

    First, this will require it to provide the implementation of your extension in the `get()`method, but also the ID of the extension point in the funciton `getExtensionPointID()`. The ID can easily be obtained from `extensionPoint/extPointA/.getID()` . 
    The following code then first gets the extensionpoint `extPointA`  from the registry and extends with your implementation:
    
    ```
    // project is a variable provided by the testing infrastructure
    ExtensionRegistry registry = project.getComponent(ExtensionRegistry.class);
    //  programmaticaly declare an extension point implementation 
    DefaultExtensionDescriptor myExtAImplExtension = new DefaultExtensionDescriptor(new myExtAImpl()); 
    registry.registerExtensionDescriptor(myExtAImpleExtension); 
    ```
    
    After testing the implementation, you must then remove the handler with this line of code
    
    ```
    registry.unregisterExtensionDescriptor(myExtAImplExtension);
    ```

    {{ contribution_by('HeikoBecker') }}

!!! question "How can you add new languages to the MPS spellchecker?"

    MPS uses the [spell checker of the IntelliJ IDEA (Grazie)](https://www.jetbrains.com/help/mps/2022.3/spellchecking.html) for spell checking.
    The spell checker is also enabled for the rich text language (it can be disabled in *preferences* --> *Other Settings* --> *Text*). To add a new language, clone
    https://github.com/wooorm/dictionaries and add a new custom dictionary in *preferences* --> *Editor* --> *Spelling* --> *Custom dictionaries *by selecting the .dic file of your language in the repo.

## Languages/Features

Most additional plugins are contributed by languages in {{ mps_extensions() }}, and {{ mbeddr_platform() }}.

!!! hint "I want to merge models."

    Use the language ^^de.itemis.mps.modelmerger^^ from {{ mps_extensions() }}.

!!! hint "I want to verify the structure of a node."

    Use the language ^^de.slisson.mps.structurecheck^^ from {{ mps_extensions() }}.

!!! hint "I want to store different states/versions of a node inside the model."

    Use the language ^^de.itemis.mps.nodeversioning^^ from {{ mps_extensions() }}.

## Open API

This section contains code-related questions and answers.

!!! question "How do you create a new *SContainmentLink* for a non-existent role?"

    Create it through {{ mps_url("@mps.MetaAdapterFactory") }}.

!!! question "How do you check if a model is a generator or a test model?"

    Call the corresponding method in {{ mps_url("@mps.SModelStereotype") }}.

!!! question "How do you add imports to a model?"

    Use the class {{ mps_url("@mps.ModelImportHelper") }} and call `addImport`.

!!! question "How can you open an MPS Editor Tab programmatically?"

    ```java
    EditorContext.getEditorPanelManager().openEditor(node);
    ```

!!! question "Is it possible to associate an MPS-Aspect with more than one node?"

    ```java
    IConceptAspect.getBaseConceptCollection();
    ```

## Troubleshooting

Plugin troubleshooting topics often overlap with IntelliJ topics. The reason for this is that the languages that deal with
plugins often compile down to IntelliJ platform features such as MPS actions that generate into [IntelliJ actions](https://plugins.jetbrains.com/docs/intellij/basic-action-system.html).

!!! warning "A reference to a key in an action context parameter is out of the search scope."

    You need to add a dependency to {{ mps_url("@mps.MPSCommonDataKeys") }}.
    This class extends {{ mps_url("@openapi.PlatformDataKeys") }}
    , and this class extends {{ mps_url("@openapi.CommonDataKeys") }}.

!!! warning "The action isn't visible."

    You have to add it to an `ActionGroup` that can be attached to different places, such as the context or build menu.
    All action context parameters marked as required must be available `#!java isApplicable` block must
    return true for an action to be visible. For debugging purposes, you can set *always visible* to true to check if your
    action is registered. 

    You must have a standalone descriptor in your model. Set the solution kind to *Other* in the *Java* tab of the solution properties ([Plugin | MPS](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups)).