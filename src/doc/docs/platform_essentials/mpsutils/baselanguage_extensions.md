# Baselanguage Extensions

## BLDoc

> ^^com.mbeddr.mpsutil.bldoc^^

This language can be used to attach documentation via the intention `Attach Documentation` to any node. The rich text language
provides the concept `Text` for writing the documentation. Two interfaces implement [IWord](http://127.0.0.1:63320/node?ref=r%3Aca2ab6bb-f6e7-4c0f-a88c-b78b9b31fff3%28de.slisson.mps.richtext.structure%29%2F2557074442922392300) so that any
node can be referenced in the ^^com.mbeddr.doc^^ language: [@child](http://127.0.0.1:63320/node?ref=r%3Acd485f95-5a84-4e95-8a53-480ef712b00a%28com.mbeddr.mpsutil.bldoc.structure%29%2F5358654548920859832) and
[@root](http://127.0.0.1:63320/node?ref=r%3Acd485f95-5a84-4e95-8a53-480ef712b00a%28com.mbeddr.mpsutil.bldoc.structure%29%2F5358654548920954071)
for referencing any child nodes and named nodes respectively.

## Richstring

> ^^com.mbeddr.mpsutil.richstring^^

This BaseLanguage extension simplifies the usage of variables and [Java String#format](https://docs.oracle.com/javase/7/docs/api/java/util/Formatter.html) inside BaseLanguage Strings. Just add the language com.mbeddr.mpsutil.richstring to your model.

The following example shows referencing a simple variable, embedding an expression inside a string, and the equivalent of calling `#!java String.format()`:

![example: richstring](richstring_example.png)

## SModule

> ^^com.mbeddr.mpsutil.smodule^^

This language adds new operations to modules:

- **add dependencies**: adds dependencies to one or more models to the module
- **add DevKits**: adds devkits to the modules
- **add languages to the module**: adds used languages to the module
- **add model**: adds a new model with the specified name to the module. The repository has to be specified as the second
  parameter. If you press enter after the name, you can also add devkits, references to models, and languages to the newly created
  model. In the inspector, the storage type has to be declared: it can be per root or single file persistence.
- **add solution**: adds a new solution to the module. The virtual package can be specified (subfolder).
