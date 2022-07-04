# Model
**UI:** Entry below Module in Logical View; may be nested in folders

- Container for model contents limiting dependencies to other Models
- within the boundaries of the containing Module

Models can be nested in folders. Folders are only for visual organization, they don't have any effect on storage location, generation or any other aspect.

## Types of Models

MPS knows several types of Models. They differ in their semantics and sometimes presentation. They do not differ from a technical point of view.

### Regular Models
**UI:** Entry below Solution in Logical View

Contains Root Nodes with no special semantics or presentation.

### Aspects
**UI:** Entry below Language in Logical View

Aspects are Models within a Language with a special meaning. They are recognized
by their name.

#### Plugin Aspect
Although this Aspect adheres to the [MPS Plugin Model](#mps-plugin-model) naming convention, it should not be used as such. It should only be used to define MPS Extension Points (from Language `jetbrains.mps.lang.extension`).

<a name="test_model"></a>
### Test Models
**UI:** Entry below Solution in a special folder named "tests" with special icon in Logical View

Model containing tests. Defined by `@tests` stereotype.

### Generator Models
**UI:** Entry with special icon below Generator in Logical View

Model containing generator. Defined by `@generator` stereotype.


### Transient Models
**UI:** Last entry below Project in Logical View

Temporary Models produced during generation. Defined by `@transient«someNumber»` or `@«someNumber»` stereotype.

###Accessories Model
**UI:** Entry below Language in a special folder named "accessories" in Logical View *or* Entry below Solution in Logical View

Model specially selected by a Language. Nodes contained in these Models are implicitly available on the Java classpath and the [Dependencies](#dependencies) of any Model using this Language. A use case would be a default library of Concept instances to be available at any place the Language is used.

Accessory Models can be stored at two places: Either as aspect of a Language (recommended), or as regular Model below a Solution. In both cases, the Model needs to added to the module runtime language settings.

### Utility Model
**UI:** Entry below Language in special folder named "util models" in Logical View

Contain code required in other parts of a Language or Generator, e.g. if a Behavior method logic is too complex for inline implementation or a Generator needs to do complex model traversals. They should be created as regular Model within the Language.

<a name="build_model"></a>
### Build Model
**UI**: Entry below Solution in Logical View

Contains Nodes from [Build Language](#build-language).


<a name="mps_plugin_model"></a>
### MPS Plugin Model
**UI:** Model within a Solution in Logical View

Contains MPS plugins.

The model name needs to adhere to the naming convention `«moduleName».plugin`.

<a name="_stereotype"></a>
## Model Stereotype
**UI:** Attached to the Model name, separated by "@"

A Model may have a Stereotype. To change, add, or remove a Stereotype, use
Rename Model Refactoring in the context menu of a Model.

Using custom Stereotypes has been reported to interfere with lots of MPS internals and thus is not advised to do.

MPS knows some predefined Stereotypes with special meaning:

* **@tests:** Denotes test models
* **@generator:** Denotes generator models
* **@transient«someNumber» or @«someNumber»:** Denotes transient models


## Model Settings
**UI:** Context menu of Model, Model Properties

For both dependencies and used languages, the settings on Models only restrict the settings from the containing Module.

### Dependencies Model Settings
**UI:** Tab in Model Properties dialog

Other Models this Model contains references to.

### Used Languages Model Settings
**UI:** Tab in Model Properties dialog

Languages used in this Model.

Any Used Language listed in a Model needs to be in the list of Used Languages of the containing module.

### Advanced Model Settings
**UI:** Tab in Model Properties dialog

Other settings for a Model.

* **Languages engaged on generation**  
  Generators contained in languages listed here will be executed on this Model
  in any case.

### Build Language
Abstracted [Apache Ant](https://ant.apache.org/) files used to build and package MPS Modules outside the IDE.

Used in [Build Models](#build-model).

Can be executed within MPS via the "Run '«Build Model name»" context menu entry of the Build Model in Logical View.


## Dependencies
**UI:** Section within Build Model

Scope import for all references to other Build Models.

Provides access to resulting artifacts of other Build Models.


## IDEA Plugin Dependencies
**UI:** Section "project structure" in Build Model, subsection "idea plugin", subsection "dependencies"

Contents of [IDEA plugin.xml](https://confluence.jetbrains.com/display/IDEADEV/IntelliJ+IDEA+Plugin+Structure#IntelliJIDEAPluginStructure-PluginConf) `depends` tags.

This plugin will only be loaded if all dependencies listed here could be loaded before. The contents of dependencies are available for this IDEA plugin.

<a name="module_dependencies"></a>
## Module Dependencies
**UI:** Section "mps group" in Build Model, subsection "solution"/"module", Inspector section "dependencies"

Copy of Relations of described Module.

## Runtime
Copy of module runtime language settings.


## Jars
**UI:** Section "default layout" un Build Model

All jars included in any Java module settings need to be included somewhere in this section.

.java files (from Java source paths) need to be compiled as java sources inside corresponding build script and manually included into the resulting build layout: corresponding .class files should be jared, .java files should be places in corresponding location if they are referenced by java_source_stub model root.
