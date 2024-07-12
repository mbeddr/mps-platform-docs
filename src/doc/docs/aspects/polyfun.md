---
comments: true
title: Polymorphic Functions Aspect
hide:
- toc
tags:
- aspect
---

# Polymorphic Functions Aspect

This aspect allows declaring polymorphic functions and is part of [Shadow Models](https://jetbrains.github.io/MPS-extensions/extensions/shadowmodels) in {{ mps_extensions() }}.
You can declare a function that can have different implementations per language. To get a better understanding, have a look at the corresponding sandbox.

!!! question "Is there a handler that the IDE calls when it loads a language?"

    > I have a language $K$ with some languages extending $K$ named $A$, $B$, and $C$. $K$ needs to access some behavior implemented by $A$, $B$ or $C$, depending on which of these are deployed. To do that, I implemented a registry where $A$, $B$, and $C$ can register and which $K$ uses to retrieve a common interface with a specific implementation by $A$, $B$, or $C$.
    
    > The question remains: How can $A$, $B$, and $C$ register their implementation at the registry? Is there maybe a better mechanism I should use here?

    The language ^^de.q60.mps.polymorphicfunctions^^ allows you to do that. It provides a new language aspect where you can declare a function in one language and multiple implementations in other languages. It supports [polymorphic dispatch](https://en.wikipedia.org/wiki/Dynamic_dispatch) and even priority rules in case multiple applicable implementations exist.

    {{ answer_by('slisson') }}

    **Alternative**

    Typically you would implement this by using the extension point mechanism:

    - Language $K$ defines an extension point $EP$ (inside of its plugin aspect) with an interface $EPI$ for the extension implementors.

    - Language $A$, $B$, and $C$ contribute extensions for the `EP` with specific implementations of the $EPI$ interface (also inside of the plugin aspect).

    - Language $K$ provides a facade for querying current extensions registered for the $EP$ and implements an appropriate strategy for handling multiple implementors of $EPI$ contributed by different extensions from languages $A$, $B$, and $C$:

        - by returning the implementor from the first extension, if your scenario expects only one deployed language with a specific implementation.

        - by picking up one of the implementors from multiple extensions using some criteria, like a priority.

        - by combining/chaining multiple implementors according to your specific logic.

    Because the facade would typically implement some simple caching of the resulting $EPI$ implementation (not to query the $EP$ every time the functionality is required), this would mean that you might need to implement some additional mechanism to allow for dynamical reload/reset of the current $EPI$ implementation during the development, when a new extension is created and tested.

    {{ answer_by('wsafonov') }}