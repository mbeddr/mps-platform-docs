---
hide:
- toc
tags:
- java
- best_practise
---

These are some points taken from the [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html) that make sense in MPS.

- [Fall-through: commented](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Write a comment on why a fall-through is necessary inside a switch statement.
- The [default case is present](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Always write a default case for switch statements.
- [Rules common to all identifiers](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Identifiers use only ASCII letters and digits and, in a few cases noted below, underscores. Don't use prefixes or suffixes with particular meanings. For example, these names don't adhere to the style: *name_*, *mName*, *s_name*, and *kName*.
- [Package names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch) are all lowercase, with consecutive words concatenated together (no underscores). For example, *com.example.deepspace*, not *com.example.deepSpace* or *com.example.deep_space*.
- [Class names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): should be in UpperCamelCase. Class names are typically nouns or noun phrases, for example, *Character* or *ImmutableList*. Interface names may also be nouns or noun phrases (for example, *List*) but may sometimes be adjectives or adjective phrases instead (for example, *Readable*). Test classes should start with the name of the class they're testing and end with Test, e.g., *HashTest* or *HashIntegrationTest*.
- [Method names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): should be in lowerCamelCase. Method names are typically verbs or verb phrases, for example, `sendMessage or stop`. Underscores may appear in JUnit test method names to separate logical components of the name, with each component written in lowerCamelCase. One typical pattern is <methodUnderTest>_<state>, e.g., *pop_emptyStack*. No correct way exists for naming test methods.
- [Constant names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Use all uppercase letters, with each word separated from the next by a single underscore
- [Non-constant field names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Non-constant field names (static or otherwise) should be *lowerCamelCase*. These names are typically nouns or noun phrases, for example, *computedValues* or *index*.
- [Parameter names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch) should be *lowerCamelCase*. Avoid one-character parameter names in public methods.
- [Local variable names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch) should be in lowerCamelCase. Even when final and immutable, local variables are not considered constants, and you should not style them as constants.
- [Type variable names](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): Each type variable should adhere to one of two styles: a single capital letter, optionally followed by a single numeral (such as *E*, *T*, *X*, *T2*), or a name in the form used for classes, followed by the capital letter *T* (examples: *RequestT*, *FooBarT*).
- [Camel case: defined](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch): tutorial on how to write camelcase
- [Don't ignore caught exceptions](https://google.github.io/styleguide/javaguide.html#s4.8.4-switch)
  (see also: [Avoid empty catch blocks](http://www.javapractices.com/topic/TopicAction.do?Id=16))

[javapractices.com]( http://www.javapractices.com/home/HomeAction.do) contains additional java practices.