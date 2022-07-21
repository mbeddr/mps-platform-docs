# Dependencies

First of all: the number of languages can be very important: Many small languages are hard to maintain while big languages
take a long time building in the IDE. Many dependencies can create cycles which are described later on this page.

By default, you can only reference nodes present in the current model. Dependencies add other models and modules that you can reference from the current model.

Models listed as dependencies of Model $A$ need to be contained within modules listed in the dependencies (including transitive entries) of the module containing this model. Example:

```kroki-plantuml
@startuml
left to right direction

class ModuleA <<M,lightgray>>
class "ModelA.one" as ModelA1 <<m,lightblue>>
class "NodeA.one.alpha" as NodeA1 <<N,yellow>>
class "ModelA.two" as ModelA2 <<m,lightblue>>
class "NodeA.two.alpha" as NodeA2 <<N,yellow>>

class ModuleB <<G,lightgray>>
class "ModelB.one" as ModelB1 <<G,lightblue>>
class "NodeB.one.alpha" as NodeB1 <<N,yellow>>

class ModuleC <<M,lightgray>>
class "ModelC.one" as ModelC1 <<G,lightblue>>

ModuleA *-- ModelA1: contains
ModelA1 *-- NodeA1: contains
ModuleA *-- ModelA2: contains
ModelA2 *-- NodeA2: contains

ModuleB *-- ModelB1: contains
ModuleB .left.|> ModuleA: depends on
ModelB1 .left.|> ModelA1: depends on
ModelB1 *-- NodeB1: contains
NodeB1 .left.|> ModelA1: depends on
NodeB1 .[#red]left.|> ModelA2: depends on
note right on link
out of scope
as ModelB.one has
no dependency on 
ModelA.two
end note
'ModuleC --|> ModelB1

ModuleC *-- ModelC1: contains
ModelC1 .[#red]down. ModelA1: depends on
note right on link
out of scope
as ModuleC has
no dependency on 
ModuleA
end note

hide empty members

@enduml
```

You can't mark a model *internal* and hide it from outside access.

## Export flag

It exports a Module Dependency again to be used by modules depending on this module. Example:

```kroki-plantuml
@startuml
left to right direction

class ModuleA <<M,lightgray>>
class "ModelA.one" as ModelA1 <<m,lightblue>>
class "NodeA.one.TheNode" as NodeA1 <<N,yellow>>

class ModuleB <<(M,lightgray) export=true>>
class ModuleC <<M,lightgray>>

class ModuleBeta <<M,lightgray>>
class "ModelBeta.one" as ModelBeta1 <<m,lightblue>>
class "NodeBeta.one.TheNode" as NodeBeta1 <<N,yellow>>
class "ModelBeta.two" as ModelBeta2 <<m,lightblue>>
class "NodeBeta.two.TheNode" as NodeBeta2 <<N,yellow>>

class ModuleGamma <<M,lightgray>>
class "ModelGamma.one" as ModelGamma1 <<m,lightblue>>

ModuleA *-- ModelA1:contains
ModelA1 *-- NodeA1:contains

ModuleB .left.> ModuleA: depends on
ModuleC .left.> ModuleA: depends on

ModuleBeta .left.> ModuleB: depends on
ModuleBeta *-- ModelBeta1: contains
ModelBeta1 .left.> ModelA1: depends on
ModelBeta1 *-- NodeBeta1: contains
NodeBeta1 .left.> NodeA1: references
ModuleBeta *-- ModelBeta2: contains
ModelBeta2 *-- NodeBeta2: contains
NodeBeta2 .[#red]right.> NodeA1: references
note top on link
out of scope,
as ModelBeta.two has
no dependency on
ModelA.one
end note

ModuleGamma .left.> ModuleC: depends on
ModuleGamma *-- ModelGamma1: contains
ModelGamma1 .[#red]right.> ModelA1: depends on
note top on link
out of scope,
as ModuleC has
does not export
ModuleA
end note

hide empty members

@enduml
```

## Scope

*Default Scope* is available for all module types.

*Extends Scope* is a superset of *Default Scope*, for example, you never need to have both a *Default Scope* and an *Extends Scope* dependency on another module.

