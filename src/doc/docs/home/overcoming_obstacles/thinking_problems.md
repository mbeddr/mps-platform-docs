# [Thinking Problems](https://pythonprinciples.com/blog/getting-unstuck/#thinking-problems)

You can do it without much thought when you have an easy coding problem. When you have to deal with a new topic that you are unfamiliar with
or have to dive into a large code base (with little documentation), you start guessing and trying things with the hope that something will eventually work.
Especially with unfamiliar domains and unclear requirements, there is the risk of getting overwhelmed. You start throwing the dice to make decisions or get stuck on a problem for a long time.
When your approach fails and you become frustrated, it's better to step back and think. Ensure your [mental model](https://en.wikipedia.org/wiki/Mental_model) is clear before proceeding. Read [Mental Models: Learn How to Think Better and Gain a Mental Edge | James Clear](https://jamesclear.com/mental-models) to learn more about mental models.

When the code base is complex or has some technical debt, it can be challenging to find and focus on the relevant part of the code. Create a [minimal, reproducible example](https://stackoverflow.com/help/minimal-reproducible-example) or extract the code into a toy project or class. You can also play around with the code by executing it on the MPS console. If the problem is too big, split it into a few tasks or solve one small task. Once you get that working, add the layers of complexity back in one at a time until you solve the problem as the problem statement asked.

Finding the root cause of your problem should always be done before implementing a workaround or writing poorly designed code. In the MPS platforms, this can be a challenging task. The current project can be the source of the problems, any of the MPS platforms, or even MPS itself. Don’t focus only on the code you think contains the bug but also consider all other platforms. Try disabling offending languages and methodically go through all layers of code that might be responsible for the problem. Comment out chunks of code to see if the problem persists. To rule out MPS itself, try a simple example in MPS itself, without any additional languages and plugins installed. Also, check if the issue still arises in the latest MPS version if you are still using an older version.

## Devise a Strategy

Write down in plain English what you want to achieve before writing code. You can even go a step further as described in [Stuck on a Coding Problem? Here are 5 Steps to Solve It|Adrian Prieto](https://medium.com/learn-love-code/stuck-on-a-coding-problem-here-are-5-steps-to-solve-it-8be04c4b4f19):

- Read the problem several times until you can explain it to someone else
- Solve the problem manually
- Make your manual solution better
- Write pseudocode
- Replace pseudocode with running code

Ideally, though, you have a ticket that specifies the problem. It should describe the issue/feature in detail, including all edge cases. Tickets that deal with bugs should contain images, GIFs, or videos to showcase the problem. The ticket description should compare the actual with the expected behavior. It can also include concrete ideas for solving the problem. It can even explain how the UI should look and how the user interaction will work.

Depending on the nature of the project, customers, domain experts, or a member of your team who is very familiar with the target domain can create tickets. Ideally, the domain expert and the developers are different people so that the developers don’t have to write specifications and can focus on developing features and fixing bugs.
