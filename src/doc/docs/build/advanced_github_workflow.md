The following workflow suits small projects and projects with hundreds of developers. This guide assumes that you host the project on GitHub and that the CI pipeline also runs on GitHub. Additionally, one or more teams work on the project and have some form of [agile software development](https://www.wikiwand.com/en/Agile_software_development) implemented.
New feature/bug fixes are developed based on a [ticket](https://www.vollcom-digital.com/blog/digital-transformation/how-to-write-an-agile-ticket/) system.

## CODEOWNERS File 

GitHub supports [CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) files which you have to place in the *.github* subfolder. An MPS language can generate it.  For solutions, add a root node to describe the owners. For example:

> **Solution Code Owners**

> The following maintainers should be added to pull requests changing this solution

```text linenums="0"
- team1
- team2
```

Add this information to the documentation aspect if you use the  *com.mbeddr.doc*. For example:

> **Maintainer**                                                                                                                       
                                                                                  
> The following maintainers should be added to pull requests changing this language.

```text linenums="0"
ownerslist {
- team1
- team2
}
```                           

Specify that the corresponding team must review pull requests before merging them in the branch protection rules on GitHub.

## Merge Queue

When you merge all branches into a main branch, and there are many pull requests simultaneously, enabling the [merge queue](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue) feature on GitHub. Pull requests with reviews and no failing checks can be added to the merge queue. PRs show the position in the merge queue and the expected merge time.

When the previous PRs in the merge queue conflict with the current PR, GitHub removes the current PR from the merge queue. You can do this manually when accidentally adding a PR to the merge queue. There is also the option *Merge when ready* at the bottom of the PR to automatically add
it to the merge queue when all other checks succeed.

## Issue and Pull Request Templates

Add [issue templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository) to a repository to make it easier for developers and users to submit issues. [stevemao/github-issue-templates](https://github.com/stevemao/github-issue-templates) contains a few ready-to-use templates. If you use a help desk, some other tool like [Jira](https://www.atlassian.com/software/jira), [YouTrack](https://www.jetbrains.com/youtrack/), or a platform like [GitLab](https://about.gitlab.com/), you should [turn off issues](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/disabling-issues) instead.

For developers, a [pull request template](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository) helps them create better pull requests. When you open a new PR, GitHub uses the template.
It can explain naming conventions that the developer has to follow or provide a checklist of things to pay attention to before
opening a new PR, for example, adding the change to the changelog, updating the documentation, or checking that tests exist for a new feature.

## GitHub Actions and Workflows

GitHub supports automating the workflow through [GitHub Actions](https://github.com/features/actions).

### Release Notes

GitHub supports [automatically generating release notes](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes); many [actions](https://github.com/marketplace?type=actions&query=Release+notes+) on the GitHub marketplace support this feature. While a common approach is to extract the information from the commit messages, it might be better to manually write a release notes file or extract the information from the PR description if it has a pre-defined format.

It's important to differentiate between a changelog and release notes ([amoeboids.com](https://amoeboids.com/blog/changelog-vs-release-notes-the-key-differences/)): the changelog communicates technical changes, and the release notes 
inform the users about new features, improvements, and bug fixes in a non-technical way.

### Workflows

[Workflows](https://docs.github.com/en/actions/using-workflows/about-workflows) are located in the *.github/workflows* directory. You can trigger them by events and schedule them automatically or manually. For many workflows, at least the [default environment variables](https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables) *GITHUB_ACTOR* and *GITHUB_TOKEN* are necessary. Use [nektos/act](https://github.com/nektos/act) to run GitHub Actions locally. Depending on the project, the following workflows might be helpful:

- Building the project using the [gradle-build-action](https://github.com/gradle/gradle-build-action) in combination with the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin)
- Checking that issues or PRs are not [stale](https://github.com/actions/stale) (e.g., as a cronjob)
- Checking that PR conventions are followed when a PR changes or the PR is added to the merge queue. Some possible checks:
    - valid PR title
    - valid PR description
    - valid branch name
- Publishing the MPS languages and RCP as snapshots when a snapshot [Git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) exists
- Building and testing the languages when you create a PR or the PR is added to the merge queue.
- Building the RCP when a change is pushed to main
- Creating a release (e.g., manually triggered)
    - building the RCP
    - generating the release notes
    - deploying the RCP to a repository, for example, [JFrog Artifactory](https://jfrog.com/artifactory/), [Sonatype Nexus Repository](https://www.sonatype.com/products/sonatype-nexus-repository), or [GitHub Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry)
- Collecting repository metrics
- scanning the code for vulnerabilities and errors [automatically on GitHub](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors) or using a proprietary solution like [Black Duck Software Composition Analysis](https://www.synopsys.com/software-integrity/security-testing/software-composition-analysis.html) (e.g., as a cronjob)
- uploading coverage reports (e.g., [JaCoCo](https://www.jacoco.org/jacoco/trunk/index.html#:~:text=JaCoCo%20is%20a%20free%20Java,26%20based%20on%20commit%20e0d9d0442e9d6caa98362db034ad76db819a8cc9)) and test results generated by MPS ([JUnit](https://junit.org/junit5/)) to a server (e.g., as a cronjob)

#### Metrics

Use a GitHub action like [floric/repo-monitor-action](https://github.com/floric/repo-monitor-action) to get an overview of project statistics.
You can generate custom metrics reports for MPS projects, including the last releases using GitHub Pages. In the following snippets, languages and solutions are in the *code* folder:

```bash title="number of languages"
$(find code/languages/*/languages/* -maxdepth 0 -type d | wc -l)
```

```bash title="number of solutions"
$(find code/languages/*/solutions/* -maxdepth 0 -type d | wc -l)
```

```bash title="number of models"
$(find code/languages/*/*/*/models/*.mps -maxdepth 0 -type f | wc -l)
```

```bash title="number of concepts"
$(grep -ro "<node concept=\"1TIwiD\"" code/languages/*/languages/*/models --include *structure.mps | wc -l)
```

```bash title="number of interfaces"
$(grep -ro "<node concept=\"PlHQZ\"" code/languages/*/languages/*/models --include *structure.mps | wc -l)
```

```bash title="number of deprecated nodes (DeprecatedNodeAnnotation)"
$(grep -ro "<node concept=\"asaX9\"" code/languages/*/languages/*/models --include *structure.mps | wc -l)
```

Other interesting statistics that can be collected:

- code coverage
- duration of workflow
- build duration
- [model check](https://github.com/mbeddr/mps-gradle-plugin#model-check) duration
- number of added files in the latest commit
- number of modified files in the latest commit
- number of removed files in the latest commit

## From the Ticket to the Merged PR

The developer creates a new branch from the [default branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches#about-the-default-branch) usually called *main* or *master*. It is the stable branch that contains all the latest changes.
Use the ticket numbers in the branch name to connect code changes to ticket numbers. There are many different
branch naming conventions ([example](https://dev.to/varbsan/a-simplified-convention-for-naming-branches-and-commits-in-git-il4)). One possible pattern is
to start the branch with a category such as *feature*, *bugfix*, or *refactor*, then include the ticket number, and a branch description — for example, `feature/TASK-123_implement_awesome_feature`.

For the commits, sometimes also naming conventions are used. A simple approach is to start the commit message with the ticket number and describe the change, for example, `TASK-123: implement the feature`. GitHub should execute some of the described workflows automatically when the branch is ready and pushed. The PR should be reviewed from a white box and black box perspective (see: [[testing|testing]]), and when all checks succeed, you can add the PR to the merge queue. When the PR is at the top of the merge queue, GitHub will build and test it again, and execute all the checks will be executed once again. If everything succeeds, GitHub will finally merge the PR into one of the stable branches, like the default branch.

In the meantime, depending on the used [agile workflow](https://www.easyagile.com/blog/agile-workflow/), the state of the ticket might change from *Todo* to *In Progress* to *Code Review* and then to *Done* when you merge the PR. Depending on the [release cycle](https://digital.ai/glossary/agile-release-planning), you might release a new version regularly (e.g., four weeks).

## An Example of a Different Workflow

While the described workflow has proven successful for big projects, you can use many other workflows. For example, the MPS platforms don't use ticket numbers in commit messages. Tickets come from different (customer) projects. Linking existing tickets can also be difficult because the platforms are Open Source, and the tickets sometimes are not. The platforms are released whenever a change is pushed to the master or maintenance branches ([rolling release](https://www.wikiwand.com/en/Rolling_release)) instead of using a fixed release cycle. The projects are also not built on GitHub but on a [TeamCity](teamcity.md) server.
