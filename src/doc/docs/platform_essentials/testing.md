---
alias: testing
---

This page explains some testing ideas in MPS according to general ideas in [software testing](https://en.wikipedia.org/wiki/Software_testing).
For a specific MPS testing introduction, visit [Testing language - MPS documentation](https://www.jetbrains.com/help/mps/testing-languages.html).

## Testing techniques

The following techniques are considered typical [black-box](https://en.wikipedia.org/wiki/Black-box_testing) design techniques that means you examine the functionality of an application without peering into its internal structures or workings.

- [Equivalence partitioning](https://en.wikipedia.org/wiki/Equivalence_partitioning): an equivalence class or equivalence partition is a set of test cases that tests the same thing or reveals the same bug. Often nearly unlimited combinations of input data exist. The idea is to reduce the number of test cases that are necessary by dividing the input data into partitions of equivalent data from which test cases can be derived. Test cases are designed to cover each partition at least once. KernelF has [support for equivalence partitions](https://voelter.de/data/books/kernelf-designEvoUse.pdf#page=39) in test cases.
    - Example: a number with exactly 6 digits is allowed. Partitions: >6 (invalid), <= 5 (invalid), = 5 
  - [Boundary-value analysis](https://en.wikipedia.org/wiki/Boundary-value_analysis): It is based on testing the boundary values of valid and invalid partitions. Values at the edge of partitions are more likely to be overlooked and force errors. Off-by-one errors or boundary condition errors can
  also be detected with this technique. The example for the previous technique also shows a case of boundary-value analysis.
- [Decision tables](https://en.wikipedia.org/wiki/Decision_table): They are used to test different input combinations/conditions in a tabular form. They are [directly supported](https://voelter.de/data/books/kernelf-designEvoUse.pdf#page=38) in KernelF.

## What is a bug and what should be tested

> A software bug is an error, flaw or fault in the design, development, or operation of computer software that causes it to produce an incorrect or unexpected result, or to behave in unintended ways. [software bug | Wikipedia](https://en.wikipedia.org/wiki/Software_bug)

A good approach to finding bugs is to check if one of the following 5 rules is true which were first defined in the book [Ron Patton - Software Testing](https://books.google.at/books/about/Software_Testing.html?id=MTEiAQAAIAAJ&redir_esc=y) from 2006:

1. The software doesn't do something that the product specification says it should do.
2. The software does something that the product specification says it shouldn't do.
3. The software does something that the product specification doesn't mention.
4. The software doesn't do something that the product specification doesn't mention but
   should.
5. The software is difficult to understand, hard to use, slow, or -- in the software tester’s
   eyes -- will be viewed by the end user as just plain not right.

### Automatic testing

Have a look at the [quick navigation table | MPS documentation](https://www.jetbrains.com/help/mps/testing-languages.html#quicknavigationtable) first. In addition, typesystem errors should be tested with "has error" annotations in nodes test cases.

While the generator can be tested with generator tests as explained in the documentation, they are often not fine-grained enough to test exactly what you want to test. You might also want to
exclude certain nodes or properties or show the result in a diff tool. An alternative approach is to invoke the generator yourself through [com.mbeddr.mpsutil.generatorfacade.GeneratorFacade#runGenerator](http://127.0.0.1:63320/node?ref=r%3A00bd75cf-1225-4ef5-9a7e-390aed8718dd%28com.mbeddr.mpsutil.generatorfacade.runtime%29%2F5915735921188923345) and compare the expected and actual output yourself with `com.mbeddr.mpsutil.compare.structure.AssertNodeEquals`.

### Manually testing

- Is there documentation for a new feature/change?
- Is the change mentioned in the changelog?
- Is the sandbox/the tutorial updated to showcase the feature?
- Are there visual problems with editor-related languages such as tables and diagrams?
- Is the reflective editor shown anywhere caused by an exception?
- Does the editor freezes?
- Do any actions throw exceptions?
- Are there any exceptions in the log file?

## Testing approaches

- *Functional review* ([black-box-testing](https://en.wikipedia.org/wiki/Black-box_testing)): The tester doesn't look at the code but rather checks the functionality of an application and if it meets the specification.
  - *Code review* ([white-box testing](https://en.wikipedia.org/wiki/White-box%20testing)): a different developer (e.g. from the same team) checks the code for
  logical errors, code standard violations and other issues. If, for example, GitHub is used for hosting the project and [reviews are required](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/reviewing-proposed-changes-in-a-pull-request) before a branch can be merged, a reviewer can comment on a PR, approve it or request changes.

### [Continuous testing](https://en.wikipedia.org/wiki/Continuous_testing)

MPS [tests](https://www.jetbrains.com/help/mps/testing-languages.html) such as unit, nodes and editor tests can be executed on the command line and as part of the CI pipeline. To execute tests with the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin), use the [TestLanguages](https://github.com/mbeddr/mps-gradle-plugin#runantscript) task ([example](https://github.com/JetBrains/MPS-extensions/blob/7a7619ece4068098ffb8f09b44791713063587e7/build.gradle#L255)). To run the model checker, use the [Model Check](https://github.com/mbeddr/mps-gradle-plugin#model-check) task. It can be configured to make the
build fail when there is a model check error and also show the failures as normal JUnit test fails. The model checking can be combined with the [linters](https://github.com/mbeddr/mps-qa/blob/master/code/languages/org.mpsqa.lint/README.md) from the [mps-qa](https://github.com/mbeddr/mps-qa) project to further
improve the code quality.

### [Usability testing](https://en.wikipedia.org/wiki/Usability_testing)

Start by looking through the [UI patterns](ui_patterns.md) list. To get started with testing with users, read [Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/).

#### [Expert review](https://en.wikipedia.org/wiki/Usability_testing?oldformat=true#Expert_review)
Check the [Nielsen's usability heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/):

- *Visibility of system status*: The design should always keep users informed about what is going on, through appropriate feedback within a reasonable amount of time.
    - Does the editor show feedback by show model checking messages, error cells, other types of feedback?
    - Are some kind of [notifications](https://plugins.jetbrains.com/docs/intellij/notifications.html) from the IntelliJ platform (e.g. dialogs, banners) used for other information? What about the messages view?
- *Match between system and the real world*: The design should speak the users' language. Use words, phrases, and concepts familiar to the user, rather than internal jargon. Follow real-world conventions, making information appear in a natural and logical order.
    - Are the terms and concepts from the target domain used? If they are unclear they should be declared in a glossary and be referencable from other places such as the documentation.
- *User control and freedom*: Users often perform actions by mistake. They need a clearly marked "emergency exit" to leave the unwanted action without having to go through an extended process.
    - While MPS supports [undoing and redoing changes](https://www.jetbrains.com/help/mps/undoing-and-redoing-changes.html) out of the box
      and confirmation dialogs are used for asking for confirmation before taking an action, another option is described in the [Google Material Design Guidelines](https://m2.material.io/design/communication/confirmation-acknowledgement.html). Successful actions can also be acknowledged through a [got it notificatation](https://plugins.jetbrains.com/docs/intellij/notifications.html#got-it-notification) or reverted through a custom action that is attached to a [balloon](https://jetbrains.design/intellij/controls/balloon/#actions).
    - Are mistakes by the user caught by the model checker and displayed in the editor? 
- *Consistency and standards*: Users should not have to wonder whether different words, situations, or actions mean the same thing. Follow platform and industry conventions.
    - Is the format of error messages consistent? (e.g. trailing dot at the end of a message)
    - Are the colors, fonts, spacings consistent?
    - Does the hierarchy of headers make sense?
    - Do labels always look the same way? (e.g. bold, not editable)
    - Do keywords, comments, editable fields always look the same way so that they are recognizable?
- *Error prevention*: Good error messages are important, but the best designs carefully prevent problems from occurring in the first place. Either eliminate error-prone conditions, or check for them and present users with a confirmation option before they commit to the action.
    - Are [constraints](https://www.jetbrains.com/help/mps/constraints.html) used to restrict certain node relationships to avoid users making errors in the first place?
- *Recognition rather than recall*: Minimize the user's memory load by making elements, actions, and options visible. The user should not have to remember information from one part of the interface to another. Information required to use the design (e.g. field labels or menu items) should be visible or easily retrievable when needed.
    - Does the user know where he can find certain actions? ([inspector](https://www.jetbrains.com/help/mps/mps-inspector.html), [context actions tool](https://www.jetbrains.com/help/mps/context-actions-tool.html), [context assistant](https://www.jetbrains.com/help/mps/context-assistant.html), right-click context menu, main menu)
- *Flexibility and efficiency of use*: Shortcuts — hidden from novice users — may speed up the interaction for the expert user so that the design can cater to both inexperienced and experienced users. Allow users to tailor frequent actions.
    - Do custom actions have default shortcuts assigned?
    - Can the editor be navigated only by keyboard?
    - Can certain features be customized through [preference components](https://www.jetbrains.com/help/mps/plugin.html#preferencescomponents)
        - at the project level?
        - at the application level?
- *Aesthetic and minimalist design*: Interfaces should not contain information that is irrelevant or rarely needed. Every extra unit of information in an interface competes with the relevant units of information and diminishes their relative visibility.
    - Are editor cells collapsed by default that clutter the editor?
    - Are optional parts hidden in the editor? (e.g. by using [optional cells](https://jetbrains.github.io/MPS-extensions/extensions/editor/grammar-cells/#grammaroptional) from the grammarcells language)
    - Is the grouping of content made recognizable without great impact on the layout and design? (only spacing, borders, background color and not everything together)
    - Are colors, font weight, underlining text and other forms of emphasizing content done in moderation?
- *Help users recognize, diagnose, and recover from errors*: Error messages should be expressed in plain language (no error codes), precisely indicate the problem, and constructively suggest a solution.
    - Read [Writing short and clear | IntelliJ Platform UI Guidelines](https://jetbrains.github.io/ui/text/writing_short/) and [Punctuation](https://jetbrains.github.io/ui/text/punctuation/)
    - Use the model checker to show error messages in the editor
    - Use [quick fixes](https://www.jetbrains.com/help/mps/cookbook-type-system.html#checkingandquick-fixes) or [error intentions](https://www.jetbrains.com/help/mps/mps-intentions.html#regularintentions) to provide solutions for the error
- *Help and documentation*: It’s best if the system doesn’t need any additional explanation. However, it may be necessary to provide documentation to help users understand how to complete their tasks.
    - Do the users have help available? (e.g. Show Help for X in right-click context menu, external documentation, a tooltip that shows additional information or text in the inspector or a dedicated documentation tool such as ^^com.mbeddr.doc.aspect^^)
### [Performance testing](https://en.wikipedia.org/wiki/Software_performance_testing)

#### [Load testing](https://en.wikipedia.org/wiki/Software_load_testing)

- Do bigger models still generate fast enough? Are there any timeouts while generating?
- Do bigger root nodes still render fast enough in the editor?
- When you are using an importer to create nodes: is it fast enough for big input files? Where is the limit? Is a progress bar necessary?
- Does the application load fast enough on startup for many and big models/modules?

#### [Stress testing](https://en.wikipedia.org/wiki/Stress_testing_(software))

- Does the application still works when there is no internet connection? 
- What is the maximal size of a model that generates in a timely fashion? Is [[performance#model-pruning|model pruning]] needed?
- What happens when you enter the power save mode? Do things like the automatic typesystem checks and background threads work again when you leave the mode?

#### [Soak testing](https://en.wikipedia.org/wiki/Soak_testing)

- Does the memory consumption rises after longer use? (memory indicator in lower right corner) Is there maybe a memory leak?
- Are all models loaded into memory after some time? (memory indicator). Models are lazily loaded that means that they are only loaded when they are needed. When all models are loaded this indicates that the models are probably accessed by accident e.g. through a global find usage search.
- Do any suspicious messages appear in the [log file](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#logs-directory) such as warnings about memory leaks, broken models etc.?
- Is memory released after some time or are not needed objects never garbage collected? If not, read about Java JVM options on [this page](../mps_internal/index.md#:~:text=where%20can%20you%20find%20information%20about%20environment%2Fjvm%20variables%20that%20are%20set%20in%20mps%3F).

#### Spike testing

- Does the action `Reload all` causes any issues such as memory leaks or freezes?
- Are there any issue when clicking the memory indicator to unload all models?
- Does the main project still has good performance when you open other projects in the background?

#### Configuration testing

- Does the application works on all supported operating systems? (e.g. Windows, Linux, Mac + M1 chip)
- Does the application works if a non-bundled Java Runtime is used? (e.g. JDK 11 instead of JBR 11 which might be needed for JCEF support)
- Can the application be started with insufficient initial memory specific in the custom VM options? (`Xms`)
- Does the editor still work when switching between different editor themes? (e.g. Light Theme, Darcula Theme, Mac Theme)