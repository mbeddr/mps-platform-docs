# Dependencies

!!! warning "Some sections on this page were written a few years ago, where an older MPS version was used. Please report anything that isn't true anymore."

The number of languages can be important: many small languages are hard to maintain, while big languages
take a long time to build in the IDE. Many dependencies can create cycles which are described later.

By default, you can only reference nodes present in the current model. Dependencies add other models and modules that you can reference from the current model.

Models listed as dependencies of the model $A$ need to be contained within modules listed in the dependencies (including transitive entries) of the module containing this model. Example:

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

*Extends Scope* is a superset of *Default Scope*. For example, you never need to have both a *Default Scope* and an *Extends Scope* dependency on another module.

### Extends Scope for Languages

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

Removing all errors flagged on behaviors and constraints in *LanguageB* is possible. However, they aren't taken into account for *ConceptA*.

### Extends Scope for Generators

*GeneratorB* (inside *LanguageB*, and containing *ConceptB*) must extend *GeneratorA* (inside *LanguageA*, and containing *ConceptA*) if and only if *GeneratorB*.

```kroki-plantuml
@from_file:mps_internal/diagrams/dependencies_6.puml
```

## Implicit Dependencies

MPS adds some dependencies implicitly without listing them in the corresponding dialog.

Warning: Even if the dependencies described below are established implicitly, they aren't taken into account in every aspect of MPS. So if an error occurs, ensure you don't rely on some implicit dependency. If in doubt, make the dependency explicit.

### Implicit Dependencies Inherited by a Generator From Its Language

A Generator inherits some dependencies from the language where it's defined in:

- The language's runtime solutions are added to the generator module dependencies.
- The language's module is added to the generator module dependencies.
- The language is added to the generator's *Used languages*.

Except in the case of generating a concept of a language that has a runtime solution, there's no requirement on the language's dependencies or *Used Languages* stemming from the generator.

### Implicit Exports of Used Language and Language Structure Aspect

Both a *Used Language* and the language structure aspect implicitly make accessing the language's behavior methods possible. However, they don't export the complete behavior aspect again. For example, a Base Language class contained in the behavior Aspect isn't visible.

### Implicit Exports of Runtime Language Settings

Runtime solutions are

- implicitly loaded into the Java classpath of any module using this language.
- implicitly added to the dependencies of the generator contained in this language.

Accessory Models are

- implicitly loaded into the dependencies of any model using this language.

  Accessory Models aren't designed to keep any classes. This is design-only information. They shouldn't affect the Java classpath anyhow.

Neither runtime solutions nor accessory models constitute a dependency from the language to the referenced solution or model.

## Cyclic Dependencies

Avoid cyclic dependencies between modules. They tend to render generation orders and other behavior non-deterministic. Languages are explicitly checked not to have a cyclic *Extends Scope* dependency. Cycles between models in the same module are fine.
Starting with MPS 2021.1, there's a higher chance that you could run into troubles with cyclic dependencies. The reason is the new Javax compiler that doesn't act as forgiving as the earlier one (ECJ).

Distinctive cases are runtime solutions, accessory models, and utility models.

In contrast to runtime solutions, utility models are used *while* accessing behavior or running a generator. Code within runtime solutions is used *after* the generator runs from the generated code. Thus, a runtime solution shouldn't use or reference the language it is referenced from. A utility model can use or reference the language it is referenced from.

Accessory models can use or reference the language they're referenced from.

For build scripts, there's a flag that allows bootstrap dependencies. The section *MPS Settings* of the [build language documentation](https://www.jetbrains.com/help/mps/build-language.html?q=bootstrap%20%E2%80%93%20setting%20this%20flag#whatismpsbuildlanguage?) contains more information. 
