---
tags:
- dependencies
- classpath
- plugins
- generator
- solution
---

# Dependencies and classpath in MPS

This page describes the meaning and effect of different types of dependencies within MPS, including the effects on the applicable Java classpath. It describes both the expected state and all bugs deviating from the expectations.

## Overview

The module pool has all content known to MPS.
The modules pool is filled from *modules* in the current *project* and all *non-project sources*.
MPS in general cares about dependencies between modules. The dependencies on *models* only constrain further the dependencies of the modules.
Two main types of *relations* exist: *dependencies* are needed for any reference to something in another module. *Used Languages* are needed to use something defined in a language. We refer to relations if we address both types.
Other types of dependencies on modules include: *Java stubs* (in combination with *Java libraries*), *Java source stubs* (in combination with *Java source paths*), *runtime solutions* and *accessory models* (only available for languages), and *languages engaged on generation*.
*Build models* abstract Ant files to build and package modules and *IDEA plugins*. They contain a copy of the relations defined in the modules, and dependencies to other build models and IDEA plugins.

## MPS Plugins

MPS Plugins are automatically loaded according to the solution Kind set in Java module settings.
MPS Plugins need to be contained in MPS plugin models.

#### StandalonePluginDescriptor

We need to add a *StandalonePluginDescriptor* (defined in Language ^^jetbrains.mps.lang.plugin.standalone^^) as a root node if an MPS plugin model uses any concept from the language ^^jetbrains.mps.lang.plugin^^. Other concepts from the language ^^jetbrains.mps.lang.plugin.standalone^^ don't need a *StandalonePluginDescriptor*.

## Plugin disambiguation

The term "plugin" is used at various places throughout MPS. It describes different things:

- IDEA plugins: a packaged set of contributions to the IntelliJ IDEA platform, which MPS is based upon.
- MPS plugins: automatically loaded Models.
- Plugin language aspect: model inside a language defining extension points.
- Build model plugins: part of the build model language providing new entries for build models.

## Non-project sources

Non-project sources are

- global libraries
- IDEA plugins
- project libraries
- common and Java module settings regarding Java classes and Java source files
- IDEA plugins referenced by a module

These directories or jar files are recursively scanned for *.mpl* (languages), *.msd* (solutions), and *.devkit* (devkit) files. If found, the corresponding content is added to the modules pool.

## Java classpath versus relations

The various settings on models and modules specify both the Java classpath and the relations of a model. However, these settings affect classpath and relations in a different way.
As a rule of thumb, the classpath has all Java classes reachable through any kind of relation. The Classpath is populated generously.

On the contrary, the relations are populated reluctantly, for example, they need to be specified explicitly.
The dependency relations on modules and models are completely separated from the used language relations on modules and models. Thus, no dependency requires a *Used Language* or vice versa.

## Used languages

No implicitly *Used Languages* are available except described for generators. Specifically, if *LanguageB* has an *Extends Scope* dependency on *LanguageA* and *ModuleC* uses *LanguageB*, *LanguageA* isn't a *Used Language* within *ModuleC*.

You must add *LanguageA* (containing *ConceptA*) to *ModuleB's* and contained *ModelB's* used languages if and only if

- *ModelB* instantiates *ConceptA* within the IDE.
- *ModelB* executes intentions from *LanguageA*.
- *ModelB* requires type checks from *LanguageA*.
- *ModelB* uses editors from *LanguageA* by selecting an editor hint but *not* if *LanguageA* only defines the editor hint.
- *ModuleB* is a generator and outputs instance of *ConceptA*.

## Executed generators

*GeneratorA* contained in *LanguageA* (containing *ConceptA*) will be executed for *ModelS* (contained in *ModuleS*) if and only if

- *ModelS* uses *LanguageA* and contains an instance of *ConceptA*
- *ModelS* lists *LanguageA* in Languages engaged on generation
- The preceding conditions match *LanguageB* containing *GeneratorB* extending *GeneratorA*

For discussion, we establish a continued scenario:

