---
hide:
- toc
tags:
- baselanguage
- best_practise
---

This page focuses on creating MPS code that is easy to read but also deals with the topic of maintainability. Too often, code is
written by one person but has to be maintained by someone else. Understanding the mindset of other people can be difficult,
especially if they don't follow any patterns and the code is (visually) hard to read.

Maintaining code means dealing with technical debt, reducing it, and cleaning up the codebase periodically.
That also means that sometimes code must be deprecated and removed after some time. Or it must be rewritten when it uses deprecated code, e.g.,
after upgrading to a new MPS version. Neglecting those tasks makes maintaining the code more difficult in the future.

## Readability

Establishing a coding style is essential for Base Language code and other parts of your code, such as the language aspects.
When the code is consistent, it is also easier for other people to understand because they can see patterns in the code.
For writing names, read: [Write short code with good names | Sandi Metz's Rules for OOP](https://yiming.dev/blog/2017/08/23/sandi-metzs-rules-for-oop/#orgda11695). Read the [MPS Java style guide](java_style_guide) for more ideas.
In addition to consistency, short code helps readability.

Learning to write readable code takes time and must be practiced. Coding standards can help enforce specific patterns, but sometimes
code reviews are necessary so that others can help improve your code.

- Simplicity: You should strive to make your code as simple as possible. Unnecessary complexity will make the code hard to understand and prone to errors. The code can be clever if it focuses on readability and maintainability. If the code is kept short, it is easier to go through, but if it's too smart, it will take too much time to understand and edit.
- Use the same naming scheme for concepts (e.g., start interfaces with the letter "I"), intentions, or actions. Always place code in behavior methods
  or utility classes with similar naming patterns. Follow standard naming conventions such as camelCase for variables.
- Name temporary variables such as counter variables consistently. Read [this StackOverflow answer](https://softwareengineering.stackexchange.com/a/127948)
  for some ideas on how to name variables.
- Create methods if the code becomes too long and avoid boilerplate code. For example: Use setters and getters for classes:
```
  public int a {get; private set;} 
  public int b {get;
    set(value) {
      System.out.println("" + a + b + this.a);
    }
  }
```
A property can be created by typing `property` at the same place where fields are declared.

- Extract long, boolean expressions that you use as conditions into variables. For example:
  ```java
  if ((object.size > 20 && object.shape.equals("rectangle")) && (object.color.equals("black") || object.color.equals("gray")) && (object.buttons.contains("power") && object.buttons.contains("volume") && object.buttons.contains("channel")) && (object.hasPowerCord())) {
  // The object is a TV
  } 
  ```    
  Split up boolean expressions into variables:
  ```java
  boolean hasScreen = object.size > 20 && object.shape.equals("rectangle");
  boolean hasRemote = object.color.equals("black") || object.color.equals("gray");
  boolean hasSpeakers = object.buttons.contains("power") && object.buttons.contains("volume") && object.buttons.contains("channel");
  boolean hasPowerCord = object.hasPowerCord();

  if (hasScreen && hasRemote && hasSpeakers && hasPowerCord) {
  // The object is a TV
  }
  ```
  You can reduce conditions by saving them in closures or functions. For example:
  ```java
  {int => boolean} isEven = {int number => number % 2 == 0; };
  #print isEven(1); 
  ```
  If statements can also improve readability when you use them as guard clauses, also known as assert or precondition. Compare the following snippets:
  The first one doesn't use guard clauses.
  ```java
  public void updateData(Data data) {
    if (data == null) {
      return;
    } else if (data.isPresent()) {
      // do stuff here
    } else {
      throw new Exception(msg);
    }
  }
  ```
  The second snippet uses them and is more readable.
  ```java
  public void updateData(Data data) {
    if (data == null) return;
    if (!data.isPresent()) trow new Exception(msg);
    // do stuff here
  }
  ```

- Functional interfaces [accept lambdas](https://www.baeldung.com/java-8-lambda-expressions-tips) as parameters. For example, a thread that accepts a Runnable object can also be called like this:
```java
new Thread({ => System.out.println("Thread"); }).start()
```

- Use enhanced *for* loops instead of *for* loops with counters. For example:
  ```java
  for(type variable:iterable) {}
  
  foreach(variable in iterable) {}
  ```
  The second statement doesn't even need a type for the variable. For lists, other ways exist: `list.forEach({it => })` for iterating the list and `list.select({it => <no statements> })` or `list.selectMany({it => <no statements> })` for transforming the list. For adding many elements to a list, use `list.addAll(elements)`.

- Use empty lines between statements for readability([StackOverflow discussion](https://softwareengineering.stackexchange.com/questions/17305/how-do-you-use-blank-lines-in-your-code)). When a line becomes too long, you can use a few [Base Language refactorings](https://www.jetbrains.com/help/mps/default-keymap-reference.html#baselanguagerefactoring), such as introducing variables or extracting code into a method.
  You might also want to experiment with the default text width of the editor (preferences --> *Editor* --> *MPS Editor*), which is set to 120 by default.
  This value is relatively low and can be increased depending on your monitor size.
- Use virtual packages to organize your code. How you arrange the modules is up to you. Some suggestions:
    - Arrange type of module: lang, test, build, etc.
    - Arrange by a group of languages: tables, tooltips, widgets... or core, expr, trace, etc.
    - Arrange by language maturity: stable, staging, rest, etc.
    - Arrange by a numbering system + other criteria: _10_build, _50_active, _60_demo, _70_attic, etc.
- Avoid double negation as they are hard to understand. Also, use a positive tone to help with understanding statements more intuitively. Example:
  ```
  boolean isDisabled = true; 
  if (!isDisabled) { // bad
  }
  x.setDisabled(true) // bad
  x.setEnabled(true) // good
  ```
- Avoid deep nesting like a chain of calls (`#!java nodea.nodeb.nodec.property`). Consider providing a method to access deeper nested nodes or directly jump to the nested node. For example:
  ```java
  #print classNode.getAllIfStatements()
  #print classifier.ancestor<concept = ClassConcept>
  #print classNode.descendants<concept = Classifier>
  ```
  The nesting is also relevant for if conditions, loops, and nested method calls. Keep them flat, or use only a few levels of nesting.
- Four-parameter rule: a method accepting many parameters is hard to follow. A good maximal number of parameters is four.
Refactor methods into smaller methods. You can use [MPS builders](https://www.jetbrains.com/help/mps/builders.html) to avoid many parameters.
- Group your code: Group the fields and methods of Base Language classes by their visibility and purpose. For example, group the private fields and methods, and group the public fields and methods together. Also, group the fields and methods related to each other by their functionality or logic. Also, break down big tasks into smaller chunks. You can split up long (behavior) methods into multiple methods. You can place helper methods
  as static methods into separate classes. Call them more easiliy using [Extension methods](https://www.jetbrains.com/help/mps/type-extension-methods.html) For example:
  ```java
  extension methods String {
    public void customMethod() for String {
    }  
  }
  
  public class S {
  
    public static void main(string[] args) {
        "test".customMethodx();
    }
  }
  ```
  Group code into multiple root nodes, models, or modules. If the generation is across multiple models,
   [cross-model generation](https://www.jetbrains.com/help/mps/generation-plan.html#cross-modelgeneration) applies.
  - [Prefer Readable Code to Comments | ncrcoe.gitbooks.io](https://ncrcoe.gitbooks.io/java-for-small-teams/content/style/20_prefer_readable_code_to_comments.html)

## Maintainability

- Mark classes/concepts etc., as deprecated when you don't want others to use them, and you will remove them in the future. When you add a deprecation date, you can use it as a reminder to remove deprecated code in regular intervals or enforce it through a [linter](https://github.com/mbeddr/mps-qa/blob/master/code/languages/org.mpsqa.lint/README.md).

<figure markdown>
  ![deprecated node annotation](deprecated.png)
  <figcaption markdown>[DeprecatedNodeAnnotation](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590292%28jetbrains.mps.lang.structure.structure%29%2F1224240836180)</figcaption>
</figure>

<figure markdown>
  ![deprecated block doc tag](deprecated2.png)
  <figcaption markdown>[DeprecatedBlockDocTag](http://127.0.0.1:63320/node?ref=r%3A4095af4f-a097-4799-aaa9-03df087ddfa6%28jetbrains.mps.baseLanguage.javadoc.structure%29%2F8465538089690331492) and [Java Deprecated annotation](http://127.0.0.1:63320/node?ref=6354ebe7-c22a-4a0f-ac54-50b52ab9b065%2Fjava%3Ajava.lang%28JDK%2F%29%2F%7EDeprecated)</figcaption>
</figure>

- Use the text *TODO*, *FIX*, or *FIXME* in the comments. The *TODO* tool can find those strings and the commit dialog when the option *Check TODO (all)* is activated.
  Other texts not supported by the tool but common are [NOTE, XXX, HACK, and BUG](https://stackoverflow.com/a/7284583).
- Don't repeat code. You can write the same code twice but consider creating a method when you duplicate the code again.
  Repeated code breaks the reading flow and makes updating the code more complex.
- Delete unnecessary and unused code. If you use version control and need to return to
  the old code, you can still find it in the history.
- Use comments to document complex code. Don't use them if the method signature contains all the necessary information.
  You don't have to place every piece of information next to the code. You can use documentation, such as this website, or documentation created with
  *com.mbeddr.doc* (+ optional *com.mbeddr.aspect*) can be used not only for user documentation but also for technical guides for
  developers.
- Avoid using magic numbers which are direct usages of numbers in the code. Example:
  ```java
  double x = 0.2; // What does this variable represent?
  double y = 100; // And this one?
  double z = 0.1; // And this one?
  double w = y * (1 - z) * (1 + x); // What is the meaning of this expression?
  System.out.println("The result is " + w); // What is the result 
  ```
## [Stack Exchange: Software Engineering](https://softwareengineering.stackexchange.com/questions)

- [What's wrong with comments that explain complex code?](https://softwareengineering.stackexchange.com/questions/254978/whats-wrong-with-comments-that-explain-complex-code)
- [When is a BIG Rewrite the answer?](https://softwareengineering.stackexchange.com/questions/6268/when-is-a-big-rewrite-the-answer)
- [How can I convince management to deal with technical debt?](https://softwareengineering.stackexchange.com/questions/43948/how-can-i-convince-management-to-deal-with-technical-debt)
- [How do I know how reusable my methods should be?](https://softwareengineering.stackexchange.com/questions/382069/how-do-i-know-how-reusable-my-methods-should-be)
