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

# General Blog posts

- [24 debugging tips and tricks](https://dev.to/humblefool_2/24-debugging-tips-and-tricks-b4c)
- [The Debugger Checklist – Part I](https://talktotheduck.dev/the-debugger-checklist-part-i)
- [The Debugger Checklist – Part II](https://talktotheduck.dev/the-debugger-checklist-part-ii)
- [Debugging tips](https://jonskeet.uk/csharp/debugging.html)
- [10 Debugging Tips for Beginners](https://blog.hartleybrody.com/debugging-code-beginner/)