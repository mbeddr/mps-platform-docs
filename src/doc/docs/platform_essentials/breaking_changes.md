---
comments: true
---

A breaking change in software development is a change that affects the compatibility or functionality of existing code
that depends on the changed code. In the platform it can also mean that the code now behaves for example, differently for the users, new errors are introduced or the user has to change its own code.

## Breaking Changes

- Changing the cardinality of a property, reference, or link in the structure aspect of a language.  This can affect the way the element is accessed or modified in the code, and may require additional checks or conversions. A change from 0..1/1 to 0..n or vice versa
 is the most drastic change where the calling code has to be adapted. Changing the cardinality from 0..1 to 1 or vice versa
 might leave parts of nodes uninitialized when they become mandatory. They also throw model check errors when used in light quotations.
- Changing the type of a property/ reference or link in the structure aspect of a language. This can cause type errors or mismatches in the code that assigns or reads the value. 
- Changing the target concept of a reference or link in the structure aspect of a language. This can affect the validity and resolution of the reference or link, and may require additional constraints or scopes.
- Changing the inheritance hierarchy of concepts in the structure aspect of a language. This can affect the subtyping and substitutability of concepts, and may require additional type rules or migrations.
- Changing the behavior of a concept or a model element in the behavior aspect of a language. This can affect the semantics and execution of the code that invokes the behavior, and may require additional tests or validations.
- Changing the language version or module version. This might only cause the migration assistant to pop up to update the versions
  but most of the time (mandatory) migrations have to be executed.
- Changing the constraints aspect of a concept or a model element. This can affect the validity and scope of the element in the context of other elements.
- Changing the typesystem aspect of a concept or a model element. This can affect the type checking and inference of the element and its subtypes.
- Changing the generator aspect of a concept or a model element. This can affect the transformation and generation of the element and its dependencies.
- Changing the name or location of a language or a model. This can affect the references and dependencies of the language or the model, and may require updating the project configuration or the module.xml file.
- Changing the name or location of a generator template or a mapping label. This can affect the generation plan or the mapping configuration of the language, and may require updating the generator aspect or the generator.xml file.
- Changing the generated code of a custom aspect can be a breaking change, depending on how the code is used by the subsystems. For example, if the code is used to access or modify the aspect model elements, changing the code can affect the validity or functionality of the aspect. If the code is used to implement some behavior or logic of the aspect, changing the code can affect the semantics or performance of the aspect.
- Removing or changing the visibility of a dependency that is used by other modules or models. This can cause unresolved references or compilation errors in the dependent code, and may require updating the module.xml or the model properties files.
- Changing the dependency scope from compile to runtime or test. This can affect the generation or execution of the dependent code, and may require adding additional dependencies or changing the generation plan.
- Removing a language completely or some concepts of it.

## Partially Breaking Changes

- Changing the name of a concept, property, reference or link in the structure aspect of a language won't break reference to
those elements but resolve infos need to be updated.
- Changing the editor aspect of a concept or a model element. This can affect the way the element is displayed or edited in the projectional editor2.

## Base Language Code

Changes can affect types, methods and fields of classes.

### Breaking Changes

The following changes are considered breaking:

- Type
    - rename/move
    - move and rename
    - remove
    - lost visibility
    - add final modifier/remove static modifier
    - change in supertype/remove supertype
- Method
    - move/rename
    - remove
    - push down
    - inline
    - change in parameter/exception list
    - change in return type
    - lost visibility
    - add final modifier/remove static modifier
- Field
  - remove
  - move
  - push down field
  - change in default value
  - change in type field
  - lost visibility
  - add final modifier

### Non-Breaking Changes

The following changes are considered non-breaking:

- Type
    - add
    - extract supertype
    - gain visibility
    - remove final modifier
    - add static modifier/supertype
    - deprecated type
- Method
    - pull up
    - gain visibility
    - remove final modifier
    - add static modifier
    - deprecated method
    - add
    - extract
- Field
    - pull up
    - add
    - deprecated field
    - gain visibility
    - remove final modifier

## Java API Design Links

- [Google Best Practices for Java Libraries](https://jlbp.dev/)
- [Java API Best Practices](https://dzone.com/refcardz/java-api-best-practices)
- [Java API Design Guidelines](https://www.artima.com/weblogs/viewpost.jsp?thread=142428) + [Gist](https://gist.github.com/renepanke/e669ead080865e175db50880ebc94fda)
- [API Design With Java 8](https://dzone.com/articles/the-java-8-api-design-principles)
- [Best Practices for Java Library Developers](https://www.jonathangiles.net/jbp/index.html)
- [How to Design a Good, Regular API](https://blog.jooq.org/how-to-design-a-good-regular-api/)
- [Java API Design: A Checklist to Consider](https://api2cart.com/news/java-api-design-checklist-consider/)
- [The Little Manual of API Design](https://people.mpi-inf.mpg.de/~jblanche/api-design.pdf)