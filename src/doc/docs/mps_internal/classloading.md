# Classloading

## Classloaders

Different classloaders exist: bootstrap-class-loader, IDEA plugin classloaders and module class loaders.
Loading a class into an MPS module involves the module class loader, the class of its dependencies and the bootstrap-class-loader.
If a class comes from a jar in the MPS/lib folder (a bootstrap-loaded class), you practically can’t load another version of it.
They also have different life cycles.

Module class loaders can reload classes after rebuilding and are resilient towards hot reloading.
IDEA plugin class loaders are just for the installed plugins and didn't know what to do if a class needs reloading during runtime in the past. New versions of the intelliJ platform know how to reload classes, but now we’re with MPS’ implementation.
The IDEA plugin classloaders load jars from the /plugins/<plugin-name>/lib directory.
Jars from the /lib directory of the RCP are loaded from the root class loader. For your RCP, you usually don't want to put anything there.
Code inside an IDEA plugin classloader may not access classes from module-class loaders but vice versa is fine
If you pass a module-loaded class to an IDEA plugin-loaded class and reload the module-loaded class, and then try to access the stale class, you might get a *ClassNotFoundException*.
If you register a class in the plugin.xml, you should make sure it can be loaded from the IDEA plugin classloader. To do so, add its jar to the /lib folder of your intellij-plugin.

| location                         | description                             | Java class                                    |
|----------------------------------|-----------------------------------------|-----------------------------------------------|
| MPS/lib                          | root class loader,boostrap class loader | com.intellij.util.lang.UrlClassLoader         |
| /plugins/<plugin-name>/lib       | IDEA plugin class loader                | com.intellij.ide.plugins.cl.PluginClassLoader |
| any mps module with a java facet | module class loader                     | jetbrains.mps.classloading.ModuleClassLoader  |

## How to use Java classes shipped in MPS plugins

For this example, assume that you want to use classes from the *git4idea* plugin inside your code.

### Solution 1

1. Create a solution *MySolution*.
2. Create a model ending with ".plugin," for example *MySolution.plugin*.
3. Add the language ^^jetbrains.mps.lang.plugin.standalone^^ to both the *MySolution.plugin* model and the *MySolution* solution.
4. Create a *StandalonePluginDescriptor* in the model *MySolution.plugin*.
5. Add the *MySolution* to a build model named *MySolution.build*.
6. Create an idea plugin the build model with id *MySolution.IdeaPlugin*.
7. Add *MySolution.build* to the idea plugin *MySolution.IdeaPlugin* content.
8. Add the dependency on *git4idea* to *MySolution.IdeaPlugin* dependencies.
9. Execute the build script.
10. In properties of solution *MySolution*, on the Facets tab, select *Idea Plugin*.
11. In newly appearing Idea Plugin tab, set plugin ID to *MySolution.IdeaPlugin*.
12. Restart MPS.

Now the classes within *git4idea* are available within *MySolution*.

Attention: MPS IDE won't build the code within solution *MySolution* anymore. Run the build script to activate any changes.

### Solution 2

You can find an example [here](https://github.com/modelix/modelix/blob/master/mps/solutions/org.modelix.git4idea.withJavaFacet/org.modelix.git4idea.withJavaFacet.msd).

1. Create a solution *git4idea.withJavaFacet*.
2. Edit the created msd file and make the following modifications:
```xml
  <solution>
    ...
  <models>
    <modelRoot contentPath="${module}" type="default">
      <sourceRoot location="models" />
    </modelRoot>
    <modelRoot contentPath="${mps_home}/plugins/git4idea/lib" type="java_classes">
      <sourceRoot location="git4idea-rt.jar" />
      <sourceRoot location="git4idea.jar" />
    </modelRoot>
  </models>
  <facets>
    <facet type="java" languageLevel="JAVA_8">
      <classes generated="true" path="${module}/classes_gen" />
    </facet>
    <facet pluginId="Git4Idea" type="ideaPlugin" />
  </facets>
  <stubModelEntries>
    <stubModelEntry path="${mps_home}/plugins/git4idea/lib/git4idea-rt.jar" />
    <stubModelEntry path="${mps_home}/plugins/git4idea/lib/git4idea.jar" />
  </stubModelEntries>
  <sourcePath />
  <dependencies>
    ...
  </dependencies>
    ...
</solution>
```

The jar files are directly referenced from the mps plugins folder. The jars are then loaded as part of the Git4Idea facet.

## Classloading issues

Sometimes you might get conflicts with existing libraries that MPS already ships. For instance while using the `SAXBuilder`. In these cases, you will get a class version exception or similar. As a workaround, you can set the classloader and the current thread while instantiating such classes:

```java
class ClassLoading {
    void setClassLoader() {
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        try {
            Thread.currentThread().setContextClassLoader(this.getClass().getClassLoader());
            SAXBuilder sax = new SAXBuilder();
            return sax.build(f);
        } finally {
            Thread.currentThread().setContextClassLoader(cl);
        }
    }   
}
```

This prevents the exception but make sure to set the class loader back when you finish. Calling things written in MPS like behavior methods when the class loader changes is also likely to not work and gives you all kinds of strange exceptions.