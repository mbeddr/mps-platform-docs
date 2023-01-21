## UI

{% include 'platform_essentials/mpsutils/ui/cells.md' %}

{% include 'platform_essentials/mpsutils/ui/diagrams.md' %}

### Date picker

> ^^com.mbeddr.mpsutil.datepicker^^

A classic widget to select a date from a pop-up calendar.

![example: datepicker](datepicker_example.png)

!!! warning "There's a [known issue](https://github.com/mbeddr/mbeddr.core/issues/2203) where the datepicker doesn't work when the theme is set to macOS light."

This is only the control, i.e. the developer handles synchronizing the control with the source of the shown date. We provide hooks executed before showing the calendar, for determining whether a date is valid, and to process a selected date.

### Editor utils

> ^^com.mbeddr.mpsutil.editor.utils^^

The class [EditorRuntimeUtil](http://127.0.0.1:63320/node?ref=371850a9-2c5b-4e1d-a811-70d97e847917%2Fr%3Af4ae6487-fb1d-418f-8dd3-759f9604156f%28com.mbeddr.mpsutil.editor.utils%2Fcom.mbeddr.mpsutil.editor.utils.runtime%29%2F4912572611769853192) contains a few helpful editor utility methods:

- **getErrorText(EditorContext)**: returns the error text of the current selected cell in the editor
- **collectAllOpenEditors(Project)**: returns all opened MPS editors
- **collectAllOpenEditorComponents(Project)**: return all opened editor components

## File picker

> ^^com.mbeddr.mpsutil.filepicker^^

This language contains text-based file and folder pickers. The paths can be directly entered in
the editor. There's also an intention `Open File Chooser Dialog` that shows a file chooser dialog. The following file pickers are supported:

- [file system dir picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F4881264737620519319)
- [file system file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F1504214765033455826)
- [macro file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F8297282968580444334)
- [macro folder picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F4881264737614560289)
- [solution relative dir picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F2642765975824060179)
- [solution relative file picker](http://127.0.0.1:63320/node?ref=r%3A2a10821d-612f-4a73-b7b0-ed6b57106321%28com.mbeddr.mpsutil.filepicker.structure%29%2F6156524541423588207)

The macro pickers can contain [path variables](https://www.jetbrains.com/help/mps/absolute-path-variables.html).

### Hyperlink

> ^^com.mbeddr.mpsutil.hyperlink^^

Hyperlink cells can be used for references in MPS. In contrast to normal reference cells they automatically become blue and underlined if the mouse hovers over them (no Ctrl is necessary). The following style attributes are supported:

- **hyperlink-reference**: make a reference a hyperlink
- **hyperlink-handler**: a function that's called when the link is clicked. The *util* parameter object contains a method
  *openInBrowser* for opening a URL with the default web browser.
- **hyperlink-style**: can be URl or reference. The reference style forces the usage of the key *ctrl* to activate the hyperlink.
- **hyperlink-node**: the node that should be displayed after the link was clicked
- **hyperlink-focus**: focus the target node of the hyperlink after navigating to it.
- **hyperlink-select**: select the target node of the hyperlink after navigating to it.

### JFreeChart

> ^^com.mbeddr.mpsutil.jfreechart^^

This module contains stubs for the [JFreeChart](https://www.jfree.org/jfreechart/) library. The charts can be viewed in
an extra tool *Chart* by calling the following code:

```java
ChartManager.getInstance(editorContext).setChart(node.createChart())
```

where `createChart` return instance of [JFreeChart](http://127.0.0.1:63320/node?ref=7fe13e34-8620-4d5d-92c7-df091b0ed628%2Fjava%3Aorg.jfree.chart%28com.mbeddr.mpsutil.jfreechart.runtime%2F%29%2F%7EJFreeChart).

![example: jfreechart](jfreechart_example.png)

### Target chooser

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

- **setInitial**: set the initial selected item. This can be a node or a model.
- **setSelectionValidator**: the selection validator checks if the selected target is valid or shows an error message when it's invalid. By default, no validation takes places (an empty validator is used).
- **setSNodeFilter**: this filter decides which nodes should be visible in the dialog (within the selected scope).
  To show a node, you also have to return true for the root node, but not for all ancestors.
- **setModuleScope**: this scope defines the available modules that will be the sources for the nodes that will be displayed.
- **addModuleFilter**: an additional boolean filter for the modules of the module scope.
- **showModulesPool**: a flag that decides if the modules pool (last entry in logical view) should also be displayed in the dialog.
- **setModelFilter**: only keep the models of the specified scope where the filter returns true
- **setScope**: sets the scope for the items that should be displayed in the dialog. This can be in instance of
  [TargetChooserScope](http://127.0.0.1:63320/node?ref=r%3A24b43531-125c-4436-b4b0-f3444d2173fd%28com.mbeddr.mpsutil.targetchooser%29%2F7547442689028637169) or a sequence of nodes (+ ancestor filter). By default, the specified modules scope
  with the specified model and node filers applied is used.

### User styles

> ^^com.mbeddr.mpsutil.userstyles^^

This language provides a new annotation *@userConfigurable*, that can be added to a style class in a style sheet
(intention:*Make User Configurable*). After defining a name, the user can change the style in the preferences
(*Preferences*-->*Editor*-->*Color Scheme*-->*Code*). The following style-class items are supported:

- **Foreground**: equivalent to *text-foreground-color*
- **Background**: equivalent to *text-background-color*
- **Bold**: equivalent to *font-style: bold*
- **Italic**: equivalent to *font-style: italic
- **Effects: Dotted lines, bold underscored, underscored, underwaved**: equivalent to *underlined*
- **Effects: strikeout**: equivalent to *strike-out*

Further useful links for developers:

- [Export IntelliJ editor themes as plugin | JetBrains blog](https://blog.jetbrains.com/platform/2017/12/export-intellij-editor-themes-as-plugins/)
- [UI Themes — Editor Schemes and Background Images | IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/themes-extras.html)
