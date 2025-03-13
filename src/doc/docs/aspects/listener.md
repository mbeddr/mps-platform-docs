---
comments: true
title: Listener Aspect
hide:
- toc
tags:
- aspect
---

# [Listener Aspect](https://jetbrains.github.io/MPS-extensions/extensions/utils/model-listener/)

This aspect allows the creation of listeners that can react to changes in the model. It can respond to different events, such as adding and removing children or value changes of properties.

!!! question "How do you react to changes in the model?"

    Use ^^com.mbeddr.mpsutil.modellisteners^^ from the {{ mbeddr_platform() }}.

!!! question "Is there a way to listen to changes in any descendant?"

    Add a single change listener to [BaseConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1133920641626). You must still define your logic for every type of change (property, reference, child) separately.

!!! question "Are they executed synchronously or asynchronously?"

    They execute synchronously.

!!! question "What are real-world examples of listeners?"

    - update other nodes when children are removed or added
    - add missing references when the model changes
    - update components that preview nodes
    - remove cache entries when you remove a node
    - calculate IDs or updated calculated hashes when the model changes
    - populating the list of results when the specified scope of a node changes that fetches information from the model

!!! question "What listener can you call when an MPS project is ready?"

    The simplest solution would be to just create an application plugin in a plugin solution.

    If you only need the IntelliJ Platform to be loaded, the extension point `com.intellij.postStartupActivity` or `com.intellij.backgroundPostStartupActivity` can be used.

    For that you have to implement `com.intellij.openapi.startup.ProjectActivity`.
    To support older versions of MPS, you can implement `com.intellij.openapi.startup.StartupActivity` instead.
    
    Then you can declare you implementation as extension.
    
    ```xml
    <extensions defaultExtensionNs="com.intellij">
        <postStartupActivity implementation="com.example.MyProjectActivity"/>
    </extensions>
    ```

    {{ answer_by('odzhychko') }}

!!! question "Is there a listener that's called when an MPS project is closed?"

    For simple use cases, you can use the dispose method of an application plugin. If you want get notified on the IntelliJ platform level, there is [AppLifecycleListener](https://github.com/JetBrains/intellij-community/blob/idea/233.13135.103/platform/platform-impl/src/com/intellij/ide/AppLifecycleListener.java) which can be registered as described [here](https://plugins.jetbrains.com/docs/intellij/messaging-infrastructure.html#subscribing-to-a-topic).