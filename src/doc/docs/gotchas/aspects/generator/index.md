!!! question "Are there any best practices for generators?"

    - [coolya - Maintainable MPS Generators](https://coolya.github.io/maintainable-generators/)

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

!!! warning "The generated code has no debug symbols."

    Locate the build solution in MPS that is building your languages and adjust the java settings:
    
        java options <project default> 
          generate debug info false 
          generate no warnings false 
          fork false 
          compiler <default compiler> 
          java compliance level 1.8 
          java compiler options <no additional options> 
          copy resources false 
    
    Then set `generate debug info` to `true`.
    
    If no java options exist in your build solution simply add one in the project structure.

??? question "How can I check if a model requires generation programmatically?"

    > The project view shows "(generation required)" if a model has been changed.
    > What is the source of this information, and how reliable is it?

    > *(regarding the 2nd part of the question: sometimes the text in the project view is not up to date, but pressing ++f5++ fixes it. Is it just the UI that is not updated when the underlying state changes, or is the state itself not updated properly until ++f5++ is pressed?)*

    `ModelGenerationStatusManager` provides corresponding API. This is how to use it:

    ```java
    MPSProject project = /* ... */;
    SModel model = /* ... */;
    ModelGenerationStatusManager statusManager = project.getComponent(ModelGenerationStatusManager.class); 
    if (statusManager.generationRequired(model)) { /* ... */ } 
    ```
    
    Unfortunately, it does not seem to be reliable. E.g., when changing something in the model, the API behaves correct in the first place. But after executing the "Synchronize" action, MPS for some reason believes that generation is not required any more (even though the change would have an effect on the output and "Synchronize" does not execute generation). This odd behavior can also be seen in the project view.

    {{ contribution_by('till-f') }}

??? question "How to generate large strings?"

    > Given I am writing a generator and it generates a java string for a string property.
    > That property holds a string of more than 64000 characters and the java compiler gives me a `constant string too long` error.
    > What can I do?

    > This is how it looks like so far:

    > ![long string property macro](long_string_property_macro.png)

    **Option 1**: Extract into a separate file

    Of course it would be better to not fill the java file too much and instead generate the string into a file that gets loaded at this place.

    **Option 2**: Split and join again

    The restriction only applies to the size of string literals. However, at runtime, it is allowed to have larger strings. So that we can split it into a concatenation that gets assembled at runtime then:

    * Here we use the guava `Joiner` and `Splitter` from `MPS.Core/google.common.base` and `java.util.Arrays`
    * We use the splitter at generation time to split it into parts of maximal 50000 characters.
    * Then we map it onto an arbitrary node that has a string property, as `$LOOP$` requires a node
    * In the property macro inside the loop, we simply pull that property out of the node again (the inspector of this is not visible in the screenshot)
    * It is just a coincidence that we create nodes of the same concept and use the same property for the loop content, than for the outside context node. You may light-quote anything of type string here.

    ![long string improved macro](long_string_improved_macro.png)

    {{ contribution_by('abstraktor') }}

??? question "How can I debug differences of generation between command line and MPS?"

    > Given I have an MPS project and it compiles well in my MPS.
    > When I run the same in a command line then I see a compile error.
    > How can I debug this?

    As Wladi reports, the issue behind this kind of issues usually lies in one of these three things:

    **Issue Area 1**: Settings (inplace, threading)
    
    Try turning off `Apply transformations in place` in your MPS settings under _Build, Execution, Deployment > Generator > General_, as this is unset in the command line (note, that this setting doesn't appear in the search):
    
    ![generator settings](generator_settings.png)
    
    Also, disabling the build in parallel threads may help.
    
    **Issue Area 2**: Dependencies
    
    A second issue may originate from the separate type of class loading and dependency loading in the command line.
    
    **Issue Area 3**: Generation plans
    
    The command line build runs the generator plans that are included in the devkits of a model, or that are explicitly added to the _generator_ facet+tab of a module. If your code starts the build for an explicit generation plan other than that, consider if a different plan could be the culprit. (Remember, right-clicking a model and "Show Generation Plan" to see if all looks as expected).

    Remark 1: Inplace transformations are on or off depending on your build script, same applied to parallel generation. On the command line if nothing specified it defaults to 4 threads. The biggest difference is that in the command line build not project is opened, which means anything that tried to access the project incl, virtual files will fail.

    Remark 2: One potential source of problems could be packaging of languages and generators. Because in the command line build generators might need to be loaded from packaged jars, any issues with that packaging could affect the generation. For example, as it currently may happen due to an MPS bug [MPS-32026](youtrack.jetbrains.com/issue/MPS-32026) that whole generator models with templates are not loaded and therefore not applied during the generation in the command line.

    {{ contribution_by('abstraktor') }}

??? question "How use generated classes which implement an extension-point?"

    > Let `L_A` be a language which offers an extension-point over class `E`. Then it is quite simple to provide a static implementation for extension-point for `E` in another language for example. But what if we have want map a concept `Q` of `B` to that extension-point? We want to be able to generated Code `C` from a Concept instance of `Q` which is a subclass of ``E, such that we can use it for the extension-point over class `E`.

    - Create the extension point in the plugin aspect of language `L_A`.

    ![extension point ModelMergeExt](extension_point_ModelMergeExt.png)

    - In generator main you need to create two root mapping rules for `Q` (which is ModelMerge in our case).

    ![ModelMergeExt generator](ModelMergeExt_generator.png)

    - map_ModelMerge maps `Q` to a class which extends `E` (here ConceptMergeSpec).
    - map_ModelMerge_extension will generate an extension for `Q`. It is a extension RootMapping which can be selected from the intention. 

    ![ModelMergeExt root template](ModelMergeExt_root_template.png)
    
    The code for the Reference-Macro in the figure above should look like this.
    ![ModelMergeExt_reference_macro.png](ModelMergeExt_reference_macro.png)

    Make sure you have `jetbrains.mps.lang.extension` included as language in the plugin.

    - Now create a solution (NOT a sandbox, it is a MUST). Set 'Solution Kind' in the properties to 'Other'. Afterwards create a model named 'plugin' (it is a MUST). Add an instance of `Q` to your model 'plugin' and build it. Looking now at your last transient model, there must be 3 artifacts related to `Q`: 1. The generated class 2. the generated extension 3. A ExtensionDescriptor which provides all found extensions.

    - Now you should be able to locate your extension with a code fragment like this:

    ```java
    foreach obj in extensionPoint/ModelMergeExt/.objects { 
    System.out.println("---> extension " + obj); 
    }
    ```

    {{ contribution_by('dbinkele') }}

[^1]:[MPS forum - I want export multiple languages from MPS](https://mps-support.jetbrains.com/hc/en-us/community/posts/4406708701458-i-want-export-multi-language-from-mps)
[^2]:[MPS forum - Is it possible to export a DSL compiler created with MPS and use it independently](https://mps-support.jetbrains.com/hc/en-us/community/posts/360008125300-Is-it-possible-to-export-a-DSL-compiler-created-with-MPS-and-use-it-independently-e-g-invoke-it-from-another-java-program-)
[^3]:[MPS forum - Generator error: uncaught exception ?no classifier?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004217260-Generator-error-uncaught-exception-no-classifier-)