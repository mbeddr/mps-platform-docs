---
comments: true
hide:
- toc
tags:
- best_practise
---

# Programming Principles

These are some general programming principles taken from [this article](https://dzone.com/articles/java-best-practices-quick-reference) that you can also apply to MPS:

- **KISS** (Keep It Simple, Stupid): At the beginning of their journey, you may notice that developers try to implement complicated, ambiguous designs.
- **DRY** (Don’t Repeat Yourself): Try to avoid any duplicates. Instead, you put them into a single part of the system or a method.
- **YAGNI** (You Ain’t Gonna Need It): If you run into a situation where you are asking yourself, "What about adding extra (feature, code, …etc.)?", you probably need to rethink it.
- **Clean code over clever code**: Speaking of clean code, leave your ego at the door, and forget about writing clever code.
- **Avoid premature optimization**: The problem with premature optimization is that you can never know where a program’s bottlenecks will be until after the fact.
- **Single responsibility**: Every class or module in a program should only provide one bit of specific functionality.
- **Fail fast, fail hard**: The fail-fast principle stands for stopping the current operation as soon as any unexpected error occurs. Adhering to this principle generally results in a more stable solution.

[refactoring.guru](https://refactoring.guru/design-patterns/catalog) describes general Java design patterns and includes very nice illustrations.