# Editor

## Richtext
Language: <u>slisson.richtext</u>

!!! warning "The ordering of text and IWords can't be arbitrary"

    A checking rule enforces that the text is normalized: There has to be at least one child, it must start with a Word and a Word must always be betweeen two embedded nodes and there are noo two consecutive Words.

## Diagram
Language: <u>de.itemis.mps.editor.diagram</u>

!!! warning "I encountered a bug."

    Check the [meta Issue](https://github.com/JetBrains/MPS-extensions/issues/120) on Github.

!!! question "How do I use this language?"

    Have a look at the samples of this language in [mps-extensions](https://jetbrains.github.io/MPS-extensions/). There is also an [external tutorial series](https://tillschallau.de/mps/).

!!! question "What is edge ID in the diagrams used for?"

    It’s used in the map that contains the layout data. It can be any unique string.
    LayoutMapEntry.key is the property where this string is used ([source](https://jetbrains-mps.slack.com/archives/C99H1FR42/p1634132395020500?thread_ts=1634127497.019400&cid=C99H1FR42)).

## Conditional Editor
Language: <u>de.slisson.mps.conditionalEditor</u>

!!! warning "There are generation errors."

    The condition of the conditional editor is not optional, it has to be set.

## Tables
Language: <u>de.slisson.mps.tables</u>

!!! question "How to get rid of the small little extra grid lines on the outside of the table rows? ([original question](https://jetbrains-mps.slack.com/archives/C99H1FR42/p1632226340005700))"

    Change these properties to `true`. ![Set Properties to true](../../img/table_lines_properties.png)

## Cell Layout
Language: <u>de.itemis.mps.editor.celllayout</u>

!!! question "What does this language do?"

    In the MPS layout algorithms the children decide about their width and height and the parent cell can only arrange the already layouted children. 
    In the algorithms from the celllayout language are similar to the swing layouters where the child is asked for its min/max/preferred size, 
    but the parent decides about the size of the child and the child then has to fit itself into these bounds. 
    This is used in tables and diagram, but also for the styles defined in the `de.itemis.mps.celllayout` language ([source](https://jetbrains-mps.slack.com/archives/C99H1FR42/p1626868877018500?thread_ts=1626861485.018300&cid=C99H1FR42)).

# Grammar Cells
Language: <u>de.itemis.mps.grammarcells</u>

!!! question "Grammar cells force me to create a dummy component. Is this really necessary?"

    Yes it is, otherwise the generator doesn't get used [source](https://jetbrains-mps.slack.com/archives/C3YUV3YK0/p1628146601046300).

!!! question "What combination of cells are not supported?"

    The following combinations are not allowed:

    - optional and constant
    - optional and reference
