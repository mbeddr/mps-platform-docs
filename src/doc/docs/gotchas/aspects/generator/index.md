!!! question "What can be generated?"
    
    Have a look at the [language repostory](https://confluence.jetbrains.com/display/MPS/MPS+Languages+Repository). You
    might also find other languages on Github. In general there doesn't have to be an existing language. Any text can be
    generated with TextGen or Plaintextgen from mps-extensions. It's also possible to generate code from an action or
    pre/post-processing script in the generator by using an existing Java library such as Apache Poi. A tutorial for example 
    for excel can be found [here](https://www.codejava.net/coding/how-to-write-excel-files-in-java-using-apache-poi).

!!! hint "I want to create multi outputs for my language.[^1]"

    Use a dummy concept or  generation plan with fork. Also answered in [documentation](https://www.jetbrains.com/help/mps/generator-cookbook.html#howtogeneratemultiplefilesperrootnode).

!!! question "Can I invoke the generator from an external tool?[^2]"

    Yes, it can be run from Ant.

!!! warning "The import x cannot be resolved.[^3]"

    The solution that contains the class has to be added as a runtime solution (see [here](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004217260/comments/360000621000))

!!! hint "I want to copy the output to another location."

    Use the [@CopyOutcome](http://127.0.0.1:63320/node?ref=r%3A4d7d5410-8d5a-45f2-a2f2-a6b7b42a377e%28jetbrains.mps.lang.makeup.structure%29%2F12232831069847415239) annotation.

!!! hint "I want to generate latex files."

    The mbeddr documentation language can do this. Have a look at the [documentation](http://mbeddr.com/files/documentationdocumentation.pdf).

!!! hint "I don't want to generate code."

    You can interpret your models instead. Use `mbeddr.mpsutil.interpreter` from the mbeddr plattform.

!!! hint "I want to generate text."

    Use the textgen aspect or use [mps-plaintextgen](https://dslfoundry.com/plaintextgen-tutorial/) from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).

!!! hint "I need a temporary model."

    Use the class [TemporaryModels](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel.tempmodel%28MPS.Core%2F%29%2F%7ETemporaryModels).

!!! hint "I want to call preview generated text programmatically."

    Use the MPS action [TextPreviewModel](http://127.0.0.1:63320/node?ref=r%3Acfccec82-df72-4483-9807-88776b4673ab%28jetbrains.mps.ide.make.actions%29%2F8610665572788515769) or call the methods in [TextGeneratorEngine](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.text%28MPS.Core%2F%29%2F%7ETextGeneratorEngine) if you want to use textgen.

!!! question "Why are my root nodes generated multiple times?"

    Have you used one of your root nodes as a child of another node? It will still act as a root node in this case.

!!! question "Should I use generation plans or generator priorities?"

    Have a look at the motivation for generation plans in the [official documentation](https://www.jetbrains.com/help/mps/generation-plan.html).
    Generation plans should be used when the generation order is simple.

!!! hint "I need to get the output path for a solution."

    - To get an `IFile` call `SModelOperations.getOutputLocation(model)`.
    - To get an string call `ProjectPathUtil.getGeneratorOutputPath(module.getModuleDescriptor())`. You have to first cast the module to an `AbstractModule.`

!!! warning "no output location for X."

    Make sure that the Java facet is enabled in the properties of the language or solution. This error can often be seen when opening an old MPS project.

!!! question "Which variable names can't be used because of hidden variables in the generator?"
    ^^Underlined^^ variables are special variables that are available.

    - Console: ConsoleContext **context**, ConsoleStream **console**
    - Constraint:
        - Scope: ReferenceConstraintsContext **_context**
    - Typesystem:
        - all rules: IsApplicable2Status **status**, TypeCheckingContext **typeCheckingContext**
        - comparison rule: SNode **node1**, SNode **node2**, 
        - inequation replacement rule
            - custom condition: SNode **subtype**, SNode **supertype**,
            - rule: SNode **subtype**, **SNode supertype**, ^^EquationInfo **equationInfo**^^, TypeCheckingContext **typeCheckingContext**, boolean **inequalityIsWeak**, boolean **inequalityIsLessThan**
        - substitute type rule: SNode **originalType**
    - Generator:
        - mapping configuration: CreateRootRuleContext **_context**
    - Editor:
        - General: SNode **myNode**

!!! question "How do I debug generators?"
    Specific Languages Blog &mdash; [Debugging generators](https://specificlanguages.com/posts/debugging-generators/){target=_blank}

!!! question "How does MPS collect generators to engage on a model?"
    Specific Languages Blog &mdash; [How MPS collects generators to engage on a model](https://specificlanguages.com/posts/how-mps-collects-generators-to-engage-on-a-model/){target=_blank}

!!! question "How do I generate language X from MPS?"
    Specific Languages Blog &mdash; [How do I generate language X from MPS?](https://specificlanguages.com/posts/how-do-i-generate-language-x-from-mps/){target=_blank}

!!! question "How to ensure that a generator B can use output of a generator A?"

    1. Define priorities or a fixed genplan for `B` (and maybe `A`)
    2. If you can't run / don't want to run both generators in the same “phase”, configure them to run one after each other.

    Solution **1**:

    - Define a *MM (structure)* (INFO-NODE) in `A` where you accumulate all required information and pass for all other generators.
    - Configure `A` to remove INFO-NODE if not required (separate mapping configuration).

    Solution **2**:

    - Define an annotation and store all req. infos there
    - Configure `A` to drop annotation if not required (separate mapping configuration),

    Solution **3**:

    - Use user objects to store required information as part of the real AST nodes.
    - User objects are “volatile” children/properties which are not persisted but survive several generation phases. Use `com.mbeddr.mpsutil.genutil` to achieve this.

    Solution **4**:
    
    - Define a fixed genplan with checkpoints.
    - Organize the whole generation process manually.

!!! question "genplan (in devkit) vs. generator priorities?"

    The genplan is applied instead of the generator priorities. If your generator should be applied in a model using a genplan, your generator has to be part of the genplan (somehow)
    When developing a language, which is used within an aspect, e.g. typesystem, the MPS aspect's genplan can block the generator.

[^1]:[MPS forum - i want export multi language from mps](https://mps-support.jetbrains.com/hc/en-us/community/posts/4406708701458-i-want-export-multi-language-from-mps)
[^2]:[MPS forum - Is it possible to export a DSL compiler created with MPS and use it independently](https://mps-support.jetbrains.com/hc/en-us/community/posts/360008125300-Is-it-possible-to-export-a-DSL-compiler-created-with-MPS-and-use-it-independently-e-g-invoke-it-from-another-java-program-)
[^3]:[MPS forum - Generator error: uncaught exception ?no classifier?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004217260-Generator-error-uncaught-exception-no-classifier-)