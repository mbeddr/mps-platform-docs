# Dependencies and Classpath in MPS

In this document, we describe the meaning and effect of different types of dependencies within MPS, including the effects on the applicable Java classpath. We describe both the expected state and all bugs deviating from the expectations, as of MPS version 3.1.4 (build #MPS-135.1441). We mention expected changes for version 3.2.

## Overview

All content known to MPS is contained in its *Modules Pool*.

The Modules Pool is filled from *Modules* in the current *Project* and all *Non-Project Sources*.

MPS in general cares about dependencies between Modules. The dependencies on *Models* only constrain further the dependencies of the Modules.

There are two main types of *Relations*: *Dependencies* are needed for any reference to something in another Module. *Used Languages* are needed to use something defined in a language. We refer to Relations if we address both types.

Other types of dependencies on Modules include *Java Stubs* (in combination with *Java Libraries*), *Java Source Stubs* (in combination with *Java Source Paths*), *Runtime Solutions* and *Accessory Models* (only available for Languages), and *Languages Engaged on Generation*.

*Build Models* abstract Ant files to build and package Modules and *IDEA Plugins*. They contain a copy of the Relations defined in the Modules, and dependencies to other Build Models and IDEA Plugins.

<a name=mps_plugin></a>
## MPS Plugins
MPS Plugins are automatically loaded according to the Solution Kind set in Java module settings.

MPS Plugins need to be contained in MPS plugin models.

#### StandalonePluginDescriptor
We need to add a StandalonePluginDescriptor (defined in Language `jetbrains.mps.lang.plugin.standalone`) as Root Node to any MPS Plugin Model using a Concept from Language `jetbrains.mps.lang.plugin`. Other concepts from Language `jetbrains.mps.lang.plugin.standalone` don't need a StandalonePluginDescriptor.

## Plugin Disambiguation
The term "plugin" is used at various places throughout MPS. It describes very different things:

* **IDEA plugins:** A packaged set of contributions to the IntelliJ IDEA Platform, which MPS is based upon.

* **MPS plugins:** Automatically loaded Models.

* **Plugin language aspect:** Model inside a Language defining Extension Points.

* **Build model plugins:** Part of Build Model language providing new entries for Build Models.


## Non-Project Sources

Non-Project Sources are

* Global libraries
* IDEA plugins
* Project libraries
* Common and Java Module Settings regarding Java classes and Java source files
* IDEA plugins referenced by a Module

These directories or Jar files are recursively scanned for `*.mpl` (Languages), `*.msd`(Solutions), and `*.devkit` (DevKit) files. If found, the corresponding content is added to the modules pool.


## Java Classpath vs. Relations

Both the Java Classpath and the Relations of a Model are specified by the various settings on Models and Modules. However, these settings affect Classpath and Relations in a different way.

As a rule of thumb, the Classpath contains all Java classes reachable through any kind of relation, i.e. the Classpath is populated generously. On the contrary, the Relations are populated reluctantly, i.e. they need to be specified explicitly.

The Dependency Relations on Modules and Models are completely separated from the Used Language Relations on Modules and Models. Thus, no Dependency requires a Used Language or vice versa.

## Used Languages

[Model Used Languages](#model-used-languages) need to be listed in the containing [Module Used Languages](#module-used-languages).

There are no implicitly available Used Languages except [described for Generators](#implicit-generator-dependencies). Specifically, if LanguageB has an [Extends Scope Dependency](#extend-language) on LanguageA and ModuleC uses LanguageB, LanguageA *is not a Used Language* within ModuleC.

We MUST add LanguageA (containing ConceptA) to ModuleB's and contained ModelB's Used Languages if and only if

* ModelB **instantiates** ConceptA within the IDE
* ModelB **executes Intentions** from LanguageA
* ModelB **requires Type checks** from LanguageA
* ModelB **uses Editors** from LanguageA by selecting an Editor Hint (but *not* if LanguageA only defines the Editor Hint)
* ModuleB is a Generator and **outputs instances** of ConceptA

Remark: not sure about: ModelB **uses Editors** from LanguageA by selecting an Editor Hint (but *not* if LanguageA only defines the Editor Hint)

<a name="executed_generator"></a>
## Executed Generators

GeneratorA contained in LanguageA (containing ConceptA)
will be executed for ModelS (contained in ModuleS) if and only if

* ModelS **[uses](#model-used-languages)** LanguageA **and contains an instance** of ConceptA
* ModelS **lists** LanguageA in **[Languages engaged on generation](#engaged-languages)**
* above conditions match LanguageB containing GeneratorB **[extending](#extend-generator)** GeneratorA


For discussion, we establish a continued scenario:

(The Relations listed here are not complete in order to reduce clutter. The [complete example](https://github.com/enikao/mps-dependencies) is available.)


	LanguageBase
		defines ConceptBase, ConceptBase2

	SolutionBase
		contains ModelBase [using LanguageBase]
			contains NodeBase [instanceof ConceptBase]

`SolutionBase` doesn't change during generation, as `LanguageBase` does not define any Generators.


	LanguageBaseGen
		contains GeneratorBase
			defines a rule for ConceptBase
			
	SolutionBaseGen
		contains ModelBaseGen [using LanguageBase, LanguageBaseGen]
			contains NodeBase [instanceof ConceptBase]

`SolutionBaseGen` doesn't change during generation either, as it does not contain any instances from
`LanguageBaseGen`, thus removing `LanguageBaseGen` from the list of applicable Generators, ending up with
no Generators at all.


	SolutionBaseGen2
		contains ModelBaseGen2 [using LanguageBase; engages LanguageBaseGen]
			contains NodeBase [instanceof ConceptBase]

`SolutionBaseGen2` ends up with a transformed `NodeBase`, as *Languages engaged in generation* are never removed.


	LanguageBaseGenExtends [extends LanguageBase]
		contains GeneratorBaseExtends
			defines a rule for ConceptBase2
	
	SolutionBaseGenExtends
		contains ModelBaseGenExtends [using LanguageBase; engages LanguageBaseGenExtends]
			contains NodeBase [instanceof ConceptBase]
			contains NodeBase2 [instanceof ConceptBase2]

`SolutionBaseGenExtends` ends up with an unchanged `NodeBase`, but a transformed `NodeBase2`.
`GeneratorBaseExtends` will be executed, because `LanguageBaseGenExtends` is listed in the *Languages engaged in generation*. However, the Dependencies of the Language are not considered for selecting the running Generators.


	LanguageBaseGenExtends2 [extends LanguageBase]
		contains GeneratorBaseExtends2 [extends GeneratorBase]
			defines a rule for ConceptBase2
	
	SolutionBaseGenExtends2
		contains ModelBaseGenExtends2 [using LanguageBase; engages LanguageBaseGenExtends2]
			contains NodeBase [instanceof ConceptBase]
			contains NodeBase2 [instanceof ConceptBase2]

In `SolutionBaseGenExtends2` both `NodeBase` and `NodeBase2` will be transformed, as `LanguageBaseGenExtends2`
is listed in the *Languages engaged in generation* and `GeneratorBaseExtends2` extends `GeneratorBase`.


	LanguageExtendsGen [extends LanguageBase]
		defines ConceptExtendsGen extending ConceptBase
		contains GeneratorExtendsGen
			defines a rule for ConceptExtendsGen
	
	SolutionExtendsGen
		contains ModelExtendsGen [using LanguageBase, LanguageExtendsGen]
			contains NodeBase [instanceof ConceptBase]
			contains NodeExtendsGen [instanceof ConceptExtendsGen]

Only `NodeExtendsGen` will be transformed in `SolutionExtendsGen`, as the only active Generator is
`GeneratorExtendsGen` (because we found an instance of `ConceptExtendsGen` contained in
the same Language as the Generator), and the Generator does not extend any other applicable Generator.


	LanguageExtendsGen2 [extends LanguageBase]
		defines ConceptExtendsGen2 extending ConceptBase
		contains GeneratorExtendsGen2 [extends GeneratorBase]
			defines a rule for ConceptExtendsGen2
	
	SolutionExtendsGen2
		contains ModelExtendsGen2 [using LanguageBase, LanguageExtendsGen2]
			contains NodeBase [instanceof ConceptBase]
			contains NodeExtendsGen2 [instanceof ConceptExtendsGen2]

All nodes within `SolutionExtendsGen2` will be transformed, as an instance of `ConceptExtendsGen2` was found,
and the generator `GeneratorExtendsGen2` contained in the same language extends `GeneratorBase`.



<a name="generated_relation"></a>
## Generated Relations

Relations on the output Model are defined only by the contents of the output Model
that was created by the Generator. Thus,

* all Languages providing the Concepts of generated instances are listed in the Used Languages
* all Models referenced from the output Model are listed in the Dependencies

Additional Relations on anything else (source Module, source Model,
Dependencies of the source Model, languages used in the source Model, Dependencies of applied Generators,
languages used in applied Generators) are **not** added to the output Model. [Implicit Dependencies](#implicit-dependencies) apply as described.



<a name="_test"></a>
## Tests

Tests are regular or extended [JUnit](http://junit.org/) tests that can be executed within MPS or [stand-alone](#build-language).

Tests are contained in test models, defined by `@tests` stereotyp.

The Stereotype enables

* the "Run Tests" entry in solution and test model context menu.

* Build language test instruction to search the Model for tests.

As soon as we're using any concepts from language `jetbrains.mps.lang.test`, we need to have a `TestInfo` Root Node in the same model. The TestInfo node needs to refer to a project to be used to execute the tests. This reference may *not* use a `${module}`, `${language_descriptor}`, `${solution_descriptor}`, or `${project}` built-in path variables. It needs to refer to a Project containing the test.



