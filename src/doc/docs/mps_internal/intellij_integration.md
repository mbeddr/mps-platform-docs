---
tags:
- internals
- intellij
---

The different plugins of MPS are declared using a [plugin configuration file](https://plugins.jetbrains.com/docs/intellij/plugin-configuration-file.html). The functionality is split into [plugin components](https://plugins.jetbrains.com/docs/intellij/plugin-components.html). `application-components` are activated when MPS starts, `project-components`
are activated when a project is opened.

MPS uses existing [IntelliJ extension points](https://plugins.jetbrains.com/docs/intellij/plugin-extension-points.html). For a list of all extension points and listeners have a look at
[Extension Point and Listener List | IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/extension-point-list.html). New extension points are declared in a section *extensionPoints* where
a qualified name and the interface to implement have to be provided. The interface has to contain an extension point name
declaration. Example:

```java
public interface IntentionActionsProvider {
  ExtensionPointName<IntentionActionsProvider> EP_NAME = new ExtensionPointName<>("com.intellij.mps.IntentionActionsProvider");

  @NotNull
  AnAction[] getIntentionActions(@NotNull IntentionExecutable intention);
}
```

The extensions can be registered in an *extensions* block in the *plugin.xml*. The default extension namespace has to be
`com.intellij` ([example](https://github.com/JetBrains/MPS/blob/683a16f879f97bbfcb77b22b41890e5306c93c31/IdeaPlugin/mps-vcs/META-INF/plugin.xml#L37)). The extension can also have attributes ([example](https://github.com/JetBrains/MPS/blob/683a16f879f97bbfcb77b22b41890e5306c93c31/workbench/mps-platform/source/jetbrains/mps/LanguageLibrary.java#L26)).

Link to different MPS plugin.xml files:

- [Execution Api and Utility Languages](https://github.com/JetBrains/MPS/blob/master/plugins/execution-api/META-INF/plugin.xml)
- [Execution configurations](https://github.com/JetBrains/MPS/blob/master/plugins/execution-configurations/META-INF/plugin.xml)
- [MPS Ant Integration: Make](https://github.com/JetBrains/MPS/blob/master/plugins/mps-ant-make/META-INF/plugin.xml)
- [MPS Build Language](https://github.com/JetBrains/MPS/blob/master/plugins/mps-build/META-INF/plugin.xml)
- [MPS Context Actions Tool](https://github.com/JetBrains/MPS/blob/master/plugins/mps-context-actions/META-INF/plugin.xml)
- [MPS Diagram Editor](https://github.com/JetBrains/MPS/blob/master/plugins/mps-diagram-editor/META-INF/plugin.xml)
- [Make](https://github.com/JetBrains/MPS/blob/master/plugins/mps-make/META-INF/plugin.xml)
- [MPS Tooltips](https://github.com/JetBrains/MPS/blob/master/plugins/mps-tooltips/META-INF/plugin.xml)
- [JetBrains MPS Integration](https://github.com/JetBrains/MPS/blob/master/plugins/mps-idea-integration/IDEAPlugin/META-INF/plugin.xml)
- [Migration Support](https://github.com/JetBrains/MPS/blob/master/plugins/mps-migration/META-INF/plugin.xml) (+[plugin base](https://github.com/JetBrains/MPS/blob/master/plugins/mps-migration/migration-platform/pluginBase.xml))
- [Debugger API for MPS](https://github.com/JetBrains/MPS/blob/master/plugins/debugger-api/META-INF/plugin.xml)
- [Java Debugger for MPS](https://github.com/JetBrains/MPS/blob/master/plugins/debugger-java/META-INF/plugin.xml)
- [JetPad](https://github.com/JetBrains/MPS/blob/master/plugins/jetpad/META-INF/plugin.xml)
- [Idea Integration for MPS](https://github.com/JetBrains/MPS/blob/master/plugins/mps-idea-integration/META-INF/plugin.xml)
- [MPS Java Integration](https://github.com/JetBrains/MPS/blob/master/plugins/mps-java/META-INF/plugin.xml)(+[Java platform](https://github.com/JetBrains/MPS/blob/master/plugins/mps-java/META-INF/JavaPlatform.xml))
- [MPS console](https://github.com/JetBrains/MPS/blob/master/plugins/mps-console/META-INF/plugin.xml)(+[actions](https://github.com/JetBrains/MPS/blob/master/plugins/mps-console/META-INF/ConsoleActions.xml))
- [Languages DevKit](https://github.com/JetBrains/MPS/blob/master/plugins/mps-devkit/META-INF/plugin.xml)
- [Memory Tool](https://github.com/JetBrains/MPS/blob/master/plugins/mps-memtool/META-INF/plugin.xml)
- [Model Checker](https://github.com/JetBrains/MPS/blob/master/plugins/mps-modelchecker/META-INF/plugin.xml)
- [MPS Version Control Support](https://github.com/JetBrains/MPS/blob/master/IdeaPlugin/mps-vcs/META-INF/plugin.xml)
- [IDEA Core](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/source/META-INF/IdeaPlugin.xml)(+[other files](https://github.com/JetBrains/MPS/tree/master/workbench/mps-workbench/source/META-INF))

Included in other plugins:

- [editor actions](https://github.com/JetBrains/MPS/blob/master/workbench/mps-editor/source_gen/jetbrains/mps/ide/editor/actions/MPSEditorActions.xml)
- [editor](https://github.com/JetBrains/MPS/blob/master/workbench/mps-editor/source/META-INF/MPSEditor.xml)
- [Java platform actions](https://github.com/JetBrains/MPS/blob/master/plugins/mps-java/META-INF/JavaPlatformActions.xml)
- [MPSCore](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/source/META-INF/MPSCore.xml)
- [PlatformActions](https://github.com/JetBrains/MPS/blob/master/workbench/mps-ui/source_gen/jetbrains/mps/ide/platform/actions/PlatformActions.xml)

All the plugins use the [charisma reporter](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/source/jetbrains/mps/ide/blame/CharismaReporter.java) for error reporting.
This allows reporting errors to YouTrack. Another notable extension is the declaration of the MPS language library. For example:
```xml
<mps.LanguageLibrary dir="/languages" />
```

It tells MPS where in the plugin folder the compiled MPS languages can be found.
