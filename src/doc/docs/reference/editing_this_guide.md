# Editing this guide

This guide uses [MkDocs](https://www.mkdocs.org/) + [Material for Mkdocs](https://squidfunk.github.io/mkdocs-material/).
The reference for the Material theme can be found [here](https://squidfunk.github.io/mkdocs-material/reference/).
Additional mkdocs plugins can be installed in build.gradle + mkdocs.yml.

## Diagrams

There is support for diagrams via [Kroki](http://kroki.io) ([examples](https://kroki.io/examples.html)). The following diagrams are supported:

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

They can be embedded by creating a code block and the text kroki-[diagramtype].

Example:

~~~
```kroki-blockdiag
blockdiag {
  blockdiag -> generates -> "block-diagrams";
  blockdiag -> is -> "very easy!";

  blockdiag [color = "greenyellow"];
  "block-diagrams" [color = "pink"];
  "very easy!" [color = "orange"];
}
~~~

## Extensions

In addition to the Material extensions, there are some [Pymdown](https://facelessuser.github.io/pymdown-extensions/) extensions that are enabled:

- [pymdownx.betterem](https://facelessuser.github.io/pymdown-extensions/extensions/betterem/): different emphasis handling
- [pymdownx.inlinehilite](https://facelessuser.github.io/pymdown-extensions/extensions/inlinehilite/): inline code highlighting; example: #!js var test = 0;
- [pymdownx.magiclink](https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/): linkafies URLs
- [pymdownx.smartsymbols](https://facelessuser.github.io/pymdown-extensions/extensions/smartsymbols/): inserts commonly used Unicode characters via simple ASCII representations.
- [pymdownx.superfences](https://facelessuser.github.io/pymdown-extensions/extensions/superfences/): extension to Markdown fenches
- [pymdownx.details](https://facelessuser.github.io/pymdown-extensions/extensions/details/): collapsible elements
- [pymdownx.highlight](https://facelessuser.github.io/pymdown-extensions/extensions/highlight/)
- [pymdownx.snippets](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/):  include other Markdown or HTML snippets into the current Markdown file
- [pymdownx.keys](https://facelessuser.github.io/pymdown-extensions/extensions/keys/): simplifies inserting key inputs; example: ++ctrl+alt+delete++
- [pymdownx.caret](https://facelessuser.github.io/pymdown-extensions/extensions/caret/): superscript text via caret
- [pymdownx.mark](https://facelessuser.github.io/pymdown-extensions/extensions/mark/): allows to mark words
- [pymdownx.tilde](https://facelessuser.github.io/pymdown-extensions/extensions/tilde/): subscript text via tilde
- [pymdownx.emoji](https://facelessuser.github.io/pymdown-extensions/extensions/emoji/): support for custom Emojis. Example: [MPS Icons](../Icons)
- [pymdownx.tasklist](https://facelessuser.github.io/pymdown-extensions/extensions/tasklist/): support for lists with check boxe

## Editing

- The first header should be `#`.
- Images can be inserted through HTML. Example:`<img src="../../../img/facets.png" alt="facets" />`
- Link attributes can be specified in curly braces. Example: `[Google](http://google.com){target=_blank}`
- [footnotes syntax](https://squidfunk.github.io/mkdocs-material/reference/footnotes/)
- Code snippet for gifs and show on hover: `<span class="hover_img"><a href="LINK">TEXT<span><img src="../../img/IMG.gif" alt="ALT_TEXT" /></span></a></span>`