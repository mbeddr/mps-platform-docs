---
comments: true
---

# [Understanding the Problem](https://pythonprinciples.com/blog/getting-unstuck/#incomplete-understanding)

Not understanding the problem 100% is often the problem. Read the task/issue several times until you can explain it to someone else. If you don't fully
understand a problem, you can't solve it.
Here are some questions that you can ask yourself:

- Did you read the full description of the ticket or problem?
- Was anything unclear about it?
- Can you restate it in your own words?

## Tickets

Solve for the goal, not what you’re given in the ticket. Contact the ticket submitter and ask for clarification if something is unclear: you might misinterpret the meaning, or he explained something poorly. People that specify tickets/problems sometimes miss edge cases, don’t go into detail, or don’t provide enough information. Try to ask them early. It saves you a lot of time.

If the ticket contains the specification for a feature, read [How to Constructively Read a Spec | hackernoon.com](https://hackernoon.com/how-to-constructively-read-a-spec-fac917f58893) first if need help understanding a giant wall of text or learning to read a specification carefully.

## Exceptions

When you are a developer using an open-source library, read the source code and look at the latest changes in the offending files to figure out what’s happening. Make sure to look at the code of the correct branch. For the MPS platforms, the naming scheme is most often maintenance/mpsX; for MPS itself, it is just mpsX. If you are dealing with an exception, try to google it first, especially if it is a standard Java exception. The page [exceptions](exceptions.md) explains some MPS-specific exceptions.

To make the problem more reproducible, write a test for it. When you fix the code, and the test is green, the code coverage rises, and
you can be more confident when making changes to the code in the future.

