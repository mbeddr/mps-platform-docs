---
title: Accessory Models
hide:
- toc
tags:
- aspect
---

# [Accessory Models](https://www.jetbrains.com/help/mps/accessories.html)

- [Adding builtins for an existing language](https://specificlanguages.com/posts/2022-05/19-adding-builtins-for-existing-language/){{ blog('sl') }}

!!! question "How do accessory models and utility models differ in terms of dependencies?"

    Utility models are models of a language that don’t have one of the names reserved for the aspects. There is nothing special about them regarding dependencies.
    Accessory models are automatically part of the imported models if you add the language to the *used languages*.

!!! question "How do you decide between providing a standard library shipped with the language vs. located in the user repository?"

    It depends on several factors, such as:
    
    - The scope of the library: Is it intended to be used by many users across different domains, or is it specific to a particular project or context?
    - The stability of the library: Is it well-tested and documented, or is it still under development and subject to frequent changes?
    - The library's dependencies: Does it rely on other libraries or external resources, or is it self-contained and portable?
    - The size of the library: Is it large or small, and how does it affect the distribution and performance of the language?
    - The maintainability of the library: Is it easy or hard to update and fix bugs, and who is responsible for doing so? Should users be able to edit the library?

!!! question "What are examples of accessory models in the real world?"

    - a catalog of scenarios
    - a glossary with referenceable terms
    - a container of predefined nodes such as languages, base types, units, modes
    - default styles sheets for the documentation

!!! question "What are examples of accessory models in MPS?"

    - custom collections containers
    - predefined symbol classes and regular expression
    - lightweight DSL classes that are instantiated by the user and processed in the generator
    - generation plans