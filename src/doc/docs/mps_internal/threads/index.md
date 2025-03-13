---
comments: true
tags:
- internals
- intellij
- ui
---

# Threading

Regardless of the calling thread, writing and reading MPS models always need to be performed holding an appropriate lock.
IntelliJ IDEA also needs read and write locks in its platform. Multiple reads can be done at the same time. When writing should be done,
all reads have to be finished. The IDEA platform's lock is acquired first, and only then the MPS's lock is acquired.

The MPS locks are described in [Managing concurrent access | MPS](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage)
and are **only necessary** if you are accessing the model or specific features of the IntelliJ platform from a different thread. All aspects in your language and declared actions have the necessary lock by default (command access). You most likely only need locking when accessing MPS models from a Swing event handler, such as in the `actionPerformed` method of a button. The locks are of type [ReentrantReadWriteLock](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/locks/ReentrantReadWriteLock.html) (read the JavaDoc for more info).

## AWT Event Dispatch Thread (EDT)

The drawing of components in MPS/IntelliJ IDEA is done through [Java Swing](https://www.tutorialspoint.com/swing/swing_quick_guide.htm). The [event dispatch thread or Swing thread](https://docs.oracle.com/javase/tutorial/uiswing/concurrency/dispatch.html) is used for handling events in Swing because it is not thread-safe, so most of the Swing code runs in this thread. It also handles events from the [Abstract Window Toolkit](https://docs.oracle.com/javase/8/docs/technotes/guides/awt/) and has the thread name *AWT-EventQueue-0*.
In the IntelliJ platform/MPS, it is also called the *UI thread* or *editor thread*. Any writes to the IntelliJ IDE data model ([PSI](https://plugins.jetbrains.com/docs/intellij/psi.html), [VFS](https://plugins.jetbrains.com/docs/intellij/virtual-file-system.html), [project root model](https://plugins.jetbrains.com/docs/intellij/project-structure.html)) must also happen on the *write thread*, which can be the same as EDT in IntelliJ products. In MPS, it is the same thread.

Depending on the access type, you need different locks from the language ^^jetbrains.mps.lang.access^^:

- synchronously read MPS model: `read action with`
- synchronously write MPS model: `write action with`
- synchronously write MPS model with undo: `command with`

Several read actions can be executed in parallel from multiple threads. Note that if a write action is pending, all pending read actions are blocked until the write action completes. This has been known to cause deadlocks sometimes.

In older MPS versions (< 2021.1.5), it was always necessary to use `command with` when writing a model. While it is not necessary anymore, it
is still recommended to use it instead of the `write action with` statements. `write` actions **do not** update the UI automatically. As a tribute to legacy code, access to constant and meta info objects of a node is allowed without read access. It's not encouraged for new code and might change in the future.

If you are not already in the EDT, you need one of the following methods:

- Asynchronously write MPS model: `execute command in EDT with`.
- Asynchronously read MPS model: `execute in EDT with`.

The *in EDT* commands allow to read/write the MPS model and perform EDT-related UI activities and update models of the IntelliJ platform. To check if the current thread is the EDT, call `#!java ApplicationManager.getApplication().assertIsDispatchThread()` or `#!java ThreadUtils.isInEDT()`

The code must also be run on the UI thread to modify the UI. Typically, you would call `#!java SwingUtilities.invokeLater`.
When you are changing the IDE model in the IntelliJ platform (see: [write-safe context](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/#what-is-a-write-safe-context)) or an MPS model, you should use one of the following methods:

- `#!java ApplicationManager.getApplication.invokeLater` (asynchronous) 
- `#!java ApplicationManager.getApplication.invokeAndWait` (synchronously)

If you don't precisely know what you are doing when calling it synchronously, the IDE will freeze.
The reason for those methods is that the so-called [modality state](https://plugins.jetbrains.com/docs/intellij/general-threading-rules.html#modality-and-invokelater) should
be taken into account ,i.e., the stack of modal dialogs under which the call is allowed to execute. Alternatively, there is
also the class `ThreadUtils` which contains the method `runInUIThreadAndWait`, which takes a `Runnable` instance as a parameter and uses the correct method based on the calling context.

## Background Threads

Every code that is executed on the EDT should finish quickly. Long-running code blocks the thread, and the UI becomes unresponsive. Run long-running tasks in the background: [Progress indicators | MPS](https://www.jetbrains.com/help/mps/progress-indicators.html)
The class [Task](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.progress%28MPS.IDEA%2F%29%2F%7ETask) can be extended and run in a modal dialog or in the background. When many tasks should be executed, pooled threads can be used: [Introduction to Thread Pools in Java | baeldung.com](https://www.baeldung.com/thread-pool-java-and-guava). There's also a method for that: `ApplicationManager.getApplication().executeOnPooledThread`.

## Examples

In the following examples, a node is accessed from a background thread or the EDT.

### Reading the Model

=== ":white_check_mark: Different thread with lock"

    ```java
    ApplicationManager.getApplication().executeOnPooledThread(
        { => read action with #project.getRepository() {
            string name = myNode.name;
        }
    })
    ```

=== ":x: Different thread without lock"

    ```java
    // jetbrains.mps.smodel.IllegalModelAccessError: You can read model only inside read actions

    ApplicationManager.getApplication().executeOnPooledThread(
        { => string name = myNode.name; 
        })
    ```

=== ":white_check_mark: EDT with read lock"

    ```java
    // jetbrains.mps.smodel.IllegalModelAccessError: You can read model only inside read actions

    button.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
            read action with #project.getRepository() {
                string name = myNode.name;
            }
        } 
    }
    ```

### Writing the Model (Different Thread)

=== ":white_check_mark: command in EDT lock"

    ```java
    ApplicationManager.getApplication().executeOnPooledThread(
        { => execute command in EDT with #project.getRepository() {
           myNode.name = "newName";
        }}
    )
    ```

=== ":x: command in the wrong thread"

    ```java
    // Access is allowed from write thread only.
    
    ```java
    ApplicationManager.getApplication().executeOnPooledThread(
        { => command with #project.getRepository() {
           myNode.name = "newName";
        }}
    )
    ```

=== ":x: no lock"

    ```java
    // jetbrains.mps.smodel.IllegalModelAccessError: You can read model only inside read actions
    
    ApplicationManager.getApplication().executeOnPooledThread(
        { => myNode.name = "newName"; }
    )
    ```

=== ":question: only write lock"

    ```java
    // < 2021.1.5: jetbrains.mps.smodel.IllegalModelChangeError: registered node can be modified only inside a command or during model loading process
    
    ApplicationManager.getApplication().executeOnPooledThread(
        { => write action with #project.getRepository() {
           myNode.name = "newName";
        }}
    )
    ```

### Writing the Model (EDT)

=== ":white_check_mark: command lock"

    ```java
    ApplicationManager.getApplication().invokeLater(
        { => command in EDT with #project.getRepository() {
           myNode.name = "newName";
        }}
    )
    ```

=== ":x: no lock"

    ```java
    // jetbrains.mps.smodel.IllegalModelAccessError: You can read model only inside read actions
    
    ApplicationManager.getApplication().invokeLater(
        { => myNode.name = "newName"; }
    )
    ```

=== ":question: only write lock"

    ```java
    // < 2021.1.5: jetbrains.mps.smodel.IllegalModelChangeError: registered node can be modified only inside a command or during model loading process
    
    ApplicationManager.getApplication().invokeLater(
        { => write action with #project.getRepository() {
           myNode.name = "newName";
        }}
    )
    ```

### Modifying the UI

=== ":white_check_mark: using Application#invokeLater"

    ```java
    ApplicationManager.getApplication().invokeLater({ => JOptionPane.showInputDialog("Input"); });
    ```

=== ":white_check_mark: using SwingUtilities#invokeLater"

    ```java
    // okay if no MPS/IDE model is accessed

    SwingUtilities.invokeLater({ => JOptionPane.showInputDialog("Input"); });
    ```

=== ":x: called from a thread with IntelliJ write access (e.g., standard MPS code)"

    ```java
    // java.lang.Throwable: AWT events are not allowed inside write action

    OptionPane.showInputDialog("Input")
    ```

=== ":x: called from within MPS read action"

    ```java
    // java.lang.Throwable: AWT events are not allowed inside write action
    
    read action with #project.getRepository() { 
        JOptionPane.showInputDialog("Input");
    }
    ```

### Showing a Notification With Information From the Model

In this example, additional information is shown to the user through a [top-level notification](https://plugins.jetbrains.com/docs/intellij/notifications.html#top-level-notifications-balloons) (balloon).

=== ":white_check_mark: using a read lock synchronously"

    ```java
    ApplicationManager.getApplication().executeOnPooledThread(
        { => 
            string name;
            read action with #project.getRepository() {
                name = myNode.name;
            }
        Notifications.Bus.notify(new Notification("test", "Name", name, NotificationType.INFORMATION));
        }
    );
    ```

=== ":x: using a read lock asynchronously"

    ```java
    // name is null because the following block is executed on the EDT thread which doesn't return the result immediately
    ApplicationManager.getApplication().executeOnPooledThread(
        { => 
            string name;
            execute in EDT #project.getRepository() {
                name = myNode.name;
            }
        Notifications.Bus.notify(new Notification("test", "Name", name, NotificationType.INFORMATION));
        }
    );
    ```

=== ":white_check_mark: call synchronously on EDT with read lock"

    ```java
    ApplicationManager.getApplication().executeOnPooledThread(
        { =>
        StringBuilder builder = new StringBuilder();
        ApplicationManager.getApplication().invokeAndWait(
            { => read action with #project.getRepository() {
                builder.append(myNode.name);
            }
        }
    );
    Notifications.Bus.notify(new Notification("test", "Name", builder.toString(), NotificationType.INFORMATION));
        }
    )
    ```

### Elevating Model Access

It depends on the current thread and active locks, but most of the time, read locks can't be upgraded. A lock that is higher in the hierarchy also
has the permissions of the lower locks: *read* < *write* < *command*.

=== ":white_check_mark: elevating write to command access"

    ```java
    // no previous write lock

    ApplicationManager.getApplication().invokeLater(
        { => write action with #project.getRepository() { 
            command with #project.getRepository() { 
                myNode.name = "myName"; 
            } 
        }
        }
    )
    ```

=== ":x: elevating read to write access"

    ```java
    // java.lang.IllegalStateException: deadlock prevention: do not start write action from read

    ApplicationManager.getApplication().invokeLater(
        { => read action with #project.getRepository() { 
            write with #project.getRepository() { 
                myNode.name = "myName"; 
            } 
        }
        }
    )
    ```

=== ":x: elevating read to command access"

    ```java
    // jetbrains.mps.smodel.IllegalModelAccessException: deadlock prevention: can not elevate model read to a command

    ApplicationManager.getApplication().invokeLater(
        { => read action with #project.getRepository() { 
            write with #project.getRepository() { 
                myNode.name = "myName"; 
            } 
        }
        }
    )
    ```

=== ":white_check_mark: elevating read to command access (write available)"

    ```java
    // previous write lock available

    read action with #project.getRepository() { 
        command with #project.getRepository() { 
            myNode.name = "myName"; 
        } 
    }
    ```

## Additional References

- [IDEA threading model | developerlife.com](https://developerlife.com/2021/03/13/ij-idea-plugin-advanced/#idea-threading-model)
- [Common Concurrency Pitfalls in Java](https://www.baeldung.com/java-common-concurrency-pitfalls)
