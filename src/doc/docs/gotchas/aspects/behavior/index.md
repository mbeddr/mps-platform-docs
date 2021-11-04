!!! question  "I want to use generic return types.[^1]"

    Not possible. Have a look at [this ticket](https://youtrack.jetbrains.com/issue/MPS-22502).

!!! question  "Can I use asynchronous code in behaviour methods such as calls to external tools?"

    Be careful when doing so. Make sure to not mix concurrent locking aspects such as write and read actions into behaviour methods. 
    It should always be assumed that you have the correct lock in this methods. Move the code concerning the concurrent access for example into a background task.
    More information can be found in the [official documentation](https://www.jetbrains.com/help/mps/progress-indicators.html).

!!! question  "Can I access the parent in the constructor?"

    No, it doesn't work because the node is not attached yet. Use for example a [node factory](https://www.jetbrains.com/help/mps/smodel-language-modification-operations.html#newnodecreation) to
    access the parent instead.

!!! question  "Can I use a more specific return type while overriding behavior?"

    No, it is not possible. Have a look at [this ticket](https://youtrack.jetbrains.com/issue/MPS-27720).

!!! question  "Can I use variable arguments (varArgs) in Behaviour methods?"

    No, it is not possible. Have a look at [this ticket](https://youtrack.jetbrains.com/issue/MPS-31056).

!!! question  "Can I enter a throws clause in Behaviour methods?"

    No, it is not possible. Have a look at [this ticket](https://youtrack.jetbrains.com/issue/MPS-22306).

!!! question  "Where can I save temporary information about nodes?"
    
    Consider saving temporay data about nodes in annotations and user objects ([node/.putUserObject](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.model%28MPS.OpenAPI%2F%29%2F%7ESNode.putUserObject%2528java.lang.Object%2Cjava.lang.Object%2529), [node/.getUserObject](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.model%28MPS.OpenAPI%2F%29%2F%7ESNode.getUserObject%2528java.lang.Object%2529))
    instead of introducing properties. For the generator consult the section "Transferring User Data" of the [generator documentation](https://www.jetbrains.com/help/mps/generator-language.html#generatorlanguagereference).

[^1]: [MPS forum - Generics for return type of behavior method](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010808559-Generics-for-return-type-of-behavior-method)