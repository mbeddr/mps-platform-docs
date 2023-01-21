---
tags:
- mps_extensions
- mbeddr
- iets3
---

This list explains some common abstract concepts and interfaces that you can use to extend or use the functionality of the platforms.

## Mbeddr

### Base

#### [Assessment](http://mbeddr.com/userguide/UserGuideExport.html#sid3231021218602645814)

To extend assessments, extend the class [AssessmentQuery](AssessmentQuery) to create a new query. The result of the query has to extend the class [AssessmentResult](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F865293814733133833). The interface [AssessmentSummary](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F671216505796427448) must also be extended to provide a summary of the results.

Example:

![example for an assessment query: interpreter coverage](example_interpreter_coverage.png)


#### Chunk

A node of the class [Chunk](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F7139820346881560230) has several properties: it has a name, acts as a scope provider for elements, can import other elements or vice versa. It also integrates with the tree view and provides a graph of all the chunk hierarchy including imports. It also detects dependency cycles.

Example:

![example: simple library with an import](example_library.png)

#### ICommentable

Concepts or interfaces that implement [ICommentable](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F7024921229556133800) can be commented out by typing `//` or `/*` as long as it is not trigger by a node that implements [IEmpty](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F1049346859912912067).

#### IDocumentable

Add support for documenting nodes when implementing the [IDocumentable](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F3857533489766146432) interface. The text node is using the language `de.slisson.mps.richtext` and supported text and embedded nodes.

#### ITreeViewable

Implement the interface [ITreeViewRoot] to use the Tree tool. It is a tool that can show a tree structure when this interface is implemented.

Example: IETS3 call tree of functions

![iets3 call tree of functions](iets3_calltree.png)

#### IContainerOfUniqueNames

The interface [IContainerOfUniqueNames](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F5095889050031055796) checks that the provided names are indeed unique and shows and error otherwise. For qualified names, implement the interface [IHasQualifiedName](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F5227231181399633032).

#### IDetectCycle

The interface [IDetectCycle](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F5939454523704167063) can be implemented to detect cyclic dependencies. This feature is used, for example, with chunks that import other chunks.

#### IEmpty

The interface [IEmpty](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F1049346859912912067) can be implemented to support empty lines. Error messages are automatically suppressed and the node is also not shown in the outline.

#### Name related interfaces

