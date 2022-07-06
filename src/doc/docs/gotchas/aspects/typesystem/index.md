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

    <sub>Contribution by: [@kbirken](https://github.com/kbirken)<sub>