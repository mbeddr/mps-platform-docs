---
alias: testing
---

This page explains some MPS testing ideas according to general [software testing concepts](https://en.wikipedia.org/wiki/Software_testing).
For a specific MPS testing introduction, visit [Testing language | MPS documentation](https://www.jetbrains.com/help/mps/testing-languages.html).

## Testing Techniques

The following techniques are considered typical [black-box](https://en.wikipedia.org/wiki/Black-box_testing) design techniques, which means you examine the functionality of an application without peering into its internal structures or workings.

- [Equivalence partitioning](https://en.wikipedia.org/wiki/Equivalence_partitioning): An equivalence class or equivalence partition is a set of test cases that tests the same thing or reveals the same bug. Often nearly unlimited combinations of input data exist. The idea is to reduce the necessary test cases  by dividing the input data into partitions of equivalent data from which you can derive test cases. Design test cases to cover each partition at least once. KernelF has [support for equivalence partitions](https://voelter.de/data/books/kernelf-designEvoUse.pdf#page=39) in test cases.
    - Example: a number with exactly six digits is allowed. Partitions: >6 (invalid), <= 5 (invalid), = 5 
  - [Boundary-value analysis](https://en.wikipedia.org/wiki/Boundary-value_analysis): In this analysis, you test the boundary values of valid and invalid partitions. Values at the edge of partitions are more likely to be overlooked and force errors. This technique also detects off-by-one errors or boundary condition errors. The example for the previous technique also shows a case of boundary-value analysis.
- [Decision tables](https://en.wikipedia.org/wiki/Decision_table) are used to test different input combinations/conditions in a tabular form. KernelF supports them [directly](https://voelter.de/data/books/kernelf-designEvoUse.pdf#page=38).

## What Is a Bug and What Should Be Tested

> A software bug is an error, flaw, or fault in computer software's design, development, or operation that causes it to produce an incorrect or unexpected result or to behave in unintended ways. [software bug | Wikipedia](https://en.wikipedia.org/wiki/Software_bug)

An approach to finding bugs is to check if one of the following five rules is true, which the book [Ron Patton - Software Testing](https://books.google.at/books/about/Software_Testing.html?id=MTEiAQAAIAAJ&redir_esc=y) from 2006 first defined:

1. The software doesn't do something that the product specification says it should do.
2. The software does something that the product specification says it shouldn't do.
3. The software does something that the product specification doesn't mention.
4. The software doesn't do something the product specification doesn't mention but
   should.
5. The software is difficult to understand, hard to use, slow, or -- in the software tester’s
   eyes -- will be viewed by the end user as just plain not right.

### Automatic testing

Have a look at the [quick navigation table | MPS documentation](https://www.jetbrains.com/help/mps/testing-languages.html#quicknavigationtable) first. In addition, test type system errors in node test cases with *has error* annotations.

While the generator can be tested with generator tests, as explained in the documentation, they are often not fine-grained enough to test what you want to test. Moreover, exclude specific nodes or properties or show the result in a diff tool. An alternative approach is to invoke the generator yourself through [com.mbeddr.mpsutil.generatorfacade.GeneratorFacade#runGenerator](http://127.0.0.1:63320/node?ref=r%3A00bd75cf-1225-4ef5-9a7e-390aed8718dd%28com.mbeddr.mpsutil.generatorfacade.runtime%29%2F5915735921188923345) and compare the expected and actual output yourself with `com.mbeddr.mpsutil.compare.structure.AssertNodeEquals`.

### Manually Testing

- Is there documentation for a new feature/change?
- Is the change mentioned in the changelog?
- Is the sandbox/tutorial updated to showcase the feature?
- Are there visual problems with editor-related languages, such as tables and diagrams?
- Is the reflective editor shown anywhere caused by an exception?
- Does the editor freeze?
- Do any actions throw exceptions?
- Are there any exceptions in the log file?

## Testing Approaches

- *Functional review* ([black-box testing](https://en.wikipedia.org/wiki/Black-box_testing)): The tester doesn't look at the code but instead checks the functionality of an application and if it meets the specification.
  - *Code review* ([white-box testing](https://en.wikipedia.org/wiki/White-box%20testing)): A different developer (e.g., from the same team) checks the code for
  logical errors, code standard violations, and other issues. If, for example, you use GitHub for hosting the project and [reviews are required](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/reviewing-proposed-changes-in-a-pull-request) before you can merge a branch, a reviewer can comment on a PR, approve it or request changes.

### [Continuous Testing](https://en.wikipedia.org/wiki/Continuous_testing)

MPS [tests](https://www.jetbrains.com/help/mps/testing-languages.html) such as unit, nodes, and editor tests can be executed on the command line and as part of the CI pipeline. To execute tests with the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin), use the [TestLanguages](https://github.com/mbeddr/mps-gradle-plugin#runantscript) task ([example](https://github.com/JetBrains/MPS-extensions/blob/7a7619ece4068098ffb8f09b44791713063587e7/build.gradle#L255)). To run the model checker, use the [Model Check](https://github.com/mbeddr/mps-gradle-plugin#model-check) task. It can be configured to make the
build fail when there is a model check error and show the failures as normal JUnit test fails. The model checking can be combined with the [linters](https://github.com/mbeddr/mps-qa/blob/master/code/languages/org.mpsqa.lint/README.md) from the [mps-qa](https://github.com/mbeddr/mps-qa) project to improve the code quality further.

### [Usability Testing](https://en.wikipedia.org/wiki/Usability_testing)

Start by looking through the [UI patterns](ui_patterns.md) list. To get started with testing with users, read [Usability Testing 101](https://www.nngroup.com/articles/usability-testing-101/).

#### [Expert Review](https://en.wikipedia.org/wiki/Usability_testing?oldformat=true#Expert_review)

An expert review is another general method of usability testing. Check [Nielsen's usability heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/):

- *Visibility of system status*: The design should always keep users informed about what is happening through appropriate feedback within a reasonable amount of time.
    - Does the editor show feedback by showing model-checking messages, error cells, and other types of feedback?
    - Are [notifications](https://plugins.jetbrains.com/docs/intellij/notifications.html) from the IntelliJ platform (e.g., dialogs, banners) used sed to convey information? What about the message view?
- *Match between the system and the real world*: The design should speak the users' language. Use words, phrases, and concepts familiar to the user rather than internal jargon. Follow real-world conventions, making information appear in a natural and logical order.
    - Are the terms and concepts from the target domain used? If they are unclear to the user, they should be declared in a glossary and referenced from other places, such as the documentation.
- *User control and freedom*: Users often perform actions by mistake. They require a clearly labeled "emergency exit" that allows them to quit the undesired action without following a lengthy procedure.
    - While MPS supports [undoing and redoing changes](https://www.jetbrains.com/help/mps/undoing-and-redoing-changes.html) out of the box
      and confirmation dialogs are used for asking for confirmation before taking action, the [Google Material Design Guidelines](https://m2.material.io/design/communication/confirmation-acknowledgement.html) describe another option. Acknowledge successful actions through a [got it notification](https://plugins.jetbrains.com/docs/intellij/notifications.html#got-it-notification) or revert the action through a custom action that is attached to a [balloon](https://jetbrains.design/intellij/controls/balloon/#actions).
    - Are mistakes by the user caught by the model checker and displayed in the editor? 
- *Consistency and standards*: Users should not have to wonder whether different words, situations, or actions mean the same thing. Follow platform and industry conventions.
    - Is the format of error messages consistent? (e.g., trailing dot at the end of a message)
    - Are the colors, fonts, and spacings consistent?
    - Does the hierarchy of headers make sense?
    - Do labels always look the same way? (e.g., bold, not editable)
    - Do keywords, comments, and editable fields always look the same way so that they are recognizable?
- *Error prevention*: Good error messages are essential, but the best designs carefully prevent problems from occurring in the first place. Either eliminate error-prone conditions or check for them and present users with a confirmation option before they commit to the action.
    - Are [constraints](https://www.jetbrains.com/help/mps/constraints.html) used to restrict certain node relationships to avoid users making errors in the first place?
- *Recognition rather than recall*: Minimize the user's memory load by making elements, actions, and options visible. The user should not have to remember information from one part of the interface to another. Information required to use the design (e.g., field labels or menu items) should be visible or easily retrievable when needed.
    - Does the user know where he can find specific actions? ([inspector](https://www.jetbrains.com/help/mps/mps-inspector.html), [context actions tool](https://www.jetbrains.com/help/mps/context-actions-tool.html), [context assistant](https://www.jetbrains.com/help/mps/context-assistant.html), right-click context menu, main menu)
- *Flexibility and efficiency of use*: Shortcuts — hidden from novice users — may speed up the interaction for the expert user so that the design can cater to inexperienced and experienced users. Allow users to tailor frequent actions.
    - Do custom actions have default shortcuts assigned?
    - Can the editor be navigated only by the keyboard?
    - Can certain features be customized through [preference components](https://www.jetbrains.com/help/mps/plugin.html#preferencescomponents) ...
        - at the project level?
        - at the application level?
- *Aesthetic and minimalist design*: Interfaces should not contain irrelevant or rarely needed information. Every extra unit of information in an interface competes with the relevant information units and diminishes their relative visibility.
    - Are editor cells collapsed by default that clutter the editor?
    - Are optional parts hidden in the editor? (e.g., by using [optional cells](https://jetbrains.github.io/MPS-extensions/extensions/editor/grammar-cells/#grammaroptional) from the grammar cells language)
    - Is the grouping of content made recognizable without impacting the layout and design? (only spacing, borders, background color, and not everything together)
    - Are colors, font weight, underlining text, and other forms of emphasizing content done in moderation?
- *Help users recognize, diagnose, and recover from errors*: Express error messages in plain language (no error codes), precisely indicate the problem, and constructively suggest a solution.
    - Read [Writing Short and Clear | IntelliJ Platform UI Guidelines](https://jetbrains.github.io/ui/text/writing_short/) and [Punctuation](https://jetbrains.github.io/ui/text/punctuation/)
    - Use the model checker to show error messages in the editor.
    - Use [quick fixes](https://www.jetbrains.com/help/mps/cookbook-type-system.html#checkingandquick-fixes) or [error intentions](https://www.jetbrains.com/help/mps/mps-intentions.html#regularintentions) to provide solutions for the error.
- *Help and documentation*: It’s best if the system doesn’t need additional explanation. However, it may be necessary to provide documentation to help users understand how to complete their tasks.
    - Do the users have help available? (e.g., Show Help for X in right-click context menu, external documentation, a tooltip that shows additional information or text in the inspector, or a dedicated documentation tool such as ^^com.mbeddr.doc.aspect^^)
### [Performance testing](https://en.wikipedia.org/wiki/Software_performance_testing)

#### [Load Testing](https://en.wikipedia.org/wiki/Software_load_testing)

- Do bigger models still generate fast enough? Are there any timeouts while generating?
- Do bigger root nodes still render fast enough in the editor?
- When you are using an importer to create nodes: is it fast enough for big input files? Where is the limit? Is a progress bar necessary?
- Does the application load fast enough on startup for many and big models/modules?

#### [Stress Testing](https://en.wikipedia.org/wiki/Stress_testing_(software))

- Does the application still work when there is no internet connection? 
- What is the maximal size of a model that generates in a timely fashion? Is [[performance#model-pruning|model pruning]] needed?
- What happens when you enter the power save mode? Do things like the automatic type system checks and background threads work again when you leave the mode?

#### [Soak Testing](https://en.wikipedia.org/wiki/Soak_testing)

- Does the memory consumption rise after longer use? (memory indicator in the lower right corner) Could there be a memory leak?
- Are all models loaded into memory after some time? (memory indicator). Models are lazily loaded, which means that they are only loaded when they are needed. When all models are loaded, this indicates that the models are probably accessed by accident, e.g., through a global find usage search.
- Do suspicious messages appear in the [log file](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#logs-directory), such as warnings about memory leaks or broken models?
- Is memory released after some time, or are not needed objects never garbage collected? Read about Java JVM options on [this page](../mps_internal/index.md#:~:text=where%20can%20you%20find%20information%20about%20environment%2Fjvm%20variables%20that%20are%20set%20in%20mps%3F) if it doesn't happen.

#### Spike Testing

- Does the action `Reload all` cause issues such as memory leaks or freezes?
- Are there any issues when clicking the memory indicator to unload all models?
- Does the main project still perform well when you open other projects in the background?

#### Configuration Testing

- Does the application work on all supported operating systems? (e.g., Windows, Linux, Mac + M1 chip)
- Does the application work with a non-bundled Java Runtime? (e.g., JDK 11 instead of JBR 11, which you might need for JCEF support)
- Can the application be started with insufficient initial memory specific in the custom VM options? (`Xms`)
- Does the editor still work when switching between different editor themes? (e.g., Light Theme, Darcula Theme, Mac Theme)

## Final Words

> Given enough eyeballs, all bugs are shallow.
>
> Eric S. Raymond ([Linus's law](https://www.wikiwand.com/en/Linus%27s_law))

While it is possible to find many bugs with one or a handful of developers and users, it helps to have a large enough beta-tester and co-developer base
to get bugs reported and fixed quickly. Sometimes it is good enough when somebody finds a workaround.

Other times, like in the MPS platforms, people would never identify some bugs, were there few users and developers using them daily. There are always new unexplored use cases when a new project uses an MPS platform, and more edge cases are detected when more users test features. While this quote originally referred to open-source projects, this also applies to closed-source projects.

## [Stack Exchange: Software Quality Assurance & Testing](https://sqa.stackexchange.com/)

These questions on the site Stack Exchange are relevant for MPS projects where dedicated testers, developers,
or another team member does the testing.

=== "Tests and testing"

    - [What's the difference between a good test and a bad test?](https://sqa.stackexchange.com/questions/30734/whats-the-difference-between-a-good-test-and-a-bad-test)
    - [Testing using real data from the customer](https://sqa.stackexchange.com/questions/39246/testing-using-real-data-of-the-customer)
    - [How do you know if you are writing high-quality tests?](https://sqa.stackexchange.com/questions/27238/how-do-you-know-if-you-are-writing-high-quality-tests)
    - [What would be the strategy when too many bugs are found in the final round of testing?](https://sqa.stackexchange.com/questions/31934/what-would-be-the-strategy-when-too-many-bugs-are-found-in-the-final-round-of-te)

=== "Bugs"

    - [What is your approach to low-priority bugs?](https://sqa.stackexchange.com/questions/47630/what-is-your-approach-to-low-priority-bugs)
    - [Best guidelines for bug reporting?](https://sqa.stackexchange.com/questions/1920/best-guidelines-for-bug-reporting)
    - [What is common practice for labels of the bug severity?](https://sqa.stackexchange.com/questions/7531/what-is-common-practice-for-labels-of-the-bug-severity)
    - [How to isolate a bug?](https://sqa.stackexchange.com/questions/3226/how-to-isolate-a-bug)
    - [Who is ultimately responsible for issues that are found after software is released?](https://sqa.stackexchange.com/questions/893/who-is-ultimately-responsible-for-issues-that-are-found-after-software-is-releas)
    - [How should a Software Tester deal with missed Defects/bugs in Production?](https://sqa.stackexchange.com/questions/27622/how-should-a-software-tester-deal-with-missed-defects-bugs-in-production)
    - [Should tester fix bugs?](https://sqa.stackexchange.com/questions/5194/should-tester-fix-bugs)

=== "For developers"

    - [Actual data for why developers shouldn't be the only ones testing their code?](https://sqa.stackexchange.com/questions/28926/actual-data-for-why-developers-shouldnt-be-the-only-ones-testing-their-code)
    - [What kind of testing should a developer do before passing a build to the QA team?](https://sqa.stackexchange.com/questions/423/what-kind-of-testing-should-a-developer-do-before-passing-a-build-to-the-qa-team)
    - [How can developers be assured that their software is fault free?](https://sqa.stackexchange.com/questions/17613/how-can-developers-be-assured-that-their-software-is-fault-free)
    - [How to deal with flaky tests that have intermittent failures?](https://sqa.stackexchange.com/questions/28204/how-to-deal-with-flaky-tests-that-have-intermittent-failures)
    - [Is it normal to spend as much, if not more, time writing tests than actual code?](https://softwareengineering.stackexchange.com/questions/299796/is-it-normal-to-spend-as-much-if-not-more-time-writing-tests-than-actual-code)
    - [How do I review my own code?](https://softwareengineering.stackexchange.com/questions/139321/how-do-i-review-my-own-code)  

=== "For testers"

    - [Why is a dedicated QA team member necessary?](https://sqa.stackexchange.com/questions/40146/why-is-a-dedicated-qa-team-member-necessary)
    - [Should a tester feel bad about finding too many defects/bugs in the product?](https://sqa.stackexchange.com/questions/25034/should-a-tester-feel-bad-about-finding-too-many-defects-bugs-in-the-product)
    - [What should be reported when a bug only happens 50% of the time?](https://sqa.stackexchange.com/questions/28135/what-should-be-reported-when-a-bug-only-happens-50-of-the-time)
    - [Should Testers first discuss a bug with the developers before writing a bug report?](https://sqa.stackexchange.com/questions/16640/should-testers-first-discuss-a-bug-with-the-developers-before-writing-a-bug-repo)
    - [Should QA report bugs on features before they are fully implemented?](https://sqa.stackexchange.com/questions/16715/should-qa-report-bugs-on-features-before-they-are-fully-implemented)
    - [How does a tester decide how much debugging/investigation to do before handing an issue over to development?](https://sqa.stackexchange.com/questions/1610/how-does-a-tester-decide-how-much-debugging-investigation-to-do-before-handing-a)
    - [How can a Software Tester use "Out of the Box" thinking approach to find more bugs?](https://sqa.stackexchange.com/questions/8156/how-can-a-software-tester-use-out-of-the-box-thinking-approach-to-find-more-bu)
    - [Can knowing too much about the tested code be a disadvantage?](https://sqa.stackexchange.com/questions/33922/can-knowing-too-much-about-the-tested-code-be-a-disadvantage)
    - [Should QA or tester mention the root cause for a bug?](https://sqa.stackexchange.com/questions/27962/should-qa-or-tester-mention-the-root-cause-for-a-bug)