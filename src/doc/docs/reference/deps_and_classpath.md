# Dependencies and Classpath in MPS

In this document, we describe the meaning and effect of different types of dependencies within MPS, including the effects on the applicable Java classpath. We describe both the expected state and all bugs deviating from the expectations, as of MPS version 3.1.4 (build #MPS-135.1441). We mention expected changes for version 3.2.

## Overview

All content known to MPS is contained in its *Modules Pool*.

The Modules Pool is filled from *Modules* in the current *Project* and all *Non-Project Sources*.

MPS in general cares about dependencies between Modules. The dependencies on *Models* only constrain further the dependencies of the Modules.

There are two main types of *Relations*: *Dependencies* are needed for any reference to something in another Module. *Used Languages* are needed to use something defined in a language. We refer to Relations if we address both types.

Other types of dependencies on Modules include *Java Stubs* (in combination with *Java Libraries*), *Java Source Stubs* (in combination with *Java Source Paths*), *Runtime Solutions* and *Accessory Models* (only available for Languages), and *Languages Engaged on Generation*.

*Build Models* abstract Ant files to build and package Modules and *IDEA Plugins*. They contain a copy of the Relations defined in the Modules, and dependencies to other Build Models and IDEA Plugins.



## Terminology and UI for Access

This section lists the main terms used in this document, including a brief description, their relation to other terms (also via document structure), and the place in the MPS IDE where to access it.

We capitalize all terms with specific meaning to MPS.

### Settings
**UI:**  File menu

All global and project settings.

<a name="global_settings"></a>
#### IDE Settings (aka Global Settings)
Settings applied to all projects opened with this MPS installation. Stored in

	Windows:
	C:\Users\«username»\Application Settings\.MPS31
		
	Linux:
	~/MPS31
[AS]: is it ~/MPS31 or ~/.MPS31?

	Mac:
	~/Library/Application Support/MPS31
	~/Library/Caches/MPS31
	~/Library/Logs/MPS31
	~/Library/Preferences/MPS31

<a name="path_variables"></a>
##### Path Variables
**UI:** Entry in Settings Dialog

Variables pointing to some place in the file system. For any path selected in MPS contained within one of these Path Variables, the path is stored relative to the variable.

Known pre-defined Path Variables:

* `${module}` Containing Module
* `${user.home}` Current user home directory ???
* `${language_descriptor}` Directory containing the Language Module ?
* `${solution_descriptor}` Directory containing the Solution Module ?
* `${project}` Directory containing the Project
* `${mps_home}` Installation directory of this MPS installation

Do **not** point Path Variables to a sub-path of another Path Variable, as MPS will always apply the first (pre-defined before user-defined, user-defined in order of definition) one matching.

	INVALID example:
	Path Variable a --> /some/dir
	Path Variable b --> /some/dir/below

<a name="global_libraries"></a>
##### Global Libraries
**UI:** Entry in Settings Dialog

Paths recursively scanned for [Modules](#_module).

<small>More info: [Non-Project Sources](#non_project_sources), [Path Variables](#path_variables), [Project Libraries](#project_libraries)</small>

<a name="idea_plugin"></a>
##### (IDEA) Plugins
**UI:** Entry in Settings Dialog

A packaged set of contributions to the [IntelliJ IDEA Platform](http://www.jetbrains.org/display/IJOS/Writing+Plug-ins), which MPS is based upon.

Contained in one of the following places:

* `${mps_home}/plugins`
* `«GlobalSettingsDir»/plugins`

There are also other things called plugins, known as [MPS Plugins](#mps_plugin), bearing no relationship to IDEA Plugins.
However, MPS Plugins can be packaged into IDEA Plugins, just as any other content of MPS.

<small>More info: [Non-Project Sources](#non_project_sources), [Global Settings](#global_settings), [Path Variables](#path_variables), [IDEA Plugin Module Settings](#idea_plugin_module_settings), [Plugin Disambiguation](#plugin_disambiguation)</small>

<a name="project_settings"></a>
#### Project Settings
**UI:** Entry in Settings Dialog

Settings applied to one project. Stored in `${project}/.mps/`.

<small>More info: [Project](#_project), [Path Variables](#path_variables)</small>

<a name="project_libraries"></a>
##### Project Libraries
**UI:** Entry in Settings Dialog

Paths recursively scanned for [Modules](#_module).

<small>More info: [Non-Project Sources](#non_project_sources), [Path Variables](#path_variables), [Global Libraries](#global_libraries)</small>

<a name="modules_pool"></a>
### Modules Pool
**UI:** Second root entry in Logical View

All content known to MPS is contained in its *Modules Pool*. This Modules Pool is shared between all windows of the same MPS installation. In some future MPS version, every window should have its independent Modules Pool.

If a Module is contained more than once in the Modules Pool (eg. present both in the current Project and in a Global Library), the behavior is undefined (ie. will mess up badly, don't do this).

<small>More info: [Module](#_module)</small>

<a name="mps_window"></a>
### MPS Window
**UI:** *If already open:* Window menu; *New:* File menu, Open..., New Window

Every Project is contained in its own window.

<small>More info: [Project](#_project)</small>

<a name="_project"></a>
### Project
**UI:** First root entry in Logical View

Collection of Modules. A Module can be part of more than one Project. They can be added via "Project Paths" context menu entry of the Project.

Modules can be nested in folders. These folders are stored in the project, ie. the same Module can be in different folders inside different Projects. Folders are only for visual organization, they don't have any effect on storage location, generation or anything else.

<small>More info: [MPS Window](#mps_window), [Module](#_module), [Project Settings](#project_settings)</small>

<a name="_module"></a>
### Module
Unit of deployment and dependency for Something[^1] with defined relations to other Modules.

[^1]: "Something" denotes anything that can be contained in a Module.

<small>More info: [Modules Pool](#modules_pool), [Project](#_project)</small>


#### Types of Modules

<a name="_solution"></a>
##### Solution
**UI:** Entry below Project in Logical View; may be nested in folders

Standard container for Something.

<small>More info:
[DevKit](#_devkit),
[Dependencies](#_dependencies),
[Used Languages](#used_language)
</small>


<a name="runtime_solution"></a>
###### Runtime Solution

Runtime Solutions are regular Solutions with additional semantic meaning: They are defined as Runtime Solution at the
[Runtime Language Settings](#runtime_language_settings). They contain Java code that should be available at run-time if the Language is used.

<small>More info: [Language](#_language)</small>


<a name="_language"></a>
##### Language
**UI:** Entry below Project in Logical View; may be nested in folders

Container for defining a new Language within MPS. Also contains Generators, but this is mostly for historical reasons.

<small>More info:
[Generator](#_generator),
[DevKit](#_devkit),
[Runtime Solution](#runtime_solution),
[Runtime Language Settings](#runtime_language_settings),
[Used Languages Module Settings](#module_used_languages),
[Used Languages Model Settings](#model_used_languages),
[Aspects](#_aspect),
[Accessories Models](#accessories_model),
[Utility Models](#utility_model),
[Plugin Disambiguation](#plugin_disambiguation),
[Extends Language Scope](#extend_language),
[Implicit Generator Dependencies](#implicit_generator_dependencies),
[Implicit Language Exports](#implicit_language_export),
[Implicit Runtime Exports](#implicit_runtime_exports),
[Cyclic Dependencies](#cyclic_dependency),
[Used Languages](#used_language)
</small>


<a name="_generator"></a>
##### Generator
**UI:** Entry below Language in Logical View

Container for defining how to translate one kind of Nodes into
another kind of Nodes.

<small>More info:
[Language](#_language),
[Generator Priorities](#generator_priorities),
[Generator Models](#generator_model),
[Transient Models](#transient_model),
[Utility Models](#utility_model),
[Languages engaged on generation](#engaged_languages),
[Scope](#_scope),
[Extends Generator Scope](#extend_generator),
[Implicit Generator Dependencies](#implicit_generator_dependencies),
[Implicit Runtime Exports](#implicit_runtime_exports),
[Used Languages](#used_language),
[Executed Generators](#executed_generator),
[Generated Relations](#generated_relation)
</small>


<a name="_devkit"></a>
##### DevKit
**UI:** TODO

Collection of Solutions and Languages to be used in combination.

TODO: Extend

<small>More info: [Solution](#_solution), [Language](#_language)</small>

#### Module Settings
**UI:** Context menu of Module, Module Properties

Settings applicable to the Module.

<a name="common_module_settings"></a>
##### Common Module Settings
**UI:** Tab in Module Properties dialog

Sources of Something. For all of them, we select or add the source type on the left-hand side and set its source on the right-hand side. The selected directory and all sub-directories are scanned for appropriate content.

* **(default)**  
  Model files edited in MPS

* <a name="java_class_stub"></a>**java_classes**  
  External contents of Java Classpath; contents of jar files are considered.
  MPS builds Java Model Stubs for all Java class files found
  in order to reference them inside MPS.

  To be able to compile code against these stubs, we need to add the jars
  to the [Java Libraries](#java_class_path) as well.

* **obsolete**  
  As named. Don't use it.

* <a name="java_source_stub"></a>**java_source_stubs**  
  External Java source files.
  MPS should build Java Model Stubs from these, but does not do so currently
  ([bug](https://youtrack.jetbrains.com/issue/MPS-20600))

  In order to make MPS compile this code and compile other code against
  these stubs, we need to add the path to the
  [Java Source Paths](#java_source_path) as well.

<small>More info: [Java Module Settings](#java_module_settings), [Non-Project Sources](#non_project_sources), [Path Variables](#path_variables)</small>


<a name="module_dependencies"></a>
##### Dependencies Module Settings
**UI:** Tab in Module Properties dialog

Other Modules this Module has a reference to.

* **export**  
  Whether this Dependency should be re-exported.

  Available only for Dependencies in Default Scope.

* **Scope**
  Scope of the Dependency.

    * **Default**  
      Standard Scope. Only Option available for Solutions.

    * **Extends**  
      Extends Scope. Only available for Languages and Generators.

      See below for a discussion of the [meaning of Extends Scope](#_scope).

<small>More info: [Export Flag](#re_export), [Model Dependencies](#model_dependencies), [Dependencies](#_dependencies)</small>


<a name="module_used_languages"></a>
##### Used Languages Module Settings
**UI:** Tab in Module Properties dialog

Languages used in this Module.

See below for a discussion of the [meaning of Language Used](#used_language).

<small>More info: [Language](#_language), [Model Used Langugaes](#model_used_languages)</small>


<a name="java_module_settings"></a>
##### Java Module Settings
**UI:** Tab in Module Properties dialog

Settings concerning Java compilation of this Module.

* **Solution Kind**  
  Whether Java classes of Module (compilation results) should be available
  for ClassLoading. Such modules can contain MPS plugins in order to be notified
  about module ClassLoading initialization and de-initialization.

  If a Module is loaded automatically, it's scanned for [MPS plugins](#mps_plugin)
  to be started at their defined event.

    * **None**  
      Module will not be loaded automatically.

    * **Core plugin**  
      Module will be loaded automatically.

      The Module should not contain any references to the MPS editor, MPS UI,
      or MPS platform. Such module is intended to be compiled without MPS editor classes
      available in the classpath. On MPS startup time, editor classes can be
      unavailable within the classpath of such module.

      We currently don't know about any use case for this Solution Kind.

    * **Editor plugin**
      Module will be loaded automatically.

      The module should not contain any references to the (MPS UI ??),
      or MPS platform, as it's started before these are available.

      This Solution Kind should be selected if this plugin is required in Editor Tests.

    * **Other plugin**
      Module will be loaded automatically.

      The module should not add anything to MPS Editors, this might break
      Editor tests on the build server.

      Select this Solution Kind if we want this Module to be loaded automatically with no other restrictions.

* <a name="java_source_path"></a>**Source Paths**  
  Paths containing Java source files to be compiled by MPS.

  The Path also needs to be added to [java_source_stubs](#java_source_stub)
  in order to be available as MPS models containing BaseLanguage concepts representing the content.

* <a name="java_class_path"></a>**Libraries**  
  Paths containing Java classes and other resources available on the
  Java classpath during compilation.

  When we add something here, a dialog pops up asking about Model Roots.
  This dialog should add the appropriate entry to the
  [Common Module Settings](#common_module_settings). However, this is currently
  broken ([bug](https://youtrack.jetbrains.com/issue/MPS-20544)). Therefore,
  we need to create the [java_classes](#java_class_stub) entry on our own.

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>


<a name="facets_module_settings"></a>
##### Facets Module Settings
**UI:** Tab in Module Properties dialog

Extensible list of facets available for a Module.

* **Idea Plugin**  
  Sets the parent Java classloader for this Module to the classloader of the
  IDEA Plugin referenced on the [IDEA Plugin Module Settings](#idea_plugin_module_settings).

* **Java**  
  Unused marker facet. Always checked.

* **tests**  
  Unused marker facet. Always checked.

<small>More info: [IDEA Plugin](#idea_plugin), [Plugin Disambiguation](#plugin_disambiguation)</small>


<a name="idea_plugin_module_settings"></a>
##### IDEA Plugin Module Settings
**UI:** Optional tab in Module Properties dialog

Settings for parent [IDEA Plugin](#idea_plugin) of this Module.

Needs to be activated on the [Facets Module Settings](#facets_module_settings).

* **Plugin ID**  
  ID of the parent IDEA plugin.

  **parent** means, this solution will be packaged as a part of the specified IDEA plugin. As a result the parent ClassLoader for the ModuleClassLoader of the corresponding solution will be a ClassLoader of specified IDEA plugin, so all classes packaged as a part of corresponding plugin will be available within ModuleClassLoader of this solution.

  On the development time one can [run build script](*build_language) building complete IDEA plugin, deploy in into the current MPS instance using special Run configuration and continue developing a solution inside the current project. In this case actual solution content from the current project will be used. For more details see [MPS Documentation](https://confluence.jetbrains.com/display/MPSD32/Custom+Persistence+Cookbook), especially "Debugging the plugin" part.

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>

<a name="runtime_language_settings"></a>
##### Runtime Language Settings
**UI:** Tab in Module Properties dialog of Language

Settings for Solutions and Models with special meaning for the Language.

* **[Runtime Solutions](#runtime_solution)**  
  Solutions containing Java code that should be available at run-time if the Language is used.

* **[Accessories Models](#accessories_model)**  
  Models containing Nodes that should be referable if the Language is used.

Refer to [Implicit Exports of Runtime Language Settings](#implicit_runtime_exports) for a discussion on the effects.


<a name="generator_priorities"></a>
##### Generators priorities Generator Settings
**UI:** Tab in Module Properties dialog of Generator

The general mechanism of these settings is out of scope of this document. In our scope, we note that any other Generator referenced in these settings needs to be added to the Dependencies tab with Extends scope.

<small>More info: [Generator](#_generator), [Extends Scope for Generators](#extend_generator)</small>

<a name="_model"></a>
### Model
**UI:** Entry below Module in Logical View; may be nested in folders

Container for model contents limiting dependencies to other Models
within the boundaries of the containing Module.

Models can be nested in folders. Folders are only for visual organization, they don't have any effect on storage location, generation or any other aspect.

<small>More info: [Module](#_module)</small>

#### Types of Models

MPS knows several different types of Models. They differ in their semantics and sometimes presentation. They do not differ from a technical point of view.

<a name="regular_model"></a>
##### Regular Models
**UI:** Entry below Solution in Logical View

Contains Root Nodes with no special semantics or presentation.

<small>More info: [Solution](#_solution)</small>


<a name="_aspect"></a>
##### Aspects
**UI:** Entry below Language in Logical View

Aspects are Models within a Language with a special meaning. They are recognized
by their name.

<small>More info: [Language](#_language)</small>

<a name="plugin_aspect"></a>
###### Plugin Aspect
Although this Aspect adheres to the [MPS Plugin Model](#mps_plugin_model) naming convention, it should not be used as such. It should only be used to define MPS Extention Points (from Language `jetbrains.mps.lang.extension`).

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>


<a name="test_model"></a>
##### Test Models
**UI:** Entry below Solution in a special folder named "tests" with special icon in Logical View

Model containing tests. Defined by `@tests` [Stereotype](#_stereotype).

<small>More info: [Test](#_test), [Solution](#_solution)</small>


<a name="generator_model"></a>
##### Generator Models
**UI:** Entry with special icon below Generator in Logical View

Model containing [Generator](#_generator). Defined by `@generator` [Stereotype](#_stereotype).


<a name="transient_model"></a>
##### Transient Models
**UI:** Last entry below Project in Logical View

Temporary Models produced during generation. Defined by `@transient«someNumber»` or `@«someNumber»` [Stereotype](#_stereotype).

<small>More info: [Generator](#_generator)</small>


<a name="accessories_model"></a>
#####Accessories Model
**UI:** Entry below Language in a special folder named "accessories" in Logical View *or* Entry below Solution in Logical View

Model specially selected by a Language. Nodes contained in these Models are implicitly available on the Java classpath and the [Dependencies](#_dependencies) of any Model using this Language. A use case would be a default library of Concept instances to be available at any place the Language is used.

Accessories Models can be stored at two places: Either as [Aspect](#_aspect) of a Language (recommended), or as regular Model below a Solution. In both cases, the Model needs to added to [Module Runtime Language Settings](#runtime_language_settings).


<a name="utility_model"></a>
##### Utility Model
**UI:** Entry below Language in special folder named "util models" in Logical View

Contain code required in other parts of a Language or Generator, eg. if a Behavior method logic is too complex for inline implementation or a Generator needs to do complex model traversals. They should be created as regular Model within the Language.

<small>More info: [Language](#_language)</small>


<a name="build_model"></a>
##### Build Model
**UI**: Entry below Solution in Logical View

Contains Nodes from [Build Language](#build_language).


<a name="mps_plugin_model"></a>
##### MPS Plugin Model
**UI:** Model within a Solution in Logical View

Contains [MPS Plugins](#mps_plugin).

The model name needs to adhere to the naming convention `«moduleName».plugin`.

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>


<a name="_stereotype"></a>
#### Model Stereotype
**UI:** Attached to the Model name, separated by "@"

A Model may have a Stereotype. To change, add, or remove a Stereotype, use the
Rename Model Refactoring in the context menu of a Model.

Using custom Stereotypes has been reported to interfere with lots of MPS internals and thus is not advised to do.

MPS knows some predefined Stereotypes with special meaning:

* **@tests:** Denotes [Test Models](#test_model)
* **@generator:** Denotes [Generator Models](#generator_model)
* **@transient«someNumber» or @«someNumber»:** Denotes [Transient Models](#transient_model)


#### Model Settings
**UI:** Context menu of Model, Model Properties

For both [Dependencies](#module_dependencies) and [Used Languages](#module_used_languages), the settings on Models only restrict the settings from the containing Module.

<a name="model_dependencies"></a>
##### Dependencies Model Settings
**UI:** Tab in Model Properties dialog

Other Models this Model contains references to.

<small>More info: [Module Dependencies](#module_dependencies), [Dependencies](#_dependencies)</small>

<a name="model_used_languages"></a>
##### Used Languages Model Settings
**UI:** Tab in Model Properties dialog

Languages used in this Model.

See below for a discussion of the [meaning of language used](#used_language).

Any Used Language listed in a Model needs to be in the list of Used Languages of the [containing Module](#module_used_languages).

##### Advanced Model Settings
**UI:** Tab in Model Properties dialog

Other settings for a Model.

* <a name="engaged_languages"></a>**Languages engaged on generation**  
  [Generators](#_generator) contained in [Languages](#_language) listed here will be executed on this Model
  in any case.

<small>More info: [Executed Generators](#executed_generator)</small>


<a name="build_language"></a>
### Build Language
Abstracted [Apache Ant](https://ant.apache.org/) files used to build and package MPS Modules outside the IDE.

Used in [Build Models](#build_model).

Can be executed within MPS via the "Run '«Build Model name»" context menu entry of the Build Model in Logical View.


<a name="build_plugin"></a>
#### Use Plugins
**UI:** Section within Build Model

Plugins to the Build Model language providing new entries for Build Models (eg. "generator options", "idea plugin"). These are *not* regular MPS Generators, but non-extendable plugins outputting Apache Ant XML.

Users may provide their own plugins.

Built-in plugins are:

* **java**  
  Support for pure Java

* **mps**  
  Support for MPS Modules

* **module-test**  
  Support for running tests including MPS Modules

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>


#### Dependencies
**UI:** Section within Build Model

Scope import for all references to other Build Models.

Provides access to resulting artifacts of other Build Models.


#### IDEA Plugin Dependencies
**UI:** Section "project structure" in Build Model, subsection "idea plugin", subsection "dependencies"

Contents of [IDEA plugin.xml](https://confluence.jetbrains.com/display/IDEADEV/IntelliJ+IDEA+Plugin+Structure#IntelliJIDEAPluginStructure-PluginConf) `depends` tags.

This plugin will only be loaded if all dependencies listed here could be loaded before. The contents of dependencies are available for this IDEA plugin.

<small>More info: [IDEA Plugins](#idea_plugin), [Plugin Disambiguation](#plugin_disambiguation)</small>


<a name="module_dependencies"></a>
#### Module Dependencies
**UI:** Section "mps group" in Build Model, subsection "solution"/"module", Inspector section "dependencies"

Copy of Relations of described Module.

<small>More info: [Module Dependencies](#module_dependencies), [Module Used Languages](#module_used_languages)</small>


#### Runtime
Copy of [Module Runtime Language Settings](#runtime_language_settings).


#### Jars
**UI:** Section "default layout" un Build Model

All jars included in any [Java Module Settings](#java_module_settings) need to be included somewhere in this section.

.java files (from [Java Source Paths](#java_source_path)) need to be compiled as java sources inside corresponding build script and manually included into the resulting build layout: corresponding .class files should be jared, .java files should be places in corresponding location if they are referenced by java_source_stub model root.


<a name=mps_plugin></a>
## MPS Plugins
MPS Plugins are automatically loaded according to the Solution Kind set in [Java Module Settings](#java_module_settings).

MPS Plugins need to be contained in [MPS Plugin Models](#mps_plugin_model).

<small>More info: [Plugin Disambiguation](#plugin_disambiguation)</small>

#### StandalonePluginDescriptor
We need to add a StandalonePluginDescriptor (defined in Language `jetbrains.mps.lang.plugin.standalone`) as Root Node to any MPS Plugin Model using a Concept from Language `jetbrains.mps.lang.plugin`. Other concepts from Language `jetbrains.mps.lang.plugin.standalone` don't need a StandalonePluginDescriptor.



<a name="plugin_disambiguation"></a>
## Plugin Disambiguation
The term "plugin" is used at various places throughout MPS. It describes very different things:

* **[IDEA Plugins](#idea_plugin):** A packaged set of contributions to the IntelliJ IDEA Platform, which MPS is based upon.

* **[MPS Plugins](#mps_plugin):** Automatically loaded Models.

* **[Plugin Language Aspect](#plugin_aspect):** Model inside a Language defining Extension Points.

* **[Build Model Plugins](#build_plugin):** Part of Build Model language providing new entries for Build Models.



<a name="non_project_sources"></a>
## Non-Project Sources

Non-Project Sources are

* [Global Libraries](#global_libraries)
* [IDEA Plugins](#idea_plugin)
* [Project Libraries](#project_libraries)
* [Common](#common_module_settings) and [Java](#java_module_settings) Module Settings regarding Java classes and Java source files
* [IDEA Plugins](#idea_plugin_module_settings) referenced by a Module

These directories or Jar files are recursively scanned for `*.mpl` ([Languages](#_language)), `*.msd`([Solutions](#_solution)), and `*.devkit` ([DevKit](#_devkit)) files. If found, the corresponding content is added to the [Modules Pool](#modules_pool).


## Java Classpath vs. Relations

Both the Java Classpath and the Relations of a Model are specified by the various settings on Models and Modules. However, these settings affect Classpath and Relations in a different way.

As a rule of thumb, the Classpath contains all Java classes reachable through any kind of relation, ie. the Classpath is populated generously. On the contrary, the Relations are populated reluctantly, ie. they need to be specified explicitly.

The Dependency Relations on Modules and Models are completely separated from the Used Language Relations on Modules and Models. Thus, no Dependency requires a Used Language or vice versa.

<small>More info: [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies), [Module Used Languages](#module_used_languages), [Model Used Languages](#model_used_languages)</small>


<a name="_dependencies"></a>
## Dependencies

By default, only Nodes present in the current Model can be referenced. Dependencies add other Models and Modules to be referenced from the current Model.

Models listed as Dependencies of Model A need to be contained within Modules listed in the Dependencies (including [transitive entries](#re_export)) of the Module containing this Model. Example:

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

<small>More info: [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies), [Module Used Languages](#module_used_languages), [Model Used Languages](#model_used_languages)</small>

<a name="re_export"></a>
### Export Flag

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

<small>More info: [Module Dependencies](#module_dependencies)</small>


<a name="_scope"></a>
### Scope

Default Scope is available for all Module types (TODO: check for DevKits).

Extends Scope is a superset of Default Scope, ie. we never need to have both a Default Scope and an Extends Scope Dependency on another Module.

<small>More info: [Module Dependencies](#module_dependencies)</small>


<a name="extend_language"></a>
#### Extends Scope for Languages

LanguageB (containing ConceptB) MUST extend LanguageA (containing ConceptA and ConceptInterfaceA), if and only if

* ConceptB **extends** ConceptA or ConceptB **implements** ConceptInterfaceA
* LanguageB defines a **new Editor** for ConceptA (but *not* if LanguageA only defines the Editor Hint)
* LanguageB defines a **new Editor Component** for ConceptA
* LanguageB **uses an Editor Component** defined in LanguageA
* LanguageB defines a **new Typesystem** for ConceptA
* <a name="generating_concept_with_runtime_solution"></a>LanguageB defines a **Generator outputting** ConceptA **and** LanguageA **has a Runtime Solution**

[AS]: Wrong (?): LanguageB **uses an Editor Component** defined in LanguageA

LanguageB SHOULD NOT extend LanguageA (but needs a Default Scope Dependency) if

* LanguageB defines a **new Intention** for ConceptA
* ConceptB defines a **Child** of Type ConceptA
* ConceptB defines a **Reference** to Type ConceptA
* ConceptB defines a behavior method **Using Type** ConceptA (eg. as return type, parameter type, or variable type)

LanguageB CANNOT define

* a **new Behavior** for ConceptA
* a **new Constraint** for ConceptA

To be precise, it *is* possible to remove all errors flagged on Behaviors and Constraints in LanguageB. However, they are not taken into account for ConceptA.

<small>More info: [Used Language](#used_language), [Module Dependencies](#module_dependencies), [Language](#_language), [Generator](#_generator), [Implicit Generator Dependencies](#implicit_generator_dependencies), [Runtime Solution](#runtime_solution)</small>


<a name="extend_generator"></a>
#### Extends Scope for Generators

GeneratorB (inside LanguageB, containing ConceptB) MUST extend GeneratorA (inside LanguageA, containing ConceptA), if and only if

* GeneratorB **defines a new Rule** for ConceptA
* GeneratorB **extends a Switch** from GeneratorA
* GeneratorB **defines a Generator Priority** relative to GeneratorA

<small>More info: [Module Dependencies](#module_dependencies), [Generator](#_generator), [Generator Priorities](#generator_priorities)</small>


<a name="implicit_dependencies"></a>
### Implicit Dependencies

Some Dependencies are added implicitly, ie. without being listed in the corresponding dialog.

**Warning:** Even if the Dependencies described below are established implicitly, they are not taken into account in every aspect of MPS. So if an error occurs, make sure we didn't rely on some implicit Dependency. If in doubt, make the Dependency explicit.


<a name="implicit_generator_dependencies"></a>
#### Implicit Dependencies inherited by a Generator from its Language

A Generator "inherits" some Dependencies from the Language it's defined in:

* The [Language](#_language)'s [Runtime Solutions](#runtime_solution) are added to the Generator [Module Dependencies](#module_dependencies).
* The Language Module is added to the Generator Module Dependencies.
* The Language is added to the Generator [Used Languages](#module_used_languages).

Except the case of generating a Concept of a Language that has a Runtime Solution (as [described above](#generating_concept_with_runtime_solution)), there is no requirement on the Language's Dependencies or Used Languages stemming from the Generator.

<small>More info: [Generator](#_generator)</small>


<a name="implicit_language_export"></a>
#### Implicit Exports of Used Language and Language Structure Aspect

Both a Used Language and the Language Structure Aspect implicitly allow accessing the Language's Behavior methods. However, they not re-export the complete Behavior Aspect. For example, a BaseLanguage Class contained in the Behavior Aspect is not visible.

<small>More info: [Language](#_language)</small>


<a name="implicit_runtime_exports"></a>
#### Implicit Exports of Runtime Language Settings

**[Runtime Solutions](#runtime_solution)** are

* implicitly loaded into the Java classpath of any Module using this Language.
* implicitly added to the Dependencies of the Generator contained in this Language.

**[Accessories Models](#accessories_model)** are

* implicitly loaded into the Dependencies of any Model using this Language.

  Accessory Models are not designed to keep any classes. This is "design-only" information. They should not affect Java class path anyhow.

TODO: [AS]: I believe they should be added to the dependencies of the generator module automatically. (if they are saved inside the same language they are visible for generator)

Neither Runtime Solutions nor Accessory Models constitute a Dependency from the Language to the referenced Solution or Model.

<small>More info: [Module Runtime Language Settings](#runtime_language_settings), [Language](#_language), [Generator](#_generator)</small>

<a name="cyclic_dependency"></a>
### Cyclic Dependencies

Cyclic Dependencies between Modules should be avoided in general. They tend to render generation orders and other behavior non-deterministic. Languages are explicitly checked not to have a cyclic Extends Scope Dependency.

A special case are [Runtime Solutions](#runtime_solution), [Accessories Models](#accessories_model), and [Utility Models](#utility_model).

In contrast to Runtime Solutions, Utility Models are used *while* accessing a Behavior or running a Generator. Code within Runtime Solutions is used *after* the Generator ran from the generated code. Thus, a Runtime Solution SHOULD NOT use or reference the Language it's referred from. A Utility Model CAN use or reference the Language it's referred from.

Accessory Models CAN use or reference the Language they're referred from.


<a name="used_language"></a>
## Used Languages

[Model Used Languages](#model_used_languages) need to be listed in the containing [Module Used Languages](#module_used_languages).

There are no implicitly available Used Languages except [described for Generators](#implicit_generator_dependencies). Specifically, if LanguageB has an [Extends Scope Dependency](#extend_language) on LanguageA and ModuleC uses LanguageB, LanguageA *is not a Used Language* within ModuleC.

We MUST add LanguageA (containing ConceptA) to ModuleB's and contained ModelB's Used Languages if and only if

* ModelB **instantiates** ConceptA within the IDE
* ModelB **executes Intentions** from LanguageA
* ModelB **requires Typechecks** from LanguageA
* ModelB **uses Editors** from LanguageA by selecting an Editor Hint (but *not* if LanguageA only defines the Editor Hint)
* ModuleB is a Generator and **outputs instances** of ConceptA

[AS]: not sure about: ModelB **uses Editors** from LanguageA by selecting an Editor Hint (but *not* if LanguageA only defines the Editor Hint)

<small>More info: [Language Extends Scope](#extend_language)</small>


<a name="executed_generator"></a>
## Executed Generators

GeneratorA contained in LanguageA (containing ConceptA)
will be executed for ModelS (contained in ModuleS) if and only if

* ModelS **[uses](#model_used_languages)** LanguageA **and contains an instance** of ConceptA
* ModelS **lists** LanguageA in **[Languages engaged on generation](#engaged_languages)**
* above conditions match LanguageB containing GeneratorB **[extending](#extend_generator)** GeneratorA


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
languages used in applied Generators) are **not** added to the output Model. [Implicit Dependencies](#implicit_dependencies) apply as described.



<a name="_test"></a>
## Tests

Tests are regular or extended [JUnit](http://junit.org/) tests that can be executed within MPS or [stand-alone](#build_language).

Tests are contained in [Test Models](#test_model), defined by `@tests` [Stereotype](#_stereotype).

The Stereotype enables

* the "Run Tests" entry in [Solution](#_solution) and [Test Model](#test_model) context menu.

* [Build Language](#build_language) test instruction to search the Model for tests.

As soon as we're using any concepts from language `jetbrains.mps.lang.test`, we need to have a `TestInfo` Root Node in the same model. The TestInfo node needs to refer to a [Project](#_project) to be used to execute the tests. This reference may *not* use a `${module}`, `${language_descriptor}`, `${solution_descriptor}`, or `${project}` built-in [Path Variables](#path_variables). It needs to refer to a Project containing the test.



## Recipes

This section lists all Relations required for a specific task.

If not specified otherwise, all Dependencies should be added

* if no Dependency exists: With Default Scope and no Export flag
* if a Dependency (no matter witch Scope and Export flag) exists: No change

MPS often creates the required Relations on Module level automatically if we add a Relation on Model
level. However, this does not work in all cases, so double-check if the Module level Relation was
created correctly if there are errors.

### Use Java Type

`ClassB` inside `ModelB` inside `ModuleB` wants to create a variable of
type `ClassA` inside `ModelA` inside `ModuleA`.

* To `ModelB`, add Dependency to `ModelA`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `ModuleA`.

<small>More info: [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Reuse (aka extend, reference) External Java Type

`ClassB` inside `ModelB` inside `ModuleB` extends `ClassA` inside `ModelA` inside `ModuleA`.
`ClassC` inside `ModelC` inside `ModuleC` wants to use `ClassB` as simple as possible.

* To `ModuleB`, add the Export Flag to the Dependency on `ModuleA`.
* To `ModelC`, add Dependency to `ModelB`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleC` to `ModuleB`.

[AS]: Not sure we should add the Export Flag to the Dependency on `ModuleA` here.

<small>More info: [Dependencies](#_dependencies), [Export Flag](#re_export), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Concept Instance

Directly (aka root node) or indirectly (aka child node) within `ModelB` inside `ModuleB`, we want to create an instance of `ConceptA` inside `LanguageA`.

* To `ModelB`, add Used Language to `LanguageA`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageA`.

<small>More info: [Used Languages](#used_language), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Use Intention

Make `IntentionC` defined in `LanguageC` for `ConceptA` inside `LanguageA` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

<small>More info: [Used Languages](#used_language), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Use Typesystem Rule

Make `TypesystemRuleC` defined in `LanguageC` for `ConceptA` inside `LanguageA` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

<small>More info: [Used Languages](#used_language), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Use alternate Editor with Hint

Make `EditorC` defined in `LanguageC` for `ConceptA` inside `LanguageA` using `HintD`defined in `LanguageD` available in `ModelB` inside `ModuleB`.

* To `ModelB`, add Used Language to `LanguageC`.  
  Even if MPS complains about the Used Language being "out of scope", click ok.
* MPS will automatically add a Used Language from `ModuleB` to `LanguageC`.

<small>More info: [Used Languages](#used_language), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Assure Generator is Executed for a Model

Assure `GeneratorC` defined in `LanguageC` for `ConceptA` inside `LanguageA` is executed for `ModelB` inside `ModuleB`.

* To `ModelB`, add `LanguageC` to *Languages engaged on generation*.
* To `ModuleB`, add Used Language to `LanguageC`.

<small>More info: [Executed Generators](#executed_generator), [Generators](#_generator)</small>


<a name="use_node_type"></a>
### Use `node<SomeConcept>` Type

`ClassB` inside `ModelB` inside `ModuleB` wants to create a variable of
type `node<ConceptA>` inside `LanguageA`.

* To `ModelB`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `LanguageA`.

<small>More info: [Dependencies](#_dependencies), [Implicit Language Exports](#implicit_language_export), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Call Behavior Method

`ClassB` inside `ModelB` inside `ModuleB` wants to call
Behavior method `opA` inside `ConceptA` inside `LanguageA`.

* To `ModelB`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `ModuleB` to `LanguageA`.

**Note:** We could also add a Dependency from `ModelB` to `LanguageA.behavior`. However, as we need
to depend on `LanguageA.structure` [anyways](#use_node_type) (to be able to access the type), the recipe presented above is preferred.

<small>More info: [Dependencies](#_dependencies), [Implicit Language Exports](#implicit_language_export), [Language Extends Scope](#extend_language), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Use Concept as Child or Reference

`ConceptB` inside `LanguageB` wants to have a child or reference of
type `ConceptA` inside `LanguageA`.

* To `LanguageB.structure`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Used Language from `LanguageB` to `LanguageA`.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Extend Concept or Implement ConceptInterface

`ConceptB` inside `LanguageB` wants to extend / implement
`ConceptA` / `ConceptInterfaceA` inside `LanguageA`.

* To `LanguageB.structure`, add Dependency to `LanguageA.structure`.  
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope, either by
  setting it manually or by using the Intention on the error appearing on `ConceptB`.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Editor

`LanguageB` wants to define a new editor for `EditorHintC` defined in `LanguageC` for
`ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageC.editor`.
* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageC`.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Editor Component

`LanguageB` wants to define a new Editor Component for `ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Use Editor Component

`LanguageB` wants to use `EditorComponentC` defined in `LanguageC` for `ConceptA` inside `LanguageA`.

* To `LanguageB.editor`, add Dependency to `LanguageC.editor`.
* To `LanguageB.editor`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageC`.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageC` has Extends Scope.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Typesystem Rule

`LanguageB` wants to define a new Typesystem Rule for `ConceptA` inside `LanguageA`.

* To `LanguageB.typesystem`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.
* Make sure the Dependency from `LanguageB`to `LanguageA` has Extends Scope.

**Note:** The *overrides* flag in Typesystem Rules is not related to Dependencies.
This flag specifies if Typesystem Rules of Concepts extended by the applicable Concept are evaluated.

Example:

* `ConceptX` extends `ConceptY` extends `ConceptZ`
* `ConceptZ` defines Typesystem Rule `ConceptZTypeRule`
* `ConceptY` defines Typesystem Rule `ConceptYTypeRule1[override=true]` and `ConceptYTypeRule2[override=false]`
* `ConceptX` defines Typesystem Rule `ConceptXTypeRule[override=false]`

Then:

* For `ConceptZ`, Typesystem Rule `ConceptZTypeRule` is evaluated.

* For `ConceptY`, Typesystem Rules `ConceptYTypeRule1` and `ConceptYTypeRule2` are evaluated.  
  `ConceptZTypeRule` is **not** evaluated, as at least one Rule for `ConceptY` defines
  `[override=true]`.

* For `ConceptX`, Typesystem Rules `ConceptYTypeRule1`, `ConceptYTypeRule2` and  
  `ConceptXTypeRule` are evaluated.  
  `ConceptYTypeRule1` and `ConceptYTypeRule2` are included because no Rule for `ConceptX`
  defines `[override=true]`.  
  `ConceptZTypeRule`is **not** evaluated because the search for Rules in extended Concepts
  stops at the first concept having at least one Rule defining `[override=true]`.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Intention

`LanguageB` wants to define a new Intention for `ConceptA` inside `LanguageA`.

* To `LanguageB.intentions`, add Dependency to `LanguageA.structure`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `LanguageB` to `LanguageA`.

<small>More info: [Language Extends Scope](#extend_language), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies)</small>


### Create Generator

*Create Generator* includes

* Create new Root Mapping
* Create new Reduction Rule
* Create new Switch

`GeneratorB` inside `LanguageB` wants to create a Generator transforming `ConceptA` inside `LanguageA`
into `ConceptC` inside `LanguageC`.

* To `GeneratorB.main@generator`, add Dependency to `LanguageA.structure`.
* To `GeneratorB.main@generator`, add Used Language to `LanguageC`.
  Even if MPS complains about the Dependency or Used Language being "out of scope", click ok.
* Don't forget to sort your generator into the generation process by defining some [Generator Priority](https://confluence.jetbrains.com/display/MPSD31/Generator#Generator-DefiningtheOrderofPriorities).
* MPS will automatically add a Dependency from `GeneratorB` to `LanguageA`.
* MPS will automatically add a Used Language from `GeneratorB` to `GeneratorA`.
* If `LanguageC` defines a Runtime Solution: To `LanguageB`, add Extends Scope Dependency to `LanguageC`.

<small>More info: [Language Extends Scope](#extend_language), [Generator Extends Scope](#extend_generator), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Extend Generator

*Extend Generator* includes

* Assure another Generator is always executed if this Generator is executed
* Create new Reduction Rule to be used in another Generator
* Create a new Switch entry for a Switch in another Generator

`GeneratorB` inside `LanguageB` wants to extend `GeneratorA` inside `LanguageA`.  
`GeneratorA` transforms `ConceptC` inside `LanguageC` into `ConceptD` inside `LanguageD`.  
`GeneratorB` transforms `ConceptE` inside `LanguageE` into `ConceptF` inside `LanguageF`.

* To `GeneratorB.main@generator`, add Dependency to `GeneratorA.main@generator`.
  Even if MPS complains about the Dependency being "out of scope", click ok.
* MPS will automatically add a Dependency from `GeneratorB` to `GeneratorA`.
* Make sure the Dependency from `GeneratorB`to `GeneratorA` has Extends Scope.

<small>More info: [Language Extends Scope](#extend_language), [Generator Extends Scope](#extend_generator), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Generate Java Class extending a Base Class

`GeneratorB` inside `LanguageB` wants to transform `ConceptA` inside `LanguageA` into a `ConceptAJavaClass` extending `ConceptAJavaClassBase` inside `ModelC` inside `SolutionC`.

* To `GeneratorB.main@generator`, add Dependency to `LanguageA.structure`.
* To `GeneratorB.main@generator`, add Dependency to `ModelC`.
* To `GeneratorB.main@generator`, add Used Language to `BaseLanguage`.
  Even if MPS complains about the Dependency or Used Language being "out of scope", click ok.
* Don't forget to sort your generator into the generation process by defining some [Generator Priority](https://confluence.jetbrains.com/display/MPSD31/Generator#Generator-DefiningtheOrderofPriorities).
* MPS will automatically add a Dependency from `GeneratorB` to `LanguageA`.
* MPS will automatically add a Dependency from `GeneratorB` to `SolutionC`.
* MPS will automatically add a Used Language from `GeneratorB` to `BaseLanguage`.
* To `LanguageB`, add Extends Scope Dependency to `BaseLanguage` (because `BaseLanguage` defines a Runtime Solution).
* To `LanguageB`, add Runtime Solution to `SolutionC`.

<small>More info: [Runtime Solutions](#runtime_solution), [Language Extends Scope](#extend_language), [Generator Extends Scope](#extend_generator), [Used Language](#used_language), [Dependencies](#_dependencies), [Module Dependencies](#module_dependencies), [Model Dependencies](#model_dependencies), [Module Used Languages](#model_used_languages), [Model Used Languages](#model_used_languages)</small>


### Define Runtime Solution

`LanguageB` wants to use `SolutionA` as Runtime Solution.

* To `LanguageB`, add Runtime Solution to `SolutionA`.

**Note:** We don't need any other Relation, specifically, **no** Dependency from `LanguageB` to `SolutionA`.

<small>More info: [Runtime Solutions](#runtime_solution), [Dependencies](#_dependencies)</small>


### Define Accessories Model (aka make Concept Instances available everywhere a Langauge is Used)

`BuiltInNodeA` as Instance of `BuiltInConcept` inside `LanguageA` should be available to be referenced anywhere `LanguageA`
is a Used Language.

* Create `AccessoryModel` as Aspect in `LanguageA`
* To `AccessoryModel`, add Used Language to `LanguageA`.
* Create `BuiltInNodeA` inside `AccessoryModel`.
* To `LanguageA`, add Accessory Model to `AccessoryModel` (if not present already).

**Note:** We don't need any other Relation, specifically, **no** Dependency from `LanguageA` to `AccessorySolution`.

<small>More info: [Accessories Model](#accessories_model), [Dependencies](#_dependencies)</small>


### Create Utility Model (aka create complex implementations for Behavior Methods or Generators)

`complexBehavior()` defined for `ConceptA` inside `LanguageA` needs `ComplexBehaviorInternalJavaClass` for its implementation.

or

`GeneratorA` inside `LanguageA` needs `ComplexGeneratorInternalJavaClass` for its execution (eg. for a complex *condition* or *macro*).

* Create `BehaviorUtilityModel` / `GeneratorUtilityModel` as regular Model within `LanguageA`.
* To `BehaviorUtilityModel` / `GeneratorUtilityModel`, add Used Language to `BaseLanguage`.
* Create `ComplexBehaviorInternalJavaClass` / `ComplexBehaviorInternalJavaClass` within `BehaviorUtilityModel` / `GeneratorUtilityModel`.
* To `LanguageA.behavior` / `GeneratorA.main@generator` add Dependency to `BehaviorUtilityModel` / `GeneratorUtilityModel`

<small>More info: [Utility Model](#utility_model), [Dependencies](#_dependencies)</small>


TODO: IDEA Plugins, MPS Plugins, External Classes, External Sources
