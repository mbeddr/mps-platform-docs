# Dependencies

By default, only Nodes present in the current Model can be referenced. Dependencies add other Models and Modules to be referenced from the current Model.

Models listed as Dependencies of Model A need to be contained within Modules listed in the Dependencies (including transitive entries) of the Module containing this Model. Example:

	Module: ModuleA
		Model: ModelA.one
			Node: ModelA.one.alpha
		Model: ModelA.two
			Node: ModelA.two.alpha
		
	Module: ModuleB [depends: ModuleA]
		Model: ModelB.one [depends: ModelA.one]
			Node: ModelB.one.alpha
				references: ModelA.one.alpha
				references: ModelA.two.alpha !!out of scope,
				                             !!as ModelB.one has
				                             !!no Dependency on 
				                             !!ModelA.two
	Module: ModuleC
		Model: ModelB.one [depends: ModelA.one] !!out of scope,
		                                        !!as ModuleC has
		                                        !!no Dependency on
		                                        !!ModuleA

There is no way to mark a Model *internal* and hide it from outside access.

<a name="re_export"></a>
## Export Flag

Re-exports a Module Dependency to be used by Modules depending on this Module. Example:

	Module: ModuleA
		Model: ModelA.one
			Node: ModelA.one.TheNode

	Module: ModuleB [depends: ModuleA; export=true]

	Module: ModuleC [depends: ModuleA]

	Module: ModuleBeta [depends: ModuleB]
		Model: ModelBeta.one [depends: ModelA.one]
			Node: ModelBeta.one.TheOneNode
				references: ModelA.one.TheNode
		Model: ModelBeta.two
			Node: ModelBeta.two.TheTwoNode
				references: ModelA.one.TheNode !!out of scope,
				                               !!as ModelBeta.two has
				                               !!no Dependency on
				                               !!ModelA.one

	Module: ModuleGamma [depends: ModuleC]
		Model: ModelGamma.one [depends: ModelA.one] !!out of scope,
		                                            !!as ModuleC
		                                            !!does not export
		                                            !!ModuleA

<a name="_scope"></a>
## Scope

Default Scope is available for all Module types (TODO: check for DevKits).

Extends Scope is a superset of Default Scope, i.e. we never need to have both a Default Scope and an Extends Scope Dependency on another Module.

<a name="extend_language"></a>
### Extends Scope for Languages

LanguageB (containing ConceptB) MUST extend LanguageA (containing ConceptA and ConceptInterfaceA), if and only if

* ConceptB **extends** ConceptA or ConceptB **implements** ConceptInterfaceA
* LanguageB defines a **new Editor** for ConceptA (but *not* if LanguageA only defines the Editor Hint)
* LanguageB defines a **new Editor Component** for ConceptA
* LanguageB **uses an Editor Component** defined in LanguageA
* LanguageB defines a **new Type system** for ConceptA
* <a name="generating_concept_with_runtime_solution"></a>LanguageB defines a **Generator outputting** ConceptA **and** LanguageA **has a Runtime Solution**

Comment: Wrong (?): LanguageB **uses an Editor Component** defined in LanguageA

LanguageB SHOULD NOT extend LanguageA (but needs a Default Scope Dependency) if

* LanguageB defines a **new Intention** for ConceptA
* ConceptB defines a **Child** of Type ConceptA
* ConceptB defines a **Reference** to Type ConceptA
* ConceptB defines a behavior method **Using Type** ConceptA (e.g. as return type, parameter type, or variable type)

LanguageB CANNOT define

* a **new Behavior** for ConceptA
* a **new Constraint** for ConceptA

To be precise, it *is* possible to remove all errors flagged on Behaviors and Constraints in LanguageB. However, they are not taken into account for ConceptA.

<a name="extend_generator"></a>
### Extends Scope for Generators

GeneratorB (inside LanguageB, containing ConceptB) MUST extend GeneratorA (inside LanguageA, containing ConceptA), if and only if

* GeneratorB **defines a new Rule** for ConceptA
* GeneratorB **extends a Switch** from GeneratorA
* GeneratorB **defines a Generator Priority** relative to GeneratorA

<a name="implicit_dependencies"></a>
## Implicit Dependencies

Some Dependencies are added implicitly, i.e. without being listed in the corresponding dialog.

**Warning:** Even if the Dependencies described below are established implicitly, they are not taken into account in every aspect of MPS. So if an error occurs, make sure we didn't rely on some implicit Dependency. If in doubt, make the Dependency explicit.


<a name="implicit_generator_dependencies"></a>
### Implicit Dependencies inherited by a Generator from its Language

A Generator "inherits" some Dependencies from the Language it's defined in:

* The Language's runtime solutions are added to the Generator module dependencies.
* The Language Module is added to the Generator Module Dependencies.
* The Language is added to the Generator used languages.

Except the case of generating a Concept of a Language that has a Runtime Solution, there is no requirement on the Language's Dependencies or Used Languages stemming from the Generator.

<a name="implicit_language_export"></a>
### Implicit Exports of Used Language and Language Structure Aspect

Both a Used Language and the Language Structure Aspect implicitly allow accessing the Language's Behavior methods. However, they not re-export the complete Behavior Aspect. For example, a BaseLanguage Class contained in the Behavior Aspect is not visible.

<a name="implicit_runtime_exports"></a>
### Implicit Exports of Runtime Language Settings

**Runtime solutions** are

* implicitly loaded into the Java classpath of any Module using this Language.
* implicitly added to the Dependencies of the Generator contained in this Language.

**Accessory Models** are

* implicitly loaded into the Dependencies of any Model using this Language.

  Accessory Models are not designed to keep any classes. This is "design-only" information. They should not affect Java class path anyhow.

TODO: I believe they should be added to the dependencies of the generator module automatically. (if they are saved inside the same language they are visible for generator)

Neither Runtime Solutions nor Accessory Models constitute a Dependency from the Language to the referenced Solution or Model.

<a name="cyclic_dependency"></a>
## Cyclic Dependencies

Cyclic Dependencies between Modules should be avoided in general. They tend to render generation orders and other behavior non-deterministic. Languages are explicitly checked not to have a cyclic "Extends Scope Dependency". Cycles between models in the same module are fine.
Starting with MPS 2021.1 there is a higher chance that you could run into troubles with those cyclic dependencies, as the new javax compiler doesn't act as forgiving on that as the previous one (ECJ).

A special case are runtime solutions, accessory models, and utility models.

In contrast to Runtime Solutions, Utility Models are used *while* accessing a Behavior or running a Generator. Code within Runtime Solutions is used *after* the Generator ran from the generated code. Thus, a Runtime Solution SHOULD NOT use or reference the Language it's referred from. A Utility Model CAN use or reference the Language it's referred from.

Accessory Models CAN use or reference the Language they're referred from.
