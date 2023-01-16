This page lists at most three examples per [Java design pattern](https://refactoring.guru/design-patterns) in the MPS source code.
The headers link to explanations and examples for the corresponding design patterns in the Java world.

## Creational Patterns

### [Abstract Factory](https://refactoring.guru/design-patterns/abstract-factory)

- TODO

### [Builder](https://refactoring.guru/design-patterns/builder)

- [Builders language](https://www.jetbrains.com/help/mps/builders.html)
- [AbstractEditorBuilder](https://www.jetbrains.com/help/mps/editor-language-generation-api.html#languageruntime:%C2%A0abstracteditorbuilder)
- [EditorConfigurationBuilder.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/configuration/EditorConfigurationBuilder.java)

### [Factory method](https://refactoring.guru/design-patterns/factory-method)

- [AbstractContainerTest.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/tests/jetbrains/mps/nodeEditor/cells/collections/AbstractContainerTest.java)
- [EditorCellFactory.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-api/source/jetbrains/mps/openapi/editor/cells/EditorCellFactory.java)
- [Custom cell | MPS documentation](https://www.jetbrains.com/help/mps/editor.html#customcell)

### [Prototype](https://refactoring.guru/design-patterns/prototype)

- [Copyable.java](https://github.com/JetBrains/MPS/blob/master/core/kernel/source/jetbrains/mps/project/structure/modules/Copyable.java)

### [Singleton](https://refactoring.guru/design-patterns/singleton)

- [EditorSettings.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/EditorSettings.java)
- [PersistenceFacade.java](https://github.com/JetBrains/MPS/blob/master/core/openapi/source/org/jetbrains/mps/openapi/persistence/PersistenceFacade.java)
- [GlobalIconManager.java](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/jetbrains.mps.ide.platform/source_gen/jetbrains/mps/ide/icons/GlobalIconManager.java)

## Structural Patterns

### [Adapter](https://refactoring.guru/design-patterns/adapter)

- [GenerationTaskAdapter.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/GenerationTaskAdapter.java)
- [GeneratorLoggerAdapter.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/GeneratorLoggerAdapter.java)

### [Bridge](https://refactoring.guru/design-patterns/bridge)

- [NavigationSupportImpl](https://github.com/JetBrains/MPS/blob/master/IdeaPlugin/mps-core/src/jetbrains/mps/idea/core/navigation/NavigationSupportImpl.java)
- [UpdateSessionImpl](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/updater/UpdateSessionImpl.java)
- [TextBuilderImpl.java](https://github.com/JetBrains/MPS/blob/master/editor/editorlang-runtime/source/jetbrains/mps/editor/runtime/TextBuilderImpl.java)

### [Composite](https://refactoring.guru/design-patterns/composite)

- [CompositeScope.java](https://github.com/JetBrains/MPS/blob/master/core/kernel/kernelSolution/source_gen/jetbrains/mps/scope/CompositeScope.java)
- [CompositeSubstituteInfo.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cellMenu/CompositeSubstituteInfo.java)
- [CompositeResult.java](https://github.com/JetBrains/MPS/blob/master/core/make-runtime/solutions/jetbrains.mps.make.runtime/source_gen/jetbrains/mps/internal/make/runtime/script/CompositeResult.java)

### [Decorator](https://refactoring.guru/design-patterns/decorator)

- [ProgressMonitorDecorator](https://github.com/JetBrains/MPS/blob/master/core/smodel/source/jetbrains/mps/progress/ProgressMonitorDecorator.java)
- [NodeSubstituteInfoFilterDecorator.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cellMenu/NodeSubstituteInfoFilterDecorator.java)
- [ConstraintsFilteringSubstituteMenuPartDecorator.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/lang/editor/menus/substitute/ConstraintsFilteringSubstituteMenuPartDecorator.java)

### [Facade](https://refactoring.guru/design-patterns/facade)

- [GenerationFacade.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/GenerationFacade.java)
- [ModuleRepositoryFacade.java](https://github.com/JetBrains/MPS/blob/master/core/kernel/source/jetbrains/mps/smodel/ModuleRepositoryFacade.java)
- [FindUsagesFacade.java](https://github.com/JetBrains/MPS/blob/master/core/openapi/source/org/jetbrains/mps/openapi/module/FindUsagesFacade.java)

### [Flyweight](https://refactoring.guru/design-patterns/flyweight)

### [Proxy](https://refactoring.guru/design-patterns/proxy)

- [SubstituteItemProxy.java](https://github.com/JetBrains/MPS/blob/master/editor/editorlang-runtime/source/jetbrains/mps/editor/runtime/menus/SubstituteItemProxy.java)
- [RunConfigurationProxy.java](https://github.com/JetBrains/MPS/blob/master/plugins/execution-api/source_gen/jetbrains/mps/execution/api/configurations/RunConfigurationProxy.java)

## Behavioral Patterns

### [Chain of Responsibility](https://refactoring.guru/design-patterns/chain-of-responsibility)

### [Iterator](https://refactoring.guru/design-patterns/iterator)

- [BreadthConceptHierarchyIterator.java](https://github.com/JetBrains/MPS/blob/master/core/openapi/source/org/jetbrains/mps/util/BreadthConceptHierarchyIterator.java)
- [DescendantsTreeIterator.java](https://github.com/JetBrains/MPS/blob/master/core/openapi/source/org/jetbrains/mps/util/DescendantsTreeIterator.java)
- [FilterIterator.java](https://github.com/JetBrains/MPS/blob/master/core/openapi/source/org/jetbrains/mps/util/FilterIterator.java)

### [Memento](https://refactoring.guru/design-patterns/memento)

- [Memento.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/Memento.java)
- [MappingsMemento.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/cache/MappingsMemento.java)
- [BaseNodeEditor.java#BaseEditorState](https://github.com/JetBrains/MPS/blob/21933fd970193ae6a8770a96a4c83857142c2848/workbench/mps-editor/source/jetbrains/mps/ide/editor/BaseNodeEditor.java#L383)

### [State](https://refactoring.guru/design-patterns/state)

- [CaretState.java](https://github.com/JetBrains/MPS/blob/master/editor/editorlang-runtime/source/jetbrains/mps/editor/runtime/cells/CaretState.java)
- [State.java](https://github.com/JetBrains/MPS/blob/master/core/typesystemEngine/source/jetbrains/mps/newTypesystem/state/State.java)
- [CheckpointState.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/plan/CheckpointState.java)

### [Template method](https://refactoring.guru/design-patterns/template-method)

### [Command](https://refactoring.guru/design-patterns/command)

- [Save and revert changes | MPS documentation](https://www.jetbrains.com/help/mps/saving-and-reverting-changes.html) 
- [SubstituteEquationOperation.java](https://github.com/JetBrains/MPS/blob/master/core/typesystemEngine/source/jetbrains/mps/newTypesystem/operation/equation/SubstituteEquationOperation.java)
- [SNodeUndoableAction.java](https://github.com/JetBrains/MPS/blob/master/core/smodel/source/jetbrains/mps/smodel/SNodeUndoableAction.java)
- [RestoreVirtualFileInstance.java](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/source/jetbrains/mps/ide/undo/RestoreVirtualFileInstance.java)

### [Mediator](https://refactoring.guru/design-patterns/mediator)

- [GenerationController.java](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/GenerationController.java)
- [ContextAssistantController.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cells/contextAssistant/ContextAssistantController.java)
- [MigrationScriptsController.java](https://github.com/JetBrains/MPS/blob/master/workbench/mps-workbench/pluginSolutions/lang.script/source_gen/jetbrains/mps/ide/script/migrationtool/MigrationScriptsController.java)

### [Observer](https://refactoring.guru/design-patterns/observer)

- [Messaging Infrastructure | IntelliJ Platform Plugin SDK](https://plugins.jetbrains.com/docs/intellij/messaging-infrastructure.html)
- [SModelListener.java](https://github.com/JetBrains/MPS/blob/master/core/smodel/source/jetbrains/mps/smodel/event/SModelListener.java)
- [ProjectManagerListener.java](https://github.com/JetBrains/MPS/blob/master/core/project/source/jetbrains/mps/project/ProjectManagerListener.java)
- [MPSTreeNodeListener.java](https://github.com/JetBrains/MPS/blob/master/workbench/mps-ui/source/jetbrains/mps/ide/ui/tree/MPSTreeNodeListener.java)

### [Strategy](https://refactoring.guru/design-patterns/strategy)

- [FromModulesListProjectStrategy.java](https://github.com/JetBrains/MPS/blob/master/testbench/source_gen/jetbrains/mps/testbench/junit/runners/FromModulesListProjectStrategy.java)
- [FromProjectPathProjectStrategy.java](https://github.com/JetBrains/MPS/blob/master/testbench/source_gen/jetbrains/mps/testbench/junit/runners/FromProjectPathProjectStrategy.java)
- [FromDirWithModulesProjectStrategy.java](https://github.com/JetBrains/MPS/blob/master/testbench/source_gen/jetbrains/mps/testbench/junit/runners/FromDirWithModulesProjectStrategy.java)

### [Visitor](https://refactoring.guru/design-patterns/visitor)

- [SModelEventVisitor.java](https://github.com/JetBrains/MPS/blob/master/core/smodel/source/jetbrains/mps/smodel/event/SModelEventVisitor.java)
- [IntentionsVisitor.java](https://github.com/JetBrains/MPS/blob/master/editor/intentions-runtime/source/jetbrains/mps/intentions/IntentionsVisitor.java)
- [ModuleVisitor.java](https://github.com/JetBrains/MPS/blob/master/core/kotlin-stub/source_gen/jetbrains/mps/kotlin/stubs/common/metadata/ModuleVisitor.java)