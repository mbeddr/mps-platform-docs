---
tags:
- infrastructure
---

# Git

!!! question "How do you compare Git branches?"

    Have a look at [this guide](/files/compare_git_branches.pdf).

!!! question "How should you configure Git?"
    
    Generated files should not be checked into Git ('classes_gen', 'source_gen') unless the output of generators should be checked.
    
    Example from [mps-extensions](https://github.com/JetBrains/MPS-extensions):

    - [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore)
    - [.gitattributes](https://github.com/JetBrains/MPS-extensions/blob/master/.gitattributes).

!!! question "Is there a hook in MPS that will be called when switching branches?"

    Register a [BranchChangeListener](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.vcs%28MPS.IDEA%2F%29%2F%7EBranchChangeListener) in an application or project plugin. Example: 
    ```java
    ProjectHelper.toIdeaProject(#project).getMessageBus().connect().subscribe(BranchChangeListener.VCS_BRANCH_CHANGED, new MyListener()).
    ```

!!! question "How can you find the Git commit that deleted a concept?"

    Assuming the concept is called `Foo`, search with Git Log in the corresponding structure model: `git log -SFoo -- path/to/structure.mps`

!!! question "How can I go to the first commit in a project on GitHub?"

    Use the book on the following page: http://farhadg.github.io/init/landing/

## General

- [Git cheat sheet](https://github.com/arslanbilal/git-cheat-sheet)
- [git-tips](https://github.com/git-tips/tips)
- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) (troubleshooting)
- [On undoing, fixing, or removing commits in git](https://sethrobertson.github.io/GitFixUm/fixup.html)
- [git-extras](https://github.com/tj/git-extras)(extra git commands)
- [Commit Often, Perfect Later, Publish Once: Git Best Practices](https://sethrobertson.github.io/GitBestPractices/)

## GitHub publishing checklist

- Ready to use templates
    - [Template #1](https://github.com/cfpb/open-source-project-template)
    - [Template #2](https://github.com/giantswarm/example-opensource-repo)
- Necessary files/text
    - [README.md](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)
    - [LICENSE](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)
    - description in about section of GitHub repository
- More extensive checklists
    - [Open Source Check List](https://github.com/cfpb/open-source-project-template/blob/main/opensource-checklist.md)
    - [Am I ready to Open Source This?](https://gist.github.com/PurpleBooth/6f1ba788bf70fb501439)