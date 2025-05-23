---
comments: true
tags:
- internals
- plugins
- java_integration
---

# Classloading

Class loading is a process of dynamically loading Java classes into the Java Virtual Machine (JVM) at runtime. It is performed by an instance of the *java.lang.ClassLoader* class, which is responsible for finding, loading, and initializing the classes. Class loading is essential for the Java runtime system, as it allows the JVM to run Java programs without knowing about the underlying files or file systems. In MPS, you can reload
most classes when they change automatically or through the action *Reload All Classes* to reload the classes of all modules.

## Classloaders

Bootstrap class loaders, IDEA plugin class loaders, and module class loaders are the different available class loaders.
Loading a class into an MPS module involves the module class loader, the class of its dependencies, and the bootstrap class loader.
If a class comes from a JAR in the MPS/lib folder (a bootstrap-loaded class), you practically can’t load another version of it.
They also have different life cycles.

Module class loaders can reload classes after rebuilding and are resilient toward hot reloading.
IDEA plugin class loaders are just for the installed plugins, and they don't know what to do if a class needs reloading during runtime in the past. New versions of the IntelliJ platform know how to reload classes, but now we’re within the MPS implementation.

The IDEA plugin class loaders load JARs from the */plugins/&lt;plugin-name>/lib* directory.
Jars from the */lib* directory of the RCP are loaded from the root class loader. For your RCP, you usually don't want to put anything there.
Code inside an IDEA plugin class loader may not access classes from module class loaders, but vice versa is fine.
If you pass a module-loaded class to an IDEA plugin-loaded class and reload the module-loaded class, and then try to access the stale class, you might get a *ClassNotFoundException*.
If you register a class in the plugin.xml, you should make sure it can be loaded from the IDEA plugin class loader. To do so, add its JAR to the /lib folder of your IntelliJ plugin.

| location                         | description                             | Java class                                    |
|----------------------------------|-----------------------------------------|-----------------------------------------------|
| MPS/lib                          | root class loader,boostrap class loader | com.intellij.util.lang.UrlClassLoader         |
| /plugins/<plugin-name>/lib       | IDEA plugin class loader                | com.intellij.ide.plugins.cl.PluginClassLoader |
| any MPS module with a Java facet | module class loader                     | jetbrains.mps.classloading.ModuleClassLoader  |

## How to Use Java Classes Shipped in Mps Plugins

For this example, assume that you want to use classes from the *git4idea* plugin inside your code.

### Solution (Old)

1. Create a solution *MySolution*.
2. Create a model ending with ".plugin," for example *MySolution.plugin*.
3. Add the language ^^jetbrains.mps.lang.plugin.standalone^^ to both the *MySolution\.plugin* model and the *MySolution* solution.
4. Create a *StandalonePluginDescriptor* in the model *MySolution.plugin*.
5. Add *MySolution* to a build model named *MySolution.build*.
6. Create an idea plugin with ID *MySolution\.IdeaPlugin*.
7. Add *MySolution\.build* to the idea plugin *MySolution\.IdeaPlugin* content.
8. Add the dependency on *git4idea* to *MySolution\.IdeaPlugin* dependencies.
9. Execute the build script.
10. In properties of solution *MySolution*, on the Facets tab, select *Idea Plugin*.
11. In the newly appearing Idea Plugin tab, set the plugin ID to *MySolution\.IdeaPlugin*.
12. Restart MPS.

Now the classes within *git4idea* are available within *MySolution*.

Attention: MPS IDE won't build the code within solution *MySolution* anymore. Run the build script to activate any changes.

### Solution (New)

You can find an example [here](https://github.com/modelix/modelix/blob/master/mps/solutions/org.modelix.git4idea.withJavaFacet/org.modelix.git4idea.withJavaFacet.msd).

1. Create a solution *git4idea.withJavaFacet*.
2. Edit the created .msd file and make the following modifications:
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

The JAR files are directly referenced from the MPS plugins folder. The JARs are then loaded as part of the Git4Idea facet.

## Classloading Issues

Sometimes you might get conflicts with existing libraries that MPS already ships. For instance, while using the `SAXBuilder`. In these cases, you will get a class version exception or similar. As a workaround, you can set the class loader and the current thread while instantiating such classes:

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

## Questions

!!! question "How can you load resources from modules?"

    - [Adding resources to MPS modules](https://specificlanguages.com/posts/2022-05/16-adding-resources-to-mps-modules/){{ blog('sl') }}

This prevents the exception, but make sure to set the class loader back when you finish. Calling things written in MPS, like behavior methods when the class loader changes, is also likely to not work and gives you all kinds of strange exceptions.

- [Making Apache POI work with MPS 2020.3: solving class loader hell](https://specificlanguages.com/posts/2022-03/15-apache-poi-classloader-hell/){{ blog('sl') }}
- [A weird ClassCastException](https://specificlanguages.com/posts/2022-04/20-a-weird-class-cast-exception/){{ blog('sl') }}