### Extends scope for languages

*LanguageB* (containing *ConceptB*) must extend *LanguageA* (containing *ConceptA* and *ConceptInterfaceA*) if and only if

```kroki-plantuml
@startuml
left to right direction

package LanguageA {
  class ConceptA
  class ConceptInterfaceA
  class EditorComponentA <<E,orange>>
}

package LanguageB {
  diamond LanguageB
  class ConceptB
  class EditorB <<E,orange>>
  class EditorComponentB <<E,orange>>
  class TypesystemB <<T,violet>>
}
 
ConceptB .[#blue].|> ConceptA:extends
ConceptB .[#blue].|> ConceptInterfaceA:implements
 
EditorB .[#blue].|> ConceptA:defined for
note right of EditorB
but not if LanguageA only defines the editor hint
end note
EditorComponentB .[#blue].|> ConceptA:defined for

LanguageB .[#blue].|> EditorComponentA: uses

TypesystemB .[#blue].|> ConceptA:defined for

hide empty members

@enduml
```

Another case is if *LanguageB* defines a generator outputting *ConceptA* and *LanguageA* has a runtime solution.

*LanguageB* shouldn't extend *LanguageA* (but needs a *Default Scope* dependency) if

```kroki-plantuml
@startuml
left to right direction

package LanguageA {
  class ConceptA
}

package LanguageB {
  class IntentionB <<I,yellow>>

  class ConceptB {
    <color:green>child: ConceptA</color>
    --
    <color:green>node<ConceptA> method()</color>
    --
    <color:green>reference: node<ConceptA></color>
  }
}

IntentionB .[#green].|> ConceptA: defined for

hide empty members

@enduml
```

*LanguageB* can't define

```kroki-plantuml
@startuml
left to right direction

package LanguageA {
  class ConceptA
}

package LanguageB {
  class BehaviorB <<B,orange>>
  class ConstraintB <<C,lightblue>>
}

BehaviorB .[#red].|> ConceptA: defined for
ConstraintB .[#red].|> ConceptA: defined for


hide empty members

@enduml
```

To be precise, it is possible to remove all errors flagged on behaviors and constraints in *LanguageB*. However, they aren't taken into account for *ConceptA*.

### Extends scope for generators

*GeneratorB* (inside *LanguageB*, and containing *ConceptB*) must extend *GeneratorA* (inside *LanguageA*, and containing *ConceptA*), if and only if

```kroki-plantuml
@startuml
left to right direction

package LanguageA {
  class ConceptA
  class GeneratorA <<G,lightgray>>
}

package LanguageB {
  class GeneratorB <<G,lightgray>>
}

GeneratorB .[#blue].|> ConceptA: defines a new rule for
GeneratorB .[#blue].|> GeneratorA: extends a switch
GeneratorB .[#blue].|> GeneratorA: defines a generator priority relative to

hide empty members

@enduml
```

## Implicit dependencies

MPS adds some dependencies implicitly without listing them in the corresponding dialog.

Warning: even if the dependencies described below are established implicitly, they aren't taken into account in every aspect of MPS. So if an error occurs, make sure you didn't rely on some implicit dependency. If in doubt, make the dependency explicit.

### Implicit dependencies inherited by a generator from its language

A Generator inherits some dependencies from the language where it's defined in:

- The language's runtime solutions are added to the generator module dependencies.
- The language's module is added to the generator module dependencies.
- The language is added to the generator *Used languages*.

Except the case of generating a concept of a language that has a runtime solution, there is no requirement on the language's dependencies or *Used Languages* stemming from the generator.

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
Starting with MPS 2021.1, there is a higher chance that you could run into troubles with cyclic dependencies. The reason is the new javax compiler that doesn't act as forgiving as the earlier one (ECJ).

Distinctive cases are runtime solutions, accessory models, and utility models.

In contrast to runtime solutions, utility models are used *while* accessing behavior or running a generator. Code within runtime solutions is used *after* the generator ran from the generated code. Thus, a runtime solution shouldn't use or reference the language it is referenced from. A utility model can use or reference the language it is reference from.

Accessory models can use or reference the language they're referenced from.
