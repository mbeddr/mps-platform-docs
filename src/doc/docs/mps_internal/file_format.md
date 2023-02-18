A few different persistence formats can be selected when creating a new model (`Model` --> `storage format`):

- **Pre-installed XML-based format**
    Models are described in an XML format. Git changes are collected per model. It is the default format. There seems to be support for saving user objects (strings, node ids etc. but not serializable objects) but this option just doesn't seem to be activated. User objects are therefore lost when existing MPS.
- **Pre-installed XML-based File-Per-Root format** (.mpsr) 
  Models are described in an XML format. Git changes are collected per root node. Some file-per-root [specific bugs](https://youtrack.jetbrains.com/issues/MPS?q=per%20root%20persistence%20%23Open%20) exist.
- **Pre-installed Binary-Format** (.mpb)
    Models are saved in a binary format. It can save user objects and should also be able to save serializable objects but this might not be working. The information is saved directly in the model file.

The persistence format was improved over the years (v4 - v8). Version 9 is the current format.

If you want to support a custom format, read the [custom persistence](https://www.jetbrains.com/help/mps/open-api-accessing-models-from-code.html#custompersistence) chapter in the documentation.

Here is a list of some other used file formats:

- languages (.mpl)
- solutions (.msd)
- models (.mps)
- devkit (.devkit)
- model headers (.model)
- java files (.java)
- [kotlin files](https://docs.fileformat.com/programming/kt/) (.kt)
- kotlin modules (.kotlin)
- compile Java files (.class)
- old MPS projects (.mpr)
- old workspace format (.mws)
- standalone generators (.mpst)
- Java archives (.jar)
- [IntelliJ modules](https://www.jetbrains.com/help/idea/creating-and-managing-modules.html) (.iml)
- [generation info files](https://www.jetbrains.com/help/mps/debugger.html#debuggingbaselanguageanditsextensions-integrationwiththejavadebugger) (trace.info)
