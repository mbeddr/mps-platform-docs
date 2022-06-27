# Misc Topics

## Windows and none ASCII chars

Compilation from the command line might fail due to none ASCII chars when run on windows and possibly also on Linux. The error message will look something like this:

```
[generate] NewLanguage\behavior\rtzj__BehaviorDescriptor.java : Invalid character constant (line: 27) 
```

If this happens the environment variable `JAVA_TOOL_OPTIONS` should be set to `"-Dfile.encoding=UTF8"`.

The issue is tracked upstream at JetBrains as [MPS-23526](https://youtrack.jetbrains.com/issue/MPS-23526)

## Limitations to PLE when generating variant aware code

#### Introduction
The current PLE approach only generates a single variant. The generated artifacts aren't variant aware. We want to enable the that the generated code can contain #if statements to generate all variants at once. When we want to do this we have to limit variability to elements where we can represent this in the generated C code. The main problem is that presence conditions can't be applied to all nodes in the model.

##### What does not work?

In additions to elements with a cardinality of 1 there are other items that can't be removed from the AST with presence conditions:

- Parameters of a function
- Arguments from function calls
- Additional declarations of for loops
- variable   initializers
- expressions in array/user defined type initializers
- Arguments of function macros (global function declarations)


##### Code smells

- Replacement of functioncall expr where parent is expression statement
    + Replace complete statement to generate readable code

## How to use Java Classes Shipped in MPS Plugins

For this example, we assume we want to use classes from the "git4idea" plugin inside our code.

1. Create a solution "MySolution"
2. Create a model ending with ".plugin", e. g. "MySolution.plugin"
3. Add the language "jetbrains.mps.lang.plugin.standalone" to both the "MySolution.plugin" model and the "MySolution" solution.
4. Create a "StandalonePluginDescriptor" in the "MySolution.plugin" model.
5. Add the "MySolution" to a build model (referred to as MySolution.build).
6. Create an idea plugin the build model with id "MySolution.IdeaPlugin".
7. Add MySolution.build to the idea plugin "MySolution.IdeaPlugin" content.
8. Add the dependency on "git4idea" to "MySolution.IdeaPlugin" dependencies.
9. Execute the build script.
10. In properties of solution "MySolution", on the Facets tab, check "Idea Plugin".
11. In newly appearing Idea Plugin tab, set Pugin ID to "MySolution.IdeaPlugin".
12. Restart MPS.

Now the classes within "git4idea" are available within "MySolution".

**Attention:** MPS IDE will not build the code within solution "MySolution" anymore. We need to run the build script to activate any changes.

## How to add a jar to MPS

1. Open module properties
2. On "Common" tab, click on "+ Add Model Root"
3. Select "javaclasses"
4. Make sure the newly created "(java_classes)" entry is selected on the left-hand side
5. Select a folder containing jars or a jar on the right-hand side
6. Click "Models"

Now we should have stubs to reference things inside the jar from other MPS models. However, javac will still fail.

7. In module properties, open "Java" tab
8. If the module is a solution, select Solution kind "Other"
9. On libraries, click "+"
10. Select the folder or jar from step 5 above

### Classloading issues

In some cases you might get conflicts with existing libraries that MPS already ships. For instance while using the `SAXBuilder`. In these cases you will get a class version exception or similar. As a work around you can set the classloader and the current thread while instantiating such classes:

```java
ClassLoader cl = Thread.currentThread().getContextClassLoader(); 
try { 
  Thread.currentThread().setContextClassLoader(this.getClass().getClassLoader()); 
  SAXBuilder sax = new SAXBuilder(); 
  return sax.build(f); 
} finally { 
  Thread.currentThread().setContextClassLoader(cl); 
}
```

This will prevent the exception but make sure to set the class loader back when you are finished. Also calling things written in MPS like behavior methods when the class loader is changes is like to not work and gives you all kind of strange exceptions.

## How to Debug MPS with IntelliJ

Tamas made a good video to set up IntelliJ for remote debugging of MPS on Mac (see here: https://www.youtube.com/watch?v=y3pFmlYDaXo). On Windows this is slightly different, because the VM Options cannot be passed using the `Info.plist` file. Instead, additional VM options should be set in the `mps.bat` script that can be found in the MPS installation directory. Just copy the first entry from the Run Configuration in IntelliJ to set the environment variable `ADDITIONAL_JVM_ARGS`, i.e.

    set ADDITIONAL_JVM_ARGS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005

(line 39 in my case)