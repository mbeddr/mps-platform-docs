## Deprecated

### Build utilities

> ^^com.mbeddr.mpsutil.buildutil^^

!!! warning "This language was an attempt to automatically update build scripts during the build. It will be removed in the future."

### Code completion menu

> ^^com.mbeddr.mpsutil.ccmenu^^

!!! warning "This language isn't used anymore and is disabled."

This language added support for customizing the code completion menu with tabs and a special tab for creating reference
targets. The contributions were made in a plugin solutions by creating a [CCMenuExtensions](http://127.0.0.1:63320/node?ref=r%3A3d5b7b5d-2674-4caf-bdca-c100c5a0cb8e%28com.mbeddr.mpsutil.ccmenu.structure%29%2F6243347984996272104) root node.

### Forms

> ^^com.mbeddr.mpsutil.forms^^

!!! warning "This is an unfinished language that was probably intented  to be used in ^^com.mbeddr.mpsutil.process^^. This language will be removed soon."


### Gradle support

> ^^com.mbeddr.mpsutil.gradlesupport^^

This language was an attempt to create Gradle files from MPS. It has a concepts for
text files, single lines and multi lines. If you want to generate text files, use one of the
[text generator plugins](https://jetbrains.github.io/MPS-extensions/extensions/generator/plaintext-gen/) from {{ mps_extensions() }}.

### HTTP support

> ^^com.mbeddr.mpsutil.httpsupport^^

!!! warning "This was the old http support plugin. Please use the language jetbrains.mps.ide.httpsupport instead."


### Icon char

> ^^com.mbeddr.mpsutil.iconchar^^

!!! warning "This language was used to programmatically create icons but is deprecated. Please use the official [Icon description](https://www.jetbrains.com/help/mps/icon-description.html) language instead."

### Language stats

> ^^com.mbeddr.mpsutil.langstats^^

This language contains a concept [Counter](http://127.0.0.1:63320/node?ref=44ad0baa-db6e-4793-9250-f08ab386ec56%2Fr%3Aae5422b8-2aa2-4f57-80cb-0636bf6344ae%28com.mbeddr.mpsutil.langstats%2Fcom.mbeddr.mpsutil.langstats.structure%29%2F2745981761596927378) that can be populated by invoking the intention `Count` after creating a new instance in any model. It will search the current model and all imported models and will fill it with some general stats like the number of concepts, properties or number of type system rules. The formula for the lines of code (LOC) property can be found [in the editor](http://127.0.0.1:63320/node?ref=44ad0baa-db6e-4793-9250-f08ab386ec56%2Fr%3Aa9d5f5c6-b55f-4bb9-8d35-0ab16f5a6136%28com.mbeddr.mpsutil.langstats%2Fcom.mbeddr.mpsutil.langstats.editor%29%2F2745981761597143560). Most of the stats can be easily replicated with the [MPS console](https://www.jetbrains.com/help/mps/mps-console.html).

```
Counter                  
-----------------------  
concepts: 266            
properties: 95           
links: 204               
cells: 0                 
nodeRefConstraints 0     
nodePropConstraints 0    
behaviorMethods 0        
type system rules 0      
mapping rules 0          
statements 721           
intentions 0             
testgens 0               
-------------------------
LOC: 1962.1999999999998  
```

### License manager

> ^^com.mbeddr.mpsutil.licensemanager.common^^

!!! warning "This language contains some classes of an old mbeddr licensemanager and will probably be removed in the future."

### Make

> ^^com.mbeddr.mpsutil.make^^

!!! warning "This plugin contains old fixes for rebuilding models/modules and projects that are already included in MPS. The plugin will be removed soon."

### Multilingual

!!!warning "This language might be removed in the future."

> ^^com.mbeddr.mpsutil.multilingual^^

The idea behind this language was to store text translations in properties files and load the through the Java [ResourceBundle](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ResourceBundle.html) class. The documentation for the language
can be found [here as a PDF](../../files/multilingual.pdf) and is located in the virtual package ^^doc.com.mbeddr.mpsutil^^.

### Node difference

> ^^com.mbeddr.mpsutil.nodediff^^

!!! warning "These actions were used to structurally compare two nodes and are deprecated. Please use the official action [Compare Two Nodes](http://127.0.0.1:63320/node?ref=r%3A5ec7bf64-acd2-448b-8f9b-ce1b8d920038%28jetbrains.mps.vcs.plugin%29%2F8199015172308449938) instead."

### RCP configuration

> ^^com.mbeddr.mpsutil.rcpconfig^^

!!! warning "This solution contains an old build script for the mbeddr RCP. It is deprecated and will be removed soon."

### Run configuration

> ^^com.mbeddr.mpsutil.runconfiguration^^

!!! warning "This language was used as a workaround for accessing the debuggle node in [breakpoint creators](http://127.0.0.1:63320/node?ref=r%3Af516737e-c915-4042-896e-de34190042b2%28jetbrains.mps.debugger.api.lang.structure%29%2F3157158168562217892). The expression is now officially supported, this language is deprecated and will be removed soon."

### Test scope

> ^^com.mbeddr.mpsutil.testScope^^

!!! warning "This language is deprecated. Please use the official [testing scopes](https://www.jetbrains.com/help/mps/testing-languages.html#testingscopes) instead."

### Var scope

> ^^com.mbeddr.mpsutil.varscope^^

!!! warning "This language used to provide the interfaces `IScopeElement` and `IScopeProvider` to provide scopes for nodes but is now deprecated. Please use the official [scopes](https://www.jetbrains.com/help/mps/scopes.html) instead."
