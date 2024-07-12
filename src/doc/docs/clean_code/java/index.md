---
comments: true
tags:
- java
- best_practise
---

# Java (Base language)

To learn more about advanced Java topics such as the Java virtual machine, collections language, and many more topics,
visit [baeldung.com](https://www.baeldung.com/category/java).

[Refactoring.guru](https://refactoring.guru/refactoring/smells) has information about general code smells.

- Be aware of common [Java gotchas](https://stackoverflow.com/questions/169815/java-common-gotchas).
- Avoid acronyms and abbreviations that may not be clear to others.
- Name methods and variables after what they mean. Before giving a name, consider the responsibility of that piece of code ([Naming 101: A Programmer's Guide on How to Name Things](https://www.elpassion.com/blog/naming-101-programmers-guide-on-how-to-name-things)).
- Return empty collections instead of returning null elements ([reference](http://www.javapractices.com/topic/TopicAction.do?Id=59)). It saves the efforts needed for testing on null elements.
- Efficiency: Use [StringBuilder](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/StringBuilder.html) or [StringBuffer](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/StringBuffer.html) for String concatenation
- Refactor your code [regularly](https://refactoring.guru/refactoring), especially when your classes or methods become too big ([Rule of 30 – When is a Method, Class, or Subsystem Too Big?](https://dzone.com/articles/rule-30-%E2%80%93-when-method-class-or) and [Avoid basic style errors](http://www.javapractices.com/topic/TopicAction.do?Id=227))
- Remember to test the parameters of public methods for illegal values. These methods shouldn't crash because of a NullPointer.
- Order class members by scope from private to public ([Ordering Class Members by Scopes](https://www.codejava.net/coding/10-java-core-best-practices-every-java-programmer-should-know#MemberOrdering) and [Separate public and private members](http://www.javapractices.com/topic/TopicAction.do?Id=136))
- Minimize the accessibility of class members. It enforces [information hiding or encapsulation](https://www.codejava.net/coding/10-java-core-best-practices-every-java-programmer-should-know#PrivateMembers).
- Avoid hardcoded values.
- Use lazy initialization if performance is [critical](http://www.javapractices.com/topic/TopicAction.do?Id=34), or use [caching](https://crunchify.com/how-to-create-a-simple-in-memory-cache-in-java-lightweight-cache/) if necessary.

## Utility and Helper Classes
- Utility class: They include only static methods and are stateless. Don't create an instance of such a class.
- Helper class: They can be utility classes, or they can be stateful or require an instance. It can be any class whose design is to aid another class.
- Try to make the name of the utility or helper class more specific (e.g., *AdministrationHelper*, *LoginHelper* instead of *Helper*).

## More Tips
- If you use functional interfaces, use the [standard Java ones](http://www.javapractices.com/topic/TopicAction.do?Id=277). If you want to understand the functional style, consult the page: [Understand the functional style](http://www.javapractices.com/topic/TopicAction.do?Id=274).
  - If you want to use newer Java features, look at [Modernize old code](http://www.javapractices.com/topic/TopicAction.do?Id=225).
- Have a look at common sources of [complexity](https://web.archive.org/web/20210425130253/http://www.javapractices.com/topic/TopicAction.do?Id=287).

## [Stack Exchange: Software Engineering](https://softwareengineering.stackexchange.com/questions)

- [When do you use float, and when do you use double](https://softwareengineering.stackexchange.com/questions/188721/when-do-you-use-float-and-when-do-you-use-double)
- [What's wrong with circular references?](https://softwareengineering.stackexchange.com/questions/11856/whats-wrong-with-circular-references)
- [Are null references really a bad thing?](https://softwareengineering.stackexchange.com/questions/12777/are-null-references-really-a-bad-thing)
- [Exceptions: Why throw early? Why catch late?](https://softwareengineering.stackexchange.com/questions/231057/exceptions-why-throw-early-why-catch-late)
- [How do quick & dirty programmers know they got it right?](https://softwareengineering.stackexchange.com/questions/124835/how-do-quick-dirty-programmers-know-they-got-it-right)
- [Why is Global State so Evil?](https://softwareengineering.stackexchange.com/questions/148108/why-is-global-state-so-evil)
- [How would you know if you've written readable and easily maintainable code?](https://softwareengineering.stackexchange.com/questions/141005/how-would-you-know-if-youve-written-readable-and-easily-maintainable-code)
- [How do you know you're writing good code?](https://softwareengineering.stackexchange.com/questions/61655/how-do-you-know-youre-writing-good-code)