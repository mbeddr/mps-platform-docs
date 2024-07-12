---
comments: true
tags:
- internals
- reference
---

# Reference: Named threads

These lists contain named threads from Java, the IntelliJ platform, and MPS.

## Java Threads

- AWT threads
    - AWT-AppKit: macOS-specific thread
    - AWT-EventQueue: = EDT
    - [AWT-Windows](https://stackoverflow.com/a/21597955/16577108)
    - [AWT-Shutdown](http://srcrr.com/java/oracle/openjdk/6/reference/sun/awt/AWTAutoShutdown.html)
- Image Fetch/Image Animator ([sun.awt.image.ImageFetch](https://github.com/openjdk/jdk/blob/6765f902505fbdd02f25b599f942437cd805cad1/src/java.desktop/share/classes/sun/awt/image/ImageFetcher.java#L32))
- [Get All running JVM Threads | baeldung.com](https://www.baeldung.com/java-get-all-threads)
    - [Finalizer](https://www.baeldung.com/java-finalize)
    - Reference handler: a high-priority thread to enqueue pending references ([References](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/ref/Reference.html)).
    - Signal Dispatcher: handles signals sent by the operating system to the JVM.
- Java2D
    - [Java2D Disposer](https://stackoverflow.com/a/7959447/16577108jav)
    - Java2D Queue flusher
- TimerQueue ([java.swing.TimerQueue](https://resources.mpi-inf.mpg.de/d5/teaching/ss05/is05/javadoc/javax/swing/TimerQueue.html))
- Timer ([java.util.Timer](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Timer.html))
- Common-Cleaner ([java.lang.ref.Cleaner](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/ref/Cleaner.html))
- [Attach Listener](https://stackoverflow.com/a/8251753/16577108)
- GC Thread: [garbage collector](https://www.baeldung.com/jvm-garbage-collectors) thread
- CMS Thread and CMD Main Thread: Thread of the [concurrent mark sweep collector](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/cms.html).
- [VM Thread](https://stackoverflow.com/a/50774669/16577108)
- [Service Thread](https://stackoverflow.com/a/65227754/16577108)
- [C1/C2 CompilerThread](https://dzone.com/articles/jvm-c1-c2-compiler-thread-high-cpu-consumption)
- [Sweeper thread](https://stackoverflow.com/questions/55666827/what-are-threads-i-e-lightweight-processes-named-java-created-for#:~:text=Sweeper%20thread%20cleans%20up%20obsolete,runs%20cleaning%20actions%20of%20java)
- [JPWP](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/introclientissues005.html)
- [VM Periodic Task Thread](https://stackoverflow.com/a/5259870/16577108)
- JDI ([Java Debug Interface](https://www.baeldung.com/java-debug-interface))
    - Debug Events Processor Thread
    - JDI Internal Event Handler
    - JDI Target VM Interface

## IntelliJ Platform Threads

- Alarm Pool ([Alarm](https://github.com/JetBrains/intellij-community/blob/4ca3ccd49776e9a298773fcf26f6cb4a10afc06c/platform/ide-core/src/com/intellij/util/Alarm.java#L32))
- Flushing Daemon ([FlushingDaemon](https://github.com/JetBrains/intellij-community/blob/master/platform/ide-core-impl/src/com/intellij/util/FlushingDaemon.java))
- ApplicationImpl ([ApplicationImpl](https://github.com/JetBrains/intellij-community/blob/79bf4b1ae08162fb2154fd0d058d8a8e31fa23a2/platform/core-api/src/com/intellij/openapi/application/Application.java#L20))
- Periodic tasks thread ([AppDelayQueue](https://github.com/JetBrains/intellij-community/blob/4ca3ccd49776e9a298773fcf26f6cb4a10afc06c/platform/util/src/com/intellij/util/concurrency/AppDelayQueue.java#L14))
- BaseDataReader ([com.intellij.util.io.BaseDataReader](https://github.com/JetBrains/intellij-community/blob/master/platform/util/src/com/intellij/util/io/BaseDataReader.java))
    - the error stream of X
    - the output stream of X
    - the setsid stream of X
- I/O pool ([ProcessIOExecutorService](https://github.com/JetBrains/intellij-community/blob/4ca3ccd49776e9a298773fcf26f6cb4a10afc06c/platform/util/src/com/intellij/execution/process/ProcessIOExecutorService.java#L12))
- JobScheduler FJ pool ([IdeaForkJoinWorkerThreadFactory](https://github.com/JetBrains/intellij-community/blob/master/platform/boot/src/com/intellij/concurrency/IdeaForkJoinWorkerThreadFactory.java))
- Document Committing Pool ([DocumentCommitThread](https://github.com/JetBrains/intellij-community/blob/master/platform/core-impl/src/com/intellij/psi/impl/DocumentCommitThread.java))
- FileBasedIndex Vfs Event Processor ([ChangedFilesCollector](https://github.com/JetBrains/intellij-community/blob/master/platform/lang-impl/src/com/intellij/util/indexing/events/ChangedFilesCollector.java))
- Indexing ([IndexUpdateRunner](https://github.com/JetBrains/intellij-community/blob/master/platform/lang-impl/src/com/intellij/util/indexing/contentQueue/IndexUpdateRunner.java))
- ForkJoinPool ([ForkJoinPool](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/concurrent/ForkJoinPool.html))
- Action Updater ([ActionUpdater](https://github.com/JetBrains/intellij-community/blob/master/platform/platform-impl/src/com/intellij/openapi/actionSystem/impl/ActionUpdater.java))
- fsnotifier: native file system notifier
- [DestroyJavaVM](https://stackoverflow.com/a/61063914/16577108)

## MPS Threads

- Highlighter: performs model checks in update sessions and updates the editor. Checking rules are run, for example, inside this thread ([Highlighter](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/Highlighter.java)).
- HighlightUsages: highlights references to the node at the cursor position in the editor ([HighlightUsagesSupport](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source_gen/jetbrains/mps/editor/runtime/HighlightUsagesSupport.java)).
- CompletionHelper: automatically opens the code completion menu that was introduced in MPS 2021.2 ([CompletionHelper](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/cellMenu/CompletionHelper.java)).
- MPS EDT Executor: invokes read/write/command task asynchronously on the EDT thread ([EDTExecutorInternal](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/source/jetbrains/mps/smodel/EDTExecutorInternal.java)).
- MPS interrupting thread: augments the IDEA Platform write action with functionality essential for MPS ([](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/source/jetbrains/mps/smodel/TryRunPlatformWriteHelper.java)).
- ChangesManager command queue: queue for tasks of the VCS changes manager ([CurrentDifferenceRegistry](https://github.com/JetBrains/MPS/blob/master/plugins/mps-vcs/vcs-platform/solutions/jetbrains.mps.ide.vcs.platform/source_gen/jetbrains/mps/vcs/changesmanager/CurrentDifferenceRegistry.java))
- Intentions: Shows or hides intentions
- MPS Make Thread: Thread that executes a make task ([MakeTask](https://github.com/JetBrains/MPS/blob/master/workbench/mps-platform/jetbrains.mps.ide.platform/source_gen/jetbrains/mps/ide/make/MakeTask.java))
- generation-thread: generator thread ([GenerationTaskPool](https://github.com/JetBrains/MPS/blob/master/core/generator/source/jetbrains/mps/generator/impl/GenerationTaskPool.java))
- TextGen-thread: text generator thread ([TextGeneratorEngine](https://github.com/JetBrains/MPS/blob/76b099c00163c96001d9a1f75c4ae7f59a10e8a4/core/textgen/source/jetbrains/mps/text/TextGeneratorEngine.java#L50))

## Other Threads

- AnimatorThread (removed class of com.intellij.util.ui.Timer)
- Poller SunPKCS11-Darwin (macOS-specific thread)
- [process reaper](https://stackoverflow.com/a/3836230/16577108) (Linux/macOS specific thread)
- Batik CleanerThread ([org.apache.batik.util.CleanerThread](https://xmlgraphics.apache.org/batik/javadoc/org/apache/batik/util/CleanerThread.html))
- [Netty Builtin Server](https://www.jetbrains.com/help/idea/php-built-in-web-server.html)
- [kotlinx.coroutines.DefaultExecutor](https://reflectoring.io/understanding-kotlin-coroutines-tutorial/)