(The Relations listed here are not complete to reduce clutter. The [complete example](https://github.com/enikao/mps-dependencies) is available.)

```kroki-plantuml
@startuml
left to right direction

class LanguageBase <<L,yellow>>

LanguageBase *-- ConceptBase: defines
LanguageBase *-- ConceptBase2: defines

class SolutionBase <<S, violet>>

class ModelBase <<O, gray>>

class NodeBase <<N, lightgreen>>

ModelBase -up[dotted]-|> LanguageBase: using
NodeBase -up[dotted]-|> ConceptBase: instanceof
ModelBase *-- NodeBase: contains
SolutionBase *-- ModelBase: contains

hide empty members

@enduml

```

*SolutionBase* doesn't change during generation, as *LanguageBase* doesn't define any generators.

```kroki-plantuml
@startuml
class LanguageBase <<L,yellow>>
class LanguageBaseGen <<G,lightgray>>
class GeneratorBase <<L,lightblue>>
class ConceptBase

class SolutionBaseGen <<S, violet>>
class ModelBaseGen <<G, lightgray>>

LanguageBaseGen *-right- GeneratorBase: contains
GeneratorBase -right[dotted]-> ConceptBase: defines a rule for

SolutionBaseGen *-right- ModelBaseGen: contains
ModelBaseGen -down[dotted]-> LanguageBase: using
ModelBaseGen -up[dotted]-> LanguageBaseGen: using
ModelBaseGen *-right- NodeBase: contains
NodeBase -up[dotted]-> ConceptBase: instanceof

hide empty members

@enduml
```

*SolutionBaseGen* doesn't change during generation either, as it doesn't contain any instances from
*LanguageBaseGen*, thus removing *LanguageBaseGen* from the list of applicable generators, ending up with
no generators at all.

```kroki-plantuml
@startuml
class LanguageBase <<L,yellow>>
class LanguageBaseGen <<G,lightgray>>
class ConceptBase

class SolutionBaseGen2 <<S, violet>>
class ModelBaseGen2 <<G, lightgray>>

SolutionBaseGen2 *-right- ModelBaseGen2: contains
ModelBaseGen2 -up[dotted]->LanguageBase: using
ModelBaseGen2 -up[dotted]->LanguageBaseGen: engages
ModelBaseGen2 *-right- NodeBase: contains
NodeBase -up[dotted]- ConceptBase: instanceof
LanguageBase -right- ConceptBase: contains

hide empty members

@enduml
```

*SolutionBaseGen2* ends up with a transformed *NodeBase*, as *Languages engaged in generation* are never removed.

```kroki-plantuml
@startuml
left to right direction

class LanguageBase <<L,yellow>>
class LanguageBaseGenExtends <<G,lightgray>>
class GeneratorBaseExtends <<G,lightgray>>
class ConceptBase
class ConceptBase2

class SolutionBaseGenExtends <<S, violet>>
class ModelBaseGenExtends <<G, lightgray>>

LanguageBaseGenExtends --|> LanguageBase: extends
LanguageBaseGenExtends *-- GeneratorBaseExtends: contains
GeneratorBaseExtends -[dotted]-> ConceptBase2: defines a rule for

SolutionBaseGenExtends *-- ModelBaseGenExtends: contains
ModelBaseGenExtends -right[dotted]->LanguageBase: using
ModelBaseGenExtends -right[dotted]->LanguageBaseGenExtends: engages
ModelBaseGenExtends *-- NodeBase: contains
ModelBaseGenExtends *-- NodeBase2: contains
NodeBase -[dotted]- ConceptBase: instanceof
NodeBase2 -[dotted]- ConceptBase2: instanceof
LanguageBase *-- ConceptBase: contains
LanguageBase *-- ConceptBase2: contains

hide empty members

@enduml
```

*SolutionBaseGenExtends* ends up with an unchanged *NodeBase*, but a transformed *NodeBase2*.
*GeneratorBaseExtends* gets executed, because *LanguageBaseGenExtends* is listed in *Languages engaged in generation*. However, the Dependencies of the Language aren't considered for selecting the running Generators.

```kroki-plantuml
@startuml
left to right direction

class LanguageBase <<L,yellow>>
class LanguageBaseGenExtends2 <<G,lightgray>>
class GeneratorBaseExtends2 <<G,lightgray>>
class ConceptBase
class ConceptBase2

class SolutionBaseGenExtends2 <<S, violet>>
class ModelBaseGenExtends2 <<G, lightgray>>

LanguageBaseGenExtends2 --|> LanguageBase: extends
LanguageBaseGenExtends2 *-- GeneratorBaseExtends2: contains
GeneratorBaseExtends2 --|> GeneratorBase: extends
GeneratorBaseExtends2 -[dotted]-> ConceptBase2: defines a rule for

SolutionBaseGenExtends2 *-- ModelBaseGenExtends2: contains
ModelBaseGenExtends2 -right[dotted]->LanguageBase: using
ModelBaseGenExtends2 -right[dotted]->LanguageBaseGenExtends2: engages
ModelBaseGenExtends2 *-- NodeBase: contains
ModelBaseGenExtends2 *-- NodeBase2: contains
NodeBase -[dotted]- ConceptBase: instanceof
NodeBase2 -[dotted]- ConceptBase2: instanceof
LanguageBase *-- ConceptBase: contains
LanguageBase *-- ConceptBase2: contains

hide empty members

@enduml
```

In *SolutionBaseGenExtends2* both *NodeBase* and *NodeBase2* will be transformed, as *LanguageBaseGenExtends2*
is listed in *Languages engaged in generation* and *GeneratorBaseExtends2* extends *GeneratorBase*.

```kroki-plantuml
@startuml
left to right direction

class LanguageBase <<L,yellow>>
class LanguageExtendsGen <<G,lightgray>>
class GeneratorExtendsGen <<G,lightgray>>
class ConceptExtendsGen <<G,lightgray>>
class ConceptBase

class SolutionExtendsGen <<S, violet>>
class ModelExtendsGen <<G, lightgray>>
class NodeExtendsGen <<G, lightgray>>


LanguageBase *-right- ConceptBase: contains
LanguageExtendsGen -down-|> LanguageBase: extends
ConceptExtendsGen --|> ConceptBase: extends
LanguageExtendsGen -right[dotted]-ConceptExtendsGen: defines
LanguageExtendsGen *-right-GeneratorExtendsGen: contains
GeneratorExtendsGen -[dotted]-ConceptExtendsGen: defines a rule for

SolutionExtendsGen *-- ModelExtendsGen: contains
ModelExtendsGen *-- NodeBase: contains
ModelExtendsGen *-[dotted]- LanguageBase: using
ModelExtendsGen *-[dotted]- LanguageExtendsGen: using
NodeBase -[dotted]- ConceptBase: instanceof
NodeExtendsGen -[dotted]- ConceptExtendsGen: instanceof
ModelExtendsGen *-- NodeExtendsGen: contains

hide empty members

@enduml
```

Only *NodeExtendsGen* will be transformed in *SolutionExtendsGen*, as the only active Generator is
*GeneratorExtendsGen*. The reason is that we found an instance of *ConceptExtendsGen* contained in
the same language as the generator. The Generator doesn't extend any other applicable Generator.

```kroki-plantuml
@startuml
left to right direction

class LanguageBase <<L,yellow>>
class LanguageExtendsGen2 <<G,lightgray>>
class GeneratorExtendsGen2 <<G,lightgray>>
class ConceptExtendsGen2 <<G,lightgray>>
class ConceptBase

class SolutionExtendsGen2 <<S, violet>>
class ModelExtendsGen2 <<G, lightgray>>
class NodeExtendsGen2 <<G, lightgray>>

LanguageBase *-right- ConceptBase: contains
LanguageExtendsGen2 -down-|> LanguageBase: extends
ConceptExtendsGen2 --|> ConceptBase: extends
LanguageExtendsGen2 -right[dotted]-ConceptExtendsGen2: defines
LanguageExtendsGen2 *-right-GeneratorExtendsGen2: contains
GeneratorExtendsGen2 --|> GeneratorBase: extends
GeneratorExtendsGen2 -[dotted]-ConceptExtendsGen2: defines a rule for

SolutionExtendsGen2 *-- ModelExtendsGen2: contains
ModelExtendsGen2 *-- NodeBase: contains
ModelExtendsGen2 *-[dotted]- LanguageBase: using
ModelExtendsGen2 *-[dotted]- LanguageExtendsGen2: using
NodeBase -[dotted]- ConceptBase: instanceof
NodeExtendsGen2 -[dotted]- ConceptExtendsGen2: instanceof
ModelExtendsGen2 *-- NodeExtendsGen2: contains

hide empty members

@enduml
```

All nodes within *SolutionExtendsGen2* get transformed, as an instance of *ConceptExtendsGen2* was found,
and the generator *GeneratorExtendsGen2* contained in the same language extends *GeneratorBase*.

## Generated relations

Relations on the output model are defined only by the contents of the output model that was created by the generator. Thus,

- all languages providing the concepts of generated instances are listed in *Used Languages*
- all models referenced from the output model are listed in the dependencies

Extra relations on anything else (source module, source model, dependencies of the source model, languages used in the source model, dependencies of applied generators,
languages used in applied Generators) are not added to the output model. Implicit dependencies apply as described.

## Tests

Tests are regular or extended [JUnit](http://junit.org/) tests that can be executed within MPS or stand-alone.

Test models contain tests, defined by the *@tests* stereotype.

The Stereotype enables

- the *Run Tests* entry in the solution and test model context menu.
- Build language test instruction to search the model for tests.

As soon as you are using any concepts from language *jetbrains.mps.lang.test*, you need to have a *TestInfo* root node in the same model. The *TestInfo* node needs to refer to a project to be used to execute the tests. This reference may not use a *&#36{module}*, *&#36{language_descriptor}*, *&#36{solution_descriptor}*, or *&#36{project}* builtin path variables. It needs to refer to a project containing the test.



