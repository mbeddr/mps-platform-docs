# [Debugging problems](https://pythonprinciples.com/blog/getting-unstuck/#debugging-problems)

Different kinds of problems can occur in MPS. Some of them are bugs that you have to fix, other problems might be unfixable or caused by an unusual approach to
tackling a problem (e.g. [accessing a project instance](accessing_the_project.md) from unsupported places). For debugging purposes, you can add log statements to the code, execute tests, analyze stack traces,  run code on the MSP console, or use [remote debugging](https://specificlanguages.com/articles/debugging/).

## Deal With Errors

Error messages can appear in different places:

### Errors in the Editor

Those errors (red squiggly line) are caused by [checking rules](https://www.jetbrains.com/help/mps/typesystem.html#checkingrules) or type system rules.
Right-click the offending cell in the editor --> *Language Debug* --> *Go to Rule Which Caused Error* to navigate to the statement that causes the error.
When there is an error calculating a type, the [type system trace](https://www.jetbrains.com/help/mps/typesystem.html#type-system,trace) can be helpful. The same
debug menu also contains an entry *Show Type* that shows the calculated type. Most of the time, it is easier using this action + understanding the type system check
than using the tracing tool.

### IDE Fatal Errors

Those errors can be found by clicking on the error icon in the bottom right corner of the window.

![IDE fatal errors](ide_fatal_errors.png)

This dialog contains exceptions that might be caused by your language, MPS platforms, or MPS itself. In the provided example, the source of the error
is deceptive: the plugins in which the exception was raised is MPS core but looking at the package name we see that the exception comes from [Shadow Models](https://jetbrains.github.io/MPS-extensions/extensions/other/shadow-models/)
. If you are unsure where an error comes from, have a look at the page [issue trackers](issue_trackers.md). Only report the error to the JetBrains MPS Tracker
if the exception is caused by MPS.
To analyze the exception itself, open the error dialog and copy the error message. Then click in the main menu on *Analyze* --> *Analyze Stack Trace* and press *ok*.
The stack trace will be opened in the run window. For lines where the sources are available, a link to the corresponding source is provided.

### Errors in the [Log File](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#logs-directory)

Errors in this file can be written by log statements, MPS platforms, MPS and the IntelliJ platform. Many of those exceptions can't be fixed easily if they don't come from your languages but sometimes can still contain useful hints. Example: When the automatic module maker at startup fails, only the number of errors and warnings is shown in the error tooltip. The exact stack trace can be found in the error log. Messages about models that can't be loaded are also saved in this file.

### The Editor Can’t Be Rendered

![error creating editor cell](error_creating_editor_cell.png)

When an editor cell can't be created, the stack trace can be analyzed by clicking on *Stacktrace*. Editor-related exceptions can have more serious
consequences than other exceptions like fatal errors: in the worst-case scenario, the editor can't be opened at all or MPS freezes completely. When
this happens, locate the MPS module that causes the freeze in your local file explorer and delete the _gen folders so that the module can't be loaded, and restart MPS. Now the
module is not active anymore, and you can start debugging. The same approach can be done for application and project plugins that crash the MPS instance.
If the exception is not caused by your language, please report the issue to the developer of the language.

## Dealing With Wrong Outputs

Wrong outputs could be seen in many places: a Base Language method that calculates a wrong value, an incorrectly initialized node
that is created via an intention, an error message that shows null instead of an error message, a generator that generates the wrong output, and so forth. Most of those cases can be checked automatically with the [testing languages](https://www.jetbrains.com/help/mps/testing-languages.html). The [quick navigation table](https://www.jetbrains.com/help/mps/testing-languages.html#quicknavigationtable) provides information on how to test certain
language aspects.

For generators, there are generator tests, but they are often not fine-grained enough because most of the time you just want to partly
compare models and ignore certain children, properties, or references. An alternative approach is to [invoke the generator yourself](http://127.0.0.1:8000/mps-platform-docs/platform_essentials/mpsutils/generator/) and compare the structure of the input and output model with your asserts. If
the tests are not run on the command line, it is possible to show differences between nodes graphically through:
```java
 StructDifferenceDialog.showNodeDifference(ProjectHelper.toIdeaProject(project),
        oldNode,newNode,oldTitle, newTitle)
```

The language [[mpsutils_common#comparator|com.mbeddr.mpsutil.comparator]] can help with comparing nodes programmatically while ignoring certain childen, properties, or references.