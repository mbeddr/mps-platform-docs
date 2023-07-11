# Standard Plugins in MPS

The following list contains the plugins that are installed in MPS 2021.1 and later by default. The changes were collected on the 
command line by executing: `diff -rq path1 path2`

## MPS 

- [mps-build](https://plugins.jetbrains.com/plugin/7078-mps-build-languages): [Build languages](https://www.jetbrains.com/help/mps/build-language.html) (*jetbrains.mps.build*)
- [jetpad](https://github.com/JetBrains/jetpad-projectional-open-source): JetPad Projectional Editing Framework (*jetbrains.jetpad*)
- mps-console: [console](https://www.jetbrains.com/help/mps/mps-console.html) (*jetbrains.mps.console*)
- mps-context-actions: [context actions tool](https://www.jetbrains.com/help/mps/context-actions-tool.html) (*jetbrains.mps.editor.contextActions*)
- [mps-core](https://plugins.jetbrains.com/plugin/7075-mps-core): MPS Core includes core stubs, aspects, Ant-related code, the MPS Kernel, editor, devkits, Base Language, the languages for langue design, the make framework, XML language, etc.
- mps-debugger-api: [Debugger API](https://www.jetbrains.com/help/mps/debugger-api.html) (*jetbrains.mps.debugger.api*)
- mps-debugger-java: [Java debugger for MPS](https://www.jetbrains.com/help/mps/using-mps-debugger.html) (*jetbrains.mps.debugger.java*)
- mps-devkit: a plugin that contains all IDE-related functionality of the language design plugins and Base Language
- mps-diagram-editor: [diagramming editor (deprecated)](https://www.jetbrains.com/help/mps/diagramming-editor.html) (*jetbrains.mps.lang.editor.diagram*)
- mps-execution-api: [Execution Api and Utility Languages](https://www.jetbrains.com/help/mps/run-configurations.html) (*jetbrains.mps.execution.api*)
- mps-execution-configurations: [Execution configuration](https://www.jetbrains.com/help/mps/run-configurations.html#configurations) (*jetbrains.mps.execution.configurations*)
- mps-execution-languages: [Execution languages](https://www.jetbrains.com/help/mps/run-configurations.html) (*jetbrains.mps.execution.configurations*)
- mps-git4idea: [MPS Git integration - stubs](https://github.com/JetBrains/intellij-community/tree/master/plugins/git4idea/src/git4idea) (*jetbrains.mps.git4idea.stubs*)
- mps-httpsupport: [HTTP support plugin](https://www.jetbrains.com/help/mps/http-support-plugin.html) (*jetbrains.mps.ide.httpsupport*)
- mps-java: [MPS Java IDE integrations](https://www.jetbrains.com/help/mps/using-mps-inside-intellij-idea.html) (*jetbrains.mps.ide.java*)
- mps-make: [Make framework](https://www.jetbrains.com/help/mps/howto-integrating-into-the-mps-make-framework.html) (*jetbrains.mps.ide.make*)
- mps-memtool: [Memory tool](https://www.jetbrains.com/help/mps/status-bar.html#:~:text=shows%20the%20current%20heap%20level%20and%20memory%20usage) (*jetbrains.mps.ide.memtool*)
- mps-migration: [Migration support](https://www.jetbrains.com/help/mps/migrations.html) (*jetbrains.mps.ide.migration.workbench*)
- mps-modelchecker: [Model checker](https://www.jetbrains.com/help/mps/typesystem.html) (*jetbrains.mps.ide.modelchecker*)
- mps-project-migrations: Migrations from the previous MPS version (*jetbrains.mps.ide.mpsmigration*)
- mps-samples: Shipped samples for MPS ([Samples to tutorials](https://www.jetbrains.com/help/mps/fast-track-to-mps.html#samplestotutorials:), [other sample projects](https://www.jetbrains.com/help/mps/fast-track-to-mps.html#othersampleprojects))
- [mps-testing](https://plugins.jetbrains.com/plugin/9750-mps-testing): [languages for unit-testing](https://www.jetbrains.com/help/mps/testing-languages.html) Java code and MPS aspects such as editors and the type system
- mps-tooltips: Tooltips for MPS editors; they are showcased in the *Tooltip Sample* (*jetbrains.mps.lang.editor.tooltips*)
- mps-trove: Custom containers designed to work with primitive data types ([trove4j Java library](https://trove4j.sourceforge.net/html/overview.html))
- mps-vcs: [version control integration](https://www.jetbrains.com/help/mps/version-control-integration.html) (*jetbrains.mps.vcs*)

## IntelliJ Plugins

The sources for most of the plugins are in the [plugins folder](https://github.com/JetBrains/intellij-community/tree/master/plugins) of the IntelliJ community repository.

- [copyright](https://plugins.jetbrains.com/plugin/13114-copyright): copyright (*com.intellij.copyright*)
- [github](https://plugins.jetbrains.com/plugin/13115-github): GitHub (*org.jetbrains.plugins.github*)
- java: Java related libraries such as an Ant Javac2 Task, the eclipse standalone compiler, [JetBrains annotations](https://www.jetbrains.com/help/idea/annotating-source-code.html#bundled-annotations), and libraries for the Java Virtual Machine Process Status Tool ([jps](https://docs.oracle.com/javase/7/docs/technotes/tools/share/jps.html))
- [laf-macos/laf-windows10](https://blog.jetbrains.com/idea/2020/04/ui-secrets-customize-the-appearance-of-intellij-idea/) Mac/Windows-specific [theme](https://blog.jetbrains.com/idea/2020/04/ui-secrets-customize-the-appearance-of-intellij-idea/) ([laf=look and feel](https://docs.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html))
- [markdown](https://plugins.jetbrains.com/plugin/7793-markdown): Markdown (*org.intellij.plugins.markdown*)
- [properties](https://plugins.jetbrains.com/plugin/11594-properties): properties (*com.intellij.properties*)
- [properties-resource-bundle-editor](https://plugins.jetbrains.com/plugin/17035-resource-bundle-editor): resource bundle editor (*com.intellij.properties.bundle.editor*)
- [settings-repository](https://plugins.jetbrains.com/plugin/7566-settings-repository): settings repository (*org.jetbrains.settingsRepository*)
- [sh](https://plugins.jetbrains.com/plugin/13122-shell-script): shell script (*com.jetbrains.sh*)
- [svn4idea](https://plugins.jetbrains.com/plugin/11553-subversion): subversion (*Subversion*)
- [tasks](https://plugins.jetbrains.com/plugin/11545-task-management): task management (*com.intellij.tasks*)
- [terminal](https://plugins.jetbrains.com/plugin/13123-terminal): terminal (*org.jetbrains.plugins.terminal*)
- platform-images: image-related functionality (*com.intellij.platform.images*)
- [vcs-changeReminder](https://plugins.jetbrains.com/plugin/13124-changereminder): ChangeReminder (*com.jetbrains.changeReminder*)

## Changes in 2021.2.x

- mps-build-ui: [MPS build wizard](https://www.jetbrains.com/help/mps/building-standalone-ides-for-your-languages.html#thewizardway) (*jetbrains.mps.build.ui*)
- mps-spellcheck: [Spellcheck integration for MPS](https://www.jetbrains.com/help/mps/spellchecking.html) using the IntelliJ plugin [Grazie](https://blog.jetbrains.com/idea/2019/11/meet-grazie-the-ultimate-spelling-grammar-and-style-checker-for-intellij-idea/) (*jetbrains.mps.editor.spellcheck*)

## Changes in 2021.3.x

- mps-ant-make: make execution code (*jetbrains.mps.tool.make*)
- mps-kotlin: MPS Kotlin implementation (*jetbrains.mps.kotlin*)
- mps-navbar: [navigation bar](https://www.jetbrains.com/help/idea/guided-tour-around-the-user-interface.html#navigation-bar) that supports the MPS model hierarchy (*jetbrains.mps.navbar*)

## Changes in 2022.2

No changes.

## Changes in 2022.3

- vcs-git: Git support for IntelliJ products + [git4idea](https://github.com/JetBrains/intellij-community/tree/master/plugins/git4idea/src/git4idea) runtime classes
- vcs-github: GitHub support for IntelliJ products
- vcs-svn: SVN support for IntelliJ products + SQLite library
- Removed plugins: git4idea, github, settings-repository, svn4idea