# Modules
Unit of deployment and dependency for Something[^1] with defined relations to other Modules.

[^1]: "Something" denotes anything that can be contained in a Module.

## Types of Modules

<a name="_solution"></a>
### Solution
**UI:** Entry below Project in Logical View; may be nested in folders

Standard container for Something.

#### Runtime Solution

Runtime Solutions are regular Solutions with additional semantic meaning: They are defined as Runtime Solution at the
[Runtime Language Settings](#runtime-language-settings). They contain Java code that should be available at run-time if the Language is used.

<a name="_language"></a>
### Language
**UI:** Entry below Project in Logical View; may be nested in folders

Container for defining a new Language within MPS. Also contains Generators, but this is mostly for historical reasons.

<a name="_generator"></a>
### Generator
**UI:** Entry below Language in Logical View

Container for defining how to translate one kind of Nodes into
another kind of Nodes.

<a name="_devkit"></a>
### DevKit
**UI:** TODO

Collection of Solutions and Languages to be used in combination.

TODO: Extend

## Module Settings
**UI:** Context menu of Module, Module Properties

Settings applicable to the Module.

<a name="common_module_settings"></a>
### Common Module Settings
**UI:** Tab in Module Properties dialog

Sources of Something. For all of them, we select or add the source type on the left-hand side and set its source on the right-hand side. The selected directory and all subdirectories are scanned for appropriate content.

* **(default)**  
  Model files edited in MPS

* <a name="java_class_stub"></a>**java_classes**  
  External contents of Java Classpath; contents of jar files are considered.
  MPS builds Java Model Stubs for all Java class files found
  in order to reference them inside MPS.

  To be able to compile code against these stubs, we need to add the jars
  to the [Java Libraries](#java-libraries) as well.

* **obsolete**  
  As named. Don't use it.

* <a name="java_source_stub"></a>**java_source_stubs**  
  External Java source files.
  MPS should build Java Model Stubs from these, but does not do so currently
  ([bug](https://youtrack.jetbrains.com/issue/MPS-20600))

  In order to make MPS compile this code and compile other code against
  these stubs, we need to add the path to the
  [Java Source Paths](#java_source_path) as well.

<a name="module_dependencies"></a>
### Dependencies Module Settings
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

      See below for a discussion of the [meaning of Extends Scope](#scope).

<a name="module_used_languages"></a>
### Used Languages Module Settings
**UI:** Tab in Module Properties dialog

Languages used in this Module.

See below for a discussion of the [meaning of Language Used](#meaning-of-language-used).

<a name="java_module_settings"></a>
### Java Module Settings
**UI:** Tab in Module Properties dialog

Settings concerning Java compilation of this Module.

* **Solution Kind**  
  Whether Java classes of Module (compilation results) should be available
  for ClassLoading. Such modules can contain MPS plugins in order to be notified
  about module ClassLoading initialization and de-initialization.

  If a Module is loaded automatically, it's scanned for [MPS plugins](#mps-plugins)
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

  The Path also needs to be added to [java_source_stubs](#java-source-stubs)
  in order to be available as MPS models containing BaseLanguage concepts representing the content.

* <a name="java_class_path"></a>**Libraries**  
  Paths containing Java classes and other resources available on the
  Java classpath during compilation.

  When we add something here, a dialog pops up asking about Model Roots.
  This dialog should add the appropriate entry to the
  [Common Module Settings](#common-module-settings). However, this is currently
  broken ([bug](https://youtrack.jetbrains.com/issue/MPS-20544)). Therefore,
  we need to create the [java_classes](#java-class-stub) entry on our own.

<a name="facets_module_settings"></a>
### Facets Module Settings
**UI:** Tab in Module Properties dialog

Extensible list of facets available for a Module.

* **Idea Plugin**  
  Sets the parent Java classloader for this Module to the classloader of the
  IDEA Plugin referenced on the [IDEA Plugin Module Settings](#idea-plugin-module-settings).

* **Java**  
  Unused marker facet. Always checked.

* **tests**  
  Unused marker facet. Always checked.

<a name="idea_plugin_module_settings"></a>
### IDEA Plugin Module Settings
**UI:** Optional tab in Module Properties dialog

Settings for parent [IDEA Plugin](#idea-plugin) of this Module.

Needs to be activated on the [Facets Module Settings](#facets-module-settings).

* **Plugin ID**  
  ID of the parent IDEA plugin.

  **parent** means, this solution will be packaged as a part of the specified IDEA plugin. As a result the parent ClassLoader for the ModuleClassLoader of the corresponding solution will be a ClassLoader of specified IDEA plugin, so all classes packaged as a part of corresponding plugin will be available within ModuleClassLoader of this solution.

  On the development time one can [run build script](*build-language) building complete IDEA plugin, deploy in into the current MPS instance using special Run configuration and continue developing a solution inside the current project. In this case actual solution content from the current project will be used. For more details see [MPS Documentation](https://confluence.jetbrains.com/display/MPSD32/Custom+Persistence+Cookbook), especially "Debugging the plugin" part.

<a name="runtime_language_settings"></a>
### Runtime Language Settings
**UI:** Tab in Module Properties dialog of Language

Settings for Solutions and Models with special meaning for the Language.

* **[Runtime Solutions](#runtime-solution)**  
  Solutions containing Java code that should be available at run-time if the Language is used.

* **[Accessories Models](#accessories-model)**  
  Models containing Nodes that should be referable if the Language is used.

Refer to [Implicit Exports of Runtime Language Settings](#implicit-runtime-exports) for a discussion on the effects.


<a name="generator_priorities"></a>
### Generators priorities Generator Settings
**UI:** Tab in Module Properties dialog of Generator

The general mechanism of these settings is out of scope of this document. In our scope, we note that any other Generator referenced in these settings needs to be added to the Dependencies tab with Extends scope.

<a name="_model"></a>