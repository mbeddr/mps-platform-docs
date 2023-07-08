# Overcoming Obstacles

You probably already read [troubleshooting guide](trouble_shooting_guide.md), [Finding your way out | MPS User's Guide](https://www.jetbrains.com/help/mps/finding-your-way-out.html), and [Debugging](debugging.md) but are still stuck with an issue.
The following pages combine the issue of getting stuck while developing in MPS with being stuck with a certain programming problem. It doesn't matter if you are working on a new feature, fixing a bug, or just playing around with a toy project. It is important to recognize that you are stuck before spending unnecessary time
and not making any progress. If you are already annoyed or frustrated, first try to calm down before taking any further steps. Note: The words *problem*, *issue*, *bug* and *obstacle* are used as synonyms on the following pages.

[Getting unstuck | Python Principles](https://pythonprinciples.com/blog/getting-unstuck/) identifies 4 different causes
for getting stuck:

- [understanding the problem](understanding_the_problem.md)
- [debugging problems](debugging_problems.md)
- [syntax problems](syntax_problems.md)
- [thinking problems](thinking_problems.md)

After reading through the 4 pages and the [general tips](general_tips.md) page, continue with the following sections.

## Reproducibility

Some problems can't be reproduced at all or only under certain conditions. Try to create a minimal example or let a colleague open the project containing the issue on his computer. A few other factors that have caused issues in the past that affect the reproducibility of problems are:

- the operating system
    - Windows (special fonts, file system issues such as case-insensitivity or locked files)
    - Mac (special fonts, case-insensitivity with files, special handling of M1 and M2 chips)
    - Linux (rendering issues)
- the Java Runtime Environment
    - **Don't start MPS with a normal JRE or JDK, especially not an OpenJDK**. Use the provided JBR. Some of the weirdest errors can be explained this way (maybe this is related to the Java compiler itself).
    - Make sure not to mix Java versions by accident.
    - Use a JBR that supports JCEF when you intend to integrate [JCEF](jcef.md) into MPS.
- external conditions such as race conditions, non-deterministic code, different development environments
- not fully and cleanly build projects: a common issue when regenerating MPS modules/models is to just make the module instead of rebuilding them which is necessary for certain aspects such as the generator aspect.

## Implementing a Non-Perfect Solution

You are now at the stage where the problem can be solved but a perfect or even just a standard solution cannot be achieved.
As a developer, you might always strive for perfection but one of the following factors might prevent you from achieving your goal:

- a technical limitation (MPS, IntelliJ platform, Java)
- a technical limitation (existing code)
- a bug that can't be fixed at the moment
- a deadline that must be followed

Implementing a non-perfect solution, a workaround, or even a hack is still better than no solution at all. As a developer, you want to deliver high-quality
code all the time, that is performant, follows best practices, and is reusable. Sometimes this non-perfect solution can be the best as long as you make things work and the code doesn't fail. While this solution might introduce [technical debt](https://www.outsystems.com/glossary/what-is-technical-debt/) that has to be dealt with in the future, it doesn't have to be this way: the solution might be just overengineered, is pre-optimized or deals with uses cases that might not even occur in the future. If it is a rapidly changing project, the code might even get thrown out in the next release. If you decide to ship this solution, document somewhere (e.g. in the code, ticket, a design document) why the solution is implemented the way it is.

## Let It Go

There will be obstacles that you can't overcome, problems that you can't fix and features that can't be developed. Some problems are located in MPS platforms or MPS where no workaround exists
or the priority of the issue is so low that it doesn't impact the user's experience or compromises business logic. In other cases, the issue is so complex that nobody can solve it, or it isn't reproducible.

Regardless of the reason, is it okay to move forward and not work on the problem in certain cases. When a feature must be dropped it should be explained why it is dropped through a technical explanation or a simple explanation for the user. The problem can be put into a backlog so that it can be implemented in a future release or marked as won't fix it there is nothing that can be done. Not finding a solution at the moment, doesn't mean there won't be a solution or workaround in the future: a new MPS/platform version might be released, new knowledge might allow finding a solution in the future or time will be found to tackle the problem again.

As a junior developer, you might also face an issue that you are not (yet) able to solve. In those cases, ask a more senior developer for help or
pass the problem along to another developer who can look at it with a fresh mind or back to the more senior developer who assigned the ticket to you in the first place.

