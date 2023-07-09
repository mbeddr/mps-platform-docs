# Recipes

This section lists all relations required for a specific task.

If not specified otherwise, you should add all dependencies.

- If no dependency exists: with *default scope* and no *export flag*.
- If a dependency (no matter which scope and export flag) exists: no change

The IDE often creates the required relations on the module level automatically if we add a relation on the model
level. However, this doesn't always work, so double-check if the module level relation was correctly created if errors exist.

## Use a Java Type

*ClassB* inside *ModelB* inside *ModuleB* wants to create a variable of
type *ClassA* inside *ModelA* inside *ModuleA*.

- To *ModelB*, add a dependency to *ModelA*.  
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *ModuleB* to *ModuleA*.

## Reuse (AKA Extend, Reference) An External Java Type

*ClassB* inside *ModelB* inside *ModuleB* extends *ClassA* inside *ModelA* inside *ModuleA*.
*ClassC* inside *ModelC* inside *ModuleC* wants to use *ClassB* as simply as possible.

- To *ModuleB*, add the export flag to the dependency on *ModuleA*.
- To *ModelC*, add a dependency to *ModelB*.  
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *ModuleC* to *ModuleB*.

Remark: not sure if we should add the export flag to the dependency on *ModuleA* here.

## Create a Concept Instance

Directly (aka root node) or indirectly (aka child node) within *ModelB* inside *ModuleB*, we want to create an instance of *ConceptA* inside *LanguageA*.

- To *ModelB*, add *Used Language* to *LanguageA*.  
  Even if the IDE complains about the *Used Language* being "out of scope," click *ok*.
- MPS automatically adds a *Used Language* from *ModuleB* to *LanguageA*.

## Use an Intention

Make *IntentionC* defined in *LanguageC* for *ConceptA* inside *LanguageA* available in *ModelB* inside *ModuleB*.

- To *ModelB*, add *Used Language* to *LanguageC*.  
  Even if the IDE complains about the *Used Language* being "out of scope," click *ok*.
- MPS automatically adds a *Used Language* from *ModuleB* to *LanguageC*.

## Use a Type System Rule

Make *TypesystemRuleC* defined in *LanguageC* for *ConceptA* inside *LanguageA* available in *ModelB* inside *ModuleB*.

- To *ModelB*, add *Used Language* to *LanguageC*.  
  Even if the IDE complains about the *Used Language* being "out of scope," click *ok*.
- MPS automatically adds a *Used Language* from *ModuleB* to *LanguageC*.

## Use an Alternate Editor With a Hint

Make *EditorC* defined in *LanguageC* for *ConceptA* inside *LanguageA* using *HintD* defined in *LanguageD* available in *ModelB* inside *ModuleB*.

- To *ModelB*, add *Used Language* to *LanguageC*.  
  Even if the IDE complains about the *Used Language* being "out of scope," click *ok*.
- MPS automatically adds a *Used Language* from *ModuleB* to *LanguageC*.

## Make Sure That a Generator Is Executed for a Model

Make sure that *GeneratorC* defined in *LanguageC* for *ConceptA* inside *LanguageA* is executed for *ModelB* inside *ModuleB*.

- To *ModelB*, add *LanguageC* to *Languages engaged on generation*.
- To *ModuleB*, add *Used Language* to *LanguageC*.

## Use *node<SomeConcept>* Type

*ClassB* inside *ModelB* inside *ModuleB* wants to create a variable of type *node<ConceptA>* inside *LanguageA*.

- To *ModelB*, add Dependency to *LanguageA.structure*. Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *ModuleB* to *LanguageA*.

## Call a Behavior Method

*ClassB* inside *ModelB* inside *ModuleB* wants to call behavior method *opA* inside *ConceptA* inside *LanguageA*.

- To *ModelB*, add a dependency to *LanguageA.structure*.  
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *ModuleB* to *LanguageA*.

Note: We could also add a dependency from *ModelB* to *LanguageA.behavior*. However, as we need
to depend on *LanguageA.structure* anyway (to be able to access the type), the preceding recipe presented is preferred.

## Use a Concept as a Child or Reference

*ConceptB* inside *LanguageB* wants to have a child or reference of
type *ConceptA* inside *LanguageA*.

