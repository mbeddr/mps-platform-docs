# Languages

Besides C, this page describes languages that are implement as part of {{ mbeddr() }}. Some incomplete languages that can be
implemented by textGen were removed as they didn't provide any advantages. Only JSON is still a full implemented language.

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