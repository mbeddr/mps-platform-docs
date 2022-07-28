# Debugging

See also: Specific Languages blog: [Debugging in MPS](https://specificlanguages.com/articles/debugging/)

- The menu entry *Tools* --> *Internal Actions* provides many useful debugging features, for example, the UI Inspector (Swing debugging).
- Right-click --> *Preview Generated Text*: show the result of the M2T transformation (for example generated code) for the current node
- Inspect Node: right-click --> *Show Node in Explorer*
- Inspector: right-click --> *Inspect Node*
- Right-click --> *Language Debug*
    - *Show Type*: show type system type of current node.
    - *Rule which caused Error*: find Checking-Rule/Constraint, which caused an error.
    - *Cell in Explorer*: debug editor cells and collections.
    - *Generation Traceback*: debug the generator. In transient models you can find the source node for the generated (intermediate) node.
- Find Action: *Help* --> *Find Action* or ++ctrl+shift+a++ if you forgot the name of your action.
- Changing IDE settings
    - Two locations: bin folder (MPS/IDE folder) and Preferences folder (overwrites bin-folder)
    - JVM: bin/mps.vmoptions (RAM/Xmx, debugger port, …)
    - Log-level (Log4J): bin/log.xml 	
    - IDEA properties: bin/idea.properties: change default paths, advanced IDE settings
- Log file: is stored in the logs folder, e.g. `Logs/<My-MPS-/My-RCP-Identifier>/idea.log`

!!! question "How do I debug action maps?"

    Set a breakpoint in `CellActionExecutorFinder`.

# Free Java debugging tools

- [VisualVM](https://quinnkeast.medium.com/word-choices-and-language-in-ux-part-three-user-interface-labels-messages-c1a383793e6a)
    - display process configuration and environment (e.g. Java/MPS version, JVM arguments, system properties)
    - monitor process performance And memory (e.g. CPU/heap usage, loaded classes, threads)
    - visualize process threads (e.g. dispatch thread)
    - profile performance And memory usage (e.g. CPU usage)
    - take and display thread dumps (e.g. find [deadlocks](https://docs.oracle.com/javase/tutorial/essential/concurrency/deadlock.html))
    - take and browse heap dumps (e.g. find memory leaks)
    - analyze core dumps (e.g. crashed Java processes)

    ![VisualVM](visualvm.png)

- [Memory Analyzer (MAT)](https://www.eclipse.org/mat/)
    - find memory relates issues such as memory leaks

    ![Memory Analyzer (MAT)](http://www.eclipse.org/mat/about/overview.png)

- [JDK Mission Control](https://www.oracle.com/java/technologies/javase/products-jmc8-downloads.html)
    - [troubleshoot memory leaks](https://docs.oracle.com/en/java/javase/11/troubleshoot/troubleshooting-memory-leaks.html#GUID-8090B138-6E0C-4926-9659-BE739062AB75)
    - [troubleshoot performance issues using flight recorder](https://docs.oracle.com/en/java/javase/11/troubleshoot/troubleshoot-performance-issues-using-jfr.html#GUID-0FE29092-18B5-4BEB-8D8D-0CBA7A4FEA1D)

    ![JDK Mission control](https://docs.oracle.com/en/java/javase/11/troubleshoot/img/garbage_collection_performance_automated_analysis_results_7_1_2.png)

- [jstack.review - Java Thread Dump Analyzer](https://jstack.review/#tda_1_dump)

# General Blog posts

- [24 debugging tips and tricks](https://dev.to/humblefool_2/24-debugging-tips-and-tricks-b4c)
- [The Debugger Checklist – Part I](https://talktotheduck.dev/the-debugger-checklist-part-i)
- [The Debugger Checklist – Part II](https://talktotheduck.dev/the-debugger-checklist-part-ii)
- [Debugging tips](https://jonskeet.uk/csharp/debugging.html)
- [10 Debugging Tips for Beginners](https://blog.hartleybrody.com/debugging-code-beginner/)