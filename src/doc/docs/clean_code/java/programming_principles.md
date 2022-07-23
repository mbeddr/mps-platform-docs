# Programming principles

These are some general programming principles taken from [this article](https://dzone.com/articles/java-best-practices-quick-reference) which can also be applied to MPS:

- **KISS** (Keep It Simple, Stupid): you may notice that developers at the beginning of their journey try to implement complicated, ambiguous design.
- **DRY** (Don’t Repeat Yourself): try to avoid any duplicates, instead, you put them into a single part of the system or a method.
- **YAGNI** (You Ain’t Gonna Need It): if you run into a situation where you are asking yourself, “What about adding extra (feature, code, …etc.) ?”, you probably need to rethink it.
- **Clean code over clever code**: speaking of clean code, leave your ego at the door, and forget about writing clever code.
- **Avoid premature optimization**: the problem with premature optimization is that you can never really know where a program’s bottlenecks will be until after the fact.
- **Single responsibility**: every class or module in a program should only concern itself with providing one bit of specific functionality.
- **Fail fast, fail hard**: the fail-fast principle stands for stopping the current operation as soon as any unexpected error occurs. Adhering to this principle generally results in a more stable solution

[refactoring.guru](https://refactoring.guru/design-patterns/catalog) describes general Java design patterns and also includes very nice illustrations.