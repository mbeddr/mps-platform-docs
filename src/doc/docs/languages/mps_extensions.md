---
tags:
- mps-extensions
---

**The improved documentation is hosted on [GitHub](https://jetbrains.github.io/MPS-extensions/).**

## Richtext

> ^^slisson.richtext^^

A multi-line text-block that's extendable (e.g. for images). It looks a bit latex-like.
The mbeddr doc language used it for generating xhtml, latex, and markdown.

!!! warning "The ordering of text and IWords can't be arbitrary,"

    A checking rule enforces that the text is normalized: There has to be at least one child, it must start with a Word and a Word must always be betweeen two embedded nodes and there are noo two consecutive Words.


## Diagram

> ^^de.itemis.mps.editor.diagram^^

!!! warning "I encountered a bug."

    Check the [meta Issue](https://github.com/JetBrains/MPS-extensions/issues/120) on Github.

!!! question "How do you use this language?"

    Have a look at the samples of this language in {{ mps_extensions() }}. There is also an [external tutorial series](https://tillschallau.de/mps/).

!!! question "What's the edge ID in the diagrams used for?"

    It’s used in the map that contains the layout data. It can be any unique string.
    LayoutMapEntry.key is the property where this string is used ([source](https://jetbrains-mps.slack.com/archives/C99H1FR42/p1634132395020500?thread_ts=1634127497.019400&cid=C99H1FR42)).

## Tables

> ^^de.slisson.mps.tables^^

Use *slisson-tables* instead of *mps-tables* because the language is more flexible (and not deprecated).
The language displays content in a tabular format. The table can be hard-coded or can consist of complex queries/dynamic content.
You have to add new cells and rows in the editor. They can also be readonly.
You need a little experience (trial-and-error) to create these tables.
Features:

- table cell queries
- partial tables
- grid queries

{{ blog('Strumenta',false) }}[Tabular projections in Jetbrains MPS: let’s start building an accounting system](https://tomassetti.me/tabular-projections-in-jetbrains-mps-lets-start-building-an-accounting-system/)

??? question "How do you get rid of the small little extra grid lines on the outside of the table rows? ([original question](https://jetbrains-mps.slack.com/archives/C99H1FR42/p1632226340005700))"

    Change these properties to true. 

    ![Set Properties to true](table_lines_properties.png)

!!! question "How can I improve my tables?"

    - even-odd coloring of rows
    - coloring of columns and row headers
    - group columns by color
    - multi-column headers
    - annotations for cells
    - pagination + other UI buttons

## Grammar Cells

> ^^de.itemis.mps.grammarcells^^

!!! question "Grammar cells seem to need a dummy component. Is this necessary?"

    Yes it is, otherwise the generator doesn't get used([source](https://jetbrains-mps.slack.com/archives/C3YUV3YK0/p1628146601046300)).

!!! question "What combinations of cells aren't supported?"

    The following combinations are not allowed:

    - optional and constant
    - optional and reference

!!! question "How can you enter enumerations easier?"
    
    {{ blog('sl',false) }}[Entering enumerations easier with grammar cells](https://specificlanguages.com/posts/2022-02/03-entering-enumerations-easier/)

## Querylist

> ^^com.mbeddr.mpsutil.editor.querylist^^

You can use nodes in the editor, which aren't directly available in the current context. The language is more 
powerful than (readonly) model access (displays a string).
You can have editor cells, which can have actions and all other normal cell features.
[queryListNode](http://127.0.0.1:63320/node?ref=120e1c9d-4e27-4478-b2af-b2c3bd3850b0%2Fr%3Aea4f2df6-5e5c-49de-8679-6112ec7dd9c3%28com.mbeddr.mpsutil.editor.querylist%2Fcom.mbeddr.mpsutil.editor.querylist.structure%29%2F2239254897981410197) allows to access the surrounding context node in the editor definition (which otherwise isn't available).

!!! question "How do I fold collections returned by a querylist?"

    Surround the querylist with a vertical collection and and set the cell layout of the querylist (not its content) to vertical.

??? question "How do I make cells in querylists navigatable?"

    > I'm trying to create a list of navigatable cells via querylist from mpsutil.
    >
    > The querylists query collects some nodes from my model, and I'd like to make it so that each cell produced with this querylist navigates to its respective node.
    >
    > Using the *navigatable-node* style attribute (returning `node`, the node from the query) on these cells doesn't seem to work though - ctrl+clicking them doesn't do anything.
    >
    > How can I make the cells in a querylist navigatable to that node?
    
    The `navigatable-node` style attribute won't allow you to point directly to the node from the querylist's query.   
    Instead, you can use the *hyperlink-node* style attribute (also from mpsutil) to make the navigation work, and the `hyperlink-style` attribute to make it look like a regular reference:
    
    ![hyperlink node](hyperlink_node.png)  

    A common workaround to get similar behavior with *navigatable-node* is to point it to a child or parent of the desired node instead of that node itself.

    {{ contribution_by('jonaskraemer') }}

## Tool tips

> ^^de.itemis.mps.tooltips.structure^^

This language is deprecated, use ^^jetbrains.mps.lang.editor.tooltips^^ instead. It provides tooltips on hover.
You have to define a regular editor and a hover editor.