# Recipes

This section lists all Relations required for a specific task.

If not specified otherwise, all Dependencies should be added

* if no Dependency exists: With Default Scope and no Export flag
* if a Dependency (no matter witch Scope and Export flag) exists: No change

MPS often creates the required Relations on Module level automatically if we add a Relation on Model
level. However, this does not work in all cases, so double-check if the Module level Relation was
created correctly if there are errors.

## Use Java Type

`ClassB` inside `ModelB` inside `ModuleB` wants to create a variable of
type `ClassA` inside `ModelA` inside `ModuleA`.

* To `ModelB`, add Dependency to `ModelA`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `ModuleA`.

## Reuse (aka extend, reference) External Java Type

`ClassB` inside `ModelB` inside `ModuleB` extends `ClassA` inside `ModelA` inside `ModuleA`.
`ClassC` inside `ModelC` inside `ModuleC` wants to use `ClassB` as simple as possible.

* To `ModuleB`, add the Export Flag to the Dependency on `ModuleA`.
* To `ModelC`, add Dependency to `ModelB`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleC` to `ModuleB`.

Remark: Not sure if we should add the Export Flag to the Dependency on `ModuleA` here.

## Create Concept Instance

Directly (aka root node) or indirectly (aka child node) within `ModelB` inside `ModuleB`, we want to create an instance of `ConceptA` inside `LanguageA`.

* To `ModelB`, add Used Language to `LanguageA`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageA`.


## Use Intention

Make `IntentionC` defined in `LanguageC` for `ConceptA` inside `LanguageA` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

## Use Type system Rule

Make `TypesystemRuleC` defined in `LanguageC` for `ConceptA` inside `LanguageA` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

## Use alternate Editor with Hint

Make `EditorC` defined in `LanguageC` for `ConceptA` inside `LanguageA` using `HintD`defined in `LanguageD` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

## Assure Generator is Executed for a Model

Assure `GeneratorC` defined in `LanguageC` for `ConceptA` inside `LanguageA` is executed for `ModelB` inside `ModuleB`.

* To `ModelB`, add `LanguageC` to *Languages engaged on generation*.
* To `ModuleB`, add Used Language to `LanguageC`.

<a name="use_node_type"></a>
## Use `node<SomeConcept>` Type

`ClassB` inside `ModelB` inside `ModuleB` wants to create a variable of
type `node<ConceptA>` inside `LanguageA`.

* To `ModelB`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `LanguageA`.

## Call Behavior Method

`ClassB` inside `ModelB` inside `ModuleB` wants to call
Behavior method `opA` inside `ConceptA` inside `LanguageA`.

* To `ModelB`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `LanguageA`.

