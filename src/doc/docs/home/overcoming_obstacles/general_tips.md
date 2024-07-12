---
comments: true
---

# General Tips

No matter what type of challenge you face, some tips always help you to make progress or remove your blocker.

## Search the Existing Documentation and Issue Trackers

The [MPS User's Guide](https://www.jetbrains.com/help/mps/mps-user-s-guide.html) and this website contain much information about MPS.
Search the [MPS Slack workspace](https://jetbrains-mps.slack.com/) or the [MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) for similar problems or questions. A script automatically saves older messages of the Slack channels to the forum. For more technical problems, searching the [issue tracker](https://youtrack.jetbrains.com/issues/MPS) might reveal existing bug reports and sometimes contain technical explanations.  StackOverflow also includes a few MPS questions with the tag [mps](https://stackoverflow.com/questions/tagged/mps). The page [Reference: Issue trackers](issue_trackers.md) mentions all the other issue trackers.
If you are a developer, you can also [locate the code author](https://www.jetbrains.com/help/mps/investigate-changes.html#annotate_blame) directly inside MPS if you have the Git history available for a project. Some projects also contain readme files or release notes/a changelog that includes important notes about compatibility or bug fixes and general information about the project.

## Remove All Distractions

Make sure to remove everything that distracts you:

- Turn off all notifications, such as notifications from mail or other communication channels.
- Set your status to offline or busy, and turn off your phone or notifications.
- Sit in a quiet room or use earplugs.

For challenging problems, it might be beneficial to not listen to music and even close all windows to make it as quiet as possible (but remember: you still need enough oxygen to think clearly). Thoughts and feelings can also be distracting: if you are angry or frustrated with the situation or feel the pressure, take a break or do something else to clear your mind.

## Step Away From the Problem

Sometimes focusing on a problem for a long time doesn't yield results. Switch to a different task so you don't have the mental capacity to think about the first problem. This task switch has the effect of clearing your mind. There is a downside to this approach: context switching. When switching tasks, you lose the problem's context and need time to dive into the topic again. To mitigate this, create an "investigation log" for any non-trivial problem and take detailed notes of what you saw and tried. With MPS, you also have the issue of switching between different projects and branches, which can take a lot of time, especially when you have to rerun the build. If it is technically possible, try to partially build the project or run it on the command line without cleaning (e.g., `gradle clean` or `git clean`). You can also work with [[general#:~:text=can%20i%20configure%20mps%20path%20variables%20per%20project%3F|multiple MPS instances]] at the same time.

You can also step away from the computer: walk the dog, shower, or take a toilet break: walk the dog, take a shower, or go for a toilet break. A [2014 study](https://www.ncbi.nlm.nih.gov/pubmed/24749966) by Oppezzo and Schwartz at Stanford showed that walking increased participants’ creative divergent thinking,” which is vital for creative problem-solving. For example: taking just a quick walk for 5 minutes might lead to a solution in 2 minutes instead of sitting in front of the computer for an hour without making any progress. You should experiment with the most beneficial activity: Some people stay away from cell phones, books, magazines, and other forms of entertainment, while others read books, play games or answer questions. The latter group prefers anything requiring active mental engagement, so they can't think about anything else.

## Get Enough/Some Sleep

Sleep, in general, significantly impacts the ability to solve problems and make fewer mistakes. A [2009 study](https://www.pnas.org/content/106/25/10130) by Denise Cai et al. at the University of California San Diego showed that REM sleep enhances the integration of unassociated information for creative problem-solving. Getting enough quality sleep can help your [job performance](https://www.sleepfoundation.org/sleep-hygiene/good-sleep-and-job-performance). That doesn't mean you must be in bed at 10 pm. Some people prefer to wake up early (early bird), while others stay up late at night (night owls). [Is It Better to Be a Night Owl or Early Bird? | healthline.com](https://www.healthline.com/health/sleep/night-owl-vs-early-bird) describes the differences in more detail.

After implementing a feature or fixing a bug, there comes a time when you open a pull request in your project when you are using version control, and depending on the team, someone will review your changes. Before opening the PR, consider sleeping over it the night and look at your changes with fresh eyes the next day. You will often find issues that way because you’ve cleared your mind and were able to process all your thoughts in the meantime.

## Thinking Out Loud/Asking for Help

Grab a colleague, a friend, a pet, or a [rubber duck](https://rubberduckdebugging.com/), and explain the problem you are having out loud to them. Explaining the situation to someone who might not even be familiar with the topic helps get a deeper understanding of the topic. If this is impossible, you can write a message or ask questions in one of the [MPS Slack channels](https://jetbrains-mps.slack.com/) or the [MPS forum](https://mps-support.jetbrains.com/hc/en-us/community/topics). StackOverflow has a good article about [how to ask a good question](https://stackoverflow.com/help/how-to-ask).

Don't hesitate to ask senior developers questions if you are a junior developer. If they have time, they happily answer your questions (if they have time) and might even learn something new about your problem.

## Pair Programming

> [Pair programming](https://www.techtarget.com/searchsoftwarequality/definition/Pair-programming) is an Agile software development technique originating from Extreme programming (XP) in which two developers team together on one computer. The two people work together to design, code, and test user stories. Ideally, the two people would be equally skilled and have equal time on the keyboard.

While the linked article perfectly describes the technique, a particular form of pair programming often occurs in the MPS community with customers and colleagues: pair debugging. Before spending hours on a problem, it is better to describe it to someone. Asynchronous communication via Slack, StackOverflow, or a forum may work out. Getting a second pair of eyes to look at your screen or remotely sharing your screen is often much better and faster. When doing so, give the second person enough context to understand or explain the problem by an example.

When the other person is not in the room, prefer a screen-sharing software that supports drawing on the presenter's screen. This way, explaining what UI elements to click is much easier. Especially when working in cross-platform environments, install the IntelliJ plugin n [Presentation Assistant](https://plugins.jetbrains.com/plugin/7345-presentation-assistant) to show the pressed keyboard shortcuts in the IDE. When explaining MPS actions, Windows and Mac users are rarely familiar with the keyboard shortcuts of a different OS's user.

