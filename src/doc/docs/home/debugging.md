---
tags:
- troubleshooting
---

# Debugging

> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.
> 
> (Brian Kernighan)

If you need help with general debugging topics, read: [How do I Debug my Program?](http://websites.umich.edu/~eecs381/generalFAQ/Debugging.html)
For more in-depth explanations regarding debugging in MPS, visit:

- [Debugging in MPS](https://specificlanguages.com/articles/debugging/){{ blog('sl') }}
- [White paper on Debugging in MPS](https://dslfoundry.com/whitepaper-on-debugging-in-mps/){{ blog('dslf') }}
- [Debugging MPS with IntelliJ setup](/files/debugging-MPS-with-IntelliJ_Setup.pdf)

The following list shows some debugging tips:

- The menu entry *Tools* --> *Internal Actions* provides many useful debugging features, for example, the UI Inspector (Swing debugging).
- Right-click --> *Preview Generated Text*: Show the result of the M2T transformation (for example, generated code) for the current node
- To inspect the node, right-click --> *Show Node in Explorer*
- To open the inspector, right-click --> *Inspect Node*
- Right-click in the editor and select *Language Debug*:
    - *Show Type*: Show the type system type of the current node.
    - *Rule which caused Error*: Find the checking rule/constraint which caused the error.
    - *Cell in Explorer*: Debug editor cells and collections.
    - *Generation Traceback*: Debug the generator. In transient models, you can find the generated (intermediate) node's source node.
- Find Action: *Help* --> *Find Action* or ++ctrl+shift+a++ if you forgot the name of your action.
- Changing IDE settings
    - 2 locations: bin folder (MPS/IDE folder) and preferences folder (overwrites bin folder)
    - JVM: *bin/mps.vmoptions* (RAM/Xmx, debugger port, …)
    - Log-level (Log4J): *bin/log.xml* 	
    - IDEA properties: *bin/idea.properties*: change default paths, advanced IDE settings
- Log file: is stored in the logs folder, for example, `Logs/<My-MPS-/My-RCP-Identifier>/idea.log`

!!! question "How do I debug action maps?"

    Set a breakpoint in [CellActionExecutorFinder](http://127.0.0.1:63320/node?ref=r%3Afa6df9a8-26a8-40dd-9b99-6ccc8d453556%28com.mbeddr.mpsutil.grammarcells.runtime.insertpopup%29%2F3077579741543265862).

## Free Java Debugging Tools

Since MPS is a Java application, you can use standard Java debugging tools. Not all of them work well. Tools that pause threads can also
cause issues with MPS. Especially VisualVM tends to freeze MPS. A better profiler is [YourKit](https://www.yourkit.com/java/profiler/features/) which is a commercial product.

- [VisualVM](https://quinnkeast.medium.com/word-choices-and-language-in-ux-part-three-user-interface-labels-messages-c1a383793e6a)
    - display process configuration and environment (e.g., Java/MPS version, JVM arguments, system properties)
    - monitor process performance and memory (e.g., CPU/heap usage, loaded classes, threads)
    - visualize process threads (e.g., dispatch thread)
    - profile performance and memory usage (e.g., CPU usage)
    - take and display thread dumps (e.g., find [deadlocks](https://docs.oracle.com/javase/tutorial/essential/concurrency/deadlock.html))
    - take and browse heap dumps (e.g., find memory leaks)
    - analyze core dumps (e.g., crashed Java processes)

    ![VisualVM](visualvm.png)

- [Memory Analyzer (MAT)](https://www.eclipse.org/mat/)
    - find memory-related issues such as memory leaks

    ![Memory Analyzer (MAT)](http://www.eclipse.org/mat/about/overview.png)

- [JDK Mission Control](https://www.oracle.com/java/technologies/javase/products-jmc8-downloads.html)
    - [troubleshoot memory leaks](https://docs.oracle.com/en/java/javase/11/troubleshoot/troubleshooting-memory-leaks.html#GUID-8090B138-6E0C-4926-9659-BE739062AB75)
    - [Troubleshoot Performance Issues Using Flight Recorder](https://docs.oracle.com/en/java/javase/11/troubleshoot/troubleshoot-performance-issues-using-jfr.html#GUID-0FE29092-18B5-4BEB-8D8D-0CBA7A4FEA1D)

    ![JDK Mission control](https://docs.oracle.com/en/java/javase/11/troubleshoot/img/garbage_collection_performance_automated_analysis_results_7_1_2.png)

- [jstack.review - Java Thread Dump Analyzer](https://jstack.review/#tda_1_dump)

## Decompiler

Decompiling jar files usually shouldn't be necessary because the source code of [MPS](https://github.com/JetBrains/MPS), [IntelliJ Community](https://github.com/JetBrains/intellij-community), [JetBrainsRuntime](https://github.com/JetBrains/JetBrainsRuntime), and the MPS platforms is open source and available on GitHub. For all other cases,
use the [JD Java Decompiler](http://java-decompiler.github.io/). The [Java Decompiler IntelliJ plugin](https://plugins.jetbrains.com/plugin/7100-java-decompiler) also is capable of doing this task.

## General Blog Posts

- [24 debugging tips and tricks](https://dev.to/humblefool_2/24-debugging-tips-and-tricks-b4c)
- [The Debugger Checklist – Part I](https://talktotheduck.dev/the-debugger-checklist-part-i)
- [The Debugger Checklist – Part II](https://talktotheduck.dev/the-debugger-checklist-part-ii)
- [Debugging tips](https://jonskeet.uk/csharp/debugging.html)
- [10 Debugging Tips for Beginners](https://blog.hartleybrody.com/debugging-code-beginner/)