- To *LanguageB.structure*, add a dependency to *LanguageA.structure*.  
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a *Used Language* from *LanguageB* to *LanguageA*.

## Extend a Concept or Implement a ConceptInterface

*ConceptB* inside *LanguageB* wants to extend/implement *ConceptA*/*ConceptInterfaceA* inside *LanguageA*.

- To *LanguageB.structure*, add a dependency to *LanguageA.structure*.  
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.
- Make sure the dependency from *LanguageB* to *LanguageA* has *extends* scope, either by
  setting it manually or by using the intention on the error appearing on *ConceptB*.

## Create an Editor

*LanguageB* wants to define a new editor for *EditorHintC* defined in *LanguageC* for
*ConceptA* inside *LanguageA*.

- To *LanguageB.editor*, add a dependency to *LanguageC.editor*.
- To *LanguageB.editor*, add a dependency to *LanguageA.structure*.
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageC*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.
- Make sure the dependency from *LanguageB*to *LanguageA* has *Extends Scope*.

## Create an Editor Component

*LanguageB* wants to define a new editor component for *ConceptA* inside *LanguageA*.

- To *LanguageB.editor*, add a dependency to *LanguageA.structure*.
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.
- Make sure the dependency from *LanguageB*to *LanguageA* has *Extends Scope*.

## Use an Editor Component

*LanguageB* wants to use *EditorComponentC* defined in *LanguageC* for *ConceptA* inside *LanguageA*.

- To *LanguageB.editor*, add a dependency to *LanguageC.editor*.
- To *LanguageB.editor*, add a dependency to *LanguageA.structure*.
  Even if MPS complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageC*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.
- Make sure the dependency from *LanguageB*to *LanguageC* has *Extends Scope*.

## Create a Type System Rule

*LanguageB* wants to define a new type system rule for *ConceptA* inside *LanguageA*.

- To *LanguageB.typesystem*, add a dependency to *LanguageA.structure*.
  Even if MPS complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.
- Make sure the dependency from *LanguageB*to *LanguageA* has *Extends Scope*.

Note: The *overrides* flag in type system rules isn't related to dependencies.
This flag specifies if type system rules of concepts extended by the applicable concept are evaluated.

Example:

- *ConceptX* extends *ConceptY* extends *ConceptZ*
- *ConceptZ* defines type system rule *ConceptZTypeRule*
- *ConceptY* defines type system rule *ConceptYTypeRule1[override=true]* and *ConceptYTypeRule2[override=false]*
- *ConceptX* defines type system rule *ConceptXTypeRule[override=false]*

Then:

- For *ConceptZ*, the type system rule *ConceptZTypeRule* gets evaluated.
- For *ConceptY*, type system rules *ConceptYTypeRule1* and *ConceptYTypeRule2* get evaluated.  
  *ConceptZTypeRule* is not evaluated, as at least one rule for *ConceptY* defines:*[override=true]*.
- For *ConceptX*, type system rules *ConceptYTypeRule1*, *ConceptYTypeRule2* and  
  *ConceptXTypeRule* gets evaluated.  
  *ConceptYTypeRule1* and *ConceptYTypeRule2* get included because no rule for *ConceptX*
  defines:*[override=true]*.  
  *ConceptZTypeRule* is not evaluated because the search for rules in extended Concepts
  stops at the first concept having at least one rule defining:*[override=true]*.

## Create an Intention

*LanguageB* wants to define a new intention for *ConceptA* inside *LanguageA*.

- To *LanguageB.intentions*, add a dependency to *LanguageA.structure*.
  Even if the IDE complains about the dependency being "out of scope," click *ok*.
- MPS automatically adds a dependency from *LanguageB* to *LanguageA*.

## Create a Generator

Create Generator includes

- creating new root mappings
- creating new reduction rules
- creating new switches

*GeneratorB* inside *LanguageB* wants to create a generator transforming *ConceptA* inside *LanguageA*
into *ConceptC* inside *LanguageC*.

- To *GeneratorB.main@generator*, add a dependency to *LanguageA.structure*.
- To *GeneratorB.main@generator*, add *Used Language* to *LanguageC*.
  Even if the IDE complains about the dependency or used language being "out of scope," click *ok*.
- Don't forget to sort your generator into the generation process by defining some [mapping priorities](https://www.jetbrains.com/help/mps/mapping-priorities.html).
- MPS automatically adds a dependency from *GeneratorB* to *LanguageA*.
- MPS automatically adds a *Used Language* from *GeneratorB* to *GeneratorA*.
- If *LanguageC* defines a runtime solution: To *LanguageB*, add *Extends Scope* dependency to *LanguageC*.

## Extend a Generator

*Extend Generator* includes

- Making sure that another generator is always executed if this generator gets executed.
- Creating new reduction rules to be used in another generator.
- Creating a new switch entry for a switch in another generator.

*GeneratorB* inside *LanguageB* wants to extend *GeneratorA* inside *LanguageA*.  
*GeneratorA* transforms *ConceptC* inside *LanguageC* into *ConceptD* inside *LanguageD*.  
*GeneratorB* transforms *ConceptE* inside *LanguageE* into *ConceptF* inside *LanguageF*.

- To *GeneratorB.main@generator*, add a dependency to *GeneratorA.main@generator*.
  Even if the IDE complains about the dependency being *out of scope*, click *ok*.
- MPS automatically adds a dependency from *GeneratorB* to *GeneratorA*.
- Make sure the dependency from *GeneratorB*to *GeneratorA* has *Extends Scope*.

## Generate a Java Class Extending a Base Class

*GeneratorB* inside *LanguageB* wants to transform *ConceptA* inside *LanguageA* into a *ConceptAJavaClass* extending *ConceptAJavaClassBase* inside *ModelC* inside *SolutionC*.

- To *#GeneratorB.main@generator*, add a dependency to *LanguageA.structure*.
- To *#GeneratorB.main@generator*, add a dependency to *ModelC*.
- To *#GeneratorB.main@generator*, add *Used Language* to *BaseLanguage*.
  Even if the IDE complains about the dependency or *Used Language* being "out of scope," click *ok*.
- MPS automatically adds a dependency from *GeneratorB* to *LanguageA*.
- MPS automatically adds a dependency from *GeneratorB* to *SolutionC*.
- MPS automatically adds a *Used Language* from *GeneratorB* to *BaseLanguage*.
- To *LanguageB*, add *Extends Scope* dependency to *BaseLanguage* (because *BaseLanguage* defines a runtime solution).
- To *LanguageB*, add a runtime solution to *SolutionC*.

## Define a Runtime Solution

*LanguageB* wants to use *SolutionA* as a runtime solution.

- To *LanguageB*, add a runtime solution to *SolutionA*.

Note: We don't need any other relation, specifically, **no** dependency from *LanguageB* to *SolutionA*.

## Define an Accessories Model (AKA Make Concept Instances Available Everywhere a Language Is Used)

*BuiltInNodeA*, as an instance of *BuiltInConcept* inside *LanguageA*, should be available to be referenced anywhere *LanguageA*
is a *Used Language*.

- Create *AccessoryModel* as an aspect of *LanguageA*
- To *AccessoryModel*, add *Used Language* to *LanguageA*.
- Create *BuiltInNodeA* inside *AccessoryModel*.
- To *LanguageA*, add an accessory Model to *AccessoryModel* (if not present already).

Note: We don't need any other relation, specifically, no dependency from *LanguageA* to *AccessorySolution*.

## Create a Utility Model (AKA Create Complex Implementations for Behavior Methods or Generators)

*complexBehavior()* defined for *ConceptA* inside *LanguageA* needs *ComplexBehaviorInternalJavaClass* for its implementation, or
*GeneratorA* inside *LanguageA* needs *ComplexGeneratorInternalJavaClass* for its execution (e.g., for a complex condition or *macro*).

- Create *BehaviorUtilityModel* / *GeneratorUtilityModel* as a regular model within *LanguageA*.
- To *BehaviorUtilityModel* / *GeneratorUtilityModel*, add Used Language to *BaseLanguage*.
- Create *ComplexBehaviorInternalJavaClass* / *ComplexBehaviorInternalJavaClass* within *BehaviorUtilityModel* / *GeneratorUtilityModel*.
- To *LanguageA.behavior* add dependency to *BehaviorUtilityModel*
- To *GeneratorA.main@generator* add dependency to *GeneratorUtilityModel*