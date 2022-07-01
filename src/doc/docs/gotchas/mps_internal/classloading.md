# Classloading

## How to use Java Classes Shipped in MPS Plugins

For this example, we assume we want to use classes from the "git4idea" plugin inside our code.

### Solution 1

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

### Solution 2

An example can be found [here](https://github.com/modelix/modelix/blob/master/mps/solutions/org.modelix.git4idea.withJavaFacet/org.modelix.git4idea.withJavaFacet.msd).

1. Create a solution "git4idea.withJavaFacet".
2. Edit the created msd file and make the following modifications:
```xml
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
```

The jar files are directly referenced from the mps plugins folder. The jars are then loaded as part of the Git4Idea facet.

## Classloading issues

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