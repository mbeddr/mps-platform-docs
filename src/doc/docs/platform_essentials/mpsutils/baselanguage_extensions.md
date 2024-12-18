---
comments: true
---

# Base Language Extensions

These languages extend Base Language to add further functionality. If a language is reimplemented in MPS, it will be
deprecated in the platform and removed at a later time.

## BLDoc

> ^^com.mbeddr.mpsutil.bldoc^^

This language can attach documentation via the intention `Attach Documentation` to any node. The rich text language
provides the concept `Text` for writing the documentation. Two interfaces implement [IWord](http://127.0.0.1:63320/node?ref=r%3Aca2ab6bb-f6e7-4c0f-a88c-b78b9b31fff3%28de.slisson.mps.richtext.structure%29%2F2557074442922392300) so that you can
reference any node in the ^^com.mbeddr.doc^^ language: [@child](http://127.0.0.1:63320/node?ref=r%3Acd485f95-5a84-4e95-8a53-480ef712b00a%28com.mbeddr.mpsutil.bldoc.structure%29%2F5358654548920859832) and
[@root](http://127.0.0.1:63320/node?ref=r%3Acd485f95-5a84-4e95-8a53-480ef712b00a%28com.mbeddr.mpsutil.bldoc.structure%29%2F5358654548920954071)
for referencing child nodes and named nodes, respectively.

## Richstring

> ^^com.mbeddr.mpsutil.richstring^^

This Base Language extension simplifies the usage of variables and [Java String#format](https://docs.oracle.com/javase/7/docs/api/java/util/Formatter.html) inside BaseLanguage Strings. Add the language com.mbeddr.mpsutil.richstring to your model.

The following example shows referencing a simple variable, embedding an expression inside a string, and the equivalent of calling `#!java String.format()`:

![example: richstring](images/richstring_example.png)

## SModule

> ^^com.mbeddr.mpsutil.smodule^^

This language adds new operations to modules:

- **Add dependencies** adds dependencies to one or more models to the module.
- **Add DevKits** adds devkits to the modules.
- **Add languages to the module** adds used languages to the module.
- **Add model** adds a new model with the specified name to the module. Specify the repository as the second
  parameter. If you press enter after the name, you can add devkits, references to models, and languages to the newly created
  model. In the inspector, the storage type must be declared: per root or single file persistence.
- **Add solution**: adds a new solution to the module. The virtual package can be specified (subfolder).
