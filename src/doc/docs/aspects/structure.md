---
title: Structure aspect
tags:
- aspect
---

# Structure aspect

The structure aspect contains all the concept and interface declarations of a language.

## Concepts

!!! question "How can you create an MPS concept declaration programmatically?"

    Specific Languages blog: [Create a MPS concept declaration programmatically](https://specificlanguages.com/posts/create-mps-concept-declaration-programmatically/)

!!! warning "Concept XY wasn't found in the language."

    Specific Languages blog: [Concept not found](https://specificlanguages.com/posts/2022-03/14-concept-not-found/)

!!! question "How do you find examples of MPS concepts?"

    Specific Languages blog: [Finding examples of MPS concepts](https://specificlanguages.com/posts/2022-01/19-finding-examples/)

!!! question "When a concept extends another concept/implements some interfaces, which method is called when they are defined in more than one concepts/interfaces?"

    The used algorithm is a a variant of [C3 linearization](https://www.wikiwand.com/en/C3_linearization)([source](https://github.com/JetBrains/MPS/blob/bbbfb6d8596638d27fc298a784bae09dc78e4d1e/core/aspects/behavior/behavior-api/source/jetbrains/mps/core/aspects/behaviour/AbstractC3StarAncestorResolutionOrder.java#L30)). When the concept doesn't implement the method itself, first the implemented interfaces are recursively considered in declaration order, then the extended concept.
    You can try it yourself, for example for the concept {{ mps_url("@mps.ClassConcept") }}:
    ```java
    BehaviorRegistryImpl r = (BehaviorRegistryImpl) ConceptRegistry.getInstance().getBehaviorRegistry();
    BHDescriptor d = r.getBHDescriptor(concept/ClassConcept/);
    #print r.getMRO().calcLinearization(_SAbstractConcept.wrap(concept/ClassConcept/));
    ```
    If you want to call a specific `#!java type()` implementation, you have to just cast the node to the corresponding concept and then call the method e.g. `#!java myNode as MyITypeable.type()`

!!! question "How can you get the short node ID from the node ID and vice versa?"

    - Short one: `#!java new IdEncoder().toText(node.getNodeId())`
    - Long one: `#!java new IdEncoder().parseNodeId(nodeId)`

## Interfaces

!!! warning "The concept implements {{ mps_url("@mps.ISuppressErrors") }} but errors are still shown for the node."

    You have to implement {{ mps_url("@mps.IDontApplyTypesystemRules") }} and {{ mps_url("@mps.ISkipConstraintsChecking") }}. More information can be found in [Suppressing Errors | MPS](https://www.jetbrains.com/help/mps/suppressing-errors.html).

!!! question "What's {{ mps_url("@mps.IMainClass") }} used for?"

    It allows to execute *baselanguage* code. An example can be found in [Shapes tutorial - Running the code](https://www.jetbrains.com/help/mps/shapes-an-introductory-mps-tutorial.html#runningthecode).

## Properties

!!! question "How do you use a list of string properties?"

    Wrap your property into a new concept and use a child collection:

    ```kroki-plantuml
    @startuml
    class Concept {
    myString: MyString [0..n]
    }

    class MyString {
    value: string
    }
    @enduml
    ```

!!! question "Can properties be overridden?"

    No, more info can be found in MPS-17143.

!!! question "How to get the name of a concept property?"

    The easiest way to do this is via [PropertyIdRefExpression](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F2644386474302386080). Then you can directly reference the property in question like this:
    `property/MyConcept : myProperty/.getName()`
    Whit this implementation, every changes in the property names are always calculated properly.

    {{ contribution_by('abstraktor') }}

## References

!!! question "How do you get the previous label of a reference?"

    ```java
    ((SReference)node.getReference(link)).getResolveInfo()` 
    // or
    node.reference<ref>.resolveInfo
    ```

!!! question "Can you use the resolve info to fix a broken reference?"

    ```java
    ResolverComponent.getInstance().resolve(...)
    ```

!!! question "How can you find broken references on the console?"

    ```java
    #instances<scope = global>(BaseConcept).where({~it => 
        it.references.any({~it => it.target == null; });
    })
    ```