---
tags:
- baselanguage
- best_practise
- ui
---

This document lists some recommendations for code written it MPS.

## Implementation

- {{ blog('sl',false) }}[Prefer composition over inheritance](https://specificlanguages.com/posts/prefer-composition-over-inheritance/)
- Implement [INamedConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1169194658468) in concepts that should have a name. The name property can be automatically used as the name for root nodes, references etc.
- Avoid deep nested call chains, for example: `nodea.nodeb.nodec.property`. Consider providing a method to access a property or method for the deeper levels.
- Use [isInstanceOf](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1139621453865) to check if a node is an instance of a concept.
- Use the built-in collection classes such as collections, set, list, and map ([documentation](https://www.jetbrains.com/help/mps/collections-language.html)). Use the correct type of collection[^4].
- Use the [access language](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage) instead of directly calling [ModelAccess](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.module%28MPS.OpenAPI%2F%29%2F%7EModelAccess) methods.
- Write [tests](https://www.jetbrains.com/help/mps/testing-languages.html) for new features and bugs that you have fixed that weren't caught by a test.
- Don't invoke specific features in MPS at places that don't officially support it, for example, invoking the generator in type system rules. This might not work in future versions of MPS.

## Null safety

- Use language [checkedDots](https://www.jetbrains.com/help/mps/other-languages.html) for saver access of possible null values. You can check nodes for null: [node.isNull](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1171999116870)
- Use annotation `#!java @NotNull` and `#!java @Nullable` for baselanguage code. a specific type system rule in MPS checks these annotations.
- Use [:eq:](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1225271283259) (NPE safe equals operation) and [\:ne:](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1225271221393) 
  NPE safe not equals operation instead of [==](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1068580123152) and `#!java equals`.
- Return optional values instead of null in `baselanguage` code[^1].

## Exceptions and warnings

- Use checked exceptions for recoverable conditions and run-time exceptions for programming errors [^2]^,^[^3].
- Consider alternative ways of showing errors than throwing exceptions such as showing [notifications](https://plugins.jetbrains.com/docs/intellij/notifications.html#top-level-notifications-balloons). Examples for such notifications are balloons and dialogs.
- Attach throwable objects to logging statements if available:
  `#!java log error "This is an error",errorObject`
- Clean up in the *finally-block* of a try statement.
- Treat warnings in MPS as errors[^5] and also don't ignore warnings and errors. Warnings might become errors or even make the compilation fail in the future. Ignoring too many messages can hide real errors that you have to address.
- Specific Languages blog: [Warnings should not replace documentation](https://specificlanguages.com/posts/2022-03/07-warnings-should-not-replace-documentation/)

## Swing components

- Use components from the IntelliJ platform. [here](https://plugins.jetbrains.com/docs/intellij/misc-swing-components.html) describe some more components. Use the [IntelliJ platform UI guidelines](https://jetbrains.github.io/ui/) to create consistent and usable user interfaces.
- Capitalization: most of the short textual items (menus, buttons, labels, for example) should have headline capitalization. Capitalize all words except for common words with up to three letters (*a*, *an*, *the*, *and*, *or*, *so*, *yet*, etc.), and don't appear as the first or last word.
  If the text isn't short, then you should use the capitalization used in ordinary prose (sentence capitalization) instead.
- Read the [Swing tutorials](https://docs.oracle.com/javase/tutorial/uiswing/index.html) to get a better understanding of the components.

## Multithreading and asynchronous code

- Be careful with multithreading code in any of the language aspects. It's better placed in an action or background task.
- When asynchronous code freezes (for example: on the console), try to call it with [ApplicationManager.getApplication().invokeLater(runnable)](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.application%28MPS.IDEA%2F%29%2F%7EApplication.invokeLater%2528java.lang.Runnable%2529).
- Use [tasks](https://www.jetbrains.com/help/mps/progress-indicators.html#asynchronoustasks) for asynchronous work or work that takes a long time.

## Miscellaneous

- Be careful when using unicode inside MPS. It might break something (MPS-33687, MPS-31835).
- Use gradle for build scripts ([minimal example](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75)).
- Do not leave debug statements in production code (exception: [debug log](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959057f%28jetbrains.mps.baseLanguage.logging.structure%29%2F2034914114981261497) statements).

[^1]:[Return Optional not null](http://www.javapractices.com/topic/TopicAction.do?Id=279)
[^2]:[Java Best Practices Quick Reference](https://dzone.com/articles/java-best-practices-quick-reference)
[^3]:[Checked versus unchecked exceptions](http://www.javapractices.com/topic/TopicAction.do?Id=129)
[^4]:[Choosing the right Collection](http://www.javapractices.com/topic/TopicAction.do?Id=65)
[^5]:[Treat Warnings As Errors](https://blog.submain.com/treat-warnings-errors/)