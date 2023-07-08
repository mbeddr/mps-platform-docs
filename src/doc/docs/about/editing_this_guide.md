---
tags:
- guide
---

# Editing This Guide

This guide uses [MkDocs](https://www.mkdocs.org/) + [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).
The markdown version is [Python-Markdown](https://python-markdown.github.io/). [This page](https://squidfunk.github.io/mkdocs-material/reference/) contains the reference for the material theme.
Install extra MkDocs plugins in build.gradle + mkdocs.yml.

If you are using IntelliJ for editing, it is recommended to install the plugin [Grazie Professional](https://plugins.jetbrains.com/plugin/16136-grazie-professional) for spell checking. 

## Editing

- The first header should be `#`.
- Inserted images with Markdown, not HTML: `![description](url){width="600px"}`. Set the with to 600px or 300px, depending on how big or small the image is
- [footnotes syntax](https://squidfunk.github.io/mkdocs-material/reference/footnotes/)
- The `target=_blank` attribute and an icon for external links get automatically added to links.

The following symbols must be escaped:

  - &#36; is `&#36;` because it collides with inline Latex blocks.

Trees can be created with the terminal command `tree`. It supports the `-I` parameter for excluding folders.

## Extensions

Besides the Material extensions, the project used the following [Pymdown](https://facelessuser.github.io/pymdown-extensions/) extensions:

- [pymdownx.betterem](https://facelessuser.github.io/pymdown-extensions/extensions/betterem/): different emphasis handling
- [pymdownx.inlinehilite](https://facelessuser.github.io/pymdown-extensions/extensions/inlinehilite/): inline code highlighting; example: #!js var test = 0;
- [pymdownx.magiclink](https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/): linkafies URLs
- [pymdownx.smartsymbols](https://facelessuser.github.io/pymdown-extensions/extensions/smartsymbols/): inserts commonly used Unicode characters via ASCII representations.
- [pymdownx.superfences](https://facelessuser.github.io/pymdown-extensions/extensions/superfences/): extension to Markdown fences
- [pymdownx.details](https://facelessuser.github.io/pymdown-extensions/extensions/details/): collapsible elements
- [pymdownx.highlight](https://facelessuser.github.io/pymdown-extensions/extensions/highlight/)
- [pymdownx.snippets](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/): include other Markdown or HTML snippets into the current Markdown file
- [pymdownx.keys](https://facelessuser.github.io/pymdown-extensions/extensions/keys/): simplifies inserting key inputs; example: ++ctrl+alt+delete++
- [pymdownx.caret](https://facelessuser.github.io/pymdown-extensions/extensions/caret/): superscript text via caret
- [pymdownx.mark](https://facelessuser.github.io/pymdown-extensions/extensions/mark/): enables marking words
- [pymdownx.tilde](https://facelessuser.github.io/pymdown-extensions/extensions/tilde/): subscript text via tilde
- [pymdownx.emoji](https://facelessuser.github.io/pymdown-extensions/extensions/emoji/): support for custom Emojis. Some example icons are in [MPS Icons](icons.md).
- [pymdownx.tasklist](https://facelessuser.github.io/pymdown-extensions/extensions/tasklist/): support for lists with checkboxes
- [mk_in_html](https://python-markdown.github.io/extensions/md_in_html/): support for markdown in HTML
- [pymdownx.magiclink](https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/): additional link related features 
- [mdx-spanner](https://pypi.org/project/mdx-spanner): enables row and column spanning in Markdown tables

## Macros

The plugin [mkdocs-macros-plugin](https://mkdocs-macros-plugin.readthedocs.io/en/latest/pages/) is activated.
You can add variables to the extra section of mkdocs.yml (example: `mps_latest`) and use the available macros:

  - contribution_by(GitHub_username)
  - question_by(GitHub_username)
  - answer_by(GitHub_username)
  - mps_url(identifier)
  - image_popup()
  - iets3()
  - mbeddr()
  - mbeddr_platform()
  - mps_extensions()
  - mps
  
  Look through main.py to see how they are implemented.

The identifier can start with one of the following special identifiers:

  - @openapi
  - @mps
  - @baselang
  - @mpsutil
  - @itemis
  - @mbeddr
  - @iets3

The special identifiers get translated to the corresponding package names. Only the last part of the identifier has to
be the correct name. The identifier can reference classes, interfaces, concepts, and interface declarations in Base Language,
MPS-extensions, mbeddr, and iets3. The rest of the identifier only helps to find the correct node and doesn't have to be
exact.

Example: `@mps.ClassConcept` will find `jetbrains.mps.baseLanguage.structure.ClassConcept`. When the wrong node is
selected, enter more parts of the full qualified name of the node.

## Diagrams

[Kroki](http://kroki.io) enables support for diagrams ([examples](https://kroki.io/examples.html)). It supports the following diagrams:

- [BlockDiag](http://blockdiag.com/en/)
  - [BlockDiag](http://blockdiag.com/en/blockdiag/index.html) (simple block diagrams)
  - [SeqDiag](http://blockdiag.com/en/seqdiag/) (simple sequence diagrams)
  - [ActDiag](http://blockdiag.com/en/actdiag/index.html) (simple activity diagrams)
  - [NwDiag](http://blockdiag.com/en/nwdiag/index.html) (simple network diagrams)
  - [PacketDiag](http://blockdiag.com/en/nwdiag/packetdiag-examples.html) (packet header diagrams)
  - [RackDiag](http://blockdiag.com/en/nwdiag/rackdiag-examples.html) (rack diagrams)
- [BPMN](https://bpmn.io/)
- [Bytefield](https://bytefield-svg.deepsymmetry.org/bytefield-svg/1.6.1/intro.html)
- [C4 (with PlantUML)](https://github.com/plantuml-stdlib/C4-PlantUML)
- [Ditaa](http://ditaa.sourceforge.net/)
- [Erd](https://github.com/BurntSushi/erd)
- [Excalidraw](https://github.com/excalidraw/excalidraw)
- [GraphViz](https://www.graphviz.org/)
- [Mermaid](https://mermaid-js.github.io/mermaid/#/)
- [Nomnoml](https://www.nomnoml.com/)
- [Pikchr](https://pikchr.org/home/doc/trunk/homepage.md)
- [PlantUML](https://plantuml.com/)
- [Structurizr](https://github.com/structurizr/dsl)
- [SvgBob](https://ivanceras.github.io/svgbob-editor/)
- [UMLet](https://www.umlet.com/)
- [Vega](https://vega.github.io/vega/)
- [Vega-Lite](https://vega.github.io/vega-lite/)
- [WaveDrom](https://wavedrom.com/tutorial.html)

They can be embedded by creating a code block and the text `kroki-[diagramtype]`.

The following sections contain ideas for diagrams.

### [blockdiag](http://blockdiag.com/en/blockdiag/index.html)

#### Diagram 1

=== "Diagram"

    ```kroki-blockdiag
    blockdiag {
    orientation = portrait
    
        R -> A
        R -> B
           B -> C
                C -> E
           B -> D
                D -> F
                     F -> E
                D -> G
           A <- C    
           B -> D
    
    }
    ```

=== "Code"

    ```
    blockdiag {
    orientation = portrait
    
        R -> A
        R -> B
           B -> C
                C -> E
           B -> D
                D -> F
                     F -> E
                D -> G
           A <- C    
           B -> D
    
    }
    ```

#### Diagram 2

=== "Diagram"

    ```kroki-blockdiag
    blockdiag {   
        default_node_color = 'yellow' 
    
        if [shape="roundedbox", color='white']
        condition [numbered = 1, shape="roundedbox", description="the condition"]
        true_block [numbered = 1, shape="roundedbox"]
        false_block [numbered = 0-1, shape="roundedbox"]
        
        if -> condition
        if -> true_block
        if -> false_block
    }
    ```
=== "Code"

    ```
    blockdiag {   
        default_node_color = 'yellow' 
    
        if [shape="roundedbox", color='white']
        condition [numbered = 1, shape="roundedbox", description="the condition"]
        true_block [numbered = 1, shape="roundedbox"]
        false_block [numbered = 0-1, shape="roundedbox"]
        
        if -> condition
        if -> true_block
        if -> false_block
    }
    ```


### [SeqDiag](http://blockdiag.com/en/seqdiag/index.html)

=== "Diagram"

    ```kroki-seqdiag
    seqdiag {
        MPS -> Clipboard [label = "Copy Node Reference as URL"]
        Clipboard -> Browser [label = "Paste URL"]
        http_server [label="MPS HTTP Server"]
        Browser -> http_server [label = "Send request"]
        http_server -> MPS [label = "Open Node"]
    }
    ```

=== "Code"

    ```
    seqdiag {
        MPS -> Clipboard [label = "Copy Node Reference as URL"]
        Clipboard -> Browser [label = "Paste URL"]
        http_server [label="MPS HTTP Server"]
        Browser -> http_server [label = "Send request"]
        http_server -> MPS [label = "Open Node"]
    }
    ```

### [ActDiag](http://blockdiag.com/en/actdiag/index.html)

=== "Diagram"

    ```kroki-actdiag
    actdiag {
      createConcept -> createEditor -> createNodes
    
      lane language {
        label = "Language"
        createConcept [label = "Create concept"]
        createEditor [label = "Create editor"]
      }
    
      lane solution {
        label ="Solution"
        createNodes [label = "Create nodes"]
      }
    }
    ```

=== "Code"

    ```
    actdiag {
      createConcept -> createEditor -> createNodes
    
      lane language {
        label = "Language"
        createConcept [label = "Create concept"]
        createEditor [label = "Create editor"]
      }
    
      lane solution {
        label ="Solution"
        createNodes [label = "Create nodes"]
      }
    }
    ```

### [Graphviz](https://graphviz.org/gallery/)

=== "Diagram"

    ```kroki-graphviz
    digraph finite_state_machine {
        rankdir=LR;
            planning -> analysis
            analysis -> design
            design -> implementation
        ti [label="testing & integration"]
            implementation -> ti
            ti -> maintenance
            maintenance -> planning
    }
    ```

=== "Code"

    ```
    digraph finite_state_machine {
        rankdir=LR;
            planning -> analysis
            analysis -> design
            design -> implementation
        ti [label="testing & integration"]
            implementation -> ti
            ti -> maintenance
            maintenance -> planning
    }
    ```

### Ditaa

=== "Diagram"

    ```kroki-ditaa
          +--------+
          |        |
          |  User  |
          |        |
          +--------+
              ^
      request |
              v
      +-------------+
      |             |
      |    Kroki    |
      |             |---+
      +-------------+   |
           ^  ^         | inflate
           |  |         |
           v  +---------+
      +-------------+
      |             |
      |    Ditaa    |
      |             |----+
      +-------------+    |
                 ^       | process
                 |       |
                 +-------+
    
    ```

=== "Code"

    ```
          +--------+
          |        |
          |  User  |
          |        |
          +--------+
              ^
      request |
              v
      +-------------+
      |             |
      |    Kroki    |
      |             |---+
      +-------------+   |
           ^  ^         | inflate
           |  |         |
           v  +---------+
      +-------------+
      |             |
      |    Ditaa    |
      |             |----+
      +-------------+    |
                 ^       | process
                 |       |
                 +-------+
    
    ```

### [mermaid.js](https://mermaid-js.github.io/mermaid/#/)

=== "Diagram"

    ```kroki-mermaid
    graph TD;
        A-->B;
        A-->C;
        B-->D;
        C-->D;
    ```

=== "Code"

    ```
    graph TD;
        A-->B;
        A-->C;
        B-->D;
        C-->D;
    ```

### [nomnoml](https://nomnoml.com)

=== "Diagram"

    ```kroki-nomnoml
    [Pirate|eyeCount: Int|raid();pillage()|
      [beard]--[parrot]
      [beard]-:>[foul mouth]
    ]
    
    [<table>mischief | bawl | sing || yell | drink]
    
    [<abstract>Marauder]<:--[Pirate]
    [Pirate]- 0..7[mischief]
    [jollyness]->[Pirate]
    [jollyness]->[rum]
    [jollyness]->[singing]
    [Pirate]-> *[rum|tastiness: Int|swig()]
    [Pirate]->[singing]
    [singing]<->[rum]
    
    [<start>st]->[<state>plunder]
    [plunder]->[<choice>more loot]
    [more loot]->[st]
    [more loot] no ->[<end>e]
    
    [<actor>Sailor] - [<usecase>shiver me;timbers]
    ```
=== "Code"

    ```
    [Pirate|eyeCount: Int|raid();pillage()|
      [beard]--[parrot]
      [beard]-:>[foul mouth]
    ]
    
    [<table>mischief | bawl | sing || yell | drink]
    
    [<abstract>Marauder]<:--[Pirate]
    [Pirate]- 0..7[mischief]
    [jollyness]->[Pirate]
    [jollyness]->[rum]
    [jollyness]->[singing]
    [Pirate]-> *[rum|tastiness: Int|swig()]
    [Pirate]->[singing]
    [singing]<->[rum]
    
    [<start>st]->[<state>plunder]
    [plunder]->[<choice>more loot]
    [more loot]->[st]
    [more loot] no ->[<end>e]
    
    [<actor>Sailor] - [<usecase>shiver me;timbers]
    ```

### [plantUML](https://plantuml.com/de/)

#### Diagram 1

=== "Diagram"

    ```kroki-plantuml
    @startuml
    left to right direction
    skinparam packageStyle rectangle
    skinparam monochrome true
    actor customer
    actor clerk
    rectangle checkout {
      customer -- (checkout)
      (checkout) .> (payment) : include
      (help) .> (checkout) : extends
      (checkout) -- clerk
    }
    @enduml
    ```

=== "Code"

    ```
    @startuml
    left to right direction
    skinparam packageStyle rectangle
    skinparam monochrome true
    actor customer
    actor clerk
    rectangle checkout {
      customer -- (checkout)
      (checkout) .> (payment) : include
      (help) .> (checkout) : extends
      (checkout) -- clerk
    }
    @enduml
    ```

#### Diagram 2

=== "Diagram"

    ```kroki-plantuml
    @startwbs
    skinparam monochrome true
    * Business Process Modelling WBS
    ** Launch the project
    *** Complete Stakeholder Research
    *** Initial Implementation Plan
    ** Design phase
    *** Model of AsIs Processes Completed
    **** Model of AsIs Processes Completed1
    **** Model of AsIs Processes Completed2
    *** Measure AsIs performance metrics
    *** Identify Quick Wins
    ** Complete innovate phase
    @endwbs
    ```

=== "Code"

    ```
    @startwbs
    skinparam monochrome true
    * Business Process Modelling WBS
    ** Launch the project
    *** Complete Stakeholder Research
    *** Initial Implementation Plan
    ** Design phase
    *** Model of AsIs Processes Completed
    **** Model of AsIs Processes Completed1
    **** Model of AsIs Processes Completed2
    *** Measure AsIs performance metrics
    *** Identify Quick Wins
    ** Complete innovate phase
    @endwbs
    ```

### [BPMN](https://camunda.com/de/bpmn/bpmn-2-0-symbol-reference/)

=== "Diagram"

    ```kroki-bpmn
    <?xml version="1.0" encoding="UTF-8"?>
    <semantic:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:semantic="http://www.omg.org/spec/BPMN/20100524/MODEL" id="_1275940932088" targetNamespace="http://www.trisotech.com/definitions/_1275940932088" exporter="Camunda Modeler" exporterVersion="1.16.0">
      <semantic:message id="_1275940932310" />
      <semantic:message id="_1275940932433" />
      <semantic:process id="_6-1" isExecutable="false">
        <semantic:laneSet id="ls_6-438">
          <semantic:lane id="_6-650" name="clerk">
            <semantic:flowNodeRef>OrderReceivedEvent</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-652</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-674</semantic:flowNodeRef>
            <semantic:flowNodeRef>CalmCustomerTask</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-446" name="pizza chef">
            <semantic:flowNodeRef>_6-463</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-448" name="delivery boy">
            <semantic:flowNodeRef>_6-514</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-565</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-616</semantic:flowNodeRef>
          </semantic:lane>
        </semantic:laneSet>
        <semantic:startEvent id="OrderReceivedEvent" name="Order received">
          <semantic:outgoing>_6-630</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932310" />
        </semantic:startEvent>
        <semantic:parallelGateway id="_6-652" name="">
          <semantic:incoming>_6-630</semantic:incoming>
          <semantic:outgoing>_6-691</semantic:outgoing>
          <semantic:outgoing>_6-693</semantic:outgoing>
        </semantic:parallelGateway>
        <semantic:intermediateCatchEvent id="_6-674" name="„where is my pizza?“">
          <semantic:incoming>_6-691</semantic:incoming>
          <semantic:incoming>_6-746</semantic:incoming>
          <semantic:outgoing>_6-748</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932433" />
        </semantic:intermediateCatchEvent>
        <semantic:task id="CalmCustomerTask" name="Calm customer">
          <semantic:incoming>_6-748</semantic:incoming>
          <semantic:outgoing>_6-746</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-463" name="Bake the pizza">
          <semantic:incoming>_6-693</semantic:incoming>
          <semantic:outgoing>_6-632</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-514" name="Deliver the pizza">
          <semantic:incoming>_6-632</semantic:incoming>
          <semantic:outgoing>_6-634</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-565" name="Receive payment">
          <semantic:incoming>_6-634</semantic:incoming>
          <semantic:outgoing>_6-636</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-616" name="">
          <semantic:incoming>_6-636</semantic:incoming>
          <semantic:terminateEventDefinition />
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-630" name="" sourceRef="OrderReceivedEvent" targetRef="_6-652" />
        <semantic:sequenceFlow id="_6-632" name="" sourceRef="_6-463" targetRef="_6-514" />
        <semantic:sequenceFlow id="_6-634" name="" sourceRef="_6-514" targetRef="_6-565" />
        <semantic:sequenceFlow id="_6-636" name="" sourceRef="_6-565" targetRef="_6-616" />
        <semantic:sequenceFlow id="_6-691" name="" sourceRef="_6-652" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-693" name="" sourceRef="_6-652" targetRef="_6-463" />
        <semantic:sequenceFlow id="_6-746" name="" sourceRef="CalmCustomerTask" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-748" name="" sourceRef="_6-674" targetRef="CalmCustomerTask" />
      </semantic:process>
      <semantic:message id="_1275940932198" />
      <semantic:process id="_6-2" isExecutable="false">
        <semantic:startEvent id="_6-61" name="Hungry for pizza">
          <semantic:outgoing>_6-125</semantic:outgoing>
        </semantic:startEvent>
        <semantic:task id="SelectAPizzaTask" name="Select a pizza">
          <semantic:incoming>_6-125</semantic:incoming>
          <semantic:outgoing>_6-178</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-127" name="Order a pizza">
          <semantic:incoming>_6-178</semantic:incoming>
          <semantic:outgoing>_6-420</semantic:outgoing>
        </semantic:task>
        <semantic:eventBasedGateway id="_6-180" name="">
          <semantic:incoming>_6-420</semantic:incoming>
          <semantic:incoming>_6-430</semantic:incoming>
          <semantic:outgoing>_6-422</semantic:outgoing>
          <semantic:outgoing>_6-424</semantic:outgoing>
        </semantic:eventBasedGateway>
        <semantic:intermediateCatchEvent id="_6-202" name="pizza received">
          <semantic:incoming>_6-422</semantic:incoming>
          <semantic:outgoing>_6-428</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932198" />
        </semantic:intermediateCatchEvent>
        <semantic:intermediateCatchEvent id="_6-219" name="60 minutes">
          <semantic:incoming>_6-424</semantic:incoming>
          <semantic:outgoing>_6-426</semantic:outgoing>
          <semantic:timerEventDefinition>
            <semantic:timeDate />
          </semantic:timerEventDefinition>
        </semantic:intermediateCatchEvent>
        <semantic:task id="_6-236" name="Ask for the pizza">
          <semantic:incoming>_6-426</semantic:incoming>
          <semantic:outgoing>_6-430</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-304" name="Pay the pizza">
          <semantic:incoming>_6-428</semantic:incoming>
          <semantic:outgoing>_6-434</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-355" name="Eat the pizza">
          <semantic:incoming>_6-434</semantic:incoming>
          <semantic:outgoing>_6-436</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-406" name="Hunger satisfied">
          <semantic:incoming>_6-436</semantic:incoming>
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-125" name="" sourceRef="_6-61" targetRef="SelectAPizzaTask" />
        <semantic:sequenceFlow id="_6-178" name="" sourceRef="SelectAPizzaTask" targetRef="_6-127" />
        <semantic:sequenceFlow id="_6-420" name="" sourceRef="_6-127" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-422" name="" sourceRef="_6-180" targetRef="_6-202" />
        <semantic:sequenceFlow id="_6-424" name="" sourceRef="_6-180" targetRef="_6-219" />
        <semantic:sequenceFlow id="_6-426" name="" sourceRef="_6-219" targetRef="_6-236" />
        <semantic:sequenceFlow id="_6-428" name="" sourceRef="_6-202" targetRef="_6-304" />
        <semantic:sequenceFlow id="_6-430" name="" sourceRef="_6-236" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-434" name="" sourceRef="_6-304" targetRef="_6-355" />
        <semantic:sequenceFlow id="_6-436" name="" sourceRef="_6-355" targetRef="_6-406" />
      </semantic:process>
      <semantic:collaboration id="C1275940932557">
        <semantic:participant id="_6-53" name="Pizza Customer" processRef="_6-2" />
        <semantic:participant id="_6-438" name="Pizza vendor" processRef="_6-1" />
        <semantic:messageFlow id="_6-638" name="pizza order" sourceRef="_6-127" targetRef="OrderReceivedEvent" />
        <semantic:messageFlow id="_6-642" name="" sourceRef="_6-236" targetRef="_6-674" />
        <semantic:messageFlow id="_6-646" name="receipt" sourceRef="_6-565" targetRef="_6-304" />
        <semantic:messageFlow id="_6-648" name="money" sourceRef="_6-304" targetRef="_6-565" />
        <semantic:messageFlow id="_6-640" name="pizza" sourceRef="_6-514" targetRef="_6-202" />
        <semantic:messageFlow id="_6-750" name="" sourceRef="CalmCustomerTask" targetRef="_6-236" />
      </semantic:collaboration>
      <bpmndi:BPMNDiagram id="Trisotech.Visio-_6" name="Untitled Diagram" documentation="" resolution="96.00000267028808">
        <bpmndi:BPMNPlane bpmnElement="C1275940932557">
          <bpmndi:BPMNShape id="Trisotech.Visio__6-53" bpmnElement="_6-53" isHorizontal="true">
            <dc:Bounds x="12" y="12" width="1044" height="294" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6-438" bpmnElement="_6-438" isHorizontal="true">
            <dc:Bounds x="12" y="372" width="905" height="337" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-650" bpmnElement="_6-650" isHorizontal="true">
            <dc:Bounds x="42" y="372" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-446" bpmnElement="_6-446" isHorizontal="true">
            <dc:Bounds x="42" y="486" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-448" bpmnElement="_6-448" isHorizontal="true">
            <dc:Bounds x="42" y="600" width="875" height="109" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_OrderReceivedEvent" bpmnElement="OrderReceivedEvent">
            <dc:Bounds x="79" y="405" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-652" bpmnElement="_6-652">
            <dc:Bounds x="140" y="399" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-674" bpmnElement="_6-674">
            <dc:Bounds x="218" y="404" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_CalmCustomerTask" bpmnElement="CalmCustomerTask">
            <dc:Bounds x="286" y="386" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-463" bpmnElement="_6-463">
            <dc:Bounds x="252" y="521" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-514" bpmnElement="_6-514">
            <dc:Bounds x="464" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-565" bpmnElement="_6-565">
            <dc:Bounds x="603" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-616" bpmnElement="_6-616">
            <dc:Bounds x="722" y="647" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-61" bpmnElement="_6-61">
            <dc:Bounds x="66" y="96" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-74" bpmnElement="SelectAPizzaTask">
            <dc:Bounds x="145" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-127" bpmnElement="_6-127">
            <dc:Bounds x="265" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-180" bpmnElement="_6-180">
            <dc:Bounds x="378" y="90" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-202" bpmnElement="_6-202">
            <dc:Bounds x="647" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-219" bpmnElement="_6-219">
            <dc:Bounds x="448" y="184" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-236" bpmnElement="_6-236">
            <dc:Bounds x="517" y="166" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-304" bpmnElement="_6-304">
            <dc:Bounds x="726" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-355" bpmnElement="_6-355">
            <dc:Bounds x="834" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-406" bpmnElement="_6-406">
            <dc:Bounds x="956" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-640" bpmnElement="_6-640">
            <di:waypoint x="506" y="629" />
            <di:waypoint x="506" y="384" />
            <di:waypoint x="663" y="384" />
            <di:waypoint x="663" y="127" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-630" bpmnElement="_6-630">
            <di:waypoint x="109" y="420" />
            <di:waypoint x="140" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-691" bpmnElement="_6-691">
            <di:waypoint x="182" y="420" />
            <di:waypoint x="200" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-648" bpmnElement="_6-648">
            <di:waypoint x="754" y="145" />
            <di:waypoint x="754" y="408" />
            <di:waypoint x="630" y="408" />
            <di:waypoint x="631" y="629" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-422" bpmnElement="_6-422">
            <di:waypoint x="420" y="111" />
            <di:waypoint x="438" y="111" />
            <di:waypoint x="647" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-646" bpmnElement="_6-646" messageVisibleKind="non_initiating">
            <di:waypoint x="658" y="629" />
            <di:waypoint x="658" y="432" />
            <di:waypoint x="782" y="432" />
            <di:waypoint x="782" y="145" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-428" bpmnElement="_6-428">
            <di:waypoint x="679" y="111" />
            <di:waypoint x="726" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-748" bpmnElement="_6-748">
            <di:waypoint x="250" y="420" />
            <di:waypoint x="268" y="420" />
            <di:waypoint x="286" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-420" bpmnElement="_6-420">
            <di:waypoint x="348" y="111" />
            <di:waypoint x="366" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-636" bpmnElement="_6-636">
            <di:waypoint x="686" y="663" />
            <di:waypoint x="704" y="663" />
            <di:waypoint x="722" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-750" bpmnElement="_6-750">
            <di:waypoint x="328" y="386" />
            <di:waypoint x="328" y="348" />
            <di:waypoint x="572" y="348" />
            <di:waypoint x="572" y="234" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-436" bpmnElement="_6-436">
            <di:waypoint x="918" y="111" />
            <di:waypoint x="936" y="111" />
            <di:waypoint x="956" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-632" bpmnElement="_6-632">
            <di:waypoint x="335" y="555" />
            <di:waypoint x="353" y="555" />
            <di:waypoint x="353" y="663" />
            <di:waypoint x="464" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-634" bpmnElement="_6-634">
            <di:waypoint x="548" y="663" />
            <di:waypoint x="603" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-125" bpmnElement="_6-125">
            <di:waypoint x="96" y="111" />
            <di:waypoint x="114" y="111" />
            <di:waypoint x="145" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-430" bpmnElement="_6-430">
            <di:waypoint x="600" y="200" />
            <di:waypoint x="618" y="200" />
            <di:waypoint x="618" y="252" />
            <di:waypoint x="576" y="252" />
            <di:waypoint x="549" y="252" />
            <di:waypoint x="360" y="252" />
            <di:waypoint x="360" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-642" bpmnElement="_6-642">
            <di:waypoint x="545" y="234" />
            <di:waypoint x="545" y="324" />
            <di:waypoint x="234" y="324" />
            <di:waypoint x="234" y="404" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-424" bpmnElement="_6-424">
            <di:waypoint x="399" y="132" />
            <di:waypoint x="399" y="200" />
            <di:waypoint x="448" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-638" bpmnElement="_6-638">
            <di:waypoint x="306" y="145" />
            <di:waypoint x="306" y="252" />
            <di:waypoint x="94" y="252" />
            <di:waypoint x="94" y="405" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-426" bpmnElement="_6-426">
            <di:waypoint x="480" y="200" />
            <di:waypoint x="498" y="200" />
            <di:waypoint x="517" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-693" bpmnElement="_6-693">
            <di:waypoint x="161" y="441" />
            <di:waypoint x="161" y="556" />
            <di:waypoint x="252" y="555" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-178" bpmnElement="_6-178">
            <di:waypoint x="228" y="111" />
            <di:waypoint x="265" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-746" bpmnElement="_6-746">
            <di:waypoint x="370" y="420" />
            <di:waypoint x="386" y="420" />
            <di:waypoint x="386" y="474" />
            <di:waypoint x="191" y="474" />
            <di:waypoint x="191" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-434" bpmnElement="_6-434">
            <di:waypoint x="810" y="111" />
            <di:waypoint x="834" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
      </bpmndi:BPMNDiagram>
    </semantic:definitions>
    ```

=== "Code"

    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <semantic:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:semantic="http://www.omg.org/spec/BPMN/20100524/MODEL" id="_1275940932088" targetNamespace="http://www.trisotech.com/definitions/_1275940932088" exporter="Camunda Modeler" exporterVersion="1.16.0">
      <semantic:message id="_1275940932310" />
      <semantic:message id="_1275940932433" />
      <semantic:process id="_6-1" isExecutable="false">
        <semantic:laneSet id="ls_6-438">
          <semantic:lane id="_6-650" name="clerk">
            <semantic:flowNodeRef>OrderReceivedEvent</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-652</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-674</semantic:flowNodeRef>
            <semantic:flowNodeRef>CalmCustomerTask</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-446" name="pizza chef">
            <semantic:flowNodeRef>_6-463</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-448" name="delivery boy">
            <semantic:flowNodeRef>_6-514</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-565</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-616</semantic:flowNodeRef>
          </semantic:lane>
        </semantic:laneSet>
        <semantic:startEvent id="OrderReceivedEvent" name="Order received">
          <semantic:outgoing>_6-630</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932310" />
        </semantic:startEvent>
        <semantic:parallelGateway id="_6-652" name="">
          <semantic:incoming>_6-630</semantic:incoming>
          <semantic:outgoing>_6-691</semantic:outgoing>
          <semantic:outgoing>_6-693</semantic:outgoing>
        </semantic:parallelGateway>
        <semantic:intermediateCatchEvent id="_6-674" name="„where is my pizza?“">
          <semantic:incoming>_6-691</semantic:incoming>
          <semantic:incoming>_6-746</semantic:incoming>
          <semantic:outgoing>_6-748</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932433" />
        </semantic:intermediateCatchEvent>
        <semantic:task id="CalmCustomerTask" name="Calm customer">
          <semantic:incoming>_6-748</semantic:incoming>
          <semantic:outgoing>_6-746</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-463" name="Bake the pizza">
          <semantic:incoming>_6-693</semantic:incoming>
          <semantic:outgoing>_6-632</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-514" name="Deliver the pizza">
          <semantic:incoming>_6-632</semantic:incoming>
          <semantic:outgoing>_6-634</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-565" name="Receive payment">
          <semantic:incoming>_6-634</semantic:incoming>
          <semantic:outgoing>_6-636</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-616" name="">
          <semantic:incoming>_6-636</semantic:incoming>
          <semantic:terminateEventDefinition />
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-630" name="" sourceRef="OrderReceivedEvent" targetRef="_6-652" />
        <semantic:sequenceFlow id="_6-632" name="" sourceRef="_6-463" targetRef="_6-514" />
        <semantic:sequenceFlow id="_6-634" name="" sourceRef="_6-514" targetRef="_6-565" />
        <semantic:sequenceFlow id="_6-636" name="" sourceRef="_6-565" targetRef="_6-616" />
        <semantic:sequenceFlow id="_6-691" name="" sourceRef="_6-652" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-693" name="" sourceRef="_6-652" targetRef="_6-463" />
        <semantic:sequenceFlow id="_6-746" name="" sourceRef="CalmCustomerTask" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-748" name="" sourceRef="_6-674" targetRef="CalmCustomerTask" />
      </semantic:process>
      <semantic:message id="_1275940932198" />
      <semantic:process id="_6-2" isExecutable="false">
        <semantic:startEvent id="_6-61" name="Hungry for pizza">
          <semantic:outgoing>_6-125</semantic:outgoing>
        </semantic:startEvent>
        <semantic:task id="SelectAPizzaTask" name="Select a pizza">
          <semantic:incoming>_6-125</semantic:incoming>
          <semantic:outgoing>_6-178</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-127" name="Order a pizza">
          <semantic:incoming>_6-178</semantic:incoming>
          <semantic:outgoing>_6-420</semantic:outgoing>
        </semantic:task>
        <semantic:eventBasedGateway id="_6-180" name="">
          <semantic:incoming>_6-420</semantic:incoming>
          <semantic:incoming>_6-430</semantic:incoming>
          <semantic:outgoing>_6-422</semantic:outgoing>
          <semantic:outgoing>_6-424</semantic:outgoing>
        </semantic:eventBasedGateway>
        <semantic:intermediateCatchEvent id="_6-202" name="pizza received">
          <semantic:incoming>_6-422</semantic:incoming>
          <semantic:outgoing>_6-428</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932198" />
        </semantic:intermediateCatchEvent>
        <semantic:intermediateCatchEvent id="_6-219" name="60 minutes">
          <semantic:incoming>_6-424</semantic:incoming>
          <semantic:outgoing>_6-426</semantic:outgoing>
          <semantic:timerEventDefinition>
            <semantic:timeDate />
          </semantic:timerEventDefinition>
        </semantic:intermediateCatchEvent>
        <semantic:task id="_6-236" name="Ask for the pizza">
          <semantic:incoming>_6-426</semantic:incoming>
          <semantic:outgoing>_6-430</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-304" name="Pay the pizza">
          <semantic:incoming>_6-428</semantic:incoming>
          <semantic:outgoing>_6-434</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-355" name="Eat the pizza">
          <semantic:incoming>_6-434</semantic:incoming>
          <semantic:outgoing>_6-436</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-406" name="Hunger satisfied">
          <semantic:incoming>_6-436</semantic:incoming>
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-125" name="" sourceRef="_6-61" targetRef="SelectAPizzaTask" />
        <semantic:sequenceFlow id="_6-178" name="" sourceRef="SelectAPizzaTask" targetRef="_6-127" />
        <semantic:sequenceFlow id="_6-420" name="" sourceRef="_6-127" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-422" name="" sourceRef="_6-180" targetRef="_6-202" />
        <semantic:sequenceFlow id="_6-424" name="" sourceRef="_6-180" targetRef="_6-219" />
        <semantic:sequenceFlow id="_6-426" name="" sourceRef="_6-219" targetRef="_6-236" />
        <semantic:sequenceFlow id="_6-428" name="" sourceRef="_6-202" targetRef="_6-304" />
        <semantic:sequenceFlow id="_6-430" name="" sourceRef="_6-236" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-434" name="" sourceRef="_6-304" targetRef="_6-355" />
        <semantic:sequenceFlow id="_6-436" name="" sourceRef="_6-355" targetRef="_6-406" />
      </semantic:process>
      <semantic:collaboration id="C1275940932557">
        <semantic:participant id="_6-53" name="Pizza Customer" processRef="_6-2" />
        <semantic:participant id="_6-438" name="Pizza vendor" processRef="_6-1" />
        <semantic:messageFlow id="_6-638" name="pizza order" sourceRef="_6-127" targetRef="OrderReceivedEvent" />
        <semantic:messageFlow id="_6-642" name="" sourceRef="_6-236" targetRef="_6-674" />
        <semantic:messageFlow id="_6-646" name="receipt" sourceRef="_6-565" targetRef="_6-304" />
        <semantic:messageFlow id="_6-648" name="money" sourceRef="_6-304" targetRef="_6-565" />
        <semantic:messageFlow id="_6-640" name="pizza" sourceRef="_6-514" targetRef="_6-202" />
        <semantic:messageFlow id="_6-750" name="" sourceRef="CalmCustomerTask" targetRef="_6-236" />
      </semantic:collaboration>
      <bpmndi:BPMNDiagram id="Trisotech.Visio-_6" name="Untitled Diagram" documentation="" resolution="96.00000267028808">
        <bpmndi:BPMNPlane bpmnElement="C1275940932557">
          <bpmndi:BPMNShape id="Trisotech.Visio__6-53" bpmnElement="_6-53" isHorizontal="true">
            <dc:Bounds x="12" y="12" width="1044" height="294" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6-438" bpmnElement="_6-438" isHorizontal="true">
            <dc:Bounds x="12" y="372" width="905" height="337" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-650" bpmnElement="_6-650" isHorizontal="true">
            <dc:Bounds x="42" y="372" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-446" bpmnElement="_6-446" isHorizontal="true">
            <dc:Bounds x="42" y="486" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-448" bpmnElement="_6-448" isHorizontal="true">
            <dc:Bounds x="42" y="600" width="875" height="109" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_OrderReceivedEvent" bpmnElement="OrderReceivedEvent">
            <dc:Bounds x="79" y="405" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-652" bpmnElement="_6-652">
            <dc:Bounds x="140" y="399" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-674" bpmnElement="_6-674">
            <dc:Bounds x="218" y="404" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_CalmCustomerTask" bpmnElement="CalmCustomerTask">
            <dc:Bounds x="286" y="386" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-463" bpmnElement="_6-463">
            <dc:Bounds x="252" y="521" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-514" bpmnElement="_6-514">
            <dc:Bounds x="464" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-565" bpmnElement="_6-565">
            <dc:Bounds x="603" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-616" bpmnElement="_6-616">
            <dc:Bounds x="722" y="647" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-61" bpmnElement="_6-61">
            <dc:Bounds x="66" y="96" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-74" bpmnElement="SelectAPizzaTask">
            <dc:Bounds x="145" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-127" bpmnElement="_6-127">
            <dc:Bounds x="265" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-180" bpmnElement="_6-180">
            <dc:Bounds x="378" y="90" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-202" bpmnElement="_6-202">
            <dc:Bounds x="647" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-219" bpmnElement="_6-219">
            <dc:Bounds x="448" y="184" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-236" bpmnElement="_6-236">
            <dc:Bounds x="517" y="166" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-304" bpmnElement="_6-304">
            <dc:Bounds x="726" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-355" bpmnElement="_6-355">
            <dc:Bounds x="834" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-406" bpmnElement="_6-406">
            <dc:Bounds x="956" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-640" bpmnElement="_6-640">
            <di:waypoint x="506" y="629" />
            <di:waypoint x="506" y="384" />
            <di:waypoint x="663" y="384" />
            <di:waypoint x="663" y="127" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-630" bpmnElement="_6-630">
            <di:waypoint x="109" y="420" />
            <di:waypoint x="140" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-691" bpmnElement="_6-691">
            <di:waypoint x="182" y="420" />
            <di:waypoint x="200" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-648" bpmnElement="_6-648">
            <di:waypoint x="754" y="145" />
            <di:waypoint x="754" y="408" />
            <di:waypoint x="630" y="408" />
            <di:waypoint x="631" y="629" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-422" bpmnElement="_6-422">
            <di:waypoint x="420" y="111" />
            <di:waypoint x="438" y="111" />
            <di:waypoint x="647" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-646" bpmnElement="_6-646" messageVisibleKind="non_initiating">
            <di:waypoint x="658" y="629" />
            <di:waypoint x="658" y="432" />
            <di:waypoint x="782" y="432" />
            <di:waypoint x="782" y="145" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-428" bpmnElement="_6-428">
            <di:waypoint x="679" y="111" />
            <di:waypoint x="726" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-748" bpmnElement="_6-748">
            <di:waypoint x="250" y="420" />
            <di:waypoint x="268" y="420" />
            <di:waypoint x="286" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-420" bpmnElement="_6-420">
            <di:waypoint x="348" y="111" />
            <di:waypoint x="366" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-636" bpmnElement="_6-636">
            <di:waypoint x="686" y="663" />
            <di:waypoint x="704" y="663" />
            <di:waypoint x="722" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-750" bpmnElement="_6-750">
            <di:waypoint x="328" y="386" />
            <di:waypoint x="328" y="348" />
            <di:waypoint x="572" y="348" />
            <di:waypoint x="572" y="234" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-436" bpmnElement="_6-436">
            <di:waypoint x="918" y="111" />
            <di:waypoint x="936" y="111" />
            <di:waypoint x="956" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-632" bpmnElement="_6-632">
            <di:waypoint x="335" y="555" />
            <di:waypoint x="353" y="555" />
            <di:waypoint x="353" y="663" />
            <di:waypoint x="464" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-634" bpmnElement="_6-634">
            <di:waypoint x="548" y="663" />
            <di:waypoint x="603" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-125" bpmnElement="_6-125">
            <di:waypoint x="96" y="111" />
            <di:waypoint x="114" y="111" />
            <di:waypoint x="145" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-430" bpmnElement="_6-430">
            <di:waypoint x="600" y="200" />
            <di:waypoint x="618" y="200" />
            <di:waypoint x="618" y="252" />
            <di:waypoint x="576" y="252" />
            <di:waypoint x="549" y="252" />
            <di:waypoint x="360" y="252" />
            <di:waypoint x="360" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-642" bpmnElement="_6-642">
            <di:waypoint x="545" y="234" />
            <di:waypoint x="545" y="324" />
            <di:waypoint x="234" y="324" />
            <di:waypoint x="234" y="404" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-424" bpmnElement="_6-424">
            <di:waypoint x="399" y="132" />
            <di:waypoint x="399" y="200" />
            <di:waypoint x="448" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-638" bpmnElement="_6-638">
            <di:waypoint x="306" y="145" />
            <di:waypoint x="306" y="252" />
            <di:waypoint x="94" y="252" />
            <di:waypoint x="94" y="405" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-426" bpmnElement="_6-426">
            <di:waypoint x="480" y="200" />
            <di:waypoint x="498" y="200" />
            <di:waypoint x="517" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-693" bpmnElement="_6-693">
            <di:waypoint x="161" y="441" />
            <di:waypoint x="161" y="556" />
            <di:waypoint x="252" y="555" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-178" bpmnElement="_6-178">
            <di:waypoint x="228" y="111" />
            <di:waypoint x="265" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-746" bpmnElement="_6-746">
            <di:waypoint x="370" y="420" />
            <di:waypoint x="386" y="420" />
            <di:waypoint x="386" y="474" />
            <di:waypoint x="191" y="474" />
            <di:waypoint x="191" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-434" bpmnElement="_6-434">
            <di:waypoint x="810" y="111" />
            <di:waypoint x="834" y="111"### [plantUML](https://plantuml.com/de/)

#### Diagram 1

=== "Diagram"

    ```kroki-plantuml
    @startuml
    left to right direction
    skinparam packageStyle rectangle
    skinparam monochrome true
    actor customer
    actor clerk
    rectangle checkout {
      customer -- (checkout)
      (checkout) .> (payment) : include
      (help) .> (checkout) : extends
      (checkout) -- clerk
    }
    @enduml
    ```

=== "Code"

    ```
    @startuml
    left to right direction
    skinparam packageStyle rectangle
    skinparam monochrome true
    actor customer
    actor clerk
    rectangle checkout {
      customer -- (checkout)
      (checkout) .> (payment) : include
      (help) .> (checkout) : extends
      (checkout) -- clerk
    }
    @enduml
    ```

#### Diagram 2

=== "Diagram"

    ```kroki-plantuml
    @startwbs
    skinparam monochrome true
    * Business Process Modelling WBS
    ** Launch the project
    *** Complete Stakeholder Research
    *** Initial Implementation Plan
    ** Design phase
    *** Model of AsIs Processes Completed
    **** Model of AsIs Processes Completed1
    **** Model of AsIs Processes Completed2
    *** Measure AsIs performance metrics
    *** Identify Quick Wins
    ** Complete innovate phase
    @endwbs
    ```

=== "Code"

    ```
    @startwbs
    skinparam monochrome true
    * Business Process Modelling WBS
    ** Launch the project
    *** Complete Stakeholder Research
    *** Initial Implementation Plan
    ** Design phase
    *** Model of AsIs Processes Completed
    **** Model of AsIs Processes Completed1
    **** Model of AsIs Processes Completed2
    *** Measure AsIs performance metrics
    *** Identify Quick Wins
    ** Complete innovate phase
    @endwbs
    ```

### [BPMN](https://camunda.com/de/bpmn/bpmn-2-0-symbol-reference/)

=== "Diagram"

    ```kroki-bpmn
    <?xml version="1.0" encoding="UTF-8"?>
    <semantic:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:semantic="http://www.omg.org/spec/BPMN/20100524/MODEL" id="_1275940932088" targetNamespace="http://www.trisotech.com/definitions/_1275940932088" exporter="Camunda Modeler" exporterVersion="1.16.0">
      <semantic:message id="_1275940932310" />
      <semantic:message id="_1275940932433" />
      <semantic:process id="_6-1" isExecutable="false">
        <semantic:laneSet id="ls_6-438">
          <semantic:lane id="_6-650" name="clerk">
            <semantic:flowNodeRef>OrderReceivedEvent</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-652</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-674</semantic:flowNodeRef>
            <semantic:flowNodeRef>CalmCustomerTask</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-446" name="pizza chef">
            <semantic:flowNodeRef>_6-463</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-448" name="delivery boy">
            <semantic:flowNodeRef>_6-514</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-565</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-616</semantic:flowNodeRef>
          </semantic:lane>
        </semantic:laneSet>
        <semantic:startEvent id="OrderReceivedEvent" name="Order received">
          <semantic:outgoing>_6-630</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932310" />
        </semantic:startEvent>
        <semantic:parallelGateway id="_6-652" name="">
          <semantic:incoming>_6-630</semantic:incoming>
          <semantic:outgoing>_6-691</semantic:outgoing>
          <semantic:outgoing>_6-693</semantic:outgoing>
        </semantic:parallelGateway>
        <semantic:intermediateCatchEvent id="_6-674" name="„where is my pizza?“">
          <semantic:incoming>_6-691</semantic:incoming>
          <semantic:incoming>_6-746</semantic:incoming>
          <semantic:outgoing>_6-748</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932433" />
        </semantic:intermediateCatchEvent>
        <semantic:task id="CalmCustomerTask" name="Calm customer">
          <semantic:incoming>_6-748</semantic:incoming>
          <semantic:outgoing>_6-746</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-463" name="Bake the pizza">
          <semantic:incoming>_6-693</semantic:incoming>
          <semantic:outgoing>_6-632</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-514" name="Deliver the pizza">
          <semantic:incoming>_6-632</semantic:incoming>
          <semantic:outgoing>_6-634</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-565" name="Receive payment">
          <semantic:incoming>_6-634</semantic:incoming>
          <semantic:outgoing>_6-636</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-616" name="">
          <semantic:incoming>_6-636</semantic:incoming>
          <semantic:terminateEventDefinition />
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-630" name="" sourceRef="OrderReceivedEvent" targetRef="_6-652" />
        <semantic:sequenceFlow id="_6-632" name="" sourceRef="_6-463" targetRef="_6-514" />
        <semantic:sequenceFlow id="_6-634" name="" sourceRef="_6-514" targetRef="_6-565" />
        <semantic:sequenceFlow id="_6-636" name="" sourceRef="_6-565" targetRef="_6-616" />
        <semantic:sequenceFlow id="_6-691" name="" sourceRef="_6-652" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-693" name="" sourceRef="_6-652" targetRef="_6-463" />
        <semantic:sequenceFlow id="_6-746" name="" sourceRef="CalmCustomerTask" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-748" name="" sourceRef="_6-674" targetRef="CalmCustomerTask" />
      </semantic:process>
      <semantic:message id="_1275940932198" />
      <semantic:process id="_6-2" isExecutable="false">
        <semantic:startEvent id="_6-61" name="Hungry for pizza">
          <semantic:outgoing>_6-125</semantic:outgoing>
        </semantic:startEvent>
        <semantic:task id="SelectAPizzaTask" name="Select a pizza">
          <semantic:incoming>_6-125</semantic:incoming>
          <semantic:outgoing>_6-178</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-127" name="Order a pizza">
          <semantic:incoming>_6-178</semantic:incoming>
          <semantic:outgoing>_6-420</semantic:outgoing>
        </semantic:task>
        <semantic:eventBasedGateway id="_6-180" name="">
          <semantic:incoming>_6-420</semantic:incoming>
          <semantic:incoming>_6-430</semantic:incoming>
          <semantic:outgoing>_6-422</semantic:outgoing>
          <semantic:outgoing>_6-424</semantic:outgoing>
        </semantic:eventBasedGateway>
        <semantic:intermediateCatchEvent id="_6-202" name="pizza received">
          <semantic:incoming>_6-422</semantic:incoming>
          <semantic:outgoing>_6-428</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932198" />
        </semantic:intermediateCatchEvent>
        <semantic:intermediateCatchEvent id="_6-219" name="60 minutes">
          <semantic:incoming>_6-424</semantic:incoming>
          <semantic:outgoing>_6-426</semantic:outgoing>
          <semantic:timerEventDefinition>
            <semantic:timeDate />
          </semantic:timerEventDefinition>
        </semantic:intermediateCatchEvent>
        <semantic:task id="_6-236" name="Ask for the pizza">
          <semantic:incoming>_6-426</semantic:incoming>
          <semantic:outgoing>_6-430</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-304" name="Pay the pizza">
          <semantic:incoming>_6-428</semantic:incoming>
          <semantic:outgoing>_6-434</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-355" name="Eat the pizza">
          <semantic:incoming>_6-434</semantic:incoming>
          <semantic:outgoing>_6-436</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-406" name="Hunger satisfied">
          <semantic:incoming>_6-436</semantic:incoming>
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-125" name="" sourceRef="_6-61" targetRef="SelectAPizzaTask" />
        <semantic:sequenceFlow id="_6-178" name="" sourceRef="SelectAPizzaTask" targetRef="_6-127" />
        <semantic:sequenceFlow id="_6-420" name="" sourceRef="_6-127" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-422" name="" sourceRef="_6-180" targetRef="_6-202" />
        <semantic:sequenceFlow id="_6-424" name="" sourceRef="_6-180" targetRef="_6-219" />
        <semantic:sequenceFlow id="_6-426" name="" sourceRef="_6-219" targetRef="_6-236" />
        <semantic:sequenceFlow id="_6-428" name="" sourceRef="_6-202" targetRef="_6-304" />
        <semantic:sequenceFlow id="_6-430" name="" sourceRef="_6-236" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-434" name="" sourceRef="_6-304" targetRef="_6-355" />
        <semantic:sequenceFlow id="_6-436" name="" sourceRef="_6-355" targetRef="_6-406" />
      </semantic:process>
      <semantic:collaboration id="C1275940932557">
        <semantic:participant id="_6-53" name="Pizza Customer" processRef="_6-2" />
        <semantic:participant id="_6-438" name="Pizza vendor" processRef="_6-1" />
        <semantic:messageFlow id="_6-638" name="pizza order" sourceRef="_6-127" targetRef="OrderReceivedEvent" />
        <semantic:messageFlow id="_6-642" name="" sourceRef="_6-236" targetRef="_6-674" />
        <semantic:messageFlow id="_6-646" name="receipt" sourceRef="_6-565" targetRef="_6-304" />
        <semantic:messageFlow id="_6-648" name="money" sourceRef="_6-304" targetRef="_6-565" />
        <semantic:messageFlow id="_6-640" name="pizza" sourceRef="_6-514" targetRef="_6-202" />
        <semantic:messageFlow id="_6-750" name="" sourceRef="CalmCustomerTask" targetRef="_6-236" />
      </semantic:collaboration>
      <bpmndi:BPMNDiagram id="Trisotech.Visio-_6" name="Untitled Diagram" documentation="" resolution="96.00000267028808">
        <bpmndi:BPMNPlane bpmnElement="C1275940932557">
          <bpmndi:BPMNShape id="Trisotech.Visio__6-53" bpmnElement="_6-53" isHorizontal="true">
            <dc:Bounds x="12" y="12" width="1044" height="294" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6-438" bpmnElement="_6-438" isHorizontal="true">
            <dc:Bounds x="12" y="372" width="905" height="337" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-650" bpmnElement="_6-650" isHorizontal="true">
            <dc:Bounds x="42" y="372" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-446" bpmnElement="_6-446" isHorizontal="true">
            <dc:Bounds x="42" y="486" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-448" bpmnElement="_6-448" isHorizontal="true">
            <dc:Bounds x="42" y="600" width="875" height="109" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_OrderReceivedEvent" bpmnElement="OrderReceivedEvent">
            <dc:Bounds x="79" y="405" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-652" bpmnElement="_6-652">
            <dc:Bounds x="140" y="399" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-674" bpmnElement="_6-674">
            <dc:Bounds x="218" y="404" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_CalmCustomerTask" bpmnElement="CalmCustomerTask">
            <dc:Bounds x="286" y="386" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-463" bpmnElement="_6-463">
            <dc:Bounds x="252" y="521" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-514" bpmnElement="_6-514">
            <dc:Bounds x="464" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-565" bpmnElement="_6-565">
            <dc:Bounds x="603" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-616" bpmnElement="_6-616">
            <dc:Bounds x="722" y="647" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-61" bpmnElement="_6-61">
            <dc:Bounds x="66" y="96" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-74" bpmnElement="SelectAPizzaTask">
            <dc:Bounds x="145" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-127" bpmnElement="_6-127">
            <dc:Bounds x="265" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-180" bpmnElement="_6-180">
            <dc:Bounds x="378" y="90" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-202" bpmnElement="_6-202">
            <dc:Bounds x="647" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-219" bpmnElement="_6-219">
            <dc:Bounds x="448" y="184" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-236" bpmnElement="_6-236">
            <dc:Bounds x="517" y="166" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-304" bpmnElement="_6-304">
            <dc:Bounds x="726" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-355" bpmnElement="_6-355">
            <dc:Bounds x="834" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-406" bpmnElement="_6-406">
            <dc:Bounds x="956" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-640" bpmnElement="_6-640">
            <di:waypoint x="506" y="629" />
            <di:waypoint x="506" y="384" />
            <di:waypoint x="663" y="384" />
            <di:waypoint x="663" y="127" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-630" bpmnElement="_6-630">
            <di:waypoint x="109" y="420" />
            <di:waypoint x="140" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-691" bpmnElement="_6-691">
            <di:waypoint x="182" y="420" />
            <di:waypoint x="200" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-648" bpmnElement="_6-648">
            <di:waypoint x="754" y="145" />
            <di:waypoint x="754" y="408" />
            <di:waypoint x="630" y="408" />
            <di:waypoint x="631" y="629" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-422" bpmnElement="_6-422">
            <di:waypoint x="420" y="111" />
            <di:waypoint x="438" y="111" />
            <di:waypoint x="647" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-646" bpmnElement="_6-646" messageVisibleKind="non_initiating">
            <di:waypoint x="658" y="629" />
            <di:waypoint x="658" y="432" />
            <di:waypoint x="782" y="432" />
            <di:waypoint x="782" y="145" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-428" bpmnElement="_6-428">
            <di:waypoint x="679" y="111" />
            <di:waypoint x="726" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-748" bpmnElement="_6-748">
            <di:waypoint x="250" y="420" />
            <di:waypoint x="268" y="420" />
            <di:waypoint x="286" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-420" bpmnElement="_6-420">
            <di:waypoint x="348" y="111" />
            <di:waypoint x="366" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-636" bpmnElement="_6-636">
            <di:waypoint x="686" y="663" />
            <di:waypoint x="704" y="663" />
            <di:waypoint x="722" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-750" bpmnElement="_6-750">
            <di:waypoint x="328" y="386" />
            <di:waypoint x="328" y="348" />
            <di:waypoint x="572" y="348" />
            <di:waypoint x="572" y="234" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-436" bpmnElement="_6-436">
            <di:waypoint x="918" y="111" />
            <di:waypoint x="936" y="111" />
            <di:waypoint x="956" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-632" bpmnElement="_6-632">
            <di:waypoint x="335" y="555" />
            <di:waypoint x="353" y="555" />
            <di:waypoint x="353" y="663" />
            <di:waypoint x="464" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-634" bpmnElement="_6-634">
            <di:waypoint x="548" y="663" />
            <di:waypoint x="603" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-125" bpmnElement="_6-125">
            <di:waypoint x="96" y="111" />
            <di:waypoint x="114" y="111" />
            <di:waypoint x="145" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-430" bpmnElement="_6-430">
            <di:waypoint x="600" y="200" />
            <di:waypoint x="618" y="200" />
            <di:waypoint x="618" y="252" />
            <di:waypoint x="576" y="252" />
            <di:waypoint x="549" y="252" />
            <di:waypoint x="360" y="252" />
            <di:waypoint x="360" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-642" bpmnElement="_6-642">
            <di:waypoint x="545" y="234" />
            <di:waypoint x="545" y="324" />
            <di:waypoint x="234" y="324" />
            <di:waypoint x="234" y="404" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-424" bpmnElement="_6-424">
            <di:waypoint x="399" y="132" />
            <di:waypoint x="399" y="200" />
            <di:waypoint x="448" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-638" bpmnElement="_6-638">
            <di:waypoint x="306" y="145" />
            <di:waypoint x="306" y="252" />
            <di:waypoint x="94" y="252" />
            <di:waypoint x="94" y="405" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-426" bpmnElement="_6-426">
            <di:waypoint x="480" y="200" />
            <di:waypoint x="498" y="200" />
            <di:waypoint x="517" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-693" bpmnElement="_6-693">
            <di:waypoint x="161" y="441" />
            <di:waypoint x="161" y="556" />
            <di:waypoint x="252" y="555" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-178" bpmnElement="_6-178">
            <di:waypoint x="228" y="111" />
            <di:waypoint x="265" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-746" bpmnElement="_6-746">
            <di:waypoint x="370" y="420" />
            <di:waypoint x="386" y="420" />
            <di:waypoint x="386" y="474" />
            <di:waypoint x="191" y="474" />
            <di:waypoint x="191" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-434" bpmnElement="_6-434">
            <di:waypoint x="810" y="111" />
            <di:waypoint x="834" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
      </bpmndi:BPMNDiagram>
    </semantic:definitions>
    ```

=== "Code"

    ```
    <?xml version="1.0" encoding="UTF-8"?>
    <semantic:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:semantic="http://www.omg.org/spec/BPMN/20100524/MODEL" id="_1275940932088" targetNamespace="http://www.trisotech.com/definitions/_1275940932088" exporter="Camunda Modeler" exporterVersion="1.16.0">
      <semantic:message id="_1275940932310" />
      <semantic:message id="_1275940932433" />
      <semantic:process id="_6-1" isExecutable="false">
        <semantic:laneSet id="ls_6-438">
          <semantic:lane id="_6-650" name="clerk">
            <semantic:flowNodeRef>OrderReceivedEvent</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-652</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-674</semantic:flowNodeRef>
            <semantic:flowNodeRef>CalmCustomerTask</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-446" name="pizza chef">
            <semantic:flowNodeRef>_6-463</semantic:flowNodeRef>
          </semantic:lane>
          <semantic:lane id="_6-448" name="delivery boy">
            <semantic:flowNodeRef>_6-514</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-565</semantic:flowNodeRef>
            <semantic:flowNodeRef>_6-616</semantic:flowNodeRef>
          </semantic:lane>
        </semantic:laneSet>
        <semantic:startEvent id="OrderReceivedEvent" name="Order received">
          <semantic:outgoing>_6-630</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932310" />
        </semantic:startEvent>
        <semantic:parallelGateway id="_6-652" name="">
          <semantic:incoming>_6-630</semantic:incoming>
          <semantic:outgoing>_6-691</semantic:outgoing>
          <semantic:outgoing>_6-693</semantic:outgoing>
        </semantic:parallelGateway>
        <semantic:intermediateCatchEvent id="_6-674" name="„where is my pizza?“">
          <semantic:incoming>_6-691</semantic:incoming>
          <semantic:incoming>_6-746</semantic:incoming>
          <semantic:outgoing>_6-748</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932433" />
        </semantic:intermediateCatchEvent>
        <semantic:task id="CalmCustomerTask" name="Calm customer">
          <semantic:incoming>_6-748</semantic:incoming>
          <semantic:outgoing>_6-746</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-463" name="Bake the pizza">
          <semantic:incoming>_6-693</semantic:incoming>
          <semantic:outgoing>_6-632</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-514" name="Deliver the pizza">
          <semantic:incoming>_6-632</semantic:incoming>
          <semantic:outgoing>_6-634</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-565" name="Receive payment">
          <semantic:incoming>_6-634</semantic:incoming>
          <semantic:outgoing>_6-636</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-616" name="">
          <semantic:incoming>_6-636</semantic:incoming>
          <semantic:terminateEventDefinition />
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-630" name="" sourceRef="OrderReceivedEvent" targetRef="_6-652" />
        <semantic:sequenceFlow id="_6-632" name="" sourceRef="_6-463" targetRef="_6-514" />
        <semantic:sequenceFlow id="_6-634" name="" sourceRef="_6-514" targetRef="_6-565" />
        <semantic:sequenceFlow id="_6-636" name="" sourceRef="_6-565" targetRef="_6-616" />
        <semantic:sequenceFlow id="_6-691" name="" sourceRef="_6-652" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-693" name="" sourceRef="_6-652" targetRef="_6-463" />
        <semantic:sequenceFlow id="_6-746" name="" sourceRef="CalmCustomerTask" targetRef="_6-674" />
        <semantic:sequenceFlow id="_6-748" name="" sourceRef="_6-674" targetRef="CalmCustomerTask" />
      </semantic:process>
      <semantic:message id="_1275940932198" />
      <semantic:process id="_6-2" isExecutable="false">
        <semantic:startEvent id="_6-61" name="Hungry for pizza">
          <semantic:outgoing>_6-125</semantic:outgoing>
        </semantic:startEvent>
        <semantic:task id="SelectAPizzaTask" name="Select a pizza">
          <semantic:incoming>_6-125</semantic:incoming>
          <semantic:outgoing>_6-178</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-127" name="Order a pizza">
          <semantic:incoming>_6-178</semantic:incoming>
          <semantic:outgoing>_6-420</semantic:outgoing>
        </semantic:task>
        <semantic:eventBasedGateway id="_6-180" name="">
          <semantic:incoming>_6-420</semantic:incoming>
          <semantic:incoming>_6-430</semantic:incoming>
          <semantic:outgoing>_6-422</semantic:outgoing>
          <semantic:outgoing>_6-424</semantic:outgoing>
        </semantic:eventBasedGateway>
        <semantic:intermediateCatchEvent id="_6-202" name="pizza received">
          <semantic:incoming>_6-422</semantic:incoming>
          <semantic:outgoing>_6-428</semantic:outgoing>
          <semantic:messageEventDefinition messageRef="_1275940932198" />
        </semantic:intermediateCatchEvent>
        <semantic:intermediateCatchEvent id="_6-219" name="60 minutes">
          <semantic:incoming>_6-424</semantic:incoming>
          <semantic:outgoing>_6-426</semantic:outgoing>
          <semantic:timerEventDefinition>
            <semantic:timeDate />
          </semantic:timerEventDefinition>
        </semantic:intermediateCatchEvent>
        <semantic:task id="_6-236" name="Ask for the pizza">
          <semantic:incoming>_6-426</semantic:incoming>
          <semantic:outgoing>_6-430</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-304" name="Pay the pizza">
          <semantic:incoming>_6-428</semantic:incoming>
          <semantic:outgoing>_6-434</semantic:outgoing>
        </semantic:task>
        <semantic:task id="_6-355" name="Eat the pizza">
          <semantic:incoming>_6-434</semantic:incoming>
          <semantic:outgoing>_6-436</semantic:outgoing>
        </semantic:task>
        <semantic:endEvent id="_6-406" name="Hunger satisfied">
          <semantic:incoming>_6-436</semantic:incoming>
        </semantic:endEvent>
        <semantic:sequenceFlow id="_6-125" name="" sourceRef="_6-61" targetRef="SelectAPizzaTask" />
        <semantic:sequenceFlow id="_6-178" name="" sourceRef="SelectAPizzaTask" targetRef="_6-127" />
        <semantic:sequenceFlow id="_6-420" name="" sourceRef="_6-127" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-422" name="" sourceRef="_6-180" targetRef="_6-202" />
        <semantic:sequenceFlow id="_6-424" name="" sourceRef="_6-180" targetRef="_6-219" />
        <semantic:sequenceFlow id="_6-426" name="" sourceRef="_6-219" targetRef="_6-236" />
        <semantic:sequenceFlow id="_6-428" name="" sourceRef="_6-202" targetRef="_6-304" />
        <semantic:sequenceFlow id="_6-430" name="" sourceRef="_6-236" targetRef="_6-180" />
        <semantic:sequenceFlow id="_6-434" name="" sourceRef="_6-304" targetRef="_6-355" />
        <semantic:sequenceFlow id="_6-436" name="" sourceRef="_6-355" targetRef="_6-406" />
      </semantic:process>
      <semantic:collaboration id="C1275940932557">
        <semantic:participant id="_6-53" name="Pizza Customer" processRef="_6-2" />
        <semantic:participant id="_6-438" name="Pizza vendor" processRef="_6-1" />
        <semantic:messageFlow id="_6-638" name="pizza order" sourceRef="_6-127" targetRef="OrderReceivedEvent" />
        <semantic:messageFlow id="_6-642" name="" sourceRef="_6-236" targetRef="_6-674" />
        <semantic:messageFlow id="_6-646" name="receipt" sourceRef="_6-565" targetRef="_6-304" />
        <semantic:messageFlow id="_6-648" name="money" sourceRef="_6-304" targetRef="_6-565" />
        <semantic:messageFlow id="_6-640" name="pizza" sourceRef="_6-514" targetRef="_6-202" />
        <semantic:messageFlow id="_6-750" name="" sourceRef="CalmCustomerTask" targetRef="_6-236" />
      </semantic:collaboration>
      <bpmndi:BPMNDiagram id="Trisotech.Visio-_6" name="Untitled Diagram" documentation="" resolution="96.00000267028808">
        <bpmndi:BPMNPlane bpmnElement="C1275940932557">
          <bpmndi:BPMNShape id="Trisotech.Visio__6-53" bpmnElement="_6-53" isHorizontal="true">
            <dc:Bounds x="12" y="12" width="1044" height="294" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6-438" bpmnElement="_6-438" isHorizontal="true">
            <dc:Bounds x="12" y="372" width="905" height="337" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-650" bpmnElement="_6-650" isHorizontal="true">
            <dc:Bounds x="42" y="372" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-446" bpmnElement="_6-446" isHorizontal="true">
            <dc:Bounds x="42" y="486" width="875" height="114" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-448" bpmnElement="_6-448" isHorizontal="true">
            <dc:Bounds x="42" y="600" width="875" height="109" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_OrderReceivedEvent" bpmnElement="OrderReceivedEvent">
            <dc:Bounds x="79" y="405" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-652" bpmnElement="_6-652">
            <dc:Bounds x="140" y="399" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-674" bpmnElement="_6-674">
            <dc:Bounds x="218" y="404" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6_CalmCustomerTask" bpmnElement="CalmCustomerTask">
            <dc:Bounds x="286" y="386" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-463" bpmnElement="_6-463">
            <dc:Bounds x="252" y="521" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-514" bpmnElement="_6-514">
            <dc:Bounds x="464" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-565" bpmnElement="_6-565">
            <dc:Bounds x="603" y="629" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-616" bpmnElement="_6-616">
            <dc:Bounds x="722" y="647" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-61" bpmnElement="_6-61">
            <dc:Bounds x="66" y="96" width="30" height="30" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-74" bpmnElement="SelectAPizzaTask">
            <dc:Bounds x="145" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-127" bpmnElement="_6-127">
            <dc:Bounds x="265" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-180" bpmnElement="_6-180">
            <dc:Bounds x="378" y="90" width="42" height="42" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-202" bpmnElement="_6-202">
            <dc:Bounds x="647" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-219" bpmnElement="_6-219">
            <dc:Bounds x="448" y="184" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-236" bpmnElement="_6-236">
            <dc:Bounds x="517" y="166" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-304" bpmnElement="_6-304">
            <dc:Bounds x="726" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-355" bpmnElement="_6-355">
            <dc:Bounds x="834" y="77" width="83" height="68" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNShape id="Trisotech.Visio__6__6-406" bpmnElement="_6-406">
            <dc:Bounds x="956" y="95" width="32" height="32" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNShape>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-640" bpmnElement="_6-640">
            <di:waypoint x="506" y="629" />
            <di:waypoint x="506" y="384" />
            <di:waypoint x="663" y="384" />
            <di:waypoint x="663" y="127" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-630" bpmnElement="_6-630">
            <di:waypoint x="109" y="420" />
            <di:waypoint x="140" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-691" bpmnElement="_6-691">
            <di:waypoint x="182" y="420" />
            <di:waypoint x="200" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-648" bpmnElement="_6-648">
            <di:waypoint x="754" y="145" />
            <di:waypoint x="754" y="408" />
            <di:waypoint x="630" y="408" />
            <di:waypoint x="631" y="629" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-422" bpmnElement="_6-422">
            <di:waypoint x="420" y="111" />
            <di:waypoint x="438" y="111" />
            <di:waypoint x="647" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-646" bpmnElement="_6-646" messageVisibleKind="non_initiating">
            <di:waypoint x="658" y="629" />
            <di:waypoint x="658" y="432" />
            <di:waypoint x="782" y="432" />
            <di:waypoint x="782" y="145" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-428" bpmnElement="_6-428">
            <di:waypoint x="679" y="111" />
            <di:waypoint x="726" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-748" bpmnElement="_6-748">
            <di:waypoint x="250" y="420" />
            <di:waypoint x="268" y="420" />
            <di:waypoint x="286" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-420" bpmnElement="_6-420">
            <di:waypoint x="348" y="111" />
            <di:waypoint x="366" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-636" bpmnElement="_6-636">
            <di:waypoint x="686" y="663" />
            <di:waypoint x="704" y="663" />
            <di:waypoint x="722" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-750" bpmnElement="_6-750">
            <di:waypoint x="328" y="386" />
            <di:waypoint x="328" y="348" />
            <di:waypoint x="572" y="348" />
            <di:waypoint x="572" y="234" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-436" bpmnElement="_6-436">
            <di:waypoint x="918" y="111" />
            <di:waypoint x="936" y="111" />
            <di:waypoint x="956" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-632" bpmnElement="_6-632">
            <di:waypoint x="335" y="555" />
            <di:waypoint x="353" y="555" />
            <di:waypoint x="353" y="663" />
            <di:waypoint x="464" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-634" bpmnElement="_6-634">
            <di:waypoint x="548" y="663" />
            <di:waypoint x="603" y="663" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-125" bpmnElement="_6-125">
            <di:waypoint x="96" y="111" />
            <di:waypoint x="114" y="111" />
            <di:waypoint x="145" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-430" bpmnElement="_6-430">
            <di:waypoint x="600" y="200" />
            <di:waypoint x="618" y="200" />
            <di:waypoint x="618" y="252" />
            <di:waypoint x="576" y="252" />
            <di:waypoint x="549" y="252" />
            <di:waypoint x="360" y="252" />
            <di:waypoint x="360" y="111" />
            <di:waypoint x="378" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-642" bpmnElement="_6-642">
            <di:waypoint x="545" y="234" />
            <di:waypoint x="545" y="324" />
            <di:waypoint x="234" y="324" />
            <di:waypoint x="234" y="404" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-424" bpmnElement="_6-424">
            <di:waypoint x="399" y="132" />
            <di:waypoint x="399" y="200" />
            <di:waypoint x="448" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-638" bpmnElement="_6-638">
            <di:waypoint x="306" y="145" />
            <di:waypoint x="306" y="252" />
            <di:waypoint x="94" y="252" />
            <di:waypoint x="94" y="405" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-426" bpmnElement="_6-426">
            <di:waypoint x="480" y="200" />
            <di:waypoint x="498" y="200" />
            <di:waypoint x="517" y="200" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-693" bpmnElement="_6-693">
            <di:waypoint x="161" y="441" />
            <di:waypoint x="161" y="556" />
            <di:waypoint x="252" y="555" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-178" bpmnElement="_6-178">
            <di:waypoint x="228" y="111" />
            <di:waypoint x="265" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-746" bpmnElement="_6-746">
            <di:waypoint x="370" y="420" />
            <di:waypoint x="386" y="420" />
            <di:waypoint x="386" y="474" />
            <di:waypoint x="191" y="474" />
            <di:waypoint x="191" y="420" />
            <di:waypoint x="218" y="420" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
          <bpmndi:BPMNEdge id="Trisotech.Visio__6__6-434" bpmnElement="_6-434">
            <di:waypoint x="810" y="111" />
            <di:waypoint x="834" y="111" />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
      </bpmndi:BPMNDiagram>
    </semantic:definitions>
    ``` />
            <bpmndi:BPMNLabel />
          </bpmndi:BPMNEdge>
        </bpmndi:BPMNPlane>
      </bpmndi:BPMNDiagram>
    </semantic:definitions>
    ```