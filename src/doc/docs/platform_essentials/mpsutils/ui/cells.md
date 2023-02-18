### Cells

#### AsyncCell

The async cell allows displaying a text based loading indicator as long as the return string is null.

Create a new `$custom cell$` editor cell and return a new AsyncCellProvider:

```java
return new AsyncCellProvider(node, { =>
    string value = calculateValue(); // calculate or query your value here
    if (value.isEmpty) { return null; }
    Style style = editorContext.?getContextCell().?getStyle();
    return new AsyncCellValue(value, style);
});
```

![async cell](async_cell.gif)

#### FrameCell

> ^^com.mbeddr.mpsutil.framecell^^

The [frame](http://127.0.0.1:63320/node?ref=b33d119e-196d-4497-977c-5c167b21fe33%2Fr%3A724443d4-b85d-4829-9ddf-5c5d9b1583dc%28com.mbeddr.mpsutil.framecell%2Fcom.mbeddr.mpsutil.framecell.structure%29%2F8760592470373336790) cell is a special editor cell collection that draws a top and bottom border around its contained cell. It supports the following style attributes:

- **frame-color**: the color of the frame (default: black)
- **frame-width**: the thickness of the frame (default: 1 pixel)
- **frame-padding**: the space between the containing cell and the frame (default: 3 pixel)

An example can be seen in the documentation language:

![example: framecell](framecell_example.png)

In most cases, the language ^^de.itemis.mps.editor.celllayout^^ from {{ mps_extensions() }} can also be used for customizing the border and margins around a cell. Its documentation can be found [here](https://jetbrains.github.io/MPS-extensions/extensions/editor/celllayout/).

### Margin cell / review

> ^^com.mbeddr.mpsutil.margincell^^ and ^^com.mbeddr.mpsutil.review^^

Margin cells are editor cells that are shown beyond the right editor margin, a bit like comments in Word. In fact, the ReviewNote cell implements exactly Word's comment facility as an example of the margin cell. Here is a screenshot:

![example: margin cell](margincell_example.png)

To use the review notes, just include the respective language; intentions are available to attach review notes to editor cells.

To put your own cells into the right margin, your cell must implement the IMarginCellContent interface. The editor of your cell may use the *margincell-cell-width* and *margincell-dashed-line-interval* style attributes to design the width and line style. You also have to have the actual margin cell on the root element of the editor. However, as illustrated by the CommentAnnotationContainer from the review language, you can use an annotation for this. Hence, margin comments can essentially be added to every model, without the model's language being aware of it.

### Placeholder text list

> ^^com.mbeddr.mpsutil.placeholderTextList^^

This language adds a new [cell model](http://127.0.0.1:63320/node?ref=r%3Ae633d72e-7309-4abb-b48b-c0511f07461b%28com.mbeddr.mpsutil.placeholderTextList.structure%29%2F1739942158294184652) that supports multiple aggregation with a custom placeholder text.

The placeholder can be specified in the inspector by creating a query function for the *placeholder text*.