**Note:** We could also add a Dependency from `ModelB` to `LanguageA.behavior`. However, as we need
to depend on `LanguageA.structure` [anyway](#use_node_type) (to be able to access the type), the recipe presented above is preferred.

## Use Concept as Child or Reference

`ConceptB` inside `LanguageB` wants to have a child or reference of
type `ConceptA` inside `LanguageA`.

* To `LanguageB.structure`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Used Language from `LanguageB` to `LanguageA`.

## Extend Concept or Implement ConceptInterface

`ConceptB` inside `LanguageB` wants to extend / implement
`ConceptA` / `ConceptInterfaceA` inside `LanguageA`.

* To `LanguageB.structure`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope, either by
  setting it manually or by using the Intention on the error appearing on `ConceptB`.

## Create Editor

`LanguageB` wants to define a new editor for `EditorHintC` defined in `LanguageC` for
`ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageC.editor`.
* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageC`.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

## Create Editor Component

`LanguageB` wants to define a new Editor Component for `ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

## Use Editor Component

`LanguageB` wants to use `EditorComponentC` defined in `LanguageC` for `ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageC.editor`.
* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageC`.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageC` has Extends Scope.

## Create Type system Rule

`LanguageB` wants to define a new Type system Rule for `ConceptA` inside `LanguageA`.

* To `LanguageB.typesystem`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

**Note:** The *overrides* flag in Type system Rules is not related to Dependencies.
This flag specifies if Type system Rules of Concepts extended by the applicable Concept are evaluated.

Example:

* `ConceptX` extends `ConceptY` extends `ConceptZ`
* `ConceptZ` defines Type system Rule `ConceptZTypeRule`
* `ConceptY` defines Type system Rule `ConceptYTypeRule1[override=true]` and `ConceptYTypeRule2[override=false]`
* `ConceptX` defines Type system Rule `ConceptXTypeRule[override=false]`

Then:

* For `ConceptZ`, Type system Rule `ConceptZTypeRule` is evaluated.

* For `ConceptY`, Type system Rules `ConceptYTypeRule1` and `ConceptYTypeRule2` are evaluated.  
  `ConceptZTypeRule` is **not** evaluated, as at least one Rule for `ConceptY` defines
  `[override=true]`.

* For `ConceptX`, Type system Rules `ConceptYTypeRule1`, `ConceptYTypeRule2` and  
  `ConceptXTypeRule` are evaluated.  
  `ConceptYTypeRule1` and `ConceptYTypeRule2` are included because no Rule for `ConceptX`
  defines `[override=true]`.  
  `ConceptZTypeRule`is **not** evaluated because the search for Rules in extended Concepts
  stops at the first concept having at least one Rule defining `[override=true]`.

## Create Intention

`LanguageB` wants to define a new Intention for `ConceptA` inside `LanguageA`.

* To `LanguageB.intentions`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.

## Create Generator

*Create Generator* includes

* Create new Root Mapping
* Create new Reduction Rule
* Create new Switch

`GeneratorB` inside `LanguageB` wants to create a Generator transforming `ConceptA` inside `LanguageA`
into `ConceptC` inside `LanguageC`.

* To `GeneratorB.main@generator`, add Dependency to `LanguageA.structure`.
* To `GeneratorB.main@generator`, add Used Language to `LanguageC`.
  Even if MPS complains about the Dependency or Used Language being "out of scope", click ok.
* Don't forget to sort your generator into the generation process by defining some [Generator Priority](https://confluence.jetbrains.com/display/MPSD31/Generator#Generator-DefiningtheOrderofPriorities).
* MPS will automatically add a Dependency from `GeneratorB` to `LanguageA`.
* MPS will automatically add a Used Language from `GeneratorB` to `GeneratorA`.
* If `LanguageC` defines a Runtime Solution: To `LanguageB`, add Extends Scope Dependency to `LanguageC`.

## Extend Generator

*Extend Generator* includes

* Assure another Generator is always executed if this Generator is executed
* Create new Reduction Rule to be used in another Generator
* Create a new Switch entry for a Switch in another Generator

`GeneratorB` inside `LanguageB` wants to extend `GeneratorA` inside `LanguageA`.  
`GeneratorA` transforms `ConceptC` inside `LanguageC` into `ConceptD` inside `LanguageD`.  
`GeneratorB` transforms `ConceptE` inside `LanguageE` into `ConceptF` inside `LanguageF`.

* To `GeneratorB.main@generator`, add Dependency to `GeneratorA.main@generator`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `GeneratorB` to `GeneratorA`.
* Make sure the Dependency from `GeneratorB`to `GeneratorA` has Extends Scope.

## Generate Java Class extending a Base Class

`GeneratorB` inside `LanguageB` wants to transform `ConceptA` inside `LanguageA` into a `ConceptAJavaClass` extending `ConceptAJavaClassBase` inside `ModelC` inside `SolutionC`.

* To `GeneratorB.main@generator`, add Dependency to `LanguageA.structure`.
* To `GeneratorB.main@generator`, add Dependency to `ModelC`.
* To `GeneratorB.main@generator`, add Used Language to `BaseLanguage`.
  Even if MPS complains about the Dependency or Used Language being "out of scope", click ok.
* Don't forget to sort your generator into the generation process by defining some [Generator Priority](https://confluence.jetbrains.com/display/MPSD31/Generator#Generator-DefiningtheOrderofPriorities).
* MPS will automatically add a Dependency from `GeneratorB` to `LanguageA`.
* MPS will automatically add a Dependency from `GeneratorB` to `SolutionC`.
* MPS will automatically add a Used Language from `GeneratorB` to `BaseLanguage`.
* To `LanguageB`, add Extends Scope Dependency to `BaseLanguage` (because `BaseLanguage` defines a Runtime Solution).
* To `LanguageB`, add Runtime Solution to `SolutionC`.

## Define Runtime Solution

`LanguageB` wants to use `SolutionA` as Runtime Solution.

* To `LanguageB`, add Runtime Solution to `SolutionA`.

**Note:** We don't need any other Relation, specifically, **no** Dependency from `LanguageB` to `SolutionA`.

## Define Accessories Model (aka make Concept Instances available everywhere a Language is Used)

`BuiltInNodeA` as Instance of `BuiltInConcept` inside `LanguageA` should be available to be referenced anywhere `LanguageA`
is a Used Language.

* Create `AccessoryModel` as Aspect in `LanguageA`
* To `AccessoryModel`, add Used Language to `LanguageA`.
* Create `BuiltInNodeA` inside `AccessoryModel`.
* To `LanguageA`, add Accessory Model to `AccessoryModel` (if not present already).

**Note:** We don't need any other Relation, specifically, **no** Dependency from `LanguageA` to `AccessorySolution`.

## Create Utility Model (aka create complex implementations for Behavior Methods or Generators)

`complexBehavior()` defined for `ConceptA` inside `LanguageA` needs `ComplexBehaviorInternalJavaClass` for its implementation.

or

`GeneratorA` inside `LanguageA` needs `ComplexGeneratorInternalJavaClass` for its execution (e.g. for a complex *condition* or *macro*).

* Create `BehaviorUtilityModel` / `GeneratorUtilityModel` as regular Model within `LanguageA`.
* To `BehaviorUtilityModel` / `GeneratorUtilityModel`, add Used Language to `BaseLanguage`.
* Create `ComplexBehaviorInternalJavaClass` / `ComplexBehaviorInternalJavaClass` within `BehaviorUtilityModel` / `GeneratorUtilityModel`.
* To `LanguageA.behavior` / `GeneratorA.main@generator` add Dependency to `BehaviorUtilityModel` / `GeneratorUtilityModel`