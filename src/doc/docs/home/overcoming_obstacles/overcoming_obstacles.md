# Overcoming Obstacles

You probably already read the [troubleshooting guide](trouble_shooting_guide.md), [Finding your way out | MPS User's Guide](https://www.jetbrains.com/help/mps/finding-your-way-out.html) and [Debugging](debugging.md) but you still need help with an issue.
The following pages combine the issue of getting stuck while developing in MPS with struggling with general programming problems. Whether you are working on a new feature, fixing a bug, or just playing around with a toy project doesn't matter. Recognizing that you can't move forward before spending unnecessary time and not making any progress is essential. If you are already annoyed or frustrated, try to calm down before taking further steps. Note: The words *problem*, *issue*, *bug*, and *obstacle* are synonyms on the following pages.

[Getting unstuck | Python Principles](https://pythonprinciples.com/blog/getting-unstuck/) identifies four different causes
for getting stuck:

- [understanding the problem](understanding_the_problem.md)
- [debugging problems](debugging_problems.md)
- [syntax problems](syntax_problems.md)
- [thinking problems](thinking_problems.md)

After reading through the different causes and the [general tips](general_tips.md) page, continue with the following sections.

## Reproducibility

Some problems can't be reproduced at all or only under certain conditions. Try to create a minimal example or let a colleague open the project containing the issue on his computer. A few other factors that have caused issues in the past that affect the reproducibility of problems are:

- the operating system
    - Windows (particular fonts, file system issues such as case-insensitivity or locked files)
    - Mac (particular fonts, case-insensitivity with files, special handling of M1 and M2 chips)
    - Linux (rendering issues)
- the Java Runtime Environment
    - **Don't start MPS with a normal JRE or JDK, especially not an OpenJDK**. Use the provided JBR. Some of the weirdest errors can be explained this way (maybe this is related to the Java compiler itself).
    - Make sure to avoid mixing Java versions by accident.
    - Use a JBR that supports JCEF when you intend to integrate [JCEF](jcef.md) into MPS.
- External conditions such as race conditions, non-deterministic code, different development environments
- Only partially and cleanly build projects: A common issue when regenerating MPS modules/models is to make the module instead of rebuilding them, which is necessary for certain aspects, such as the generator aspect.

## Implementing a Non-Perfect Solution

You are now at the stage where you can solve the problem but are still trying to achieve a perfect or standard solution.
As a developer, you might always strive for perfection, but one of the following factors might prevent you from achieving your goal:

- a technical limitation (MPS, IntelliJ platform, Java)
- a technical limitation (existing code)
- a temporarily unfixable bug
- a deadline that you have to follow

Implementing a non-perfect solution, a workaround, or even a hack is still better than no solution. As a developer, you want to consistently deliver high-quality, performant code that follows best practices and is reusable. . Sometimes this non-perfect solution can be the best as long as you make things work and the code doesn't fail. While this solution might introduce [technical debt](https://www.outsystems.com/glossary/what-is-technical-debt/) that you have to deal with in the future, it can be a different way: the implementation might be just overengineered, pre-optimized, or deals with use cases that might not even occur. The code might get thrown out in the next release if it is a rapidly changing project. If you decide to ship this solution, document somewhere (e.g., in the code, ticket, a design document) why you implemented the code the way you did.

## Let It Go

There will be obstacles you can't overcome, problems you can't fix, and features you can't develop. Some issues exist in MPS platforms or MPS where no workaround exists or the issue's priority is so low that it doesn't impact the user's experience or compromise business logic. In other cases, the problem is so complex that nobody can solve it or isn't reproducible.

Moving forward is sometimes okay. Stop working on the problem. When you have to drop a feature, explain why you dropped it. The problem can also be put into a backlog so that you can implement it in a future release or mark it as won't fix if you can do nothing about it. Not finding a solution at the moment doesn't mean there won't be a solution or workaround in the future. Bug fixes in a new MPS version or platform or new knowledge might load to finding a solution, or you find time to tackle the problem again.

As a junior developer, you might also face issues where you are not up to the task. In those cases, ask a more senior developer for help or pass the problem along to another developer who can look at it with a fresh mind. You can also give it back to the more senior developer who assigned the ticket to you in the first place.