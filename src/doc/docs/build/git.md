---
tags:
- infrastructure
---

# Git

!!! question "How do you compare Git branches?"

    Have a look at [this guide](/files/compare_git_branches.pdf).

!!! question "How should you configure Git?"
    
    Generated files should not be checked into Git (*classes_gen*, *source_gen*) unless the output of generators should be checked.
    
    Example from [MPS Extensions](https://github.com/JetBrains/MPS-extensions):

    - [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore)
    - [.gitattributes](https://github.com/JetBrains/MPS-extensions/blob/master/.gitattributes).

!!! question "Is there a hook in MPS that it will call when switching branches?"

    Register a [BranchChangeListener](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.openapi.vcs%28MPS.IDEA%2F%29%2F%7EBranchChangeListener) in an application or project plugin. Example: 
    ```java
    ProjectHelper.toIdeaProject(#project).getMessageBus().connect().subscribe(BranchChangeListener.VCS_BRANCH_CHANGED, new MyListener()).
    ```

!!! question "How can you find the Git commit that deleted a concept?"

    Assuming the concept is named `Foo`, search with Git Log in the corresponding structure model: `git log -SFoo -- path/to/structure.mps`

!!! question "How can I go to the first commit in a project on GitHub?"

    Use the book on the following page: http://farhadg.github.io/init/landing/

!!! question "During conflict resolution, what does *Resolve automatically and Exit* do exactly?"

    This button merges non-conflicting changes in roots and the metadata.
    
    A) A change in roots is not conflicting if:

    - there are [merge hints](https://www.jetbrains.com/help/mps/mergehints.html)
    - the node ID [changed](https://www.jetbrains.com/help/mps/resolving-conflicts.html#cd808d10)
    - the resolve info [changed](https://www.jetbrains.com/help/mps/resolving-conflicts.html#e052970a)

    B) Metadata changes are:

    - a dependency was deleted/added
    - do not generate flag was set
    - an engaged language on generated was added/removed
    - an imported model was added/deleted
    - a model attribute was changed (e.g., model user objects)
    - a module dependency was added/deleted
    - a used language was added/deleted/changed

      Those are two different merge sessions. TODO: How does the automatic resolving work with the metadata changes? (Are A and B applied to the metamodels?)

!!! question "When I shut down MPS, change files on disk (e.g., git pull), and restart MPS, it asks me if I want to reload the files from disks or use the cached models. Why?"

    Excerpt from MPS documentation:
    > MPS automatically saves changes that you make in your files. Various events trigger saving, such as compiling, running, debugging, performing version control operations, closing a file or a project, or quitting the IDE. Saving files can also be triggered by third-party plugins.
    
    An external change could be done by accident, for example, the project is on a shared drive, and someone else changes some files but not on purpose. You might also edit some MPS files with a different editor to fix some issues, so there must be the option to decide which version to use. The feature itself comes from the IntelliJ platform and is not MPS-specific:
    
    > If an external process changes a file that was opened and unsaved in IntelliJ IDEA, it results in two conflicting versions.


## General

- [Git cheat sheet](https://github.com/arslanbilal/git-cheat-sheet)
- [git-tips](https://github.com/git-tips/tips)
- [Flight rules for Git](https://github.com/k88hudson/git-flight-rules) (troubleshooting)
- [On undoing, fixing, or removing commits in Git](https://sethrobertson.github.io/GitFixUm/fixup.html)
- [git-extras](https://github.com/tj/git-extras)(extra git commands)
- [Commit Often, Perfect Later, Publish Once: Git Best Practices](https://sethrobertson.github.io/GitBestPractices/)

## GitHub Publishing Checklist

- Ready to use templates
    - [Template #1](https://github.com/cfpb/open-source-project-template)
    - [Template #2](https://github.com/giantswarm/example-opensource-repo)
- Necessary files/text
    - [README.md](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)
    - [LICENSE](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)
    - description in the About section of the GitHub repository
- More extensive checklists
    - [Open Source Checklist](https://github.com/cfpb/open-source-project-template/blob/main/opensource-checklist.md)
    - [Am I ready to Open Source This?](https://gist.github.com/PurpleBooth/6f1ba788bf70fb501439)