This page is an addition to https://jetbrains.github.io/MPS-extensions/extensions/editor/celllayout/. Some terminology of this page is explained on the page [editor development](../../mps_internal/editor_development//#terminology), so please read this page first. Additionally, when the variable's type or argument is omitted in a diagram, it is assumed to be *int*. Methods without a return type, have a type of *void*.

In the MPS layout algorithms, the children decide about their width and height, and the parent cell can only arrange the already layouted children. The algorithms from the celllayout language are similar to the ones from the swing layouters where the child is asked for its min/max/preferred size, but the parent decides about the size of the child and the child then has to fit itself into these bounds. The table and diagram language uses this language, but there are also some useful styles defined in the *de.itemis.mps.celllayout* language. The language is partially inspired by the Java [MigLayout](https://www.miglayout.com/).

## Box Model

The box model defines how the editor elements are modeled in the celllayout language. It is like a simplified version
of the [CSS box model](https://en.wikipedia.org/wiki/CSS_box_model).

### Layout box

A layout box has a *position* (x,y) and a *dimension* (width, height). These properties can be saved together in a
[Bounds](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F6454451880331308523) object which also has methods for checking if another bounds or point is contained in it.

```kroki-plantuml
@startuml
interface LayoutBox <<extends Cloneable>> {
//«get/set»// x
//«get»// right = x + width
//«get/set»// y
//«get»// bottom = y + height
//«get/set»// width
//«get/set»// height
//«get/set»// ascent
//«get/set»// descent
containsPoint(x, y): boolean
growWidth/Height(amount) 
moveX/Y(amount) 
move(amountX,amountY) 
setSize(w, h)
setListener(listener)
}

interface Bounds <<immutable>> {
//«get/set»// x: int
//«get»// maxX = x + width
//«get/set»// y: int
//«get»// maxY = y + height
//«get/set»// width: int
//«get/set»// height: int
contains(x, y): boolean
contains(childBounds): boolean
}
@enduml
```

The size can be changed with the *growN* methods, the position can be changed with the
*move* methods. All of those methods take relative values. A listener can be set to listening to changes in the mentioned properties.
The default implementation is [DefaultLayoutBox](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118843427) which extends [AbstractlayoutBox](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118846449). Whenever a setter method is called, the corresponding method of the listener is triggered. The ascent is calculated by subtracting the descent from the height.

### LayoutBoxFrame

A [LayoutBoxFrame](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118842758) is a box that has a frame around an inner box:

{% include 'languages/diagrams/celllayout_layoutbox_frame.md' %}

Setting the frame size sets it for all sides (left, right, bottom, top).

```kroki-plantuml
@startuml
interface LayoutBox <<extends Cloneable>> {
//«get/set»// leftSize
//«get/set»// rightSize
//«get/set»// topSize
//«get/set»// bottomSize
//«get/set»// innerBox
setFrameSze(size)
}
@enduml
```

[AbstractLayoutBoxFrame](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118845385) extends this class.
The position is calculated by the inner box's position minus the frame size and the dimension is the inner box's dimension plus the
frame size. The default implementation is [DefaultLayoutBoxFrame](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118843041). It contains a layout box has the frame size split up into left, right, bottom and top size.

[CalcOnWriteFrame](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F2623983396592470484) is a layout box frame which contains an inner and result layout box. The position and dimension are returned from the result box while the same setter methods set the properties of the inner box. When the inner box changes, the listener propagates those changes to the result box. When the left/right/bottom or top size is set, the property of the result box is set by a delta.

### BoxModel

A [BoxModel](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118842608) consists of 4 boxes. The most inner box contains the content, the most outer box is the margin.

{% include 'languages/diagrams/celllayout_boxmodel.md' %}

The default implementation is [DefaultBoxModel](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1605248462118842820) which is used by [EditorCellBoxModel](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F4403454289951403328). 

### EditorCellBoxModel

This box model is stored in the user object of the corresponding cell under the key 
*EditorCellBoxModel*. Besides the mentioned boxes, is has a box for additional padding and a bracket box for when the cell has the stylesheet item *drawBrackets* enabled. The brackets have a width of 7 pixel. 

{% include 'languages/diagrams/celllayout_editorcell_boxmodel.md' %}

#### Synchronisation

The read synchronisation method initializes the boxes based on the information from the editor cell. The padding is calculated as the gap minus the additional padding. If the padding is negative it is added as additional padding, otherwise it is set to the padding box.
If the dimension is less than the total frame size of the bracket box, the additional padding is set to 0. The dimension is the maximum of the current dimension and the total frame size of the bracket box. The default behavior of MPS is not to reserve any space for the border and let it overlap. That's why the position is therefore calculated as the border size minus 1.
In the write synchronisation method, the left and right gap are set. They are calculated as the padding plus the additional padding. Depending on the *useMove* flag, the cells are then moved or only the position is set.

## Layout

The immutable class [Size](http://127.0.0.1:63320/node?ref=r%3A6107a535-c9ce-47d9-a4cd-4df6fd2db517%28de.itemis.mps.editor.celllayout.boxmodel%29%2F1140493069047732951) has special methods for supporting unlimited sizes which are just large numbers that are larger than every practically used size. This approach reduces the potential for overflow errors. *limitedX* methods can be used for limiting either the width or height.
The *deriveN* methods just change the width or height separately.

### ILayouter

[ILayouter](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F1605248462118897924) has a layout method and a method to move the children of a layoutable container by a delta.

```kroki-plantuml
@startuml
interface ILayouter {
layout(container, sizeConstraint)
moveChildren(container, deltaX, deltaY)
getPreferredSize(container, sizeConstraint): Size
getMinInnerSize(container, sizeConstraint): Size
getMaxInnerSize(container, sizeConstraint): Size
getAscent(container, sizeConstraint): int
getCellsForSelectionPainting(container): Seq<ILayoutable>
toText(container): TextBuilder
usesPunctuation(): boolean
}
@enduml
```

All the *size* methods and the ascent calculation method take a container as the first parameter and a size constraint as a second parameter to restrict the returned size.
*toText()* produces a string that is returned when copying the cells to the system clipboard. *usesPunctuation()*
determines if punctuation stylesheet items are used. The class [AbstractLayout](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4403454289948172446) extends this interface. It has a method for checking and returning the gap in pixels between two ILayoutables. If the left ILayoutable has the stylesheet item *punctuation-right* or the right the item *punctuation-left* enabled, there is no gap. If one the two ILayoutables has
a border on the conjoined side, there is also no gap.

### ILayoutable

```kroki-plantuml
@startuml
interface ILayoutable {
  //«get/set»// parent: ILayoutableContainer
  //«get/set»// x
  //«get/set»// y
  //«get/set»// width
  //«get/set»// height
  //«get»// boxModel
  //«get»// ascent
  //«get/set»// changed
  setBounds(x, y, width, height)
  setPosition(x, y)
  setSize(width, height); 
   
  getPreferredSize(sizeConstraint)
  getMinSize(sizeConstraint)
  getMaxSize(sizeConstraint)
  getAscent(size); 
  
  relayout(sizeConstraint)
   
  isGrowX()
  getColumnSpan()
  isNoWrap()
  getMaxWidth()
  isBaseLineCell()
  {method} ...
   
  toText(): TextBuilder
}

@enduml
```

[ILayoutable](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F1140493069047745619) inherits some methods of LayoutBox, some of ILayouter. The main method `relayout` calculates the new position and dimension of an editor cell. Additionally, the interface has methods for the special celllayout properties such as *growX*, *column-span* etc. and methods for checking and setting the *changed* flag.
 In [AbstractLayoutable](AbstractLayoutable) all those properties are set to false and the column and row spans are by default set to 1.

The [ILayoutableContainer](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F1140493069047704919) inherits from ILayoutable and has a layouter and children:

```kroki-plantuml
@startuml
interface ILayoutable {
  //«get// children: list<ILayoutable>
  //«get// innerX
  //«get// innerY
  //«get// innerWidth
  //«get// innerHeight
  //«get// layouter: ILayouter
  isFlattenInGrid()
  setInnerBounds(x, y, width, height)
  getBaselineChild(): ILayoutable
}
@enduml
```

There are *innerX* methods for getting the position and dimension as well as a method for setting the inner bounds. There is also support for the *flatten-grid* and *base-line-child* property.

### Grid

A [Grid](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4615632674301991452) is a 2D structure and consists of [GridElement](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4615632674301991714)s and has a dimension. Internally a 1D array is used to store the elements.

#### Extending and scaling

Each row has an ascent and descent, and all columns can have different widths. A column's width can be extended. It is kept the same if the new with is smaller than the existing width. It can also extend to an unlimited size. The row's height can also be extended by providing a new ascent and descent. The sum of both values has to be greater than zero. When the old values are greater, nothing changes. The contained cells of the grid can also be extended by providing a size getter that determines a new size for each ILayoutable.

The widths can also be scaled by proving a new value and weights for the columns. The widths of the columns are percentages of the
new width based on the weights (possible rounding errors are compensated). The same scaling method exists for the height: it works the same way except that the ascents and descents of the rows are recalculated. The provided weights don't have to add up to 1 as they are automatically normalized.
```java title="Example calculation"
float availableWidth=500;
float newColumnWidths=[2,2,1];
// calculation:
float[] weighths= [0.4,0.4,0.2];
float[] newColumnSizes=[200,200,100];
```

The method *applyLayout(x, y)* takes a position as an argument and sets new bounds for the individual valid elements of the grid. An element is valid when it has a ILayoutable.
```java
float element.baseLine = y + element.y + ascent(row[y]);
float element.x = x + element.x;
float element.y = element.baseLine - element.ascent;
```

When the alignment center or alignment right property is set, the x position is changed accordingly based on the remaining space.
This is the elements size minus the result size which is calculated in the following way: the minimum of the elements size and the preferred size is calculated, then the minimum of this size and the maximum size. If the *overflowN* property is set, the corresponding size direction will be set to unlimited.

The main method of the grid is *growElement* which takes a grid element, an offset and the two directions as arguments. If the elements' dimension is lower than the maximum size of the ILayoutable, the ILayoutable's dimension becomes the element's dimension, otherwise the additional padding of the layout's box model is used to grow the element. For the horizontal growing, the alignment is taking into account.

A [GridElement](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4615632674301991714) has a ILayoutable and different *extendN* methods: extendSize works by changing the ascent of the ILayoutable. The descent is calculated by substracting the ascent from the height. There are further methods for extending the width and extending the columns.

### Standard layouts

Default implementations for the standard MPS layouts are provided:

- [HorizontalLayout](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F1140493069047724245) (grid with 1 row)
- [VerticalLayout](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4615632674300634136) (grid with 1 column)
- [IndentLayout](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F4615632674303613006) (layout based on lines that consist of words)
- [ICellLayoutWrapper](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F6809252184302533466)

ICellLayoutWrapper can wrap an existing cell layout. It can be unwrapped by calling CellLayout.unwrapAll.
[IEditorCellBasedLayoutable](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F3671361614442888780) extends ILayoutable and contains an editor cell, a method to check if an indent is present and a `readSyncAll` and `writeSyncAll` method.
[ISupportsTopDownLayout](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F3671361614442886164) is an editorCell that has a topdown layoutable (IEditorCellBasedLayoutable).

- [GridLayout](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F20138194853236771)

This class uses the class [DynamicGrid](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F8791219374217538066) to store the grid. DynamidGrid stores the elements in a 1D array and automatically grows the array when the grid size changes.
This layout respects the grid and row span properties and automatically adjusts the spans when the value is set to a negative value. The new values becomes
the maximum number of spans that are available. It also has a method to load a sub grid into a DynamicGrid. The grid elements come from a [ILayoutableContainer](http://127.0.0.1:63320/node?ref=r%3A12584d60-2d80-4ca9-9c6e-b79d499da0cf%28de.itemis.mps.editor.celllayout.layout%29%2F1140493069047704919).

#### Flattening

An ILayoutable is considered an intermediate if

- it has a horizontal layout and the parent is a grid layout
- it has a grid layout, horizontal or vertical layout and the *flatten-grid* stylesheet item is set.

This method plays a role in the flattening of the grid. When this item is used, all ancestor elements of the grid that have this property enabled,
are placed directly in the main grid and are not sub-grids. In the following example it is assumed that the property is enabled for all children:

{% include 'languages/diagrams/celllayout_grid_flattening.md' %}

## Runtime

### Cells

The [EditorListenerCellProvider](http://127.0.0.1:63320/node?ref=r%3A02240f59-d215-4642-b459-56f9f2ccb58d%28de.itemis.mps.editor.celllayout.runtime.cells%29%2F4504148519581216388) class has a reference to a node and creates a new [EditorListenerCell](http://127.0.0.1:63320/node?ref=r%3A02240f59-d215-4642-b459-56f9f2ccb58d%28de.itemis.mps.editor.celllayout.runtime.cells%29%2F4504148519581269051). This class can forward two events of the editor to the provider: *onEditorloaded* and *onEditorUnloaded*. This cell is not visible in the editor.

### AbstractLayoutableAdapter

[AbstractLayoutableAdapter](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F861697192441899653) has a parent LayoutableCollectionAdapter and handles reading all cell layout specific stylesheet items (*readSyncAll*).
All items are cached. The writing of the items (*writeSyncAll*) is forwarded to the box model.
It also contains a editor cell box model. All setter and getter work with the margin box of this box model. The only special implementations are the size
methods: the preferred size is the size of the box model's margin box. The maximum and minimum size are equivalent to the preferred size.

### BorderPainter 

[BorderPainter](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F7943214583599648867) is an [AbstractAdditionalPainter](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EAbstractAdditionalPainter) that gets the information form the border box of the editor cell's box model. There is support for border thickness, color for each side of the box. The border is only painted when the specified rectangular area intersects with the current clipping area of
the graphics object. The position and the dimension of the border gets changed because there is one pixel less reserved than required for the border.
Paint requests are added to a queue which is then processed in order of thickness and brightness (light gray is the default color and has the 
lowest priority). In the following example, the painter was enabled for all editor cells:

![celllayout: border painter in action](celllayout_borderpainter.png)

### LayoutableAdapter

[LayoutableAdapter](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F7112191969006061574) extends [AbstractLayoutableAdapter](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F861697192441899653).

It forwards *writeSync* to the box model and calls relayout on the cell if a relayout was requested.
In the method *readSync*, relayout is requested if one of the *growN* properties is set. Then relayout is called.

```kroki-plantuml
@startuml
interface LayoutableAdapter <<extends AbstractLayoutableAdapter>> {
writeSyncAll()
readSyncAll()
setSize(width,height)
updateAlignment()
getPreferredSize(sizeConstraint)
getMinSize(sizeConstraint)
getAscent(size)
getMaxSize(sizeConstraint)
}
@enduml
```

When the expected bounds are not equal to the actual bounds or a relayout was requested or the cell is marked as changed, the cell is relayouted again.
The size method takes a width and height and calculates the delta for the old dimension in comparison to the new dimension and assigns it to the additional padding box of the box model. The horizontal alignment is also taking into account.

The preferred size and also the minimum size is calculated as the dimension of the box model's padding minus the additional padding. The maximum size is equal to the preferred size unless the cell is an [Editor_Label](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor.cells%28MPS.Editor%2F%29%2F%7EEditorCell_Label) or one of the *grow* stylesheet itemi is set: in those cases, the width or the height or both can be unlimited.

### LayoutableAdapters

The [LayoutableAdapters](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F861697192442245136) class manages adapters. In *createAdapter* it returns the TopDownLayoutable for editor cells that support top down layouting, creates a LayoutableCollectionAdapter for the layouter of the cell and the cell itself or creates a new LayoutableAdapter for the cell instead. The method *getAdapter* calls this method if there is no existing adapter or receives it from the user object of the cell with the key *LayoutableAdapter*.

### LayoutableCollectionAdapter

[LayoutableCollectionAdapter](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F861697192442242919) is a layout adapter for collections which supports the *pushN* stylesheet items and *grid-layout-flatten*. It caches the calculated inner sizes and inner ascents and also has a method to return a list of children of type ILayoutable.

The `relayout` method itself calculates the layout bounds based on a size constraint and the current position. If the position or dimension has changed in comparison to the last calculation

- `relayout` is called if the size has changed.
- `moveChildren` is called when the position has changed.

When one of those two events has occurred but no layouter is present, relayout is called. The *getLayouter* method returns a suitable ILayouter based on the existing layout e.g. HorizontalLayout for CellLayout_Horizontal. If the cell or any of its super classes overwrites the method *relayoutImpl*, *null* is returned.

 The inner position and dimension methods are based on the box model's content box. The total gap is the content's position minus the margin's position. To switch between the outer and inner size, the methods *toInnerSize* and *toOuterSize* can be used. The ascent is calculated as the ascent of the children plus the total gap at the top. When the different sizes like maximum, minimum and preferred size are calculated, the values are first looked up in the cache. If no value can be found, the sizes are guessed from the cached values: if the size was already smaller for a more strict constraint, that value is used. If there is still no value returned, the value is calculated.


### LayoutEngine

[LayoutEngine](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F861697192441898630) is the main entry point for layouting editor components, the root cell, single cells or a subtree of a cell. 
*layoutSubtree* requires the cell itself and a function that sets the bounds of the ILayoutable. For a normal cell the size is calculated as the
desired dimension constraint by the minimum and maximum size of the ILayoutable. For the root cell the calculation is different:
The preferred width is the x position of the cell minus the text width settings of the editor + the hardcoded 15 pixel left margin or the unlimited width if
it is bigger. The preferred size is then calculated as the preferred size of the root layoutable constraint by the preferred width.

`layoutSubtreeUnsafe` reads all the necessary information from the processed cell, preprocesses the layoutables (e.g. setting margin and padding), relayouts the cell, sets all margins and writes back the calculated result to the editor cell. In the end, the position and dimensions are fixed for editorcell collections based on the *overflow* stylesheet items and the request layout flags, that were set in previous steps are cleared. All of those methods are invoke inside a watchdog that stops the layouting after a certain time if no stable layout could be found.

### LayoutInterceptor

[LayoutInterceptor](http://127.0.0.1:63320/node?ref=r%3A45c19b6d-dd9a-4f15-973f-0267c5e76303%28de.itemis.mps.editor.celllayout.runtime%29%2F4403454289951894115) replaces the cell layout of cells that use stylesheet items of the cell layout language with a custom layout from this language.
The interceptor is installed in the [project plugin](http://127.0.0.1:63320/node?ref=r%3Ac30772cf-6faa-4379-900e-6719e180568e%28de.itemis.mps.editor.celllayout.runtime.plugin%29%2F4403454289951931861) through different methods: as an editor update listener, an additional painter and an editor component creation listener.
