# General tips

No matter what type of challenge you face, some tips always help you to make progress or remove your blocker.

## Search the existing documentation and issue trackers

There is the [MPS User's Guide](https://www.jetbrains.com/help/mps/mps-user-s-guide.html) and this website that contains a lot of information about MPS.
Search the [MPS Slack workspace](https://jetbrains-mps.slack.com/) or the [MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) for similar problems or questions. Older messages of the Slack channels are automatically saved to the forum. For more technical problems, searching the [issue tracker](https://youtrack.jetbrains.com/issues/MPS) might not only reveal existing bug reports, but they also sometimes contain technical explanations. A few MPS questions are also answered on StackOverflow with the tag [mps](https://stackoverflow.com/questions/tagged/mps). All the other issue trackers are mentioned on the page [Reference: Issue trackers](issue_trackers.md).
If you are a developer, you can also [locate the code author](https://www.jetbrains.com/help/mps/investigate-changes.html#annotate_blame) directly inside MPS if you have the Git history available for a project. Some projects also contain readme files or release notes/a changelog that include important notes about compatibility or bug fixes as well as general information about the project.

## Remove all distractions

Make sure to remove everything that distracts you: turn off all notifications such as notifications from mail or other communication channels. If you have the possibility, set your status to offline or busy and turn off your phone (notifications). Sit in a quiet room or use earplugs. For hard problems, it might be beneficial to don't listen to music and
even close all windows to have it as quiet as possible (but don't forget: you still need enough oxygen to think clearly). Thoughts and feelings can also be distracting: if you are angry or frustrated with the situation or feel the pressure of a situation, take a break or do something else for a while to clear your mind.

## Step away from the problem

Sometimes focus on a problem for a long time doesn't yield any results. Switch to a different task, so that you don't have the mental capacity to think about the first problem. This has the effect of clearing your mind. There is a downside to this approach: context switching. When switching tasks, you lose the context of the problem and also need some time to dive into the topic again. To mitigate this, create an "investigation log" for any non-trivial problem you run into and take detailed notes of what you saw and what you tried. With MPS projects you also have the issue of switching between different projects and branches which can take a lot of time especially when you have to run the build again. If it is technically possible, try to just partially build the project or run the build on the command line without clean (e.g. `gradle clean` or `git clean`). You can also work with [[general#:~:text=can%20i%20configure%20mps%20path%20variables%20per%20project%3F|multiple MPS instances]] at the same time.

You might also want to step away from the computer completely: walk the dog, take a shower, or go for a toilet break. A [2014 study](https://www.ncbi.nlm.nih.gov/pubmed/24749966) by Oppezzo and Schwartz at Stanford showed that walking significantly increased participants’ creative divergent thinking,” which is important for creative problem-solving. For example: taking just a quick walk for 5 minutes might lead to a solution in 2 minutes instead of sitting in front of the computer for an hour without making any progress. You might want to experiment with the type of activity that is the most beneficial to you: some people stay away from cell phones, books, magazines, and other forms of entertainment, others read books, play games or answer questions. The latter group prefers anything that requires active mental engagement so that they can't think about anything else.

## Get enough/some sleep

Sleep in general has a big impact on the ability to solve problems but also make fewer mistakes. A [2009 study](https://www.pnas.org/content/106/25/10130) by Denise Cai et al. at U.C. San Diego showed that REM sleep enhances the integration of unassociated information for creative problem-solving. Not getting enough quality sleep can affect your [job performance](https://www.sleepfoundation.org/sleep-hygiene/good-sleep-and-job-performance). That doesn't mean that you have to be in bed at 10 pm. Some people prefer to wake up early (early bird), while others stay up late at night(night owls). [Is It Better to Be a Night Owl or Early Bird? | healthline.com](https://www.healthline.com/health/sleep/night-owl-vs-early-bird) describes the differences in more detail.

After implementing a feature or fixing a bug there comes a time when you open a pull request in your project when you are using version control and depending on the team someone will review your changes. Before opening the PR, consider sleeping over it the night and look at your changes with fresh eyes the next day. You will often find issues that way because you've cleared your mind and were able to process all your thoughts in the meantime.

## Thinking out loud/asking for help

Grab a colleague, a friend, a pet, or a [rubber duck](https://rubberduckdebugging.com/) and explain the problem you are having out loud to them. Just explaining the problem to someone else who might not even be familiar with the topic, helps get a deeper understanding of the topic. If this
is not possible, you can write a message or ask a question in one of the [MPS slack channels](https://jetbrains-mps.slack.com/) or the [MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/topics). StackOverflow has a good article about [how to ask a good question](https://stackoverflow.com/help/how-to-ask).

If you are a junior developer, don't hesitate to ask senior developers questions. They happily answer your questions (if they have time)
and might even learn something new about your certain problem.

## Pair programming

> [Pair programming](https://www.techtarget.com/searchsoftwarequality/definition/Pair-programming) is an Agile software development technique originating from Extreme programming (XP) in which two developers team together on one computer. The two people work together to design, code, and test user stories. Ideally, the two people would be equally skilled and would each have equal time on the keyboard.

While the technique is perfectly described in the linked article, a special form of pair programming is often done in the MPS community
with customers but also colleagues: pair debugging. Before you spend hours on a problem, it is better to describe the problem to someone. Asynchronous
communication via Slack, StackOverflow, or a forum might work out in some cases, getting a second pair of eyes to look at your screen or sharing your screen
remotely works often a lot better and is faster. When doing so, give the second person enough context to understand the problem or explain it by an example.

When the other person is not present in the room, prefer a screen sharing software, that supports drawing on the screen of the presenter. This way, it is a lot easier to explain what UI elements to click. Especially when working in cross-platform environments, install the IntelliJ plugin [Presentation Assistant](https://plugins.jetbrains.com/plugin/7345-presentation-assistant) to show the pressed keyboard shortcuts in the IDE. When explaining MPS actions, Windows and Mac's users are rarely familiar with the keyboard shortcuts of a different OS's user.

