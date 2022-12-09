---
title: Documentation aspect
tags:
- aspect
---

# Generator aspect

This aspect is contributed by the language ^^com.mbeddr.doc^^ in {{ mbeddr() }}. It allows to define a documentation node which can be exported to xhtml, latex
and markdown. New targets can be implemented easily. When you invoke the intention *Add Reference to
Documented Concept* while defining a new section as part of a chapter, the documention for this concept will be shown
in the *Documentation* tool at the bottom part of the screen. The documentation for the language is provided as a PDF: [The mbeddr Documentation Language](http://mbeddr.com/files/documentationdocumentation.pdf)

!!! question "How do you export the documentation?"

    Click *make* or *rebuild* in the menu of the model that contains the documentation. A new folder *doc_gen* will get generated.

!!! question "Should you write documentation? Is this aspect necessary?"

    Yes, code is not always self documenting. You have the following possibilities for writing documention: 

    - JavaDoc[^1] 
    - the intention [Document](http://127.0.0.1:63320/node?ref=r%3Ae5a8b5c7-85b5-4d59-9e4e-850a142e2560%28jetbrains.mps.lang.structure.intentions%29%2F7862711839424636005)
    - ^^com.mbeddr.documentation^^
    - ^^com.mbeddr.doc^^
    - the short description property of concepts
    - [DocumentedNodeAnnotation](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590292%28jetbrains.mps.lang.structure.structure%29%2F7862711839422615209)

??? question "How can you show the documentation of a concept in the documentation tool?"

    Take a look at the doc.aspect project in {{ mbeddr() }}. There is a node attribute that can be attached on pieces of a document to bind the document to some concept or node. There is also an example project which demonstrates the usage.

    {{ answer_by('szabta89') }}

!!! question "Is there a way to resolve references to embedded images (screenshots) across different documents?"

    This is enabled by adding the document to the *depends on* section.

[^1]:[Use javadoc liberally](http://www.javapractices.com/topic/TopicAction.do?Id=60)