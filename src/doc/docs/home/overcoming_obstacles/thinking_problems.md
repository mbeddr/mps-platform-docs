# [Thinking problems](https://pythonprinciples.com/blog/getting-unstuck/#thinking-problems)

When you have an easy coding problem, you can do it without much thought. When you have to deal with a new topic that you are not familiar with,
or have to dive into a large code base (with little documentation), you start guessing and trying things with the hope that something eventually will work.
Especially with not very well-known domains and unclear requirements, there is the risk of getting overwhelmed. You start throwing the dice to make decisions  or you get stuck on a problem for a long time.
When your approach fails, and you become frustrated it's better to step back and think. Ensure that your [mental model](https://en.wikipedia.org/wiki/Mental_model) is clear before proceeding. To learn more about mental models, read: [Mental Models: Learn How to Think Better and Gain a Mental Edge | James Clear](https://jamesclear.com/mental-models).

When the code base is complex or there is some technical debt, it can be difficult to find and focus on the relevant part of the code. Try to create a [minimal, reproducible example](https://stackoverflow.com/help/minimal-reproducible-example) or extract the code into a toy project or different class. You can also play around with the code by executing it on the MPS console. If the problem is too big, split it up into a few smaller problems, or just solve one smaller problem. Once you got that working, add the layers of complexity back in one at a time until you solved the problem as the problem statement asked.

Finding the root cause of your problem should always be done before implementing a workaround or writing badly designed code. For working in the MPS platforms this can be a challenging task. The problem could be located in the current project but also in one of the MPS platforms or even MPS itself. Don't focus only on the code that you think contains the bug but also consider all other platforms. Try disabling offending languages and methodically go through all layers of code that might be responsible for the problem. Comment out chunks of code to see if the problem persists. To rule out MPS itself, try a simple example in MPS itself, without any additional languages and plugins installed. Also, check if the issue still arises in the latest MPS version if you are still using an older version.

## Devise a strategy

Write down in plain English what you want to achieve before writing code. You can even go a step further as described in [Stuck on a Coding Problem? Here are 5 Steps to Solve It|Adrian Prieto](https://medium.com/learn-love-code/stuck-on-a-coding-problem-here-are-5-steps-to-solve-it-8be04c4b4f19):

- Read the problem several times until you can explain it to someone else
- Solve the problem manually
- Make your manual solution better
- Write pseudocode
- Replace pseudocode with real code

Ideally, though, you have a ticket that specifies the problem. It should describe the problem/feature in detail including all edge cases. For tickets that deal with bugs, images, GIFs, and videos can be used to showcase the problem. The description of the ticket should contain an explanation of what the real behavior is vs what the expected behavior is. The ticket can also contain concrete ideas for solving the problem and can even contain concrete ideas for how the UI should look and how the user will interact with it.

Depending on the nature of the project, the ticket can be created by a customer, a domain expert, or a member of your team who is very familiar with the target domain. Ideally, the domain expert and the developers are different people, so that the developers don't have to write specifications for the tickets and can focus on developing features and fixing bugs.
