---
tags:
- reference
---

!!! question "What does the dollar sign in error messages mean?"

    This indicates an anomyous class ([more information](https://stackoverflow.com/questions/11388840/java-compiled-classes-contain-dollar-signs)).

For a list of common Java exceptions have a look at [The Exception Hierarchy](https://docstore.mik.ua/orelly/java/langref/ch09_04.htm) and [Types of Exception in Java with Examples](https://www.geeksforgeeks.org/types-of-exception-in-java-with-examples/). [This list](https://docs.oracle.com/javase/7/docs/api/allclasses-noframe.html) includes documentation for all kinds of exceptions.

Here is some more information for exceptions that often occur in MPS:

- [java.util.ConcurrentModificationException](https://techvidvan.com/tutorials/java-concurrentmodificationexception/)
- [java.lang.NullPointerException](https://rollbar.com/blog/how-to-catch-and-fix-nullpointerexception-in-java/)

# MPS

## Module validation

!!! error "Can't find/Couldn't load X (language, devkit...)."

    X couldn't be loaded. The plugin containing X was not installed / the dependency was not fetched and added as a library.
    Install the plugin/open the project containing the language/fetch the dependency.

!!! error "Could not find generation plan associated with the devkit"

    "The generation plan couldn't be loaded. The plugin containing X was not installed / the dependency was not fetched and added as a library.
    Install the plugin/open the project containing the language/fetch the dependency.

!!! error "No generation plan in the model X"

    The referenced model for the generation plan in the properties doesn't contain a generation plan.

!!! warning ""

!!! warning "Cycle in extended language hierarchy."

    The languages extends each other in a way that creates a cycle hierarchy e.g. two languages extend each other.
    Read the documentation section about [dependencies](https://www.jetbrains.com/help/mps/mps-dependencies.html). Use the [dependency analyzer](https://www.jetbrains.com/help/mps/dependencies-analyzer-analyze-model-dependencies.html) to better understand the cycle.

!!! warning "Subconcepts for language x found, missing extends dependency."

    One or multiple concepts extend concepts from another language but don't have an extends dependency on the other language. 
    [Add a extends dependecy](https://www.jetbrains.com/help/mps/getting-the-dependencies-right.html#dependencies-2) to the other language in the dependency section of the module properties.


!!! warning "Superfluous extended module x, not referenced from structure aspect."

    The dependency was accidental added or is needed for a custom aspect and not the structure or editor aspect. Remove the dependency in the first case, keep it for the second case.

!!! warning "Missing runtime module x."

    A [runtime solution](https://www.jetbrains.com/help/mps/getting-the-dependencies-right.html#addingexternaljavaclassesandjarstoaproject-runtimesolutions) couldn't be loaded.
    The plugin containing the solution was not installed / the dependency was not fetched and added as a library.                                                                                       

!!! error "Runtime module x is not a solution." 

    The added runtime module is a language or other type of module. Add a module of type solution instead.

!!! warning "Missing accessory model x."

    The accessory model couldn't be loaded. The plugin containing the model was not installed / the dependency was not fetched and added as a library.    | Install the plugin/open the project containing the language/fetch the dependency.

!!! error "Accessory model x is not visible in the module."

     All modules visible from given modules include modules from dependencies, transitive, respecting reexports, including initial modules.
     Make sure to only refer to one of those modules.
                               |

!!! error "Accessory model x uses language it's part of."

    Mark the model as 'do not generate' to avoid unnecessary bootstrap dependency. 

!!! error "Accessory models are deemed design-time facility "

    The models are used to generate some code, this is not the best way to utilize accessory models. The models shall be marked as 'do not generate'.

## Type of exceptions

| name                                                                                                                                                                                                                                                  | example                                                                                           | description                                                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [ModuleLoaderException](https://github.com/JetBrains/MPS/blob/a704d1397ef7a04769a6c65fe4e257b3c4ce7303/plugins/mps-build/languages/build.mps/source_gen/jetbrains/mps/build/mps/util/ModuleLoaderException.java#L14)                                  | none                                                                                              | Deprecated exception that is not thrown anymore since 2017.                                                                                                   |
| [ModelReadException](https://github.com/JetBrains/MPS/blob/6f2f932bd21b581cce437a253414c46ce4cbe5f4/core/persistence/source/jetbrains/mps/smodel/persistence/def/ModelReadException.java#L25)                                                         | *.mps file is corrupt                                                                             | Indicates failure to read model. Is not specific to 'default' persistence.                                                                                    |
| [IllegalModelAccessException](https://github.com/JetBrains/MPS/blob/78a8983d975c3177461ae2553fd253bdc63baab6/core/smodel/source/jetbrains/mps/smodel/IllegalModelAccessException.java#L25)                                                            | Accessing a model from a swing button handler (e.g. you can read model only inside read actions). | Indicates forbidden operations over a SModel/SNode ([official documentation](https://www.jetbrains.com/help/mps/2021.3/smodel-language.html#accesslanguage)). |
| [AssertionError: Taking target node of dynamic reference<br />whose source node is not in a model](https://github.com/JetBrains/MPS/blob/6f2f932bd21b581cce437a253414c46ce4cbe5f4/core/kernel/source/jetbrains/mps/smodel/DynamicReference.java#L116) | a node is in detached state                                                                       | The source of a dynamic reference doesn't belong to a model.                                                                                                  |
| Position n is not allowed for X                                                                                                                                                                                                                       | The caret is the first position but the first position was disabled in the style.                 | The caret is at a position that is not allowed.                                                                                                               |
| ModuleClassLoaderIsDisposedException                                                                                                                                                                                                                  | A module couldn't be disposed and it is loaded again.                                             | The classloader of a module is disposed.                                                                                                                      |
| ClassLoader of module could not be found                                                                                                                                                                                                              |                                                                                                   | A module can't be loaded because the classloader can't be found.                                                                                              |

# Intellij Platform
| name                                                                                                                                                                                                                              | example                                             | description                                                                                                                                                                |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [PluginException](https://github.com/JetBrains/intellij-community/blob/9c46ff89dad4fc9a3e1db98ef0d0a735d4d89da2/platform/core-api/src/com/intellij/diagnostic/PluginException.java#L23)                                           | Usage of deprecated Intellij SDK methods            | Represents an internal error caused by a plugin. It may happen if the plugin's code fails with an exception, or if the plugin violates some contract of IntelliJ Platform. |
| [AlreadyDisposedException](https://github.com/JetBrains/intellij-community/blob/e4473f80a9d86ed179a41341f40796f18d254113/platform/core-api/src/com/intellij/serviceContainer/AlreadyDisposedException.java#L10)                   |                                                     | An already disposed objects gets disposed again (e.g. a Project)                                                                                                           |
| Exception from class [SlowOperations](https://github.com/JetBrains/intellij-community/blob/6985bb671272813dca262fdd751da5d038fe582b/platform/core-api/src/com/intellij/util/SlowOperations.java#L34)                              | MPS-34029                                           | If you get an exception from this method, then you need to move the computation to the background while also trying to avoid blocking the UI thread as well.               |
| Argument for @NotNull parameter must not be null                                                                                                                                                                                  | method with @NotNull Annotation is called with null | A null check failed ([official documentation](https://www.jetbrains.com/help/idea/nullable-and-notnull-annotations.html)).                                                 |
| Action dispatch failed.                                                                                                                                                                                                           |                                                     | The execution of an [action](https://plugins.jetbrains.com/docs/intellij/plugin-actions.html) failed.                                                                      |
| [ExtensionInstantiationException](https://github.com/JetBrains/intellij-community/blob/96b435d8d06965a2751c1d308ceb2240df26b656/platform/extensions/src/com/intellij/openapi/extensions/ExtensionInstantiationException.java#L13) |                                                     | This exception is thrown if some extension (service, extension point) failed to initialize.                                                                                |
