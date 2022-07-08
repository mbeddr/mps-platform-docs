!!! question "How can I set default values for properties?"

    Use the language `com.mbeddr.mpsutil.propertydefault` from the [mbeddr platform](http://mbeddr.com/platform.html).

!!! question "How do I hide inapplicable operands in dot expressions?"
    Specific Languages Blog &mdash; [Dot expressions: hiding inapplicable operands](https://specificlanguages.com/posts/dot-expressions-hiding-inapplicable-operands/){target=_blank}

!!! question "How can I emulate references?"
    Specific Languages Blog &mdash; [Pseudo-references: emulating references](https://specificlanguages.com/posts/2022-02/02-pseudoreferences/){target=_blank}

!!! question "How can I emulate references?"
    Specific Languages Blog &mdash; [Pseudo-references: emulating references](https://specificlanguages.com/posts/2022-02/02-pseudoreferences/){target=_blank}

!!! question "Are there any useful helper classes?"
    - [ModelConstraints](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel.constraints%28MPS.Core%2F%29%2F7376116761796593423): This class can be used to calculate the constraint/scope of a specific concept/node programmatically.

??? question "What's the best way to wrap a list of nodes into a Scope?"
    > I have a list of nodes and want to wrap them into a scope
    > How do I do that?

    You're probably looking for `ListScope.forResolvableElements(sequence<node<>> elements)`.

    **forResolvableElements**
    `forResolvableElements`-created list scopes also implement getName(child) like forNamedElements, yet returning the resolveInfo if the node is an `IResolveInfo`, the name if it is an `INamedConcept` or else the `getPresentation()`. That's probably what you'd expect.
    
    **forNamedElements**
    
    I'm unsure about the use-case of `ListScope.forNamedElements(sequence<node<>> elements)`, but it behaves unexpected in some cases:
    
    Note that elements with a blank name are not part of the scope created by `ListScope.forNamedElements(sequence<node<>> elements)`. They'll get silently omitted.
    
    Note that elements that are not an instance of `INamedConcept` will make `forNamedElements` throw an exception.

    <sub>Contribution by: [@abstraktor](https://github.com/abstraktor)<sub>