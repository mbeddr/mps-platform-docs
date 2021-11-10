!!! question "What is this aspect used for?"

    This aspect is part of com.mbeddr.doc. It allows to define Documentation nodes that can be exported to xhtml, latex
    and markdown at the moment. New targets can be implemented easily. When you invoke the intention "Add Reference to
    Documented Concept" when defining a new section as part of a chapter, the documention for this concept will be shown
    in the Documentation tool at the bottom part of the screen.

!!! question "How do I export the documentation?"

    Click make or rebuild model that contains the documentation, a new folder /doc_gen is generated.

!!! question "Should I write documentation? Do I need to use this aspect."

    Yes, code is not always self documenting. You have the following possibilities for writing documention: 

    - JavaDoc[^1] 
    - the intention [Document](http://127.0.0.1:63320/node?ref=r%3Ae5a8b5c7-85b5-4d59-9e4e-850a142e2560%28jetbrains.mps.lang.structure.intentions%29%2F7862711839424636005)
    - com.mbeddr.documentation
    - com.mbeddr.doc
    - the short description property of concepts
    - [DocumentedNodeAnnotation](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590292%28jetbrains.mps.lang.structure.structure%29%2F7862711839422615209)

[^1]:[Use javadoc liberally](http://www.javapractices.com/topic/TopicAction.do?Id=60)