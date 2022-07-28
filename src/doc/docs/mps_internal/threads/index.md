References:

- [Common Concurrency Pitfalls in Java](https://www.baeldung.com/java-common-concurrency-pitfalls)
- [IDEA threading model | developerlife.com](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/#idea-threading-model)
- [Modality and invokeLater() | IntelliJ Platform SDK](https://plugins.jetbrains.com/docs/intellij/general-threading-rules.html#modality-and-invokelater)
- [The Event Dispatch Thread | Oracle Java documentation](https://docs.oracle.com/javase/tutorial/uiswing/concurrency/dispatch.html)

Regardless of the calling thread, writing and reading MPS models always need to performed holding an appropriate lock.
IntelliJ IDEA also requires read and write locks in its platform. The IDEA's lock is acquired first and only then the MPS's lock is acquired when using
the MPS access language.
The MPS locks are described in [Managing concurrent access | MPS](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage).

## Main thread

- some operations need to be run there in order to keep race conditions from occurring
- the UI freezes when operations take a long time (run them in the background)
- Write MPS model: `write action with`
- Read MPS model: `read action with`

## AWT event dispatch thread (EDT) / UI Thread

- drawing of components in MPS/IntelliJ IDEA is done through [Swing](https://www.tutorialspoint.com/swing/swing_quick_guide.htm)
- Swing isn't thread safe, most of the Swing code runs in EDT.
- EDT = series of short tasks such as the `actionPerformed` method of a button.
- Tasks must be short or the UI becomes unresponsive.
- Synchronously write/read MPS model: `command with`.
- Asynchronously write MPS model: `execute command in EDT with`.
- Asynchronously read MPS model: `execute in EDT with`.
- The *in EDT* commands allow to read/write the MPS model and perform EDT-related UI activities
- `#!java ApplicationManager.getApplication().assertIsDispatchThread()` or `#!java ThreadUtils.isInEDT()`

## Background threads

- [Progress indicators | MPS](https://www.jetbrains.com/help/mps/progress-indicators.html)
- Extend class *Task* and run it in a modal dialog or in the background
- They must be invoked on EDT through `#!java ApplicationManager.getApplication.invokeLater`
  - synchronous: `#!java ApplicationManager.getApplication.invokeAndWait`
- Don't call it with `#!java SwingUtilities.invokeLater` in the Intellij platform/MPS because it doesn't respect the modality state.
- modality state = background or an open dialog
- The class `ThreadUtils` contains `runInUIThreadAndWait` which takes a `Runnable` instance as a parameter and uses the right method based on the calling context
- When there are many tasks, pooled threads can be used: [Introduction to Thread Pools in Java | baeldung.com](https://www.baeldung.com/thread-pool-java-and-guava)