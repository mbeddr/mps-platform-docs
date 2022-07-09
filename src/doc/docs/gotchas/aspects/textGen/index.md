!!! question "How do I get the TextGen for a node?"

    Use the class [TextGeneratorEngine](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.text%28MPS.Core%2F%29%2F%7ETextGeneratorEngine).
    It only works for root nodes such as [ClassConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1068390468198)
    and returns null when there is no text output.

!!! question "Can I also generate text from the generator aspect?"

    Yes. Use the language `com.dslfoundry.plaintextgen` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

??? question "TextGen for another language?"

    >I would like to implement a textgen for language A in a separate language B. Concretely, I need a *different* textgen for some of the KernelF concepts. When I try to do this, I get a compile error, because it looks like the generated descriptor does not include "inherited" concepts:

    > ```java
    > public TextGenDescriptor getDescriptor(@NotNull SAbstractConcept concept) {
    >     switch (myIndex.index(concept)) {
    >         case LanguageConceptSwitch.Component:
    >             return new Component_TextGen();
    >         case LanguageConceptSwitch.Contract:
    >             return new Contract_TextGen();
    >         case LanguageConceptSwitch.EmptyContent:
    >             return new EmptyContent_TextGen();
    >         case LanguageConceptSwitch.Library:
    >             return new Library_TextGen();
    >        case LanguageConceptSwitch.Port:
    >             return new Port_TextGen();
    > ```

    > Is it not possible to "override the textgen" this way?

    {{ question_by('markusvoelter') }}

    It's not possible this way. 

    So far the two ways I found to make this happen are:

    1. Extend the original language (A.ex) and create subconcepts of all the concepts you need to specialise the textgen. You will then need to do m2m transformation to replace the extended concepts. You can do this in a very generic way by using a scrip the generator that searches for all node of concepts that are extended in A.ex and replaces them by using the `RefactoringRuntime.replaceWithNewConcept` method.

    2. Create annotations that override the text gen of the concepts and attache them in a generator. Then MPS will first call the text gen of the annotation and you can override it there. 

    There is MPS-22092 which describes this request.

    {{ answer_by('coolya') }}