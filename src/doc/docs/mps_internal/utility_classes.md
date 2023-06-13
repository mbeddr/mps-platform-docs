---
tags:
- internals
- reference
- utility
---

# Utility classes

| **Class**                                                                                                   | **Description**                                                                           |
|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| {{ mps_url("@mps.internal.make.runtime.util.DirUtil") }}                                                    | directory related utilities                                                               |
| {{ mps_url("@mps.lang.pattern.util.MatchingUtil") }}                                                        | tests if two nodes match                                                                  |
| {{ mps_url("@mps.newTypesystem.SubtypingUtil") }}                                                           | subtyping related utilities                                                               |
| {{ mps_url("@mps.smodel.CopyUtil") }}                                                                       | utility for copying models, nodes etc.                                                    |
| {{ mps_url("@mps.util.FileUtil") }}                                                                         | related utilities                                                                         |
| {{ mps_url("@mps.util.JavaNameUtil") }}                                                                     | utilities related to java naming                                                          |
| {{ mps_url("@mps.util.NameUtil") }}                                                                         | related utilities such as pluralizing or escaping strings                                 |
| {{ mps_url("@mps.ide.datatransfer.CopyPasteUtil") }}/{{ mps_url("@mps.ide.datatransfer.TextPasteUtil") }}   | copy paste related utilities                                                              |
| {{ mps_url("@mps.workbench.action.ActionUtils") }}                                                          | action related utilities; these methods can execute actions programmatically.             |
| {{ mps_url("@mps.ide.newSolutionDialog.NewModuleUtil") }}                                                   | utilities related to creating new modules such as creating solutions or languages         |
| {{ mps_url("@mps.smodel.tempmodel.TemporaryModels") }}                                                      | utilities for creating temporary models                                                   |
| {{ mps_url("com.intellij.util.ui.UIUtil") }}                                                                | utilities related to the Intellij UI such as checking for dark mode (`isUnderDarcula()`). |
| {{ mps_url("@mps.tool.common.PathManager") }}/{{ mps_url("com.intellij.openapi.application.PathManager") }} | classes for getting all kinds of paths such as the plugins folder or the log folder.      |
| {{ mps_url("@mps.classloading.ClassLoaderManager") }}                                                       | class responsible for loading (MPS) classes                                               |
| {{ mps_url("@mps.findUsages.FindUsagesManager") }}                                                          | class that has methods for invoking the find usage UI                                     |
| {{ mps_url("@mps.generator.impl.CloneUtil") }}                                                              | utility method for cloning a model                                                        |
| {{ mps_url("@mps.generator.ModelDigestUtil") }}                                                             | class that contains hash methods                                                          |
| {{ mps_url("@mps.ide.findusages.FindUtils") }}                                                              | class for finding nodes in MPS                                                            |
| {{ mps_url("@mps.lang.pattern.util.MatchingUtil") }}                                                        | method for checking if two nodes structurally match                                       |
| {{ mps_url("@mps.newTypesystem.SubTypingManagerNew") }}                                                     | subtyping related methods such as `isSubTypeOf`  and  `collectImmediateSupertypes`.       |
| {{ mps_url("@mps.newTypesystem.SubtypingUtil") }}                                                           | subtyping related methods such as `leastCommonSuperTypes`.                                |
| {{ mps_url("@mps.persistence.PersistenceUtil") }}                                                           | methods for saving and loading models                                                     |
| {{ mps_url("@mps.project.ModelsAutoImportsManager") }}                                                      | utility methods related to auto importing models                                          |
| {{ mps_url("@mps.project.ProjectManager") }}                                                                | project-related methods such as creating projects and attaching listeners to projects     |
| {{ mps_url("@mps.smodel.CopyUtil") }}                                                                       | methods for copying models and nodes                                                      |
| {{ mps_url("@mps.smodel.ModelAccessHelper") }}                                                              | methods for running code as a command/read/write action                                   |