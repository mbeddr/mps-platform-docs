---
comments: true
---

# Importer and exporter

This page describes language that you can use to import and export data from other languages or models. If you need a
tighter integration into MPS with the original files existing, use [custom persistence](https://www.jetbrains.com/help/mps/custom-persistence-cookbook.html).
This approach is an advanced feature that is not used often.

## ECore

> ^^com.mbeddr.mpsutil.ecore^^

This language contains an importer and exporter of the metamodel ([ECore](https://wiki.eclipse.org/Ecore)) of the Eclipse Modelling Framework.
The conversion is between an XML file and an MPS model. The importer can import Ecore and Ecore model files.

Access the action by right-clicking a model and opening the *Ecore Transformation tools* group.

## XML Import

> ^^com.mbeddr.mpsutil.xmlImport.plugin^^

This plugin adds two actions for importing XML files into MPS:

- *Paste as XML Content*: This action is located in the editor context menu, parses XML code, and adds it to the next XML node or root node.
- *Import XML File(s)*: This action parses on or multiple XML files and creates XML root nodes for them in the
  selected model.

## JSON

> ^^com.mbeddr.mpsutil.json^^

This language implements a simple JSON language you can use as a generator target. The [JSON file](http://127.0.0.1:63320/node?ref=r%3Abe665d13-1e1d-44cd-9817-8bd4d610f422%28com.mbeddr.mpsutil.json.structure%29%2F4342692121161094115) root node supports an additional package name used as the folder inside the generation folder.

An example of a file that you can generate:

```json
{ 
  "description" : "This is a JSON file", 
  "name" : "my JSON file", 
  "this is an object" : { 
    "And another object" : { 
      "With a description" : "object description", 
      "An array" : [ 
        "valu1", 
        "value2" 
      ], 
      "withANumber" : 1.232E+231231, 
      "empty array" : [ ], 
      "empty object" : { }, 
      "empty string" : "" 
    } 
  } 
}
```

An importer also exists for the language. It can import all JSON files in a folder or just single files.