!!! question  "How do I use a list of string properties?"

    Wrap your property into a new concept and use a child collection

    ```kroki-plantuml
    @startuml
    class Concept {
    myString: MyString [0..n]
    }
    @enduml
    ```

!!! question  "Can properties be overridden?"

    No. More info can be found in MPS-17143.

!!! warning  "I implemented `ISuppressErrors` but errors are still shown for my node."

    You have to implement [IDontApplyTypesystemRules](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F2216760464199502422) and [ISkipConstraintsChecking](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F5831887615299457091). More information can be found
    in the [official documentation](https://www.jetbrains.com/help/mps/2020.1/suppressing-errors.html).

!!! question "How can I create an MPS concept declaration programmatically?"
    Specific Languages Blog &mdash; [Create a MPS concept declaration programmatically](https://specificlanguages.com/posts/create-mps-concept-declaration-programmatically/){target=_blank}

!!! warning "Concept X was not found in the language"
    Specific Languages Blog &mdash; [Concept not found](https://specificlanguages.com/posts/2022-03/14-concept-not-found/){target=_blank}

!!! question "How do I find examples of MPS concepts?"
    Specific Languages Blog &mdash; [Finding examples of MPS concepts](https://specificlanguages.com/posts/2022-01/19-finding-examples/){target=_blank}

!!! question "How do I get the previous label of a reference?"
    `((SReference)node.getReference(link)).getResolveInfo()` or `node.reference<ref>.resolveInfo`.

!!! question "Can I use the resolve info to fix a broken reference?"
    `ResolverComponent.getInstance().resolve`.

!!! question "How can I find broken references on the console?"
    `#instances<scope = global>(BaseConcept).where({~it => it.references.any({~it => it.target == null; }); })`

!!! question "How can I get the short node ID from the normal node ID and vice versa?"

    - Short one: `new IdEncoder().toText(node.getNodeId())`
    - Long one: `ew IdEncoder().parseNodeId(nodeId)`

!!! question "What is IMainClass good for?"
    
    An example can be found in [Shapes tutorial - Running the code](https://www.jetbrains.com/help/mps/shapes-an-introductory-mps-tutorial.html#runningthecode).

!!! question "When a concept extends another concepts/implements some interfaces, which method is called when they exist in multiple concepts/interfaces?"

    The used algorithm is a a variant of [C3 linearization](https://www.wikiwand.com/en/C3_linearization)([source code](https://github.com/JetBrains/MPS/blob/bbbfb6d8596638d27fc298a784bae09dc78e4d1e/core/aspects/behavior/behavior-api/source/jetbrains/mps/core/aspects/behaviour/AbstractC3StarAncestorResolutionOrder.java#L30). When the concept doesn't implement the method itself, first the implemented interfaces are recursively considered in declaration order, then the extended concept.
    You can try it yourself, for example for the concept `ClassConcept`:
    ```java
    BehaviorRegistryImpl r = (BehaviorRegistryImpl) ConceptRegistry.getInstance().getBehaviorRegistry();
    BHDescriptor d = r.getBHDescriptor(concept/ClassConcept/);
    #print r.getMRO().calcLinearization(_SAbstractConcept.wrap(concept/ClassConcept/));
    ```
    If you want to call a specific `type() -implementation, you have to just cast the node to the corresponding concept and then call the method e.g. `#!java myNode as MyITypeable.type()`