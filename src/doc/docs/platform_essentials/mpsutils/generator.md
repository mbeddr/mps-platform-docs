# Generator

## Generator Facade

> ^^com.mbeddr.mpsutil.generatorfacade^^

This language contains a class [GeneratorFacade](http://127.0.0.1:63320/node?ref=r%3A00bd75cf-1225-4ef5-9a7e-390aed8718dd%28com.mbeddr.mpsutil.generatorfacade.runtime%29%2F5915735921188775088) that helps with running the generator. It contains a method
`runGenerator` with different signatures that can run the generator with a specific generation plan for a defined model
with a custom handler for generator messages and custom generation parameters such as *save transient models* (default: *false*) or
*generate in parallel* (default: yes, 4 threads).

## GenUtil

> ^^com.mbeddr.mpsutil.genutil^^

This language helps with managing user objects and creating temporary nodes for them:

```
createTempNode{hello -> "world"};
```

This expression creates a new node and assigns Base Language expressions to keys of it. The keys are set internally with
the *setref* statement which takes a key, a context node (here: the newly created node), and a target expression, and creates
a new user object for this node. For normal values, *setref* and *getref* should be used to set and retrieve
values from the user object respectively. For int values, *setint* and *getint* can be used.

## Mapping Labels

> ^^com.mbeddr.mpsutil.mappingLabels^^

This language provides intentions for automatically creating [mapping labels](https://www.jetbrains.com/help/mps/generator-language.html#mappinglabel). One of the use cases is to migrate [reference macros](https://www.jetbrains.com/help/mps/generator-language.html#macro) that use strings to identify target nodes to resolve the target by mapping labels instead.

## postprocessGeneratedFiles

> ^^com.mbeddr.mpsutil.postprocessGeneratedFiles^^

Add a new node *generated files postprocessor facet* to the plugin aspect of a language to declare a new facet that
is executed after files are generated (textGen). It supports post-processor functions that have a *node* parameter and
a *path* parameter that contains the path of the generated file. This method can be, for example, used to copy the generated
files to a different folder:

```java
generated files postprocessor facet testGen
 
(node, path)->void {
    Path target = Paths.get("/var/tmp/testGen").resolve(path.getFileName());
    message info "Copying " + path + " to " + target, <no project>, <no throwable>;
    try {
    Files.createDirectories(target.getParent());
    Files.copy(path, target, StandardCopyOption.REPLACE_EXISTING);
    } catch (IOException e) {
    e.printStackTrace();
    }
}
```

For simple duplicating the TextGen outcome, There's also the built-in JetBrains annotation [CopyOutcome](http://127.0.0.1:63320/node?ref=r%3A4d7d5410-8d5a-45f2-a2f2-a6b7b42a377e%28jetbrains.mps.lang.makeup.structure%29%2F1223283106984741523).

## XModel Actions

> ^^com.mbeddr.mpsutil.xmodel.actions^^

This language adds actions for automatically deriving [generation plans](https://www.jetbrains.com/help/mps/generation-plan.html).
For a single or list of modules, there's the action `Generation Plan for Languages` which can be found in the context menu that
opens when you right-click the modules in the logical view. There's also an action *Derive Generation Plan* which derives
a generation plan for a model that has to be selected in a dialog that opens when executing this action. It can be found
in the same places as the text preview action (for example, in the context menu of models).

