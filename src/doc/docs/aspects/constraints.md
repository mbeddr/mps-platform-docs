---
title: Constraints Aspect
tags:
- aspect
---
# Constraints Aspect

The constraints aspect defines constraints for the concepts of the language.

- [official documentation](https://www.jetbrains.com/help/mps/constraints.html)

## General

!!! question "How do you hide inapplicable operands in dot expressions?"

    [Dot expressions: hiding inapplicable operands](https://specificlanguages.com/posts/dot-expressions-hiding-inapplicable-operands/){{ blog('sl') }}

!!! question "Are there any useful helper classes?"

    - {{ mps_url("@mps.ModelConstraints") }}: This class can calculate the constraint/scope of a specific concept/node programmatically.

## Properties

!!! question "How can you set default values for properties?"

    Use the language ^^com.mbeddr.mpsutil.propertydefault^^ from {{ mbeddr_platform() }}.

!!! warning "The property value isn't valid."

    Specific Languages Blog: [Invalid property values](https://specificlanguages.com/posts/2022-02/22-invalid-property-values/)

## References

!!! question "How can you emulate references?"

    [Pseudo-references: emulating references](https://specificlanguages.com/posts/2022-02/02-pseudoreferences/){{ blog('sl') }}

## Scopes

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