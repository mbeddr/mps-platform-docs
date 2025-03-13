---
comments: true
---

This document lists some recommendations for code written in MPS. For a general introduction to code smells, go to [Code Smells | Coding Horror](https://blog.codinghorror.com/code-smells/) and [How To Write Unmaintainable Code](https://web.archive.org/web/20171224114025id_/https://www.thc.org/root/phun/unmaintain.html). Clean code has many benefits. [Clean Code: Writing maintainable, readable, and testable code | https://blogs.sap.com/](https://blogs.sap.com/2022/12/21/clean-code-writing-maintainable-readable-and-testable-code/) describes those benefits.


## Implementation

- [Prefer composition over inheritance](https://specificlanguages.com/posts/prefer-composition-over-inheritance/){{ blog('sl') }}
- Implement [INamedConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1169194658468) in concepts that should have a name. The name property will be returned when you call `node.getName()`. MPS uses the name in editor tabs, the logical view, as the default presentation for references and other places.
- Use [isInstanceOf](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1139621453865) to check if a node is an instance of a concept instead of using the Java instanceof operator, for example, `#!java node.isInstanceOf(IfStatement)`. Alternatively, use the `ifInstanceOf` statement to save the converted expression in a variable directly. For example:
 ```java 
  ifInstanceOf (node is IfStatement ifStatement) {

        }
 ```
- Use the built-in collection classes such as collections, set, list, and map ([documentation](https://www.jetbrains.com/help/mps/collections-language.html)). Null-safe languages implement those classes.
  For example:
  ```java
  list<string> listOfStrings = new linkedlist<string>(copy: new string[]{"ab", "ba", "aaaa"}); 
  #print listOfStrings.where({it => it.startsWith("a"); }).join(",");
  ```
  For lists of nodes, there is the particular list type `nlist`, for example, `#!java nlist<ClassConcept> classes = new nlist<ClassConcept>;`
  [Choose the right collection](http://www.javapractices.com/topic/TopicAction.do?Id=65) for your task.
- Use the [access language](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage) instead of directly calling [ModelAccess](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.module%28MPS.OpenAPI%2F%29%2F%7EModelAccess) methods.
  For example:
  ```java
  node<ClassConcept> classNode = new node<ClassConcept>(); 
  command with #project.getRepository() {
    classNode.member.add(<argument>);
  }
  ```
- Write [tests](https://www.jetbrains.com/help/mps/testing-languages.html) for new features that you have developed and bugs that you have fixed. Always test generators, sometimes also the type system. You can even start by writing the tests first ([test-driven-development](https://www.browserstack.com/guide/what-is-test-driven-development)).
- Don't try to use features in MPS at places that don't officially support them. Not supported means that the official documentation doesn't mention it, and you can access the feature only through hacks and workarounds. Examples:
    - invoking the generator in type system rules
    - UI code in the behavior aspect
    - accessing the project instance in unsupported places, for example, the generator
- [Avoid strict node casts](https://specificlanguages.com/posts/2022-06/02-avoid-strict-node-casts/){{ blog('sl') }}
- [Use Java Streams to Write Clean Java Code](https://sweetcode.io/use-java-streams-to-write-clean-java-code/). *Warning*: While streams
  can be helpful, consider using the [MPS collections language](https://www.jetbrains.com/help/mps/collections-language.html) for most cases. It
  is better understood by MPS developers and easier to use. Switch to Java streams only when the collections language is
  not powerful enough.
- Use logging for troubleshooting purposes. Remove logging statements from production code or reduce the log level
  to debug. Do not output log messages when they are not necessary.

## Null Safety

-   Use the language [checkedDots](https://www.jetbrains.com/help/mps/other-languages.html) for saver access of possible null values. You can check nodes for null: [node.isNull](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1171999116870)
-   Use the annotations `@NotNull` and `@Nullable` for the Base Language code. A specific type system rule in MPS checks these annotations. The annotations are also enforced at runtime by the compiler.
-   Use [:eq:](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1225271283259) (NPE safe equals operation) and [\:ne:](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F122527122 1393)(NPE safe not equals operation) instead of [==](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1068580123152) and `equals`.
-   You can still return optional values instead of null in Base Language code (**[Java explanation](http://www.javapractices.com/topic/TopicAction.do?Id=279)**).

Some languages, such as the [smodel](https://www.jetbrains.com/help/mps/smodel-language.html) and [collections](https://www.jetbrains.com/help/mps/collections-language.html) languages, are also null-safe. The following code will correctly return false:
```java
node<ClassConcept> n = null;
#print n.member.first as IfStatement.forceOneLine;
```

MPS also has a null analyzer for Java that is part of the data flow analysis ([nullable analyzer](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902c2%28jetbrains.mps.baseLanguage.dataFlow%29%2F6868777471677432036), [short explanation of how it works](https://szabta89.github.io/projects/df.html#:~:text=Null-,analysis,-for%20Java%20(Nullable))). The type system checks it, and you get a warning when, for example, a method call might throw a `NullPointerException`.

## Exceptions and Warnings

- Use checked exceptions (e.g., IOException) for recoverable conditions and runtime exceptions (e.g., NullPointerException) for programming errors ([Checked versus unchecked exceptions](http://www.javapractices.com/topic/TopicAction.do?Id=129)).
- Consider alternative ways of showing errors than throwing exceptions, such as showing [notifications](https://plugins.jetbrains.com/docs/intellij/notifications.html#top-level-notifications-balloons). Examples of such notifications are balloons and dialogs.
- Attach exceptions to log statements. The stack trace will print in the log file if it is a low-level log statement (e.g., log error).
  For ordinary log statements (e.g., message log error), you can open the stack trace through the right-click menu in the messages view. Example:
  ```
  log error "This is an error", myException
  ```
- [Clean up](https://docs.oracle.com/javase/tutorial/essential/exceptions/finally.html) in the *finally-block* of a try statement. The [try-with-resources](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html) statement is also supported. An example of cleaning up could be a
  temporary model only needed in a test. When the test fails, the model still needs to be disposed of. To tie an object to the lifecycle of a parent,
  use the classes [Disposer and Disposable](https://plugins.jetbrains.com/docs/intellij/disposers.html) from the IntelliJ platform.
- [Treat Warnings As Errors](https://blog.submain.com/treat-warnings-errors/), and also don't ignore warnings/errors. Warnings might become errors or even make the compilation fail in the future. For example, the *repository* parameter in the access language (e.g., read action with global repository {}) was optional in the past but later became mandatory because using the global repository is discouraged.
  Ignoring too many messages can also hide real errors you must address. For example, a warning that a NullPointerException can happen might reveal that
  not tested situations exist where an object is null and will crash something. That can happen, for example, when code is executed on the command line
  instead of inside MPS, where it can never fail.
- [Warnings should not replace documentation](https://specificlanguages.com/posts/2022-03/07-warnings-should-not-replace-documentation/){{ blog('sl') }}

## Miscellaneous

- Be careful when using Unicode characters inside MPS. It might break something (MPS-33687, MPS-31835).
- Use Gradle for creating build scripts ([minimal example](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75)). They are better supported (e.g., [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin)). They can express the build logic more cleanly through Groovy or Kotlin than other solutions such as Maven or Ant ([article comparing all three solutions](https://www.baeldung.com/ant-maven-gradle)). While the MPS build language generates Ant scripts, you can abstract away this layer nicely with Gradle + the MPS Gradle Plugin. For example:
  ```groovy
    task buildLanguages(type: BuildLanguages, dependsOn: prebuild) {
    script "$buildDir/scripts/build-languages.xml"
    }
  ```
  Most MPS projects that used Maven in the past were migrated to Gradle.

- Do not leave debug statements in production code, including MPS log statements and *System.out* statements.
  Especially in tests, outputs can not only be annoying but can also fail the test with an *UncleanTestExecutionException*
  The only acceptable debug statements are those that have the log level set to *debug* or lower because they are not visible by default. 


    When you use a logging framework you have the option to configure the output. You can filter out messages you don't care about, you can redirect them into a log file, and you have more details such as a timestamp and the source class. With System.out there is often just this mysterious output that tells you nothing and just spams the console.
  
    In unit tests this is fine because the only time when you will see this output is when you execute the test.

    {{ answer_by('slisson') }}
