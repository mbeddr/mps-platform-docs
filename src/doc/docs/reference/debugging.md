# Debugging

See also: Specific Languages Blog &mdash; [Debugging in MPS](https://specificlanguages.com/articles/debugging/){target=_blank}

- Tools --> Internal Actions provide many useful debugging features, e.g. the UI Inspector (Swing debugging)
- Right-Click --> Preview Generated Text: show the result of the M2T transformation (e.g. generated code) for the current node
- Inspect Node: Right-Click --> Show Node in Explorer;
- Inspector: Right-Click → Inspect Node
- Right-Click -->  Language Debug
    - Show Type: show Type system Type of current node
    - Goto Rule which caused Error: find Checking-Rule/Constraint, which caused an error
    - Show Cell in Explorer: debug Editor Cells and Collections
    - Show Generation Traceback: debug the Generator: in Transient Models you can find the source node for the generated (intermediate) node
- Find Action: Help → Find Action or ++ctrl+shift+a++ if you forgot the name of your action
- Adapting IDE settings
    - Two locations: bin folder (MPS/IDE folder) and Preferences folder (overwrites bin-folder)
    - JVM: bin/mps.vmoptions (RAM/Xmx, debugger port, …)
    - Log-level (Log4J): bin/log.xml 	
    - IDEA Properties: bin/idea.properties: change default paths, advanced IDE settings, …
- Log file: is stored in the Logs folder, e.g. `Logs/<My-MPS-/My-RCP-Identifier>/idea.log`
- Where stores MPS user-specific files (configuration, caches, plugins, logs, and so on)
    - [Default IDE directories](https://www.jetbrains.com/help/mps/2020.1/tuning-the-ide.html#default-dirs)


# General Blog posts

- [24 debugging tips and tricks](https://dev.to/humblefool_2/24-debugging-tips-and-tricks-b4c)
- [The Debugger Checklist – Part I](https://talktotheduck.dev/the-debugger-checklist-part-i)
- [The Debugger Checklist – Part II](https://talktotheduck.dev/the-debugger-checklist-part-ii)
- [Debugging tips](https://jonskeet.uk/csharp/debugging.html)
- [10 Debugging Tips for Beginners](https://blog.hartleybrody.com/debugging-code-beginner/)