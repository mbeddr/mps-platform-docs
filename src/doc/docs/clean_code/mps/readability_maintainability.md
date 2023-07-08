---
hide:
- toc
tags:
- baselanguage
- best_practise
---

This page focuses on creating MPS code that is easy to read but also deals with the topic of maintainability. Too often code is
written by one person but has to be maintained by someone else. Understanding the mindset of other people can be difficult,
especially if they don't follow any patterns and the code is (visually) hard to read.

Part of maintaining code means also dealing with technical debt and reducing it, as well as cleaning up the codebase periodically.
That also means that sometimes code must be deprecated and removed after some time. Or it must be rewritten when it uses deprecated code e.g.
after upgrading to a new MPS version. Neglecting those tasks makes maintaining the code more difficult in the future.

## Readability

Establishing a coding style is important for Base Language code but also other parts of your code such as the language aspects.
When the code is consistent it is also easier for other people to understand because they can see patterns in the code.
For writing names, read: [Write short code with good names | Sandi Metz's Rules for OOP](https://yiming.dev/blog/2017/08/23/sandi-metzs-rules-for-oop/#orgda11695). Read the [MPS Java style guide](java_style_guide) for more ideas.
In addition to consistency, short code helps readability.

Learning to write readable code takes time and must be practiced. Coding standards can help enforce certain patterns but sometimes
code reviews are necessary so that other people can help improve your code.

- Simplicity: You should strive to make your code as simple as possible. Unnecessary complexity will only make the code hard to understand and prone to errors. The code can be clever, as long as it focuses on readability and maintainability. If the code is kept short it is easier to go through, but if it’s too smart, it will take too much time to understand and edit it.
- Use the same naming scheme for concepts (e.g. start interfaces with the letter "I"), intentions, or actions. Always place code in behavior methods
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

- Extract long boolean expressions that are used as conditions into variables. For example:
  ```java
  if ((object.size > 20 && object.shape.equals("rectangle")) && (object.color.equals("black") || object.color.equals("gray")) && (object.buttons.contains("power") && object.buttons.contains("volume") && object.buttons.contains("channel")) && (object.hasPowerCord())) {
  // The object is a TV
  } 
  ```    
  Long boolean expressions can be split up into variables:
  ```java
  boolean hasScreen = object.size > 20 && object.shape.equals("rectangle");
  boolean hasRemote = object.color.equals("black") || object.color.equals("gray");
  boolean hasSpeakers = object.buttons.contains("power") && object.buttons.contains("volume") && object.buttons.contains("channel");
  boolean hasPowerCord = object.hasPowerCord();

  if (hasScreen && hasRemote && hasSpeakers && hasPowerCord) {
  // The object is a TV
  }
  ```
  Conditions can be reduced by saving them in closures or functions. For example:
  ```java
  {int => boolean} isEven = {int number => number % 2 == 0; };
  #print isEven(1); 
  ```
  If statements can also improve readability when they are used as guard clauses, also known as assert or precondition. Compare the following snippets:
  the first one doesn't use guard clauses.
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

- Use enhanced for loops instead of for loops with counters. For example:
  ```java
  for(type variable:iterable) {}
  
  foreach(variable in iterable) {}
  ```
  The second statement doesn't even need a type for the variable. For lists, other ways exist: `list.forEach({it => })` for iterating the list and `list.select({it => <no statements> })` or `list.selectMany({it => <no statements> })` for transforming the list. For adding many elements to a list, `list.addAll(elements)` can be used.

- Use empty lines between statements for readability([StackOverflow discussion](https://softwareengineering.stackexchange.com/questions/17305/how-do-you-use-blank-lines-in-your-code)). When a line becomes too long, a few [BaseLanguage refactorings](https://www.jetbrains.com/help/mps/default-keymap-reference.html#baselanguagerefactoring) can be used such as introducing variables or extracting code into a method.
  You might also want to experiment with the default text width of the editor (preferences --> *Editor* --> *MPS Editor*) which is set to 120 by default.
  This value is quite low and can be increased depending on your monitor size.
- Use virtual packages to organize your code. How you organize the modules is up to you. Some suggestions:
    - by type of module: lang, test, build...
    - by a group of languages: tables, tooltips, widgets... or core, expr, trace...
    - by language maturity: stable, staging, rest...
    - by a numbering system + other criteria: _10_build, _50_active, _60_demo, _70_attic
- Avoid double negation as they are hard to understand. Also, use a positive tone to help with understanding statements more intuitively. Example:
  ```
  boolean isDisabled = true; 
  if (!isDisabled) { // bad
  }
  x.setDisabled(true) // bad
  x.setEnabled(true) // good
  ```
- Avoid deep nesting. This can be, for example, a chain of calls (`#!java nodea.nodeb.nodec.property`). Consider providing a method to access deeper nested nodes or jump
  to the nested node directly. For example:
  ```java
  #print classNode.getAllIfStatements()
  #print classifier.ancestor<concept = ClassConcept>
  #print classNode.descendants<concept = Classifier>
  ```
  This is also relevant for if conditions, loops, and nested methods calls. Keep them flat or use only a few levels of nesting.
  -  4 parameter rule: a method accepting a large number of parameters is hard to follow. A good maximal number of parameters is 4.
  Methods can be refactored into smaller methods, [MPS builders](https://www.jetbrains.com/help/mps/builders.html) can also be used to avoid many parameters.
- Group your code. Base Language code: group the fields and methods of the class by their visibility and purpose. For example, group the private fields and methods together, and group the public fields and methods together. Also, group the fields and methods that are related to each other by their functionality or logic. Also, break down big tasks into smaller chunks. Long (behavior) methods can be split up into multiple methods. Helper methods
  can be placed as static methods into separate classes. To call them more easily, [extension methods](https://www.jetbrains.com/help/mps/type-extension-methods.html) can be used. For example:
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
  Code can also be grouped into multiple root nodes, models, or even modules. If the generation spans across multiple models,
   [cross-model generation](https://www.jetbrains.com/help/mps/generation-plan.html#cross-modelgeneration) applies.
  - [Prefer Readable Code to Comments | ncrcoe.gitbooks.io](https://ncrcoe.gitbooks.io/java-for-small-teams/content/style/20_prefer_readable_code_to_comments.html)

## Maintainability

- Mark classes/concepts etc. as deprecated when they shouldn't be used and will be removed in the future. When a deprecation date is added
  it can be used as a reminder to remove deprecated code in regular intervals or even enforce it through a [linter](https://github.com/mbeddr/mps-qa/blob/master/code/languages/org.mpsqa.lint/README.md).

<figure markdown>
  ![deprecated node annotation](deprecated.png)
  <figcaption markdown>[DeprecatedNodeAnnotation](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590292%28jetbrains.mps.lang.structure.structure%29%2F1224240836180)</figcaption>
</figure>

<figure markdown>
  ![deprecated block doc tag](deprecated2.png)
  <figcaption markdown>[DeprecatedBlockDocTag](http://127.0.0.1:63320/node?ref=r%3A4095af4f-a097-4799-aaa9-03df087ddfa6%28jetbrains.mps.baseLanguage.javadoc.structure%29%2F8465538089690331492) and [Java Deprecated annotation](http://127.0.0.1:63320/node?ref=6354ebe7-c22a-4a0f-ac54-50b52ab9b065%2Fjava%3Ajava.lang%28JDK%2F%29%2F%7EDeprecated)</figcaption>
</figure>

- Use the text *TODO*, *FIX* or *FIXME* in comments. The *TODO* tool can find those strings as well as the commit dialog when the option *Check TODO (all)* is activated.
  Other texts that are not supported by the tool but are common are [NOTE, XXX, HACK, and BUG](https://stackoverflow.com/a/7284583)
- Don't repeat code. You can write the same code twice but consider creating a method when the code is duplicated again.
  Repeated code breaks the reading flow and makes updating the code more difficult.
- Delete unnecessary code. There is no point in keeping code and commenting out if it is not used. If you use version control and need to go back to
  the old code, you can still find it in the history.
- Comments can be used to document complex code. Don't use them if the method signature already contains all the necessary information.
  Not every piece of information should be placed next to the code. Documentation, such as this website, or documentation created with
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
