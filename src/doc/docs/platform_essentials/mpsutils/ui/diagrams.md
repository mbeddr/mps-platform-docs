### Diagrams

#### Concept diagram

> ^^com.mbeddr.mpsutil.conceptdiagram^^

![example:conceptdiagram](conceptdiagram_example.png)

Create a new root node of type [ConceptDiagram](http://127.0.0.1:63320/node?ref=r%3A40ee9130-2844-4f59-96e6-d12b358ca46c%28com.mbeddr.mpsutil.conceptdiagram.structure%29%2F2634829965774842138). The editor should now contain an empty editor. Nodes can be dragged
from the *Diagram Palette* to the diagram. If nodes from other languages are needed, add the language to the *languages*
section.

#### Dependencies diagram

> ^^com.mbeddr.mpsutil.dependenciesdiagram^^

This language contains a concept [DependenciesDiagram](http://127.0.0.1:63320/node?ref=r%3Aa1fbbb29-6fd2-49ce-b0b8-414a40e14ddc%28com.mbeddr.mpsutil.dependenciesdiagram.structure%29%2F7129450248256615870)

Drag a model or module reference from the diagram palette to the diagram. Dependencies to other models/modules will be automatically added. The dependencies is visualized by the line between the two boxes, and its label is named after the scope of the dependency (e.g. *uses* if the language is imported).

![example: dependency diagram](dependencydiagram_example.png)