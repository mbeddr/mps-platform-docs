---
title: Listener aspect
tags:
- aspect
---

# Listener aspect

- [documentation](https://jetbrains.github.io/MPS-extensions/extensions/utils/model-listener/)

This aspects allows to create listeners that can react to changes in the model. It can react to different events such as
adding and removing children or value changes of properties.

!!! question "How do you react to change in the model?"

    Use ^^com.mbeddr.mpsutil.modellisteners^^ from {{ mbeddr_platform() }}.

!!! question "Is there a way to listen to changes in any descendant?"

    Add a single change listener to [BaseConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1133920641626). You still need to define your logic for every kind of a change (property, reference, child...) separately there.

!!! question "Are they executed synchronously or asynchronously?"

    They are executed synchronously.