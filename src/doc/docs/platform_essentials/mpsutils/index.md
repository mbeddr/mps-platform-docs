---
tags:
- mbeddr
alias: mps_utils
---

# Mbeddr MPS Utilities

This documentation gives an introduction to the subproject *com.mbeddr.mpsutil* of {{ mbeddr() }}.

## Incremental Computation

> ^^com.mbeddr.mpsutil.incrementalcomputation^^

The language provides a single interface [IncrementallyComputedValueHolder](http://127.0.0.1:63320/node?ref=r%3A644d327d-a4dc-4e49-b137-5aa4630bcd32%28com.mbeddr.mpsutil.incrementalcomputation.structure%29%2F3315277234172465334) that can be implemented to support values that are automatically
recomputed when a dependent value changes. The methods are documented in the behavior aspect. If a full model should be
derived from an existing model, you have to use [shadow models](https://jetbrains.github.io/MPS-extensions/extensions/other/shadow-models/)
from {{ mps_extensions() }}.

## Interpreter

> ^^com.mbeddr.mpsutil.interpreter^^

The interpreter is described on the [interpreter](interpreter.md) page.

## Stubs

Stub models for the following Java libraries exist:

- [Mockito](https://site.mockito.org/): a framework for unit tests
- [Open CSV](https://opencsv.sourceforge.net/)jav: a CSV (comma-separated values) parser library
- [Batik](https://xmlgraphics.apache.org/batik/): a toolkit for applications that want to use images in the Scalable Vector Graphics (SVG) format for various purposes, such as display, generation, or manipulation
- **XML**: the following jars are included:
    - [XML Commons External Components XML APIs Extensions](https://mvnrepository.com/artifact/xml-apis/xml-apis-ext)
    - [XML Commons Resolver Component](https://mvnrepository.com/artifact/xml-resolver/xml-resolver)
    - [Xerces2 J](https://mvnrepository.com/artifact/xerces/xercesImpl)

!!! warning "The included versions might be old."
