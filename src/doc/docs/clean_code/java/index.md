[refactoring.guru](https://refactoring.guru/refactoring/smells) has information about general code smells.

- Be aware of common [Java gotchas](https://stackoverflow.com/questions/169815/java-common-gotchas).
- Avoid acronyms and abbreviations that may not be clear to others.
- Name methods and variables after what they mean. Before giving a name, consider the responsibility of that piece of code.[^1]
- Return empty collections instead of returning null elements ([reference](http://www.javapractices.com/topic/TopicAction.do?Id=59)). It saves the efforts needed for testing on null elements.
- Efficiency: use StringBuilder or StringBuffer for String concatenation
- Refactor your code [regularly](https://refactoring.guru/refactoring), especially when your classes or methods become too big.[^2]^, ^[^3].
- Remember to test parameters of public methods for illegal values. These methods shouldn't crash because of a NullPointer.
- Order class members by scope from private to public[^4]^, ^[^5] (the reverse order is also fine)
- Minimize the accessibility of class members. It enforces [information hiding or encapsulation](https://www.codejava.net/coding/10-java-core-best-practices-every-java-programmer-should-know#PrivateMembers).
- Avoid hardcoded values.
- Use lazy initialization if performance is [critical](http://www.javapractices.com/topic/TopicAction.do?Id=34) or use [caching](https://crunchify.com/how-to-create-a-simple-in-memory-cache-in-java-lightweight-cache/) if necessary.

# Utility and helper classes
- Utility class: include only static methods and are stateless. Don't create an instance of such a class.
- Helper class: they can be utility classes, or it can be stateful or require an instance. It can be any class whose design is to aid another class.
- Try to make the name of the utility or helper class more specific (for example: ``AdministrationHelper``, ``LoginHelper`` instead of ``Helper``).

# More tips
- If you use functional interfaces, use the [standard java ones](http://www.javapractices.com/topic/TopicAction.do?Id=277). If you want to understand the functional style, consult [this](http://www.javapractices.com/topic/TopicAction.do?Id=274) page.
- If you want to use newer Java features, have a look at [this](http://www.javapractices.com/topic/TopicAction.do?Id=225) page.
- Have a look at common sources of [complexity](http://www.javapractices.com/topic/TopicAction.do?Id=287).

[^1]:[Naming 101: A Programmer's Guide on How to Name Things](https://www.elpassion.com/blog/naming-101-programmers-guide-on-how-to-name-things)
[^2]:[Rule of 30 – When is a Method, Class or Subsystem Too Big?](https://dzone.com/articles/rule-30-%E2%80%93-when-method-class-or)
[^3]:[Avoid basic style errors](http://www.javapractices.com/topic/TopicAction.do?Id=227)
[^4]:[Ordering Class Members by Scopes](https://www.codejava.net/coding/10-java-core-best-practices-every-java-programmer-should-know#MemberOrdering)
[^5]:[Separate public and private members](http://www.javapractices.com/topic/TopicAction.do?Id=136)