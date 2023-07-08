# Model

**UI**: entry below module in the logical view. They may be nested in folders.

- Container for model contents limiting dependencies to other models.
- They are within the boundaries of the containing module.

Models can be nested in folders. Folders are only for visual organization, they don't have any effect on storage location, generation or any other aspect.

## Types of Models

The IDE knows several types of models. They differ in their semantics and sometimes presentation. They don't differ from a technical point of view.

### Regular Models

**UI**: entry below solution in the logical view

They contain root nodes with no specific semantics or presentation.

### Language Aspects

**UI**: entry below language in the logical view

Aspects are models within a language with a special meaning. They are recognized by their name.

#### Plugin Aspect

Although this aspect adheres to the [plugin model](#mps-plugin-model) naming convention, don't use it. Use it only to define MPS extension points (from language ^^jetbrains.mps.lang.extension^^).

### Test Model

**UI**: entry below solution in a specific folder named `tests` with a specific icon in the logical view

A model containing tests. Defined by the *&commat;tests* stereotype.

### Generator mMdel

**UI**: entry with a specific icon below generator in the logical view

A model containing the generator, defined by the *&commat;generator* stereotype.

### Transient Model

**UI**: last entry below project in the logical view

Temporary models produced during generation, defined by *&commat;transient«someNumber»* or *&commat;«someNumber»* stereotype.

### Accessories Model

**UI**: entry below language in a specific folder named *accessories* in the logical view or entry below the solution in the logical view

A model specially selected by a language. Nodes contained in these models are implicitly available on the Java classpath and the [dependencies](#dependencies) of any model using this language. A use case would be a default library of concept instances to be available at any place you use the Language.

You can store accessory models in two places: either as an aspect of a language (recommended) or as a regular model below a solution. In both cases, the model needs to be added to the module runtime language settings.

### Utility Model

**UI**: entry below language in a special folder named *util models* in the logical view

It includes code required in other parts of a language or generator. If, for example, the behavior method logic is too complex for inline implementation, or a generator needs to do complex model traversals. Create them as regular models within the language.

### Build Model

**UI**: entry below a solution in the logical view

It includes nodes from the [build language](#build-language).

### MPS Plugin Model

**UI**: model within a solution in the logical view

It includes MPS plugins. The model name needs to adhere to the naming convention *«moduleName».plugin*.

## Model Stereotype

**UI**: attached to the model name, separated by *@*

A model may have a stereotype. To change, add, or remove a stereotype, use
*Rename Model Refactoring* in the context menu of a model.

Using custom stereotypes interferes with lots of MPS internals and thus isn't advised to do.

The IDE knows some predefined Stereotypes with specific meanings:

- *&commat;tests*: Denotes test models.
- *&commat;generator*: Denotes generator models.
- *&commat;transient«someNumber»* or *&commat;«someNumber»*: Denotes transient models.

## Model Settings

**UI**: context menu of a model, model properties

For both dependencies and used languages, the settings of models only restrict the settings from the containing module.

### Dependencies Model Settings

**UI**: tab in the model properties dialog

It lists other models this model contains references to.

### Used Languages Model Settings

**UI**: tab in the model properties dialog

It lists languages used in this Model. Any *Used Language* listed in a model, needs to be in the list of *Used Languages* of the containing module.

### Advanced Model Settings

**UI**: tab in the model properties dialog

It contains other settings for a model:

- languages engaged on generation: Generators contained in languages listed here execute on this model in any case.

### Build Language

Abstracted [Apache Ant](https://ant.apache.org/) files used to build and package MPS Modules outside the IDE.
It's used in [build models](#build-model). MPS can execute them via the *Run «Build Model name»* context menu entry of the build model in the logical view.

## Dependencies

**UI**: a section within the build model

This is the scope import for all references to other build models.
It provides access to resulting artifacts of other build models.

## IDEA Plugin Dependencies

**UI**: section *project structure* in *Build Model*, subsection *idea plugin*, subsection *dependencies*.

It contains the contents of [IDEA plugin.xml](https://plugins.jetbrains.com/docs/intellij/plugin-configuration-file.html) *depends*-tags.

This plugin only loads if all dependencies listed here load before. The contents of dependencies are available for this IDEA plugin.

## Module Dependencies

**UI**: section *mps group* in *Build Model*, subsection *solution*/*module*, inspector section *dependencies*

It contains a copy of the relations of the described module.

## Runtime

It contains a copy of the module runtime language settings.

## JARs

**UI**: section *default layout* in *Build Model*

You have to include all jars included in any Java module settings somewhere in this section.
*.java* files (from Java source paths) need to be compiled as Java sources inside the corresponding build script and manually included into the resulting build layout: corresponding *\.class* files should be jared, .java files should be placed in the corresponding location if they are referenced by java_source_stub model root.
