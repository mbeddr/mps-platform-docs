---
comments: true
tags:
- reference
- intellij
---

Java annotations are a form of metadata that can be attached at different places in the source code and are supported by Base Language as well.

For an overview of Java built-in annotations, read [this article](https://www.baeldung.com/java-default-annotations).

The built-in annotations are:

- [@Override](https://www.baeldung.com/java-override): indicates that a method is intended to override a method declared in a superclass.
- [@SuppressWarnings](https://www.baeldung.com/java-suppresswarnings): tells the compiler to suppress specific warnings that it would otherwise generate.
- [@Deprecated](https://www.baeldung.com/java-deprecated): marks a program element (class, method, field, etc.) as no longer recommended for use, typically because it’s dangerous or there is a better alternative.
- [@SafeVarargs](https://www.baeldung.com/java-safevarargs): denotes that a method with a variable number of arguments (varargs) is safely handling the arguments to prevent potential heap pollution.
- [@FunctionalInterface](https://www.baeldung.com/java-default-annotations#1-functionalinterface): specifies that the annotated interface is intended to be a functional interface, which has exactly one abstract method.
- [@Native](https://www.baeldung.com/java-default-annotations#2native): Used to signal that a field is referencing a constant value from a native library, typically used in conjunction with the `native` keyword.

A common annotation that is also often used is the [@Serial](https://www.baeldung.com/java-14-serial-annotation) annotation.

The meta-annotations to describe annotations are:

- [@Target](https://www.baeldung.com/java-default-annotations#1-target): specifies the kinds of program element to which an annotation type is applicable (such as a method, field, or class).
- [@Retention](https://www.baeldung.com/java-default-annotations#2-retention): indicates how long annotations with the annotated type are to be retained. It can specify retention at source level, class level, or runtime level.
- [@Inherited](https://www.baeldung.com/java-default-annotations#3-inherited): marks an annotation to be inherited to subclasses of the annotated class (by default, annotations are not inherited to subclasses). 
- [@Documented](https://www.baeldung.com/java-default-annotations#4-documented): signifies that whenever the specified annotation is used those elements should be documented using the Javadoc tool.
- [@Repeatable](https://www.baeldung.com/java-default-annotations#5-repeatable): allows an annotation to be applied more than once to the same declaration or type use.

Some useful Intellij SDK annotations are:

- [@State](https://plugins.jetbrains.com/docs/intellij/persisting-state-of-components.html): specify the storage location when persisting the state of components
- [@RequiresBackgroundThread](http://www.jetbrains.org/intellij/sdk/docs/basics/architectural_overview/general_threading_rules.html) : Methods and constructors must be called from some thread that is not the EDT.
- [@RequiresEdt](http://www.jetbrains.org/intellij/sdk/docs/basics/architectural_overview/general_threading_rules.html) : Methods and constructors must be called from the EDT only.
- [@RequiresReadLock](http://www.jetbrains.org/intellij/sdk/docs/basics/architectural_overview/general_threading_rules.html) : Methods and constructors must be called only with read lock held.
- [@RequiresReadLockAbsence](http://www.jetbrains.org/intellij/sdk/docs/basics/architectural_overview/general_threading_rules.html) : Methods and constructors must be called without read lock held.
- [@RequiresWriteLock](http://www.jetbrains.org/intellij/sdk/docs/basics/architectural_overview/general_threading_rules.html) : Methods and constructor must be called only with write lock held.

For an overview of JetBrains-specific annotations, read: [JetBrains Annotations](https://www.jetbrains.com/help/idea/annotating-source-code.html#jetbrains-annotations):

- *@Nullable* and *@NotNull*: indicate a variable, parameter, or return value that can or cannot be null.
- *@Nls*: indicates that an annotated code element is a string that needs to be localized.
- *@NonNls*: indicates that an annotated code element is a string which is not visible to users, which doesn't require localization, and which doesn't contain strings requiring localization. When you annotate an element with @NonNls, localization tools will skip this element and strings inside it.
- *@PropertyKey*: indicates that a method parameter accepts arguments that must be valid property keys in a specific resource bundle. When a string literal that is not a property key in a bundle is passed as a parameter, IntelliJ IDEA highlights it as an error. The annotation is also used to provide completion in string literals passed as parameters.
- *@TestOnly*: indicates that a method or a constructor must be called from testing code only.
- *@Contract*: lets you specify a set of rules (a contract) that a method must follow. If the contract is violated, IntelliJ IDEA reports a problem.
- *@Language*: injects code written in another language in a Java String.

More annotations can be found in the package [org.jetbrains.annotations](https://javadoc.io/doc/org.jetbrains/annotations/latest/org/jetbrains/annotations/package-summary.html) and [org.intellij.lang.annotations](https://javadoc.io/doc/org.jetbrains/annotations/latest/org/intellij/lang/annotations/package-summary.html).