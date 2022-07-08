??? question "How to initialize a node?"
    
    > Given I have a concept `Car` and it has a mandatory `description: HTMLDescription[1]`
    > How can I ensure that all created node will have a non-null HTMLDescription?

    **Using a Node Factory**

    The node factory will be called, whenever…

    - using the code completion menu to create such a node or to replace another one
    - calling **add new initialized**, **set new initialized**, **replace new initialized**, etc.
    - creating such node as a root from the context menu in the project view.

    The node factory is

    - **not** called when using quotations `<Car()>`
    - **not** called when just showing it in the editor
    - **not** called when adding it as a root with `model.add root(<Car()>)`
    - **not** called when adding it as a root with `model.add new root(Car)`

    ![node factory:car](node_factory_car.png)

    **Using a Behavior Constructor**

    Using a behavior constructor will only partially allow you to do such. Note that it will only be called when

    - creating nodes with **add new initialized()**, **set new initialized()** and similar methods from `j.m.lang.actions` and `j.m.lang.smodel`
    - creating a node with `new node<Car>()`

    Using a quotation will **not** call this constructor.

    ![Behavior: car](Car_behavior.png)

    **Using a Property Getter**

    You could use an `initialized` variable and use a combination of property getters and setters.

    This would work **only for properties though**, not for children or references, and requires quotations to also set the `initialized` value if trying to override the default. Furthermore, your quotations will still be marked 

    ![Constraints: Car](constraints_Car.png){width="800px"}

    Usage:

    ![Usage: Car](car_usage.png)


[1]: https://stackoverflow.com/c/itemis-mps/images/s/dcf45bcf-570d-4826-8832-e8c5a79775dc.png

[1]: https://stackoverflow.com/c/itemis-mps/images/s/418a2788-4b0f-424f-bdb0-01ad5703e748.png

!!! question  "I want to use generic return types.[^1]"

    Not possible. Have a look at [MPS-22502](https://youtrack.jetbrains.com/issue/MPS-22502).

!!! question  "Can I use asynchronous code in behaviour methods such as calls to external tools?"

    Be careful when doing so. Make sure to not mix concurrent locking aspects such as write and read actions into behaviour methods. 
    It should always be assumed that you have the correct lock in this methods. Move the code concerning the concurrent access for example into a background task.
    More information can be found in the [official documentation](https://www.jetbrains.com/help/mps/progress-indicators.html).

!!! question  "Can I access the parent in the constructor?"

    No, it doesn't work because the node is not attached yet ([documentation](https://www.jetbrains.com/help/mps/behavior.html#conceptconstructors)). Use for example a [node factory](https://www.jetbrains.com/help/mps/smodel-language-modification-operations.html#newnodecreation) to
    access the parent instead.

!!! question  "Can I use a more specific return type while overriding behavior?"

    No, it is not possible. Have a look at [MPS-27720](https://youtrack.jetbrains.com/issue/MPS-27720).

!!! question  "Can I use variable arguments (varArgs) in behaviour methods?"

    No, it is not possible. Have a look at [MPS-31056](https://youtrack.jetbrains.com/issue/MPS-31056).

!!! question  "Can I enter a throws clause in behaviour methods?"

    No, it is not possible. Have a look at [MPS-22306](https://youtrack.jetbrains.com/issue/MPS-22306).

!!! question  "Where can I save temporary information about nodes?"
    
    Consider saving temporay data about nodes in annotations and user objects ([node/.putUserObject](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.model%28MPS.OpenAPI%2F%29%2F%7ESNode.putUserObject%2528java.lang.Object%2Cjava.lang.Object%2529), [node/.getUserObject](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.model%28MPS.OpenAPI%2F%29%2F%7ESNode.getUserObject%2528java.lang.Object%2529))
    instead of introducing properties. For the generator consult the section "Transferring User Data" of the [generator documentation](https://www.jetbrains.com/help/mps/generator-language.html#generatorlanguagereference).

!!! question "How to mark a constructor-created child optional? (created by a light quotation)"

    > Example:

    > ![required link is not initialized](required_link_is_not_initialized.png)

    Solutions:

    - Initialize it with "null" in the light quotation.
    - Create it without light quotation.
    - Allow the child to be optional (`[0..1]`).

!!! question "How can I query the context in a node constructor?"

    > Does anyone know a way to find the contextExpression from the node constructor?

    Use a node factories instead of constructors and make use of the `enclosingNode` parameter. 
    Constructors are invoked always when creating a node. Node factories are invoked only by the editor and by the `new initialized ...` expression.
    
    Note: Node factories are invoked in the inverse order of constructors. MPS will first invoke the specific node factory and the more generic ones if the exist.

!!! question "Why does my virtual method have `isVirtual=false`?"

    > Given there is a virtual behavior method `getPresentation`
    
    > When override `getPresentation` in a sub-concept
    
    > Then I see it displays the overriding method to be virtual
    
    > ![virtual getPresentation](virtual_getPresentation.png)
    
    > Yet, I see that `methodDeclNode.isVirtual` is `null`.
    
    > ![methodDeclNode isVirtual is null](methodDeclNode_isVirtual_null.png)
    
    > Why is that?

    Note that `isVirtual` and `isVirtual()` on a method have different semantics.

    ```java
    public boolean isVirtual() { 
        return this.isVirtual || this.overridenMethod != null; 
    }
    ```
    
    The editor shows a method to be _virtual_ when `isVirtual()` is true. As a result, overriding methods of virtual methods are not necessarily having `isVirtual=true`, but will still display _virtual_.
    
    The rationale behind may be that if a method is overriding another one, both of them **must** be virtual. This is needed so that the runtime will find out which of the two implementations to call. So we may read the `isVirtual` more precisely as „is explicitly virtual", and `isVirtual()` as "is effectively virtual".

    <sub>Contribution by: [@abstraktor](https://github.com/abstraktor)<sub>

[^1]: [MPS forum - Generics for return type of behavior method](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010808559-Generics-for-return-type-of-behavior-method)