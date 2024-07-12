---
comments: true
---

!!! success "Before Push"

    === "Basic"

        - [ ] The commit message format was checked.
        - [ ] The commit history was cleaned up (interactive rebase).
        - [ ] Build scripts where checked (use the [Build Script Notifier plugin](https://plugins.jetbrains.com/plugin/15203-build-script-notifier)).
        - [ ] All (new) migrations were run.
        - [ ] All relevant tests are green.
        - [ ] TODO comments were checked.

!!! success "GitHub"

    === "Basic"

        - [ ] Tickets that were fixed/implemented are mentioned.
        - [ ] Branch naming conventions were followed.
        - [ ] Tests don't fail.

    === "Advanced"

        - [ ] No Model check errors.
        - [ ] Linters don't fail.
        - [ ] Only changes are mentioned that are relevant for the user/developer in the changelog.
            - for example: no implementation details or cleanups

    === "Expert"

        - [ ] The PR description mentions how the feature was implemented if it is not clear to the reviewer
        - [ ] The PR title format was followed.
        - [ ] The PR description format was followed.
