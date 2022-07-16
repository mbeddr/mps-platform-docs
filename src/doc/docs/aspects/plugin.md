---
title: Plugin aspect
---

# Plugin aspect

> Plugins are a way to integrate your code with the MPS IDE functionality.
>
> — <cite>MPS documentation</cite>

## General

!!! question "Should you use this aspect?"

    No. You should use [plugin solutions](https://www.jetbrains.com/help/mps/plugin.html) instead.

??? question "How do facets work?"

    ![facets](facets.png)

    Red rectangles: marker facets
    
    - Do not define depdencies on other facets.
    - They are known to the MPS make process and are available for user
    - You can define where you own facet should fit in and decide if you require some facet.

    Usage:

    - Targets act as filters working on a stream of data delivered to them.
    - The data flowing along targets is called `resources`.
    - Resources are represented as Java interfaces and tuples.

??? question "How do I move a solution?"

    > Given I have a project with a test solution open and the solution is stored in `code/com.my/solutions/com.my.solution.to.move`, which is the wrong place. It should be `code/com.my/test/com.my.solution.to.move` instead.

    > I want to move the solution in the filesystem to its correct place. How can I move the solution without breaking the project?

    1. Move `code/com.my/solutions/com.my.solution.to.move` to `code/com.my.project/test/com.my.project.solution.to.move`.
    2. Close the MPS project and reopen it (no need to restart MPS).
    3. Re-add the `.msd` files as follows:
    3. On the workspace root node, right-click and open `Project Paths` (ALT+Return).
    4. Click on the red, old solution file and on `-`.
    6. Click on `+` and select the new location of this `.msd` file.
    7. Open your build script for CI tests and update the solution path in the project structure.

    {{ contribution_by('abstraktor') }}

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

    When clicking `#!java show`, it will open a usage search for the deleted node using `#!java ConsoleUtil.show`. This is implemented with a modellistener in a quite generic fashion.

    Here are a few insights:

    * Make sure to not show the node in the `searched for` part of the window. VCS will try to highlight it and run into an NPE (MPS 2019.3)
    * Consider cut+paste, or moving elements: These operations yield a removal event as well. Our approach is to hide the balloon again, once the node gets added again.

    ![DanglingReferenceHandler](DanglingReferenceHandler.png)

    {{ contribution_by('abstraktor') }}

??? question "How can you make sure that the IDE loads a jar exactly once and then never again?"

    > I have a .jar that depends on a native libray (.dll/.so/...). To use it in an MPS plugin I have a stubs solution for it. Unfortunately, without further ado, MPS tries to reload the jar in some cases (e.g. after a rebuild). This will fail, because the JVM does not allow reloading of native libraries.
    
    > How can I avoid this problem?

    To prevent that MPS will ever (re-)load .jars / stubs of a solution, you can check the facet "IDEA Plugin" in the "Facets" tab of the solution properties. This will show another tab where you have to set the Plugin ID "com.intellij".

    Now we just have to ensure that the .jars can be found at runtime (i.e. they must be on the classpath). The simplest approach would be to put them into the `lib` directory of the application (e.g. MPS installation / your product RCP).

    {{ contribution_by('till-f') }}

??? question "How can you use an IntelliJ icon for an action?"

    > I want to use one of the icons shipped with IntelliJ for my own action (`jetbrains.mps.lang.plugin.structure.ActionDeclaration`). How can I reference the icon?

    You can use `IconLoader.getIcon(...)` at the hidden icon expression. Right-click the editor for the icon, use "show reflective editor" and enter the expression as shown in the screenshot:

    ![IconLoader](IconLoader.png)

    {{ contribution_by('till-f') }}

??? question "How to use a Projection Mode Switcher to alter an EditorComponent?"

    > I have a concept editor in which I use an EditorComponent `A`. Using the Projection-Item in the Menu-Bar of MPS I would like to switch to another EditorComponent `B` upon activation.

    First `B` must override `A` and the `applicable concept` also must not differ.  Then for `B` in `applicable in context` we must provide a `concept editor context hint`.

    ![context hints tree layout](context_hints_tree_layout.png)

    This hint must also be referenced from a `Projection Mode Switcher`.

    ![projection mode switcher](projection_mode_switcher.png)
    
    Afterwards you will find a new entry in the `Projection`-Menu.
    
    Hint when used with grammarcells: you have to `disable component inlining` which can be activated by an intention at the position where the include of `A` happens. Also in any EditorComponent that inherits from `A` and `A` itself we cannot use 'grammarcells'.

    {{ contribution_by('dbinkele') }}

## Languages/features

!!! hint "I want to merge models."

    Use the language `de.itemis.mps.modelmerger` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I want to verify the structure of a node."

    Use the language `de.slisson.mps.structurecheck` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I want to store different states/versions of a node inside the model."

    Use the language `de.itemis.mps.nodeversioning` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

## Open API

!!! question "How do you create a new SContainmentLink for a non-existent role?[^1]."

    Create it through {{ mps_url("@mps.MetaAdapterFactory") }}.

!!! question "How to you check if a model is a generator model, a test model etc.?"

    Call the corresponding method in {{ mps_url("@mps.SModelStereotype") }}.

!!! question "How do you add imports to a model?"

    Use the class {{ mps_url("@mps.ModelImportHelper") }} and call `addImport`.

!!! question "How can you open an MPS Editor Tab programmatically?"

    ```java
    EditorContext.getEditorPanelManager().openEditor(node);
    ```

!!! question "Is it possible to associate an MPS-Aspect with more than one node?"

    Yes, see:

    ```java
    IConceptAspect.getBaseConceptCollection();
    ```

## Troubleshooting

!!! warning "A reference to a key in action context parameters is out of search scope."

    You need to add a dependency to {{ mps_url("@mps.MPSCommonDataKeys") }}.
    This class extends {{ mps_url("@openapi.PlatformDataKeys") }}
    and this class extends {{ mps_url("@openapi.CommonDataKeys") }}.

!!! warning "An action isn't visible."

    You have to add it to an `ActionGroup` that can be attached to differenct places such as the context menu or the build menu. 
    All of the action context parameters that are marked as required have to be available and the `#!java isApplicable` block must
    return true for an action to be visible. For debugging purposes you can set `always visible` to true to check if your
    action is registered at all. You also need to have a standalone descriptor in your model for it to work. Additionaly,
    the solution kind should be set to `Other` in the `Java` tab of the solution properties ([Plugin | MPS](https://www.jetbrains.com/help/mps/plugin.html#actionsandactiongroups)).

[^1]:[How to create new SContainmentLink for a non-existent role?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360009473300-How-to-create-new-SContainmentLink-for-non-existent-role-)