---
title: Listener aspect
---

# Listener aspect

This aspects allows to create listeners that can react to changes in the model. It can react to different events such as
adding and removing children or value changes of properties.

!!! question "How do you react to change in the model?"

    Use `com.mbeddr.mpsutil.modellisteners` from the [mbeddr platform](http://mbeddr.com/platform.html).

!!! question "Is there a way to listen to changes in any descendant?"

    Add a single change listener to `BaseConcept`. You would still need to define your logic for every kind of a change (property, reference, child...) separately there.

!!! question "Are they executed synchronously or asynchronously?"

    They are executed synchronously.