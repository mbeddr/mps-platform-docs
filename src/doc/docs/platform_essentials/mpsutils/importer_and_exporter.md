# Importer and exporter

## ECore

> ^^com.mbeddr.mpsutil.ecore^^

This language contains an importer and exporter of the metamodel([ECore](https://wiki.eclipse.org/Ecore)) of the Eclipse Modelling Framework.
The conversion is between an XML file and an MPS model. The importer can import Ecore and Ecore model files.

Access the action by right-clicking a model and opening the *Ecore Transformation tools* group.

## XML Import

> ^^com.mbeddr.mpsutil.xmlImport.plugin^^

This plugin adds two actions for importing XML files into MPS:

- *Paste as XML Content*: This action is located in the editor context menu, parses XML code, and adds it to the next XML node or root node.
- *Import XML File(s)*: This action parses on or multiple XML files and creates XML root nodes for them in the
  selected model.

