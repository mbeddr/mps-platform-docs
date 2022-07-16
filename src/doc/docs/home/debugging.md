# Debugging

See also: Specific Languages blog: [Debugging in MPS](https://specificlanguages.com/articles/debugging/)

- The menu entry tools → `Internal Actions` provides many useful debugging features, for example, the UI Inspector (Swing debugging)
- right-click → `Preview Generated Text`: show the result of the M2T transformation (for example generated code) for the current node
- inspect Node: right-click → `!#text Show Node in Explorer`
- inspector: right-click → `Inspect Node`
- right-click → `Language Debug`
    - `#!text Show Type`: show type system type of current node
    - `#!textGoto Rule which caused Error`: find Checking-Rule/Constraint, which caused an error
    - `#!textShow Cell in Explorer`: debug Editor Cells and Collections
    - `#!textShow Generation Traceback`: debug the Generator: in transient models you can find the source node for the generated (intermediate) node
- Find Action: Help → `Find Action` or ++ctrl+shift+a++ if you forgot the name of your action
- Adapting IDE settings
    - Two locations: bin folder (MPS/IDE folder) and Preferences folder (overwrites bin-folder)
    - JVM: bin/mps.vmoptions (RAM/Xmx, debugger port, …)
    - Log-level (Log4J): bin/log.xml 	
    - IDEA Properties: bin/idea.properties: change default paths, advanced IDE settings, …
- Log file: is stored in the Logs folder, e.g. `Logs/<My-MPS-/My-RCP-Identifier>/idea.log`

!!! question "How do I debug action maps?"

    Set a breakpoint in `CellActionExecutorFinder`.

# General Blog posts

- [24 debugging tips and tricks](https://dev.to/humblefool_2/24-debugging-tips-and-tricks-b4c)
- [The Debugger Checklist – Part I](https://talktotheduck.dev/the-debugger-checklist-part-i)
- [The Debugger Checklist – Part II](https://talktotheduck.dev/the-debugger-checklist-part-ii)
- [Debugging tips](https://jonskeet.uk/csharp/debugging.html)
- [10 Debugging Tips for Beginners](https://blog.hartleybrody.com/debugging-code-beginner/)