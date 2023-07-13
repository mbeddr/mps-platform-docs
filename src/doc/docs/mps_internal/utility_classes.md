---
hide:
- toc
tags:
- internals
- reference
- utility
---

# Utility Classes

Utility classes of other languages can contain reusable methods that can be interesting for your own languages. They often have
the suffix *Util* or *Helper*. Classes ending with *Manager* also can have those methods. You can access them through static
*getInstance* methods or, if they are core components, through *jetbrains.mps.project.Project#getComponent*. To find new methods,
search for nodes named \[TOPIC]+ \[suffix] e.g. "UI" + "Util" becomes *UIUtil*. If you work closely with MPS languages,
search their runtime models for useful methods. For example, *jetbrains.mps.ide.httpsupport.runtime.base* contains a utility class
[HttpSupportUtil](http://127.0.0.1:63320/node?ref=r%3A11b7cdb2-cc58-456e-bb9a-ce45b78edd2f%28jetbrains.mps.ide.httpsupport.runtime.base%29%2F4403308017443708918) that helps with the HTTP Support plugins.

| **Class**                                                                                                   | **Description**                                                                            |
|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| {{ mps_url("@mps.internal.make.runtime.util.DirUtil") }}                                                    | directory-related utilities                                                                |
| {{ mps_url("@mps.lang.pattern.util.MatchingUtil") }}                                                        | tests if two nodes match                                                                   |
| {{ mps_url("@mps.newTypesystem.SubtypingUtil") }}                                                           | subtyping related utilities                                                                |
| {{ mps_url("@mps.smodel.CopyUtil") }}                                                                       | utility for copying models and nodes                                                       |
| {{ mps_url("@mps.util.FileUtil") }}                                                                         | related utilities                                                                          |
| {{ mps_url("@mps.util.JavaNameUtil") }}                                                                     | utilities related to Java naming                                                           |
| {{ mps_url("@mps.util.NameUtil") }}                                                                         | name-related utilities, such as pluralizing or escaping strings                            |
| {{ mps_url("@mps.ide.datatransfer.CopyPasteUtil") }}/{{ mps_url("@mps.ide.datatransfer.TextPasteUtil") }}   | copy-paste related utilities                                                               |
| {{ mps_url("@mps.workbench.action.ActionUtils") }}                                                          | action-related utilities; these methods can execute actions programmatically.              |
| {{ mps_url("@mps.ide.newSolutionDialog.NewModuleUtil") }}                                                   | utilities associated with creating new modules, such as creating solutions or languages    |
| {{ mps_url("@mps.smodel.tempmodel.TemporaryModels") }}                                                      | utilities for creating temporary models                                                    |
| {{ mps_url("com.intellij.util.ui.UIUtil") }}                                                                | utilities related to the IntelliJ UI, such as checking for dark mode (`isUnderDarcula()`). |
| {{ mps_url("@mps.tool.common.PathManager") }}/{{ mps_url("com.intellij.openapi.application.PathManager") }} | classes for getting all kinds of paths, such as the plugins or log folder.                 |
| {{ mps_url("@mps.classloading.ClassLoaderManager") }}                                                       | class responsible for loading (MPS) classes                                                |
| {{ mps_url("@mps.findUsages.FindUsagesManager") }}                                                          | class that has methods for invoking the find usage UI                                      |
| {{ mps_url("@mps.generator.impl.CloneUtil") }}                                                              | utility method for cloning a model                                                         |
| {{ mps_url("@mps.generator.ModelDigestUtil") }}                                                             | class that contains hash methods                                                           |
| {{ mps_url("@mps.ide.findusages.FindUtils") }}                                                              | class for finding nodes in MPS                                                             |
| {{ mps_url("@mps.lang.pattern.util.MatchingUtil") }}                                                        | method for checking if two nodes structurally match                                        |
| {{ mps_url("@mps.newTypesystem.SubTypingManagerNew") }}                                                     | subtyping related methods such as `isSubTypeOf`  and  `collectImmediateSupertypes`.        |
| {{ mps_url("@mps.newTypesystem.SubtypingUtil") }}                                                           | subtyping related methods such as `leastCommonSuperTypes`.                                 |
| {{ mps_url("@mps.persistence.PersistenceUtil") }}                                                           | methods for saving and loading models                                                      |
| {{ mps_url("@mps.project.ModelsAutoImportsManager") }}                                                      | utility methods related to auto-importing models                                           |
| {{ mps_url("@mps.project.ProjectManager") }}                                                                | project-related methods, such as creating projects and attaching listeners to projects     |
| {{ mps_url("@mps.smodel.CopyUtil") }}                                                                       | methods for copying models and nodes                                                       |
| {{ mps_url("@mps.smodel.ModelAccessHelper") }}                                                              | methods for running code as a command/read/write action                                    |