## Importer and exporter

### ECore

> ^^com.mbeddr.mpsutil.ecore^^

This is an importer and exporter for the meta model([ECore](https://wiki.eclipse.org/Ecore)) of the Eclipse Modelling Framework.
The conversion is between an XML file and a MPS model. The importer can import Ecore and Ecore model files.

Access the action through right-clicking a model and opening the *Ecore Transformation tools* group.

### XML import

> ^^com.mbeddr.mpsutil.xmlImport.plugin^^

This plugin adds two actions for importing XML files into MPS:

- *Paste as XML Content*: this action is located in the editor context menu and parses XML code
  and adds it to the next xml node or root node.
- *Import XML File(s)*: this actions parses on or multiple xml files and creates xml root nodes for them in the current
  selected model.

