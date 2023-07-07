---
title: TextGen aspect
hide:
- toc
tags:
- aspect
---

# TextGen aspect

> The TextGen language aspect defines a model to text transformation.
>
> — <cite>MPS documentation</cite>

- [official documentation](https://www.jetbrains.com/help/mps/textgen.html)

!!! question "How do you get the TextGen for a node?"
    
    Use the class{{ mps_url("@mps.TextGeneratorEngine") }}.
    It only works for root nodes such as {{ mps_url("@mps.ClassConcept") }} and returns null when there is no text output.

!!! question "Can you also generate the text from the generator aspect?"

    Use the language ^^com.dslfoundry.plaintextgen^^ from {{ mps_extensions() }}.

??? question "Can I implement text generation for another language?"

    >I would like to implement text generation for language A in a separate language B. Concretely, I need *different* text generation for some of the KernelF concepts. When I try to do this, I get a compile error, because it looks like the generated descriptor does not include "inherited" concepts:

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

    It's not possible this way. So far the two ways I found to make this happen are:

    1. Extend the original language (A.ex) and create subconcepts of all the concepts you need to specialize the textgen. You will then need to do M2M transformation to replace the extended concepts. You can do this generically by using a script the generator that searches for all nodes of concepts that are extended in A.ex and replaces them by using the `RefactoringRuntime.replaceWithNewConcept` method.

    2. Create annotations that override the text generation of the concepts and attach them in a generator. Then MPS will first call the text gen of the annotation and you can override it there. 

    There is MPS-22092 which describes this request.

    {{ answer_by('coolya') }}

!!! question "Which useful builtin languages do not use the generator but only text generation?"

    - ^^jetbrains.mps.baseLanguage.javadoc^^
    - ^^jetbrains.mps.core.properties^^
    - ^^jetbrains.mps.core.xml^^