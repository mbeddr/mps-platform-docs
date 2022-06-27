# Debugging

See also: Specific Languages Blog &mdash; [Debugging in MPS](https://specificlanguages.com/articles/debugging/){target=_blank}

- Tools --> Internal Actions provide many useful debugging features, e.g. the UI Inspector (Swing debugging)
- Right-Click --> Preview Generated Text: show the result of the M2T transformation (e.g. generated code) for the current node
- Inspect Node: Right-Click --> Show Node in Explorer;
- Inspector: Right-Click → Inspect Node
- Right-Click -->  Language Debug
    - Show Type: show Typesystem Type of current node
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
    

## Random

- `SNode::putUserObject()?: You can store and access Java-Objects (as key-value pairs) where you normally could not access them in the mps-context, e.g. storing it as “Node-member” and access it in a editor, a checking-rule or anything else. This approach is difficult to trace and maintain and should only be used in exceptional cases!




Listeners and Message Bus
Message Bus (Message Interface)
General Information
Listen for IntelliJ events/messages
connect and subscribe for different Topics with listeners
just disconnect, you have not to store and remove each listener you added

IntelliJ Messaging Infrastructure
Declarative registration of Plugin Listeners

Provided by
ApplicationManager.getInstance().getMessageBus()
com.intellij.openapi.projectProject::getMessageBus()
Topics
AppTopics
ProjectTopics
Further Topics (type in the mps-console):
#nodes<scope = global>.ofConcept <StaticFieldDeclaration>.where({~it => it.type.isInstanceOf(ClassifierType) && it.type:ClassifierType.?classifier.?name.?equals("Topic"); })
(requires import of language “checkeddots”)

Example



Listeners
Concept Listeners
you can add a listener aspect to a language
there you can add a concept listener for a Concept
it can listen for children, references and properties being added or removed

Other listeners
you can add listeners to, e.g.
SModel
SModule
SRepository
ClassLoaderManager
Application
ActionManager
to listen for e.g.
SNode changes
SModel changes
loading and unloading of models, …
a good place to install them is a Project Plugin
but do not forget to remove them in the dispose block
⇒ but normally you don’t need them, because MPS does the required event-handling

[TODO] invokeLater() (and similar stuff), Threads and Timers
// ApplicationManager.getApplication.invokeLater()
// StartupManager/StartupManagerEx
[TODO] DataContext
// MPSCommonsDataKeys
// CommonDataKeys ...
