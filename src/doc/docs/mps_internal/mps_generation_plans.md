---
comments: true
---

During a generation process MPS translates generation plan models to an internal runtime representation of the generation plan:

- A generation plan specification is a metamodel instance of the MPS language `jetbrains.mps.lang.generator.plan`.
  This is what the user specifies in a respective generation plan editor.
  The root node concept is `Plan`.

- The Java interface of an internal runtime representation object of a generation plan is `jetbrains.mps.generator.ModelGenerationPlan`.
  Different implementations of that interface exist to reflect different kinds of generation plan translation results. The selected translation strategy (see below) decides about the concrete implementation class to instantiate for a particular translation result.
  In contrast to a generation plan specification, a `ModelGenerationPlan` object might be specific for a particular input model of a generation process. Possibly, this is also the reason for the prefix `Model` of the class name.

- The Java class `GenPlanTranslator` controls the generation plan translation process.
  The typical code pattern to translate a generation plan looks like this:
    ```java
    GenPlanTranslator genPlanTranslator = new GenPlanTranslator(generationPlanSpecification);
    final LanguageRegistry languageRegistry = LanguageRegistry.getInstance(generationInputModel.getRepository());
    EngagedGeneratorCollector engagedGeneratorCollector = new EngagedGeneratorCollector(languageRegistry, generationInputModel);
    RegularPlanBuilder planBuilder = new RegularPlanBuilder(languageRegistry, engagedGeneratorCollector.getGenerators());
    genPlanTranslator.feed(planBuilder);
    ModelGenerationPlan modelGenerationPlan = planBuilder.wrapUp(genPlanTranslator.getPlanIdentity());
    ```
  `ModelGenerationPlan` iterates the sequence of steps specified in a generation plan specification and delegates the translation of the generation plan steps to a generation plan builder (Java interface `jetbrains.mps.generator.GenerationPlanBuilder`).

- Different kinds of generation plan builders do exit, i.e., `jetbrains.mps.generator.impl.plan.RigidPlanBuilder` and `jetbrains.mps.generator.impl.plan.RegularPlanBuilder`. This approach follows the strategy design pattern.
  In contrast to `RegularPlanBuilder`, `RigidPlanBuilder` is more restrictive.
  It is unclear what `RigidPlanBuilder` is needed for. Within the MPS source code it is used only once in a test code class.
  Nevertheless, we use `RigidPlanBuilder` in the current implementation of `com.mbeddr.mpsutil.generatorfacade.GeneratorFacade` in the "MPS Util" part of the "mbeddr.core" platform library (see http://mbeddr.com/mps-platform-docs/platform_essentials/mpsutils/generator/#generator-facade). Possibly, because it is a bit easier to apply than `RegularPlanBuilder`.

- Restrictions of and problems with the generation plan builder `RigidPlanBuilder`:

    - The only kinds of generation plan steps that `RigidPlanBuilder` supports are transform and checkpoint steps. It is not possible to translate apply generators and fork steps.

    - `RigidPlanBuilder` does not obey to the configuration of the property `individualStepPerGenerator` in transform steps of a given generation plan specification. It seems to always break down a transform step to separate steps for each language entry.

If an MPS language module encompasses a generator implementation this generator must be applied in a respective generation plan specification for that language. Otherwise the application of that generation plan specification is errorneous (error message: "Model uses language <origin_language_module\> with 1 generator(s), none of which is engaged with the active generation plan"):

- As a consequence, it is not really possible to provide alternative generators in further language modules if the origin language module itself provides a generator. All generators must be implemented in separate language modules in such cases. But then generations for instances of that origin language always require an explicit generation plan to select a generator as it is not possible to link one of the separate generators to the origin language as its default generator.

- As a workaround, you can formally add the origin language module as the last entry in a transform step of a generation plan specification and set the `individualStepPerGenerator` property of that transform step to `false`, e.g.:
    ```java
    transform                                                                   
       examplelanguage.generator2 Transform
       examplelanguage Transform           
    ```
If `examplelanguage.generator2` will consume all input root nodes the entry `examplelanguage` will have no effect in this example setup.
Notice that this workaround does not work with the generation plan builder `RigidPlanBuilder` which does not obey to the configuration of the property `individualStepPerGenerator`.
