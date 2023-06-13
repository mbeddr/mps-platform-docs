# UI

### Cells

#### AsyncCell

The async cell allows displaying a text-based loading indicator as long as the return string is null.

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
- **frame-padding**: the space between the containing cell and the frame (default: 3 pixels)

An example can be seen in the documentation language:

![example: framecell](framecell_example.png)

In most cases, the language ^^de.itemis.mps.editor.celllayout^^ from {{ mps_extensions() }} can also be used for customizing the border and margins around a cell. Its documentation can be found [here](https://jetbrains.github.io/MPS-extensions/extensions/editor/celllayout/).

### Margin cell/review

> ^^com.mbeddr.mpsutil.margincell^^ and ^^com.mbeddr.mpsutil.review^^

Margin cells are editor cells that are shown beyond the right editor margin, a bit like comments in Word.
The ReviewNote cell implements exactly Word's comment facility as an example of the margin cell. Here is a screenshot:

![example: margin cell](margincell_example.png)

To use the review notes, just include the respective language ^^com.mbeddr.mpsutil.review^^; intentions are available to attach review notes to editor cells.

To put your cells into the right margin, your cell must implement the IMarginCellContent interface. The editor of your cell may use the *margincell-cell-width* and *margincell-dashed-line-interval* style attributes to design the width and line style. You also have to have the actual margin cell on the root element of the editor. However, as illustrated by the CommentAnnotationContainer from the review language, you can use an annotation for this. Hence, margin comments can essentially be added to every model, without the model's language being aware of it.

### Placeholder text list

> ^^com.mbeddr.mpsutil.placeholderTextList^^

This language adds a new [cell model](http://127.0.0.1:63320/node?ref=r%3Ae633d72e-7309-4abb-b48b-c0511f07461b%28com.mbeddr.mpsutil.placeholderTextList.structure%29%2F1739942158294184652) that supports multiple aggregations with a custom placeholder text.

The placeholder can be specified in the inspector by creating a query function for the *placeholder text*.


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

Drag a model or module reference from the diagram palette to the diagram. Dependencies to other models/modules will be automatically added. The dependencies are visualized by the line between the two boxes, and its label is named after the scope of the dependency (e.g. *uses* if the language is imported).

![example: dependency diagram](dependencydiagram_example.png)

## Date picker

> ^^com.mbeddr.mpsutil.datepicker^^

A classic widget to select a date from a pop-up calendar.

![example: datepicker](datepicker_example.png)

!!! warning "There's a [known issue](https://github.com/mbeddr/mbeddr.core/issues/2203) where the date picker doesn't work when the theme is set to macOS light."

This is only the control, i.e. the developer handles synchronizing the control with the source of the shown date. We provide hooks executed before showing the calendar, for determining whether a date is valid, and to process a selected date.

## Editor utils

> ^^com.mbeddr.mpsutil.editor.utils^^

The class [EditorRuntimeUtil](http://127.0.0.1:63320/node?ref=371850a9-2c5b-4e1d-a811-70d97e847917%2Fr%3Af4ae6487-fb1d-418f-8dd3-759f9604156f%28com.mbeddr.mpsutil.editor.utils%2Fcom.mbeddr.mpsutil.editor.utils.runtime%29%2F4912572611769853192) contains a few helpful editor utility methods:

- **getErrorText(EditorContext)**: returns the error text of the currently selected cell in the editor
- **collectAllOpenEditors(Project)**: returns all opened MPS editors
- **collectAllOpenEditorComponents(Project)**: return all opened editor components

## File picker

> ^^com.mbeddr.mpsutil.filepicker^^

This language contains the text-based files and folder pickers. The paths can be directly entered in
the editor. There's also an intention `Open File Chooser Dialog` that shows a file chooser dialog. The following file pickers are supported:

- [file system dir picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F4881264737620519319)
- [file system file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F1504214765033455826)
- [macro file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F8297282968580444334)
- [macro folder picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F4881264737614560289)
- [solution relative dir picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F2642765975824060179)
- [solution relative file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F6156524541423588207)

The macro pickers can contain [path variables](https://www.jetbrains.com/help/mps/absolute-path-variables.html).

## Hyperlink

> ^^com.mbeddr.mpsutil.hyperlink^^

Hyperlink cells can be used for references in MPS. In contrast to normal reference cells they automatically become blue and underlined if the mouse hovers over them (no Ctrl is necessary). The following style attributes are supported:

- **hyperlink-reference**: create a link for a node reference
- **hyperlink-handler**: a function that's called when the link is clicked. The *util* parameter object contains a method
  *openInBrowser* for opening a URL with the default web browser.
- **hyperlink-style**: can be URl or reference. The reference style forces the usage of the key *ctrl* to activate the hyperlink.
- **hyperlink-node**: the node that should be displayed after the link was clicked
- **hyperlink-focus**: set the focus on the target node of the hyperlink after navigating to it.
- **hyperlink-select**: select the target node of the hyperlink after navigating to it.

## JFreeChart

> ^^com.mbeddr.mpsutil.jfreechart^^

This module contains stubs for the [JFreeChart](https://www.jfree.org/jfreechart/) library. The charts can be viewed in
an extra tool *Chart* by calling the following code:

```java
ChartManager.getInstance(editorContext).setChart(node.createChart())
```

where `createChart` returns an instance of [JFreeChart](http://127.0.0.1:63320/node?ref=7fe13e34-8620-4d5d-92c7-df091b0ed628%2Fjava%3Aorg.jfree.chart%28com.mbeddr.mpsutil.jfreechart.runtime%2F%29%2F%7EJFreeChart).

![example: jfreechart](jfreechart_example.png)

## Target chooser

> ^^com.mbeddr.mpsutil.targetchooser^^

The target chooser language provides a modal dialog for choosing nodes based on a predefined scope:

![example: target chooser](targetchooser_example.png)

Example code:

```java
TargetChooserOptions options = new TargetChooserOptions(); 
project.getModelAccess().runReadAction({ => 
  options.setScope(new arraylist<node<>>{node/TargetChooser/, node/TargetChooserDialog/, node/DefaultModuleScope/}); 
}); 
TargetChooser chooser = new TargetChooser(ProjectHelper.toIdeaProject(project), options);
TargetChooserDialog.chooseTarget(#project, options)
```

The *options* object has the following setters:

- **setInitial**: set the initially selected item. This can be a node or a model.
- **setSelectionValidator**: the selection validator checks if the selected target is valid or shows an error message when it's invalid. By default, no validation takes place (an empty validator is used).
- **setSNodeFilter**: this filter decides which nodes should be visible in the dialog (within the selected scope).
  To show a node, you also have to return true for the root node, but not for all ancestors.
- **setModuleScope**: this scope defines the available modules that will be the sources for the nodes that will be displayed.
- **addModuleFilter**: an additional boolean filter for the modules of the module scope.
- **showModulesPool**: a flag that decides if the modules pool (last entry in logical view) should also be displayed in the dialog.
- **setModelFilter**: only keep the models of the specified scope where the filter returns true
- **setScope**: sets the scope for the items that should be displayed in the dialog. This can be an instance of
  [TargetChooserScope](http://127.0.0.1:63320/node?ref=r%3A24b43531-125c-4436-b4b0-f3444d2173fd%28com.mbeddr.mpsutil.targetchooser%29%2F7547442689028637169) or a sequence of nodes (+ ancestor filter). By default, the specified modules scope
  with the specified model and node filers applied is used.

## User styles

> ^^com.mbeddr.mpsutil.userstyles^^

This language provides a new annotation *@userConfigurable*, that can be added to a style class in a style sheet
(intention:*Make User Configurable*). After defining a name, the user can change the style in the preferences
(*Preferences*-->*Editor*-->*Color Scheme*-->*Code*). The following style-class items are supported:

- **Foreground**: equivalent to *text-foreground-color*
- **Background**: equivalent to *text-background-color*
- **Bold**: equivalent to *font-style: bold*
- **Italic**: equivalent to *font-style: italic*
- **Effects: Dotted lines, bold underscored, underscored, underwaved**: equivalent to *underlined*
- **Effects: strikeout**: equivalent to *strike-out*

Further useful links for developers:

- [Export IntelliJ editor themes as plugin | JetBrains blog](https://blog.jetbrains.com/platform/2017/12/export-intellij-editor-themes-as-plugins/)
- [UI Themes — Editor Schemes and Background Images | IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/themes-extras.html)
