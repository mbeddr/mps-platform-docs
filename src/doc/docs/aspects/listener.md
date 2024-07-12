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