---
title: Refactorings aspect
tags:
- aspect
---

# Refactorings aspect

> Simple refactorings can be written using the ^^jetbrains.mps.lang.refactoring^^ language.
>
> — <cite>MPS documentation</cite>

- [official documentation](https://www.jetbrains.com/help/mps/mps-refactoring.html)

!!! question "Is this aspect widely used?"

    No, even in MPS languages there are just a few use cases.

!!! question "Can you change the concept of a node while keeping all properties, references, and children?"

    Yes, call [RefactoringRuntime.replaceWithNewConcept](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F7217668918201205170) with your node and new concept als parameters. 
    In this class there are also some othere useful methods such as [changePropertyInstance(node, oldProp, newProp)](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765035392526) and [changeReferenceLinkInstances(node, oldLink, newLink)](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765035354594).
    
    {{ blog('sl',false) }}[Changing the concept of a node](https://specificlanguages.com/posts/2022-01/20-changing-node-concept/)
