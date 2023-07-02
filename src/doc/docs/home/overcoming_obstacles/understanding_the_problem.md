# [Understanding the problem](https://pythonprinciples.com/blog/getting-unstuck/#incomplete-understanding)

Not understanding the problem 100%, is often the problem. Read the problem several times until you can explain it to someone else. If you don't fully
understand a problem, you can't solve it.
Here are some questions that you can ask yourself:

- Did you read the full description of the ticket or problem?
- Was anything unclear?
- Can you restate it in your own words?

## Tickets

Solve for the goal, not what you’re given in the ticket but contact the submitter of the ticket and ask for clarification if something is unclear: you might misinterpret the meaning of it or something is explained poorly. People that specify tickets/problems sometimes miss edge cases, don't go into detail, or don't provide enough information. Try to ask them early, it saves you a lot of time.

If the ticket contains the specification for a feature, read [How to Constructively Read a Spec | hackernoon.com](https://hackernoon.com/how-to-constructively-read-a-spec-fac917f58893) first if you have trouble understanding
a big wall of text or reading carefully.

## Exceptions

When you are a developer and use an open-source library, read the source code and look at the latest changes in the offending files to figure out what's
going on. Make sure to look at the code of the correct branch. For the MPS platforms, the naming scheme is most often maintenance/mpsX, for MPS itself, it is just mpsX. If you are dealing with an exception, try to google it first, especially if it is a standard Java exception. Some MPS-specific exceptions
are explained on the page [exceptions](exceptions.md).

To make the problem more reproducible, write a test for it. When you fix the code and the test is green, the code coverage rises, and
you can be more confident when making changes to the code in the future.

