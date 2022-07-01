- Don't invoke special functionality in MPS at places that don't officially support it e.g. invoking the generator in type system rules. This might not work in future versions of MPS.
- Treat warnings in MPS as errors[^1] and also don't ignore warnings and errors. Warnings might become errors or even make the compilation fail in the future. Ignoring too many messages can hide real errors that have to be addressed.
- Use the [access language](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage) instead of directly calling [ModelAccess](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.module%28MPS.OpenAPI%2F%29%2F%7EModelAccess) methods.
- Use [isInstanceOf](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1139621453865) to check if a node is an instance of a concept.
- Use [tasks](https://www.jetbrains.com/help/mps/progress-indicators.html#asynchronoustasks) for asynchronous work or work that takes a long time.
- Be careful when using unicode inside MPS. It might break something. ([ticket #1](https://youtrack.jetbrains.com/issue/MPS-33687),[ticket #2](https://youtrack.jetbrains.com/issue/MPS-31835))
- Use gradle for build scripts ([minimal example](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75)).
- Write [tests](https://www.jetbrains.com/help/mps/testing-languages.html) for new features and bugs that you have fixed that were not caught by a test
- Use the built-in collection classes such as collection, set, list and map ([documentation](https://www.jetbrains.com/help/mps/collections-language.html)). Use the correct type of collection[^2].
- Be careful with multithreading code in any of the language aspects. It is better placed in an action or background task.
- Do not leave debug statements in production code (exception [debug log](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959057f%28jetbrains.mps.baseLanguage.logging.structure%29%2F2034914114981261497) statements).
- When asynchronous code freezes (e.g. on console), try to call it with [ApplicationManager.getApplication().invokeLater(runnable)](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.application%28MPS.IDEA%2F%29%2F%7EApplication.invokeLater%2528java.lang.Runnable%2529).
- Implement [INamedConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1169194658468) in concepts that have a name. The name property can be automatically used as the name for root nodes, references etc.
- Avoid deeply nested call chains e.g. `nodea.nodeb.nodec.property`. Consider providing a method do access a property or method for the deeper levels.
- [Prefer composition over inheritance](https://specificlanguages.com/posts/prefer-composition-over-inheritance/){target=_blank} (Specific Languages Blog)
- [Warnings should not replace documentation](https://specificlanguages.com/posts/2022-03/07-warnings-should-not-replace-documentation/){target=_blank} (Specific Languages Blog)

[^1]:[Treat Warnings As Errors](https://blog.submain.com/treat-warnings-errors/)
[^2]:[Choosing the right Collection](http://www.javapractices.com/topic/TopicAction.do?Id=65)