The interface [IIdentifierNamedConcept](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F7024921229555594291) can be used for concept that should have a valid identifier. Check the [property constraint](http://127.0.0.1:63320/node?ref=r%3A7a2f88d6-4108-4d29-b499-cc4de14ea970%28com.mbeddr.core.base.constraints%29%2F7024921229555594296) to understand how it works.

The interface [INameAllUpperCase](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F8628579007224193612), [INameFirstCharLowerCase](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F8628579007224192794) and [INameFirstCharUpperCase](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F8628579007224193610) can be used to further constraint the identifier name.

#### IMbeddrIDERoot

Concepts that implement the interface [IMbeddrIDERoot](http://127.0.0.1:63320/node?ref=r%3Af7764ca4-8c75-4049-922b-08516400a727%28com.mbeddr.core.base.structure%29%2F13085436577882829) show up in the *New Roots* menu that's shown above the normal *new* menu of the context menu. It adds the following features: custom name for the menu entry, root concept sorting and custom categories for the root concepts.

## IETS3

### General

#### ISolvable

The interface [ISolvable](http://127.0.0.1:63320/node?ref=r%3A9e71c0de-f9ab-4b67-96cc-7d9c857513f6%28org.iets3.analysis.base.structure%29%2F5067755556171617239) can be implemented to create solver tasks that could be executed by a solver such as [Z3](https://github.com/Z3Prover/z3). To enable the solver for a node, implement the interface [IUseSolver](http://127.0.0.1:63320/node?ref=r%3A9e71c0de-f9ab-4b67-96cc-7d9c857513f6%28org.iets3.analysis.base.structure%29%2F9051170899708928820). A solver task must extend the concept [AbstractSolverTask](http://127.0.0.1:63320/node?ref=r%3A9e71c0de-f9ab-4b67-96cc-7d9c857513f6%28org.iets3.analysis.base.structure%29%2F8571724170506775997). The concept that can be mapped to the solver must implement [ICanBeMappedToSolver](http://127.0.0.1:63320/node?ref=r%3A9e71c0de-f9ab-4b67-96cc-7d9c857513f6%28org.iets3.analysis.base.structure%29%2F5553107600697040451).

#### ICanRunCheckManually

The interface [ICanRunCheckManually](http://127.0.0.1:63320/node?ref=r%3A657c9fde-2f36-4e61-ae17-20f02b8630ad%28org.iets3.core.base.structure%29%2F4450571177430728250) can be implemented to support running checks that are executed through one of the actions (runAllManuallyOnModel, runAllManuallyOnRoot, runManuallyOnContainer etc.) or are executed through intentions. The result of a check can be stored as a user object of a node. The interface also supports updating the editor with the test results, for example, highlighting the background of a test with a color and refreshing the editor.

Example:

![KernelF: run check manually](run_check_manually.gif)


#### IOptionallyNamed

Use the interface [IOptionallyNamed](http://127.0.0.1:63320/node?ref=r%3A657c9fde-2f36-4e61-ae17-20f02b8630ad%28org.iets3.core.base.structure%29%2F229512757698888199) for concepts that should support an optional name. You can also use this name in smart references.

#### IValidNamedConcept

As an alternative to the mbeddr interfaces, you can use the interface [IValidNamedConcept](http://127.0.0.1:63320/node?ref=r%3A657c9fde-2f36-4e61-ae17-20f02b8630ad%28org.iets3.core.base.structure%29%2F229512757699383348) for valid identifiers that are valid in KernelF.


### Expressions

To add a new expression, extend the concept [Expression](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7425695345928347719). The new concept can be commented out and documented by default.

#### ICanBeLValue

Implement the interface [ICanBeLValue](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F195141004745586068) when the concept can be used as the [left value](https://en.wikipedia.org/wiki/Value_(computer_science)?oldformat=true#Assignment:_l-values_and_r-values) of expressions such as assignments. Variable references, paths and dot expression can be left values.

#### IDotTarget

Implement the interface [IDotTarget](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9002563722476995146) to support custom operations for the dot expression. It can be used, for example, to add new operations for collections, enumerations, math, state machines and many more.

#### IEmptyLiteral

The interface [IEmptyLiteral](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F915344943735946072) is a marker interface used to mark literals that at runtime evaluate to an empty value.

#### ILiteral

Implement the interface [ILiteral](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600710395780) to add support for a new literal. For primitive types such as integers and strings, extend the concept [PrimitiveLiteral](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8379605524044170035) instead. Register an extension for the [primitiveTypeMapper](http://127.0.0.1:63320/node?ref=r%3A6c6155f0-4bbe-4af5-8c26-244d570e21e4%28org.iets3.core.expr.base.plugin%29%2F1085994689350268573) extension point when using custom primitive literals. The standard implementation is the [SimpleTypesPrimitiveTypeMapper](http://127.0.0.1:63320/node?ref=r%3A5bf19129-2710-45a6-906e-9ee2d0977853%28org.iets3.core.expr.simpleTypes.plugin%29%2F3910975805742593968).

#### Effects

Since KernelF is by default immutable, some language extensions allow side effects such as the language *org.iets3.core.expr.mutable*. To add custom concepts that have affects, implement the interfaces [IMayAllowEffect](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F952298261448780116) and [IMayHaveEffect](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7791618349053901166).

#### IOptionallyTyped

Use the interface [IOptionallyTyped](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7089558164905593724) to add an optional type to an expression. The expression automatically used the provided type as its own type.

#### ITraceRoot

Nodes that want to be the root of [tracing](../interpreter/#tracing-in-kernelf), should implement the interface [ITraceRoot](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8505972469205863874)

#### Custom types

Custom types must extend the concept [Type](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7425695345928349204). If the type supports a default value (e.g. `false` for the boolean type and `0` for a numeric type), also implement the interface [ITypeSupportsDefaultValue](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6932772747669856399).

#### IWantNewLine

The concepts of expressions that need to be on a new line such as try expressions, block expressions and sometimes tables, need to implement the interface [IWantNewLine](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1134276681297127890). This interface affects the layout of some expressions such as if expressions and function bodies.

#### Tests

To add a new test statement, extend the concept [AbstractTestItem](http://127.0.0.1:63320/node?ref=r%3Aba7faab6-2b80-43d5-8b95-0c440665312c%28org.iets3.core.expr.tests.structure%29%2F8219602584783477664). If the editor needs to be updated after the test item was executed, override the method [performAdditionalEditorUpdate](http://127.0.0.1:63320/node?ref=r%3A7961970e-5737-42e2-b144-9bef3ad8d077%28org.iets3.core.expr.tests.behavior%29%2F4314247060317840957).

### Top-level

#### IToplevelExprContent

Implement the interface [IToplevelExprContent](http://127.0.0.1:63320/node?ref=r%3Ada65683e-ff6f-430d-ab68-32a77df72c93%28org.iets3.core.expr.toplevel.structure%29%2F2861782275883475449) to allow an expression to be used at the topmost level similar to the [ExpressionStatement](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1068580123155) in *baselanguage*.

### Collections

When implementing custom operations for collections such as maps, lists and sets, use one of the provided concepts as the base concept (for example [NoArgCollectionOp](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339795488) and [OneArgCollectionOp](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340020764)). If there is no suitable concept, implement one of the interfaces such as [ICollectionOp](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339790458) and [IMapOneArgOp](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7757419675865128281). If this is still not possible, you can still implement [IDotTarget](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9002563722476995146) directly.

## MPS-extensions

### Richtext

#### IWord

Implement the interface [IWord](http://127.0.0.1:63320/node?ref=r%3Aca2ab6bb-f6e7-4c0f-a88c-b78b9b31fff3%28de.slisson.mps.richtext.structure%29%2F2557074442922392300) to add new embeddable nodes to the text.
