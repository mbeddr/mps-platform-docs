# Language extensions

This page lists some languages that extend existing MPS' languages. None of them are essential for working with MPS but
can rather be convenient for special use cases.

## Dataflow

> ^^com.mbeddr.mpsutil.dataflow^^

MPS-DF is a dataflow extension for MPS. MPS partly includes the code of this project. Please visit the following page for more information:

[An Extensible Framework for Variable-precision Dataflow Analyses in MPS | Tamás Szabó](https://szabta89.github.io/projects/df.html)

## Default Values for Properties

> ^^com.mbeddr.mpsutil.propertydefault^^

This language allows setting a default value for properties when you initialize them.
The default value can be set by invoking the code completion on an existing property constraint inside the concept constraints of a concept and using one of the completion items with the "default" suffix:

```java
concepts constraints TestPropertyDefault {
...

property {bool}
default: true

property {int}
default: 42

property {string}
default: "empty"

...
}
```

## Extension Class

> ^^com.mbeddr.mpsutil.extensionclass^^

MPS already provides a language for [defining extension methods](https://www.jetbrains.com/help/mps/type-extension-methods.html), for example, methods to be called on an object without being part of the Object's class. This language extends this mechanism to provide all static methods of a class as extension methods. You can invoke them on the type of the method's first parameter.

Import the language and create a new [ExtensionClass](http://127.0.0.1:63320/node?ref=r%3Aea8e2f7a-cc5b-4bf7-a282-46a98c41b7b5%28com.mbeddr.mpsutil.extensionclass.structure%29%2F5712676642252469509) root node. Reference the Java class containing the static methods. Add method annotations to overwrite parameter names so that they're more elaborate than "p0" or "p2".

As a starting point, create a dependency to the model ^^com.mbeddr.mpsutil.extensionclass.annotation.apache.commons.lang3^^, which provides extension methods with valuable parameter names for Apache Commons StringUtils, ObjectUtils, and StringEscapeUtils.

![example: extension class](extensionclass_example.png)

## Language Plugin Extensions

> ^^com.mbeddr.mpsutil.lang.plugin.extensions^^

This language contains extensions for ^^jetbrains.mps.lang.plugin^^. It mainly adds support for adding actions not only at a specific position but also supports the anchors first, last, before, and after. Example:
`add to NewProjectOrModuleGroup after position NewProject`


## Parameterized Menu

> ^^com.mbeddr.mpsutil.parameterizedMenu^^

This language is an extension of the *parameterized* transformation language part. When used as a menu part of it, it allows
iterating over the parameter object (*parameterizable parameterized* menu part) or creating a dynamic submenu based on
the parameter object (*parameterized submenu*).

![example:ccmenu](ccmenu_example.png)

For completion styling and item priorities, use [completion styling](https://blog.jetbrains.com/mps/2019/04/jetbrains-mps\-2019-1-custom-style-for-completion-menu-static-methods-in-baselanguage-custom-ui-themes-and-more/#Custom_style_and_priority_of_completion_items_Client_Sponsored) instead.

## Resources

> ^^com.mbeddr.mpsutil.resources^^

This language extends ^^jetbrains.mps.lang.resources^^ by providing more customizations. [CircleCustomizable](http://127.0.0.1:63320/node?ref=r%3A3a350e23-1ecf-4b26-b501-4772d34dff84%28com.mbeddr.mpsutil.resources.structure%29%2F8062515945409215260) adds support for drawing the circle with a different thickness. The class [TextCustomizable](http://127.0.0.1:63320/node?ref=r%3A3a350e23-1ecf-4b26-b501-4772d34dff84%28com.mbeddr.mpsutil.resources.structure%29%2F4984484659274609509) supports specifying the font style (plain, bold, italic), font family, and offsets for the text.


## Suppress Warning

> ^^com.mbeddr.mpsutil.suppresswarning^^

This language allows attaching an annotation to nodes to deactivate all or specific type system warnings by invoking the intention `Toggle Suppress Warnings`. You can suppress different kinds of warnings:

- [all](http://127.0.0.1:63320/node?ref=r%3Ad5deda81-7a35-4c2b-bda1-1fdc1db99e3b%28com.mbeddr.mpsutil.suppresswarning.structure%29%2F9116320848000879251): Suppress all warnings.

In ^^com.mbeddr.core.modules^^, two more data flow-related kinds exist:

- **Liveness**: Suppress dataflow liveness warnings.
- **Dataflow**: Suppress dataflow warnings.

## Type System Trace

> ^^com.mbeddr.mpsutil.typesystem.trace^^

!!! warning "This language doesn't work anymore."

This language modifies the different type system concepts, such as comparison rules or non-type system rules to collect information about the runtime execution time. To use it, place an instance of [TraceTypesystem](http://127.0.0.1:63320/node?ref=2e589a6f-51c3-423f-8ea2-0d769a5cc288%2Fr%3Ac1f6b4a3-d5ba-4a16-9105-fec55e3ea263%28com.mbeddr.mpsutil.typsystem.trace%2Fcom.mbeddr.mpsutil.typsystem.trace.structure%29%2F5632795803933258786) into a type-system aspect to include the generator of this language and set the *enabled* flag to true. The model contains a new action `Benchmark Typesystem` that opens the `Type System Performance Data` tool. It shows the collected information.

## XML Fix

> ^^com.mbeddr.mpsutil.xml.fix^^

This language contains fixes for the [XML language](https://www.jetbrains.com/help/mps/xml-language.html). It [escapes XMl values](https://commons.apache.org/proper/commons-lang/javadocs/api-3.3/org/apache/commons/lang3/StringEscapeUtils.html#escapeXml10(java.lang.String)) for XML 1.0/1.1.

## Unique Names

> ^^com.mbeddr.mpsutil.uniquenames^^

MPS references all nodes by their id, not their name. Still, humans see only the name, which might be ambiguous. Activate the unique names hint in the MPS Preferences --> Editor Hints. It shows as much of the full qualified name as required, rendering it unique.

Example concept:

![example: unique names in concept declaration](uniquenames_concept_plain.png)

Example Base Language:

![example: unique names in Base Language](uniquenames_class_unique.png)

