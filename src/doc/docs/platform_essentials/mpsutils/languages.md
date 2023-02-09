## Languages

### JSON

> ^^com.mbeddr.mpsutil.json^^

This language implements a simple JSON language that can be used as a generator target. The [Json file](http://127.0.0.1:63320/node?ref=r%3Abe665d13-1e1d-44cd-9817-8bd4d610f422%28com.mbeddr.mpsutil.json.structure%29%2F4342692121161094115) root node
supports an additional package name which is used as the folder inside the generation folder where the file is generated
into.

An example for a file that can be generated:

```json
{ 
  "description" : "This is a json file", 
  "name" : "my json file", 
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

No importer and exporter exist for the language yet (there is a draft in [feature/json_importer](https://github.com/mbeddr/mbeddr.core/tree/feature/json_importer)).