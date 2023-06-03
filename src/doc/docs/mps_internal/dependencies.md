# Dependencies

!!! warning "Some sections on this page were written a few years ago where an older MPS version was used. Please report anything that isn't true anymore."

The amount of languages can be important: many small languages are hard to maintain while big languages
take a long time building in the IDE. Many dependencies can create cycles which are described later.

By default, you can only reference nodes present in the current model. Dependencies add other models and modules that you can reference from the current model.

Models listed as dependencies of Model $A$ need to be contained within modules listed in the dependencies (including transitive entries) of the module containing this model. Example:

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_1.puml
```

You can't mark a model *internal* and hide it from outside access.

## Export flag

It exports a Module Dependency again to be used by modules depending on this module. Example:

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_2.puml
```

## Scope

*Default Scope* is available for all module types.

*Extends Scope* is a superset of *Default Scope*, for example, you never need to have both a *Default Scope* and an *Extends Scope* dependency on another module.

### Extends scope for languages

*LanguageB* (containing *ConceptB*) must extend *LanguageA* (containing *ConceptA* and *ConceptInterfaceA*) if and only if

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_3.puml
```

Another case is if *LanguageB* defines a generator outputting *ConceptA* and *LanguageA* has a runtime solution.

*LanguageB* shouldn't extend *LanguageA* (but needs a *Default Scope* dependency) if

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_4.puml
```

*LanguageB* can't define

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_5.puml
```

To be precise, it is possible to remove all errors flagged on behaviors and constraints in *LanguageB*. However, they aren't taken into account for *ConceptA*.

### Extends scope for generators

*GeneratorB* (inside *LanguageB*, and containing *ConceptB*) must extend *GeneratorA* (inside *LanguageA*, and containing *ConceptA*), if and only if

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_6.puml
```

## Implicit dependencies

MPS adds some dependencies implicitly without listing them in the corresponding dialog.

Warning: even if the dependencies described below are established implicitly, they aren't taken into account in every aspect of MPS. So if an error occurs, make sure you didn't rely on some implicit dependency. If in doubt, make the dependency explicit.

### Implicit dependencies inherited by a generator from its language

A Generator inherits some dependencies from the language where it's defined in:

- The language's runtime solutions are added to the generator module dependencies.
- The language's module is added to the generator module dependencies.
- The language is added to the generator *Used languages*.

Except the case of generating a concept of a language that has a runtime solution, there's no requirement on the language's dependencies or *Used Languages* stemming from the generator.

### Implicit exports of used language and language structure aspect

Both a *Used Language* and the language structure aspect implicitly make it possible to access the language's behavior methods. However, they not export again the complete behavior aspect. For example, a *baselanguage* class contained in the behavior Aspect isn't visible.

### Implicit exports of runtime language settings

Runtime solutions are

- implicitly loaded into the Java classpath of any module using this language.
- implicitly added to the Dependencies of the Generator contained in this language.

Accessory Models are

- implicitly loaded into the dependencies of any model using this language.

  Accessory Models aren't designed to keep any classes. This is design-only information. They shouldn't affect Java class path anyhow.

Neither runtime solutions nor accessory models constitute a dependency from the language to the referenced solution or model.

## Cyclic dependencies

Cyclic dependencies between modules should be avoided in general. They tend to render generation orders and other behavior non-deterministic. Languages are explicitly checked not to have a cyclic *Extends Scope* dependency. Cycles between models in the same module are fine.
Starting with MPS 2021.1, there's a higher chance that you could run into troubles with cyclic dependencies. The reason is the new javax compiler that doesn't act as forgiving as the earlier one (ECJ).

Distinctive cases are runtime solutions, accessory models, and utility models.

In contrast to runtime solutions, utility models are used *while* accessing behavior or running a generator. Code within runtime solutions is used *after* the generator ran from the generated code. Thus, a runtime solution shouldn't use or reference the language it is referenced from. A utility model can use or reference the language it is reference from.

Accessory models can use or reference the language they're referenced from.

For build scripts there's a flag that allows bootstrap dependencies. More information can be found in section *MPS Settings* of the [build language documentation](https://www.jetbrains.com/help/mps/build-language.html?q=bootstrap%20%E2%80%93%20setting%20this%20flag#whatismpsbuildlanguage?). 
