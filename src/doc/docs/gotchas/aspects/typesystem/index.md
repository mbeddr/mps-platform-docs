!!! question "What is Helgins?"

    It's the old name of the typesystem. The name is nowadays not used anymore.

!!! warning  "Type system rules are not executing."

    Turn off the [power save mode](https://www.jetbrains.com/help/mps/status-bar.html?q=Power%20save%20mode). Also make sure that the languages that contains the rules is used. Make sure that under Tool->
    Model Checker the typesystem checks are enabled. Some rules are only checked when "Check model" is invoked. In this case the
    option "do not apply on the fly" is set to true in a checking rule.

!!! question  "Are comparison rules often used?"

    No, they are rarely used (not many results across various code bases).

!!! question "How to I learn more about MPS CodeRules?"

    This is kind of a new typesystem bases on constraints. Visit the [Github page](https://github.com/JetBrains/mps-coderules)
    for more information. There is also a [blog post](https://specificlanguages.com/posts/2022-01/13-coderules-entering-exiting/)
    about this project. The new MPS implementation of the Kotlin language uses CodeRules. More information can be found on the
    [Github page](https://github.com/JetBrains/mps-kotlin-typesystem). There is also a free course about it on [stepik](https://stepik.org/course/101057/promo).

!!! question "Type system vs constraints?"
    Specific Languages Blog &mdash; [Type system vs constraints](https://specificlanguages.com/posts/typesystem-vs-constraints/){target=_blank}

!!! question "Subtyping vs inheritance?"
    Specific Languages Blog &mdash; [Subtyping vs inheritance](https://specificlanguages.com/posts/2022-02/08-subtyping-vs-inheritance/){target=_blank}

!!! question "How can I speed up model checks?"
    Specific Languages Blog &mdash; [Speeding up model checks with Scope Cache](https://specificlanguages.com/posts/2022-01/26-speeding-up-model-checks-with-scope-cache/){target=_blank}

!!! question "How to build language extension for checking rules?"

    > I built a baselanguage extension which can be used in a checking rule (i.e., in the typesystem aspect of another language) buut the new language#s generator isn't engaged during the generation of some checking rule using the extension (generation plan says: "NOT IN THE PLAN").

    The generator of the new language must have a dependency to the baseLanguage generator with Scope set to `Extends`.
    
    ![extend baselanguage generator](generator_extend_baselanguage.png){width="800px"}

    {{ contribution_by('kbirken') }}

!!! question "When and why should a type be copied in an inference rule?"

    > I've seen basically the same code, where one time the type is copied and another time it's just used (without the copy). When should we copy the type and why?

    > ![typeof_Member](typeof_Member.png)

    The type should only be copied if you want to use it in another type as a child.

    In the example it should be fine to simply use `member.type`. But let's say you have a `SetType` concept in your language that contains an `innerType` as a child. If you want to construct an instance of that concept, you would write code like this:
    
    ```java
    node<SetType> result = new node<SetType>;
    result.innerType = member.type.copy;
    typeof(member) :==: result
    ```
    
    If you omit the `.copy` in the code, you would attempt to "hijack" the `member.type` node from the `member` and break the model. MPS will complain.

    {{ contribution_by('sergej-koscejev') }}

!!! question "How do I suppress errors?"

    > Given I have a piece of embedded demonstration code and don't want it to show warnings (e.g. on unused variables).
    > How can I do that?

    Make your demonstration node implement the `ISuppressErrors` interface. If you don't override any methods of it, it will suppress all constraint, typesystem and cardinality errors and warnings.

    - You may override `#suppress(node<>)` to only suppress the errors of certain subnodes.
    - You may override `#suppress(NodeReportItem)` to only suppress certain errors. Overriding this will take precedence of overriding `#suppress(node<>)`, so that you should implement only one of them or manually call `#suppress(node<>)` from `#suppress(NodeReportItem)`.
    
    - If there are nested nodes that implement `ISuppressErrors`, the error will be suppressed if any of them returns true**. You may debug such by copying the error-node to the console (e.g. `nodeRef@50283`) and running this line:
    
    ```java
    > nodeRef@50283.ancestors<concept = ISuppressErrors>.select({~it => [it, it.suppress(nodeRef@50283)]; });
    
    [[dummy, false], [<no name>[LiteralProgramFragment]: dummy():void, false], [Demo1, true]]
    ```
    
    The result is the path of from that node to the top and will tell you which node is suppressing that error.
    
    The concept `IAntisuppressErrors` also plays a role there, yet is deprecated (implement the `suppress`-method instead).

    {{ contribution_by('abstraktor') }}

??? question "Is there an Elegant Way to Express Inference Rules on Lists?"

    When want to calculate the common type of more than one node you can use a variable in the type system for that. I think in your case it should be possible to do:

    ```java
    var x;
    
    foreach it in self.items {
        infer x :>=: typeof(it)
    }
    
    typeof(self) :==: operation type(self, x, null);
    ```

    Given that you really need the operation type in the end. You most probably need to change the implementation of the rules contributing to the `operation type` to only use "one side". If the type of the expression is simply the type of the variable `x` you can omit it.

    {{ answer_by('coolya') }}
