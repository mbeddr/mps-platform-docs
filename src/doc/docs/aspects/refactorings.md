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

!!! question "Can you link to an example that demonstrates this aspect?"

    [Rename](http://127.0.0.1:63320/node?ref=r%3Ad9efd362-28b8-4f70-9bcd-fb582528d11c%28jetbrains.mps.lang.core.refactorings%29%2F1347577327951770664) implements the refactoring.
    [RenameNode](http://127.0.0.1:63320/node?ref=r%3A97d6b60a-b381-42e8-9ea4-402ec93eaf11%28jetbrains.mps.ide.refactoring.plugin%29%2F8784230320738943353) implements the action.
    The action is part of the group [CoreNodeRefactorings](http://127.0.0.1:63320/node?ref=r%3A97d6b60a-b381-42e8-9ea4-402ec93eaf11%28jetbrains.mps.ide.refactoring.plugin%29%2F8784230320738943351) which belongs to the
    [NodeRefactoring](http://127.0.0.1:63320/node?ref=r%3Ade82dfab-9448-49ba-813e-2b0579f7fb15%28jetbrains.mps.ide.platform.actions%29%2F6714826334259354054) group. Base Language has its own group called [RefactoringAdditions](http://127.0.0.1:63320/node?ref=r%3Adfc27cab-2d08-4c79-ac99-e95209e18392%28jetbrains.mps.baseLanguage.pluginSolution.plugin%29%2F225095413451945663).

!!! question "Can you change the concept of a node while keeping all properties, references, and children?"

    Yes, call [RefactoringRuntime.replaceWithNewConcept](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F7217668918201205170) with your node and new concept as parameters. 
    In this class, there are also some other useful methods such as [changePropertyInstance(node, oldProp, newProp)](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765035392526) and [changeReferenceLinkInstances(node, oldLink, newLink)](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765035354594).
    
    [Changing the concept of a node](https://specificlanguages.com/posts/2022-01/20-changing-node-concept/){{ blog('sl') }}

!!! question "What should I put in the applicable block of the refactoring and its action?"

    For the action you can use `is applicable refactoring<YourRefactoring>()`. By default, refactorings are not disabled for read-only
    editors. Consult the [update block](http://127.0.0.1:63320/node?ref=r%3A97d6b60a-b381-42e8-9ea4-402ec93eaf11%28jetbrains.mps.ide.refactoring.plugin%29%2F8451255343455518243) of the [MoveNodes](http://127.0.0.1:63320/node?ref=r%3A97d6b60a-b381-42e8-9ea4-402ec93eaf11%28jetbrains.mps.ide.refactoring.plugin%29%2F830211401282058525) action for more information.
