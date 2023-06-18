---
alias: performance
---

!!! warning "This is a page about advanced topics. Please skip it if you are a beginner."

This page explains common bottlenecks regarding memory consumption and performance in MPS in general and how to solve those problems.
If you want to know about slow software in general (e.g. hardware-related slowness), read: [Slow Software | Ink & Switch](https://www.inkandswitch.com/slow-software/).

## General

- Read the page [Advanced Configuration](https://www.jetbrains.com/help/mps/tuning-the-ide.html) in the official documentation. You are especially interested in setting `-Xmx` and `-Xms`.
- Do not invalidate the cache when restarting the project, if it isn't necessary. The reindexing can take a while for large projects.
- [Speeding up model checks with Scope Cache](Speeding up model checks with Scope Cache) (< MPS 2021.2)
- Often accessed data should be cached ([How to implement caching in Java](https://medium.com/analytics-vidhya/how-to-implement-cache-in-java-d9aa5e9577f2))
- Don't recalculate expensive calculations but rather save the results in variables.
- Different data structures have different time and space complexities. For example, selecting a different list implementation can have big improvements on performance ([Big-O Cheat Sheet](https://www.bigocheatsheet.com/))
- Make sure to iterate nodes or editor cell trees efficiently. Narrow down the nodes that you want to iterate over e.g. `model.roots(ClassConcept)` instead of
 `model.nodes(<all>)`. `nodesIncludingImported()` can also create huge scopes. The same is true for searching in the console: snippets such as `#nodes<scope = global>` should be avoided. For deep structures, `node.descendants`can also be expensive.
- When using scopes, avoid using a [GlobalScope](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.project%28MPS.Core%2F%29%2F%7EGlobalScope). Try to also use the following snippets for filtering models that often shouldn't be searched because they are not indexed:
    - `#modules.where({~it => it.isPackaged() })`to filter out modules that are installed
    - `#models.where({~it => TemporaryModels.isTemporary(it) })` to filter temporary models
- Throwing exceptions and especially fatal errors that are shown in the lower right corner of the window are slow. Short
  freezes before the errors are thrown are sometimes the result of that.

## Generator

- Disabling transient models through the button in the bottom right corner of the MPS frame will increase generation performance significantly especially
  in combination with the generator option *Apply transformations in place*.

- TODO: add generator performance slides from the MPS Meetup

### Model pruning

Often, not all nodes have to be processed in the generator. We might have different build configurations where we are interested
in only a subset of nodes, or we don't use [cross-model generation](https://www.jetbrains.com/help/mps/generation-plan.html#cross-modelgeneration) and
need to copy nodes from different models to the current model. Sometimes additional information is attached to nodes. Such attributes
or nodes don't have to be generated at all. Having too many nodes to be processed can have memory impacts as well as make the generator a lot slower.

Model pruning can be achieved by using an allowlist or blocklist approach: either specify which nodes should be processed or which nodes
shouldn't be processed. Both approaches can also be combined. The following simplified approach is one possible solution to achieve this:

1. Collect all original root nodes: `#!java model.roots(<all>).select({~it => genContext.get original copied input for (it); })`
2. Create a pruning condition that decides which nodes can be pruned and collect the other nodes (relevant nodes). You might also want to keep a list of relevant root concepts that shouldn't be pruned.
3. Start from a specific node and iterate through its descendants and follow only the references that are allowed by the pruning condition. You might want to
include also other nodes that are not reachable by reference that are still needed for the generation.
4. Make copies of the roots of nodes that are relevant and shouldn't be pruned.
5. Iterate through the children of the copies. If a child is not a relevant node, detach it from its parent node.
6. Clear the original content from the input model and add the relevant roots to the input model.

## Editor

### Big roots render slowly

The initial rendering time increases with the size of the AST. MPS tries to cache parts of the editor once built and after the initial render it will only update the parts that require changes, but collecting the necessary dependency information to achieve this incrementality takes time.
How big is too big? Thousands of descendants are going to take several seconds to render. Re-layouting the editor should therefore also not be invoked
too often (manually or programmatically).

{{ contribution_by('sergej-koscejev') }}

### Long-running checking rules on big roots

When a root is displayed in the editor, checking rules are run in the background. The background checker can be interrupted between rules but not during the execution of a rule. When checking rules are too expensive for live checking set the flag *do not apply on the fly* to true.
Type system calculations are cached by default but can also impact performance when they have to be recalculated too often. 

{{ contribution_by('sergej-koscejev') }}

## MPS-Extensions

- The [diagram](https://jetbrains.github.io/MPS-extensions/extensions/editor/diagrams/) language saves layout information in node attributes. That means
 that auto re-layouting the diagram creates a lot of changes in the diff view for this root node. The auto-layouting can be influenced through
 an option in the editor's definition of the diagram.
- Tables and diagrams disable incremental rendering. That means that the editor will not be updated incrementally causing a full update on each typed character.
  This might also affect the type-system calculations (MPS_EXTENSIONS-579)
- Using horizontal or vertical lines or any styles from  ^^de.itemis.mps.editor.celllayout.styles language^^ (such as *_grow-x* or *_grid-layout-flatten*) will cause a top-down layout algorithm to be activated for the editor. This algorithm is slower than the usual MPS re-layout and is also called more often for some reason, slowing down the incremental editor update.

## KernelF

- The [code coverage collection](http://localhost:8000/mps-platform-docs/platform_essentials/interpreter/#code-coverage) is global. That means that you either
have to empty it after some time with `#! DefaultCoverageAnalyzer.reset()` or start the interpreter without coverage. The class
[IETS3ExprEvalHelper](http://127.0.0.1:63320/node?ref=r%3A83e946de-2a7f-4a4c-b3c9-4f671aa7f2db%28org.iets3.core.expr.base.behavior%29%2F4065005624681052837) has methods for evaluating nodes with and without coverage.
- The [interpreter](http://mbeddr.com/interpreter/Interpreter.html) framework can be slow when the interpreter is invoked often.
  There might be [faster alternatives](https://www.nikostotz.de/blog/high-performance-interpreters-for-jetbrains-mps/) that are currently not
 implemented though.

## Startup

The startup of MPS can be analyzed with a standard Java profiler such as [YourKit](https://www.yourkit.com/). For IntelliJ [components](https://plugins.jetbrains.com/docs/intellij/plugin-components.html), [services](https://plugins.jetbrains.com/docs/intellij/plugin-services.html) and [extensions](https://plugins.jetbrains.com/docs/intellij/plugin-extensions.html),
it is also possible to use the [IntelliJ Report Analyzer](https://ij-perf.jetbrains.com/#/report). Click on the button
*Get from running instance* to fetch the data from the opened MPS instance. Make sure that the *productCode* in the left textarea
says *MPS* because other IntelliJ IDEs such as IntelliJ IDEA uses the same port.

![IntelliJ report analyzer](intellij_report_analyzer.png){width="600px"}

## Java

If you are interested in internal performance-related topics about Java and its compiler, you might find the following articles helpful:

- [How the JIT compiler optimizes code | ibm.com](https://www.ibm.com/docs/en/sdk-java-technology/8?topic=compiler-how-jit-optimizes-code)
- [The Java HotSpot Performance Engine Architecture | oracle.com](https://www.oracle.com/java/technologies/whitepaper.html)
- [Optimizing compiler | wikipedia.com](https://en.wikipedia.org/wiki/Optimizing_compiler)
- [How the JIT compiler boosts Java performance in OpenJDK | developers.redhat.com](https://developers.redhat.com/articles/2021/06/23/how-jit-compiler-boosts-java-performance-openjdk)
- [Microbenchmarking with Java | baeldung.com](https://www.baeldung.com/java-microbenchmark-harness)
