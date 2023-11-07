---
title: Constraints Aspect
tags:
- aspect
---
# [Constraints Aspect](https://www.jetbrains.com/help/mps/constraints.html)

The constraints aspect defines constraints for the concepts of the language.

## General

You can create new constraints using the concept `ConceptConstraints`. The "new" experimental constraint rules still might
not support all the features of the old approach.

!!! question "How do you hide inapplicable operands in dot expressions?"

    [Dot expressions: hiding inapplicable operands](https://specificlanguages.com/posts/dot-expressions-hiding-inapplicable-operands/){{ blog('sl') }}

!!! question "Are there any useful helper classes?"

    - {{ mps_url("@mps.ModelConstraints") }}: This class can calculate the constraint/scope of a specific concept/node programmatically.

## [Properties](https://www.jetbrains.com/help/mps/constraints.html#propertyconstraints)

You can use property constraints to add setters, and getters and check if a new property value is valid. The getters are especially
useful for setting properties based on other properties. Example: A wrapper concept that referencable a node can use the name of the
reference as its name. For a reference *r*, you can implement [INamedConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1169194658468) in your concept and set the property getter of
*name* to `r.name`.

!!! question "How can you set default values for properties?"

    Use the language ^^com.mbeddr.mpsutil.propertydefault^^ from {{ mbeddr_platform() }}.

!!! warning "The property value isn't valid :beginner:"

    Specific Languages Blog: [Invalid property values](https://specificlanguages.com/posts/2022-02/22-invalid-property-values/)

## [References](https://www.jetbrains.com/help/mps/constraints.html#referentconstraints)

You normally add a node reference constraint to set the scope. The inline scopes and inherited scopes both have advantages and
disadvantages. You normally use the inline scopes where you can extract the scope into a utility class when you want to reuse it.
The inherited scope is often used for references that inherit the referenced concept's scope. It makes finding the original scope declaration harder, though.

!!! question "How can you emulate references?"

    [Pseudo-references: emulating references](https://specificlanguages.com/posts/2022-02/02-pseudoreferences/){{ blog('sl') }}

!!! question "How do you check for an unresolved reference programmatically?"

    ```java
    private static boolean isValidReference(reference ref) {
        if (ref == null ) return false; }
        SNode target = SNodeOperations.getTargetNodeSilently(ref);
        target != null && target.getModel() != null;
    }
    ```

    {{ answer_by('kbirken') }}

## [Scopes](https://www.jetbrains.com/help/mps/scopes.html)

!!! question "How do you filter scopes? Which scopes are available?"

    [FilteringScope](http://127.0.0.1:63320/node?ref=r%3A314576fc-3aee-4386-a0a5-a38348ac317d%28jetbrains.mps.scope%29%2F3961775458390497664) takes an existing scope and can do the filtering. [Using reference scope | MPS documentation](https://www.jetbrains.com/help/mps/scopes.html#usingreferencescope)
    lists some other scope implementations.

??? question "What's the best way to wrap a list of nodes into a *Scope*?"

    > I have a list of nodes and want to wrap them into a scope.
    > How do you do that?

    You're probably looking for `#!java ListScope.forResolvableElements(sequence<node<>> elements)`.

    **forResolvableElements**
    creates list scopes and also implements getName(child) like forNamedElements, yet returning the resolveInfo if the node is an {{ mps_url("@mps.IResolveInfo") }}, the name if it is an {{ mps_url("@mps.INamedConcept") }} or else calls `#!java getPresentation()`.
    
    **forNamedElements**
    
    I'm unsure about the use-case of `#!java ListScope.forNamedElements(sequence<node<>> elements)`, but it behaves unexpected in some cases:
    
    Note that elements with a blank name are not part of the scope created by `ListScope.forNamedElements(sequence<node<>> elements)`. They'll get silently omitted.
    
    Note that elements that are not an instance of {{ mps_url("@mps.INamedConcept") }}, will make `forNamedElements` throw an exception.

    {{ contribution_by('abstraktor') }}

!!! question "How can you combine scopes?"

    Use the class {{ mps_url("@mps.CompositeScope") }}.

!!! question "What's the difference between *parent scope* and *super.getScope*?"

    A parent scope asks your node or up in the hierarchy for the scope until it finds a scope provider.
    `super.getScope` will use the implementation from the super-concept.

!!! question "What does the resolve attribute in the XML files is used for? It often shows up in the diff tool or when running migrations."

    The resolve attribute helps to bind references again. Assume you have a Base Language class that declares a variable *myVar* that you refer to. Now you delete the variable, which destroys the reference to that variable. Then you create a parameter called myVar. After pressing F5, the variable reference is bound to the parameter again.
    
    This rebinding also works after restarting MPS because the reference text string is stored. Now, If you change the name of *myVar* to *myParam*, MPS automatically updates the projection. It also updates the reference in the same model, **not** everywhere (because that would be a global search). Note: You can rename it everywhere if you don't just type over the name of *myVar* but use *rename refactoring* (F6) . If you had a reference to *myVar* in some unrelated model, maybe even in a different module, *resolveInfo* would not be updated.
    
    MPS updates the *resolveInfo* at some point, most of the time when it rewrites the model. That might happen during migration. You can also force it by choosing *main menu* --> *File* --> *Save All*.

    {{ contribution_by('enikao') }}