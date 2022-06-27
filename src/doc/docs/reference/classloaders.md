# Classloaders in MPS

- There are bootstrap-class-loader, idea-plugin classloaders and module class loaders
- To load a class into an MPS module, the module class loader, the class of its dependencies and the bootstrap-class-loader are involved.
- If a class comes from a jar in the MPS/lib folder (a bootstrap-loaded class), you practically can’t load another version of it
- they have different life cycles
- module class loaders can easily reload classes after rebuilding and are resilient towards hot reloading
- Idea-plugin class loaders are just for the installed plugins and didn’t know what to do if a class should be reloaded during runtime in the past. New versions of the intelliJ platform know how to reload classes, but now we’re with MPS’ implementation.
- jars from the /plugins/<plugin-name>/lib directory are loaded with the idea-plugin classloaders
- jars from the /lib directory of the RCP are loaded from the root class loader. For your RCP, you usually don't want to put anything there
- code inside an idea-plugin classloader may not access classes from module-class loaders. But vice versa is fine
- if I pass a module-loaded class to an idea-plugin-loaded class and reload the module-loaded class, and then try to access the stale class, I might get a ClassNotFoundException
- If you register a class in the plugin.xml, you should make sure it can be loaded from the idea-plugin classloader. To do so, add it's jar to the /lib folder of your intellij-plugin

| location | description | Java class |
| ----------- | ---------- | ---------- |
| MPS/lib | root class loader,boostrap class loader  | com.intellij.util.lang.UrlClassLoader |
| /plugins/<plugin-name>/lib | idea-plugin class loader | com.intellij.ide.plugins.cl.PluginClassLoader |
| any mps module with a java facet | module class loader | jetbrains.mps.classloading.ModuleClassLoader |