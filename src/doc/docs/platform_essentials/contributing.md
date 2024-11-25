---
comments: true
tags:
- iets3
---


This guide shows how to contribute to one of the platforms. It takes {{ iets3() }} as an example. It mainly uses the MPS GUI for Git. If you want to do everything on the command line, check out [An Introduction to Git](https://www.freecodecamp.org/news/what-is-git-and-how-to-use-it-c341b049ae61/) or one of the [Git Cheat Sheets](https://education.github.com/git-cheat-sheet-education.pdf).

1. Make sure that you have Git installed.
2. Clone the repository: `git clone https://github.com/IETS3/iets3.opensource.git` or [Check out a project from a remote host](https://www.jetbrains.com/help/mps/set-up-a-git-repository.html#clone-repo) for the GUI way.
3. Decide which branch you want to use as the template for the contribution. The README should list the supported MPS version. Older branches are named maintenance/mpsX, for example, maintenance/mps20203. The main branch is the *master* branch.
4. If you have already checked out the repository before, [fetch](https://www.jetbrains.com/help/mps/manage-branches.html#checkout-branch) all the changes from the remote repository.
5. [Create a new branch from the selected branch](https://www.jetbrains.com/help/mps/manage-branches.html#create-branch-from-selected). Some common names are feature/X, bugfix/X, and refactoring/X, where X stands for a description of the branch and maybe the targeted MPS version, such as feature/my_feature_20211.
6. [Push the changes](https://www.jetbrains.com/help/mps/commit-and-push-changes.html) to the repository. Editing the [repository history](https://www.jetbrains.com/help/mps/edit-project-history.html) is only allowed on your branch.
7. Create a new [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) in the remote repository. 
8. Optionally, [request a pull request review](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/requesting-a-pull-request-review) if the repository requires reviewing. Make sure that the build runs on https://build.mbeddr.com. Review the build status in the [PR](https://blog.jetbrains.com/teamcity/2019/08/building-github-pull-requests-with-teamcity/).
9. If the reviewer requires a change, make the change and click the re-request review button.
10. If the reviewer approves the change, you can merge the changes (or he has already merged your changes). If you have a lot of commits that you want to merge into one commit or several commits, you can either use [interactive rebase in MPS](https://www.jetbrains.com/help/mps/work-on-several-features-simultaneously.html#rebase-option) or [squash your commits](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges#squash-and-merge-your-commits) into one single commit when merging the pull request.

Some more tips:

- Enable [GitHub notifications](https://docs.github.com/en/account-and-profile/managing-subscriptions-and-notifications-on-github/setting-up-notifications/configuring-notifications) to receive mail notifications about events on GitHub, such as comments or approved pull requests.
- The browser extension [Refined GitHub](https://github.com/refined-github/refined-github) provides some additional features for GitHub that you might find helpful.