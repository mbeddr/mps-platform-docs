---
tags:
- baselanguage
- best_practise
---

- Use enhanced for loops instead of for loops with counters:
  `#!java for(type variable:iterable)` and `#!java foreach variable in iterable`
- Mark classes/concepts etc. as deprecated when you shouldn't use them.

<figure markdown>
  ![deprecated node annotation](deprecated.png)
  <figcaption markdown>[DeprecatedNodeAnnotation](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590292%28jetbrains.mps.lang.structure.structure%29%2F1224240836180)</figcaption>
</figure>

<figure markdown>
  ![deprecated block doc tag](deprecated2.png)
  <figcaption markdown>[DeprecatedBlockDocTag](http://127.0.0.1:63320/node?ref=r%3A4095af4f-a097-4799-aaa9-03df087ddfa6%28jetbrains.mps.baseLanguage.javadoc.structure%29%2F8465538089690331492)</figcaption>
</figure>

<figure markdown>
  ![Java deprecated annotation](deprecated3.png)
  <figcaption markdown>[Java Deprecated annotation](http://127.0.0.1:63320/node?ref=6354ebe7-c22a-4a0f-ac54-50b52ab9b065%2Fjava%3Ajava.lang%28JDK%2F%29%2F%7EDeprecated)</figcaption>
</figure>

- Use the text *TODO* in comments. The *TODO* tool can find these strings.
- Check for redundant variable initializers (type system warning).
- Use empty lines between statements (for example method declarations) for readability.
- Use virtual packages to organize your code.