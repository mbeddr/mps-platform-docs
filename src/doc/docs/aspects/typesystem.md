---
title: Typ System Aspect
tags:
- aspect
---

# [Type System Aspect](https://www.jetbrains.com/help/mps/typesystem.html)

> A type system is part of a language definition assigning types to the nodes in the models written using the language. The type system checks certain constraints on nodes and their types.
>
> — <cite>MPS documentation</cite>

- [old cheatsheet](http://dsl-course.org/jetbrains-mps-typesystem-aspect/)

!!! warning "Type system rules aren't executing."

    Turn off the [power save mode](https://www.jetbrains.com/help/mps/status-bar.html?q=Power%20save%20mode). Make also sure that you use the language that contains the rules. Make sure that under *Tool* -->
    *Model Checker*, the type system checks are enabled. The type system only checks some rules when you invoke *Check model*. In this case, the
    option *do not apply on the fly* is set to true in a checking rule.

!!! question "Are comparison rules often used?"

    They are rarely used (not many results across various code bases).

!!! question "How do you learn more about MPS CodeRules?"

    This new type-system works with logical constraints. Visit @JetBrains/mps-coderules
    for more information. There is also a [blog post](https://specificlanguages.com/posts/2022-01/13-coderules-entering-exiting/)
    about this project. The new MPS implementation of the Kotlin language uses CodeRules. @JetBrains/mps-kotlin-typesystem contains more information. There is also a free course about it on [stepik](https://stepik.org/course/101057/promo).

!!! question "Type system vs. constraints?"
    
    [Type system vs. constraints](https://specificlanguages.com/posts/typesystem-vs-constraints/){{ blog('sl') }}

!!! question "Subtyping vs. inheritance?"
    
    [Subtyping vs inheritance](https://specificlanguages.com/posts/2022-02/08-subtyping-vs-inheritance/){{ blog('sl') }}

!!! question "How can you speed up model checks?"
    
    [Speeding up model checks with Scope Cache](https://specificlanguages.com/posts/2022-01/26-speeding-up-model-checks-with-scope-cache/){{ blog('sl') }}

??? question "How do you build a language extension for checking rules?"

    > I built a Base Language extension that you can use in a checking rule (i.e., in the type system aspect of another language). Still, the new language's generator isn't engaged while generating some checking rules using the extension (the generation plan says: "NOT IN THE PLAN").

    The new language's generator must depend on the Base Language generator with the scope set to `Extends`.
    
    ![extend baselanguage generator](generator_extend_baselanguage.png){width="600px"}

    {{ contribution_by('kbirken') }}

!!! question "When and why should you copy a type in an inference rule?"

    > I've seen the same code, where one time, the type is copied, and another time it's just used (without the copy). When should we copy the type and why?

    ```kotlin
    inference rule typeof_Member {
        applicable for concept = Member as member
        applicable always
        overrides false

        do {
            typeof(member) :==: member.type.copy;
        }
    }
    ```

    Copy the type only if you want to use it in another type as a child.

    In the example, it should be fine to use `member.type`. But let's say you have a `SetType` concept in your language that contains an `innerType` as a child. If you want to construct an instance of that concept, write code like this:
    
    ```java
    node<SetType> result = new node<SetType>;
    result.innerType = member.type.copy;
    typeof(member) :==: result
    ```
    
    If you omit the `.copy` in the code, you will attempt to "hijack" the `member.type` node from the `member` and break the model. MPS will complain.

    {{ contribution_by('sergej-koscejev') }}

!!! question "How do you suppress errors?"

    > I have a piece of embedded demonstration code and don't want it to show warnings (e.g., on unused variables).
    > How can I do that?

    Make your node implement {{ mps_url("@mps.ISuppressErrors") }}. If you don't override any methods, it will suppress all constraint, type system, and cardinality errors and warnings.

    - You may override `#suppress(node<>)` to only hide the errors of certain subnodes.
    - You may override `#suppress(NodeReportItem)` to only hide specific errors. Overriding this will take precedence over overriding `#suppress(node<>)`. Xou should implement only one of them or manually call `#suppress(node<>)` from `#suppress(NodeReportItem)`.
    
    - If there are nested nodes that implement `ISuppressErrors`, the error will be suppressed if any of them returns true. You may debug such by copying the error node to the console (e.g., `nodeRef@50283`) and running this line:
    
    ```java
    > nodeRef@50283.ancestors<concept = ISuppressErrors>.select({~it => [it, it.suppress(nodeRef@50283)]; });
    
    [[dummy, false], [<no name>[LiteralProgramFragment]: dummy():void, false], [Demo1, true]]
    ```
    
    The result is the path from that node to the top and will tell you which node is suppressing that error.
    The concept {{ mps_url("@mps.IAntisuppressErrors") }} also plays a role there, although it is deprecated (implement the `suppress` method instead).

    {{ contribution_by('abstraktor') }}

??? question "Is there an elegant way to express inference rules on lists?"

    If you want to calculate the common type of more than one node you can use a type system variable for that. Example:

    ```java
    var x;
    
    foreach it in self.items {
        infer x :>=: typeof(it)
    }
    
    typeof(self) :==: operation type(self, x, null);
    ```

    Given that you need the operation type in the end. You probably need to change the implementation of the rules contributing to the `operation type` only to use "one side." If the type of the expression is simply the type of the variable `x`, you can omit it.

    {{ answer_by('coolya') }}

!!! question "What's Helgins?"

    It's the old name of the type system. The name is nowadays not used anymore.

!!! question "What is the relation between null and other types?"

    Null is a subtype of every [reference](https://www.javatpoint.com/reference-data-types-in-java) type in Base Language/Java but not of primitive types.

!!! question "What does variance mean?"

    Detailed explanation:

    - [StackOverflow answer](https://stackoverflow.com/a/8482091/16577108)
    - [Covariance and Contravariance in Java](https://medium.com/@yuhuan/covariance-and-contravariance-in-java-6d9bfb7f6b8e)

    > It concerns the relationship between types and subtypes, type conversion, and deciding whether a method is overwritten or overloaded.


    Simple explanation:

    - *covariance*
        - subtypes are allowed instead of a type
        - examples: method return type, parameter type, variable assignment
    - *contravariance*:
        - supertypes are allowed instead of a type
        - [parameter of function types](https://www.jetbrains.com/help/mps/closures.html#functiontype)
    - *invariance*: neither covariance nor contravariance
        - examples: generics (e.g `List<String>`is not a subtype of `List<Object>`)

    For overridden methods, the signature has to be the same (name + parameters), and the return type can be a subtype of the original return type:

    ```java
    class MyCollection {
        Iterator iterator() {
            null;
        }
    }

    class MyList extends MyCollection {
        @Override
        *package* ListIterator iterator() {
            null;
        }
    }
    ```
    
    The class *MyList* is allowed to specify a different return type (*ListIterator*).

!!! question "What's autoboxing in Base Language/Java?"

        In some cases, there is an automatic conversion between primitive and reference types called [autoboxing/unboxing](https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html).

    ```java
    Integer z1 = 1;
    int z2 = new Integer(1);
    ```

    Autoboxing [doesn't apply to array types](https://stackoverflow.com/a/45918658/16577108), and the type checker behaves differently in Java (J) and *Base Language (B)*:

    ```java
    Integer[] a = new int[]{1, 2}; // disallowed in both
    Integer z = 1; // allowed in both
    Integer[] b = {1}; // allowed in J, disallowed in B
    int[] c = {new Integer(1)}; // allowed in J, disallowed in B
    int[] d = new Integer[]{new Integer(1)}; // disallowed in both
    Object d = new int[]{1}; // allowed in both
    ```