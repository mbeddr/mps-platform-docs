# Model

**UI** Entry below Module in Logical View; may be nested in folders

- Container for model contents limiting dependencies to other Models
- within the boundaries of the containing Module

Models can be nested in folders. Folders are only for visual organization, they don't have any effect on storage location, generation or any other aspect.

## Types of models

The IDE knows several types of models. They differ in their semantics and sometimes presentation. They don't differ from a technical point of view.

### Regular models

**UI** Entry below Solution in Logical View

Contains Root Nodes with no specific semantics or presentation.

### Language aspects

**UI** Entry below Language in Logical View

Aspects are Models within a Language with a special meaning. They are recognized
by their name.

#### Plugin aspect

Although this aspect adheres to the [plugin model](#mps-plugin-model) naming convention, don't use it. Use it only to define MPS extension points (from language `jetbrains.mps.lang.extension`).

### Test model

**UI** Entry below Solution in a specific folder named "tests" with specific icon in Logical View

A Model containing tests. Defined by the `@tests` stereotype.

### Generator model
**UI** Entry with specific icon below Generator in Logical View

A Model containing the generator. Defined by the `@generator` stereotype.


### Transient model

**UI** Last entry below Project in Logical View

Temporary Models produced during generation. Defined by `@transient«someNumber»` or `@«someNumber»` stereotype.

###Accessories model

**UI** Entry below Language in a specific folder named "accessories" in the logical View *or* entry below the solution in a logical View

A model specially selected by a language. Nodes contained in these models are implicitly available on the Java classpath and the [dependencies](#dependencies) of any model using this language. A use case would be a default library of Concept instances to be available at any place you use the Language.

You can store accessory Models in two places: either as an aspect of a language (recommended), or as a regular model below a solution. In both cases, the model needs to be added to the module runtime language settings.

### Utility model

**UI** Entry below Language in special folder named "util models" in Logical View

It includes code required in other parts of a language or generator. If, for example, the behavior method logic is too complex for inline implementation or a generator needs to do complex model traversals. Create them as regular models within the language.

### Build model

**UI: entry below a solution in the logical view

It includes nodes from the  [build language](#build-language).

### MPS plugin model

**UI** Model within a Solution in Logical View

It includes MPS plugins. The model name needs to adhere to the naming convention `«moduleName».plugin`.

## Model stereotype

**UI** Attached to the model name, separated by "@"

A model may have a stereotype. To change, add, or remove a stereotype, use
`Rename Model Refactoring` in the context menu of a model.

Using custom stereotypes interferes with lots of MPS internals and thus isn't advised to do.

The IDE knows some predefined Stereotypes with specific meanings:

- **@tests:** Denotes test models
- **@generator:** Denotes generator models
- **@transient«someNumber» or @«someNumber»:** Denotes transient models


## Model Settings
**UI** Context menu of Model, Model Properties

For both dependencies and used languages, the settings on Models only restrict the settings from the containing Module.

### Dependencies Model Settings

**UI** Tab in Model Properties dialog

Other models this model contains references to.

### Used Languages Model Settings
**UI:** Tab in Model Properties dialog

Languages used in this Model.

Any Used Language listed in a Model needs to be in the list of Used Languages of the containing module.

### Advanced Model Settings
**UI:** Tab in Model Properties dialog

Other settings for a Model.

- **Languages engaged on generation**  
  Generators contained in languages listed here execute on this model in any case.

### Build language

Abstracted [Apache Ant](https://ant.apache.org/) files used to build and package MPS Modules outside the IDE.
It's used in [build models](#build-model). MPS can execute them via the `Run '«Build Model name»` context menu entry of the build model in the logical View.

## Dependencies

**UI** Section within Build Model

Scope import for all references to other build models.
It Provides access to resulting artifacts of other build models.

## IDEA plugin dependencies

**UI** section `project structure` in `Build Model`, subsection `idea plugin`, subsection `dependencies`

Contents of [IDEA plugin.xml](https://plugins.jetbrains.com/docs/intellij/plugin-configuration-file.html) `depends` tags.

This plugin only loads if all dependencies listed here load before. The contents of dependencies are available for this IDEA plugin.

## Module Dependencies

**UI** Section `mps group` in `Build Model`, subsection `solution`/`module`, Inspector section `dependencies"`

Copy of relations of the described module.

## Runtime

Copy of module runtime language settings.

## Jars

**UI** Section `default layout` in `Build Model`

You have to include all jars included in any Java module settings somewhere in this section.
`.java` files (from Java source paths) need to be compiled as java sources inside corresponding build script and manually included into the resulting build layout: corresponding `.class` files should be jared, .java files should be places in corresponding location if they are referenced by java_source_stub model root.
