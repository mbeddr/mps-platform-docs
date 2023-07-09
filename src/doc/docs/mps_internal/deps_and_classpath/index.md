---
tags:
- dependencies
- classpath
- plugins
- generator
- solution
---

# Dependencies and Classpath in MPS

This page describes the meaning and effect of different types of dependencies within MPS, including the impact on the applicable Java classpath. It describes both the expected state and all bugs deviating from the expectations.

## Overview

The module pool has all content known to MPS.
The modules pool is filled from *modules* in the current *project* and all *non-project sources*.
MPS, in general, cares about dependencies between modules. The dependencies on *models* only further constrain the dependencies of the modules.
Two main types of *relations* exist: You need *dependencies* for any reference to something in another module. You need *Used Languages* to use something defined in a language. We refer to relations if we address both types.
Other types of dependencies on modules include: *Java stubs* (in combination with *Java libraries*), *Java source stubs* (in combination with *Java source paths*), *runtime solutions* and *accessory models* (only available for languages), and *languages engaged on generation*.
*Build models* abstract Ant files to build and package modules and *IDEA plugins*. They contain a copy of the relations defined in the modules and dependencies to other build models and IDEA plugins.

## MPS Plugins

MPS Plugins are automatically loaded according to the solution kind set in Java module settings.
MPS Plugins need to be contained in MPS plugin models.

#### StandalonePluginDescriptor

We need to add a *StandalonePluginDescriptor* (defined in the language ^^jetbrains.mps.lang.plugin.standalone^^) as a root node if an MPS plugin model uses any concept from the language ^^jetbrains.mps.lang.plugin^^. Other concepts from the language ^^jetbrains.mps.lang.plugin.standalone^^ don't need a *StandalonePluginDescriptor*.

## Plugin Disambiguation

The term "plugin" is used at various places throughout MPS. It describes different things:

- IDEA plugins: a packaged set of contributions to the IntelliJ IDEA platform, which MPS is based upon
- MPS plugins: automatically loaded models
- plugin language aspect: model inside a language defining extension points
- build model plugins: part of the build model language providing new entries for build models.

## Non-Project Sources

Non-project sources are

- global libraries
- IDEA plugins
- project libraries
- common and Java module settings regarding Java classes and Java source files
- IDEA plugins referenced by a module

These directories or JAR files are recursively scanned for *.mpl* (languages), *.msd* (solutions), and *.devkit* (devkit) files. If found, the corresponding content is added to the modules pool.

## Java Classpath Versus Relations

The various settings on models and modules specify both the Java classpath and a model's relations. However, these settings affect classpath and relations differently.
As a rule of thumb, the classpath has all Java classes reachable through any relation. The classpath is populated generously.

On the contrary, the relations are populated reluctantly. For example, they need to be specified explicitly.
The dependency relations on modules and models are completely separated from the used language relations on modules and models. Thus, no dependency requires a *Used Language* or vice versa.

## Used Languages

No implicitly *Used Languages* are available except described for generators. Specifically, if *LanguageB* has an *Extends Scope* dependency on *LanguageA* and *ModuleC* uses *LanguageB*, *LanguageA* isn't a *Used Language* within *ModuleC*.

You must add *LanguageA* (containing *ConceptA*) to *ModuleB's* and contained *ModelB's* used languages if and only if

- *ModelB* instantiates *ConceptA* within the IDE.
- *ModelB* executes intentions from *LanguageA*.
- *ModelB* requires type checks from *LanguageA*.
- *ModelB* uses editors from *LanguageA* by selecting an editor hint, but *not* if *LanguageA* only defines the editor hint.
- *ModuleB* is a generator and outputs instance of *ConceptA*.

## Executed Generators

*GeneratorA* contained in *LanguageA* (containing *ConceptA*) will be executed for *ModelS* (contained in *ModuleS*) if and only if

- *ModelS* uses *LanguageA* and contains an instance of *ConceptA*.
- *ModelS* lists *LanguageA* in Languages engaged on generation.
- The preceding conditions match *LanguageB* containing *GeneratorB* extending *GeneratorA*.

For discussion, we establish a continued scenario:

(The Relations listed here are not complete to reduce clutter. The [complete example](https://github.com/enikao/mps-dependencies) is available.)

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram1.puml
```

*SolutionBase* doesn't change during generation, as *LanguageBase* doesn't define any generators.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram2.puml
```

*SolutionBaseGen* doesn't change during generation either, as it doesn't contain any instances from
*LanguageBaseGen*, thus removing *LanguageBaseGen* from the list of applicable generators, ending up with
no generators.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram3.puml
```

*SolutionBaseGen2* ends up with a transformed *NodeBase*, as *Languages engaged in generation* are never removed.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram4.puml
```

*SolutionBaseGenExtends* ends up with an unchanged *NodeBase*, but a transformed *NodeBase2*.
*GeneratorBaseExtends* gets executed because *LanguageBaseGenExtends* is listed in *Languages engaged in generation*. However, the Dependencies of the Language aren't considered for selecting the running Generators.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram5.puml
```

In *SolutionBaseGenExtends2*, both *NodeBase* and *NodeBase2* will be transformed, as *LanguageBaseGenExtends2*
is listed in *Languages engaged in generation* and *GeneratorBaseExtends2* extends *GeneratorBase*.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram6.puml
```

Only *NodeExtendsGen* will be transformed in *SolutionExtendsGen*, as the only active Generator is
*GeneratorExtendsGen*. The reason is that we found an instance of *ConceptExtendsGen* contained in
the same language as the generator. The generator doesn't extend any other applicable Generator.

```kroki-plantuml
@from_file:mps_internal/deps_and_classpath/diagrams/diagram7.puml
```

All nodes within *SolutionExtendsGen2* get transformed, as an instance of *ConceptExtendsGen2* was found,
and the generator *GeneratorExtendsGen2* contained in the same language extends *GeneratorBase*.

## Generated Relations

Relations on the output model are defined only by the contents of the output model that was created by the generator. Thus,

- all languages providing the concepts of generated instances are listed in *Used Languages*
- all models referenced from the output model are listed in the dependencies

Extra relations on anything else (source module, source model, dependencies of the source model, languages used in the source model, dependencies of applied generators,
languages used in applied Generators) are not added to the output model. Implicit dependencies apply as described.

## Tests

Tests are regular or extended [JUnit](http://junit.org/) tests that can be executed within MPS or standalone.

Test models contain tests defined by the *@tests* stereotype.

The Stereotype enables

- the *Run Tests* entry in the solution and test model context menu.
- Build language test instructions to search the model for tests.

As soon as you use any concepts from language *jetbrains.mps.lang.test*, you need to have a *TestInfo* root node in the same model. The *TestInfo* node needs to refer to a project to be used to execute the tests. This reference may not use a *&#36{module}*, *&#36{language_descriptor}*, *&#36{solution_descriptor}*, or *&#36{project}* builtin path variables. It needs to refer to a project containing the test.