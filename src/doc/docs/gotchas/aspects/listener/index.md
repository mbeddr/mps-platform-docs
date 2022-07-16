!!! question "How do I react to change in the model?"

    Use `com.mbeddr.mpsutil.modellisteners` from the [mbeddr platform](http://mbeddr.com/platform.html).

!!! question "Is there a simple way to listener to changes in any descendant?"

    Add a single change listener to `BaseConcept`. You would still need to define your logic for every kind of a change (property, reference, child...) separately there.

!!! question "Are they executed synchronously or asynchronously?"

    They are executed synchronously.