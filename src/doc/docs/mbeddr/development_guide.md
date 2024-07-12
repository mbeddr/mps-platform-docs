---
comments: true
status: deprecated
tags:
- mbeddr
- guide
---

# Development Guide

!!! warning "This document describes how the mbeddr team used Git for contributing changes in the past. The guide was written some years ago, so it might no longer reflect the workflow and guidelines of newer committers."

## Commit Messages

In general, try to follow [this guide](https://chris.beams.io/posts/git-commit/) with some exceptions for minor changes:

When you commit a significant change related to a GitHub issue, start your message with a short title (less than 50 char). Ideally, it contains the title of the GitHub issue if it fits.
If you can't fit the issue title, please reference the issue ID with the #n notation in the title. A short optional paragraph (not longer than 80 chars) follows the title describing the change:

```
ClassCastException on FilteringActionManager #1207

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
```

In contrast, if your commit is just a minor fix, then you mention the modified mbeddr subsystem (e.g., *mpsutil:*, *core:* or *ext:*) and provide a short description, followed by a short optional paragraph (not longer than 80 chars) describing the change:

```
core,ext: Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
```

The optional paragraph at the end of the commit message contains further information about the change. Mention added tests or describe why the fix was necessary. There may be special conditions when the issue surfaces.
You can also put GitHub [issue commands](https://help.github.com/articles/closing-issues-via-commit-messages/) to close or reference other issues in this paragraph.

[Writing good commit messages | github.com/erlang
/otp](https://github.com/erlang/otp/wiki/writing-good-commit-messages) and [A Note About Git Commit Messages | tbaggery.com/](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) contains further information and ideas on how to write good commit messages.

## Branches

We make heavy use of branches in the development process. If your task requires more than one commit, commit your changes on a branch.

There are two branch types: *feature* and *refactor*: Use the first for new features and the second for bug fixes or code refactorings. They are distinguished by prefix: a feature branch my-awesome-stuff would be named *feature/my-awesome-stuff* or *refactor/my-awesome-stuff* if it's a refactoring branch. Both kinds of branches should be short living (a couple of days) to reduce the risk of diverting too far from the *master* branch and causing huge afford to merge. Ideally, no commits happen directly on the *master* branch, and you evaluate every commit first on a feature/refactoring branch.

Nowadays, we mostly do merging instead of rebasing. The following sections may not accurately reflect the current workflow.

### Merging

Once you are done with your work, you need to integrate it into the *master* branch. Because your branch most likely diverted from it, merging it into the *master* branch would typically end up with a merge commit. We have learned that merging clutters Git history and makes all intermediate commits of the branch end up on the *master* branch. The suggested workflow is to rebase your branch onto *master* and squash all your commits into one.

#### Example

This example shows you how to integrate your branch into the *master* branch using rebase instead of merge.

The list of commands to use is as follows:

```
git fetch
git rebase -i origin/master
git checkout origin/master
git pull
git merge --ff-only feature/my-awesome-stuff
git pull --rebase
git push
```
They are all explained below. Below, you can see the starting point in the repository:

```
* 1ed51e3        (HEAD -> master) added another file
* 5cee848        initial commit
```

Now create the new feature branch named *feature/my-awesome-stuff* and commit some changes to it. While working on your branch, someone else committed changes to the *master* branch. Hence, for integrating your changes into it, you would end up with a merge:

```
* 3c36424        (HEAD -> master) fixed some super important issue
| * 66beba4      (feature/my-awesome-stuff) more work on my awesome feature
| * cca995e      did some stuff
|/
* 1ed51e3        added another file
* 5cee848        initial commit
```

To get your commits into the *master* branch, make sure that your local history is up-to-date by running `git fetch`. Next, rebase your commits to prevent a merge from happening. You can do this with the following Git command on our branch: `git rebase -i origin/master`. Git will now ask you how to proceed with your commits:
```
pick cca995e did some stuff
pick 66beba4 more work on my awesome feature
```

Now squash all commits into a single commit while rebasing:

```
pick cca995e did some stuff
squash 66beba4 more work on my awesome feature
```

Afterward, Git asks you to enter a message for the new commit. Its default message concatenates all the commit messages from the commits to squash. However, you want the new commit message to fit the earlier described pattern.

After rebasing, your Git history looks like this:
```
* afc0fb5        (HEAD -> feature/my-awesome-stuff)  42: super awesome feature
* 3c36424        (master) fixed some super important issue
* 1ed51e3        added another file
* 5cee848        initial commit
```

You still have to branch; now it's time to merge them. Change your Git branch to the *master* branch using `git checkout origin/master`. Make sure you have pulled from the remote and your branch is up-to-date.
Now run `git merge --ff-only feature/my-awesome-stuff`. The *--ff-only* is vital to force Git not to merge if it would produce a merge commit.

Now Git history looks like this:

```
* afc0fb5        (HEAD -> master, feature/my-awesome-stuff)  42: super awesome feature
* 3c36424        fixed some super important issue
* 1ed51e3        added another file
* 5cee848        initial commit
```

You haven't created a merge commit, and all commits from your branch appear as a single commit in the Git history. You are good to go to push back to the repo. But wait, what if somebody has changed things in the meantime on the remote? Wouldn't the pull create a new merge? Yes, it would! Therefore, don't use a plain `git pull` but use `git pull --rebase` when you are pulling from the repo into your local *master* branch. This way, Git doesn't produce a new merge commit but rebase your local changes on top of the remote changes.

## Test Organization

### Naming

The test solution for language *com.mbeddr.x.lang* should be named *test.com.mbeddr.x.lang*. Respectively, the test solution for solution *com.mbeddr.y.sol* should be named *test.com.mbeddr.y.sol*. If you need a dedicated language for testing purposes, name it *test.com.mbeddr.x.[lang|sol].testsupport* (or a similar suffix).

This way, you can discriminate between the "real" code below namespace *com.mbeddr* and the test code below namespace *test*. Place any demo or playground modules outside the *com.mbeddr* namespace for the same reason.

By following this scheme, you can build productive code in the UI by building everything below *com.mbeddr* in the modules pool and be sure that it is not interfered with by test, demo, or playground code.

### Project Structure

Place all languages, solutions, tests, demos, and playgrounds below a common virtual folder bearing the feature's name. An exception might be build models.

Generators must be present only when required or deleted if empty.

### File System

Place all test code in a special folder in the file system:

```kroki-plantuml
@from_file:mbeddr/diagrams/file_system_structure.puml
```

## Build

### Build Script Setup

In mbeddr, different build scripts exist. They are used on the local machines for building the languages and on the build server for various build-related tasks, such as testing or packaging.
This documentation guides you in following the mbeddr standards for setting up your *BuildProject* and integrating it into Mbeddr's build infrastructure.

#### Required BuildFolderMacros

In your *BuildProject* (the build script's model representation in MPS), you first need a *BuildFolderMacro* (a _folder_) named *mps\.home* (see code snippet below).
If you want to run the generated Ant script in your MPS, then you should specify the location of your MPS installation relatively. Otherwise, you don't need a path for *mps\.home*.
At script execution time, you will redefine *mps\.home*, to point to the folder where your MPS installation is.

```
folder mps.home = <no defaultPath>
```

Next, you need a *BuildFolderMacro* named *artifacts\.root* that doesn't require a path (see snippet below).
When executing the Ant script generated from your *BuildProject*, define this macro from outside to point to the folder where all your plugin dependencies (e.g., `mbeddr.platform`) are located.

```
folder artifacts.root = <no defaultPath>
```

For each *BuildProjectDependency* (the dependency section below your folders), we need a separate *BuildFolderMacro* that follows the naming convention <BuildProject name>.artifacts and points to `$artifacts.root/<BuildProject name>`.
At build script execution time, those macros will point to the folders where your required plugins are.
In the code snippet below, you can see the resulting *BuildFolderMacros* for a *BuildProject* with two dependencies: mps-sl-all and com.mbeddr.platform.

```
folder sl-all.artifacts = $artifacts.root/mps-sl-all 
folder platform.artifacts = $artifacts.root/com.mbeddr.platform
```

#### Type System Tests

When you want to build type system tests that require a specific path macro (e.g., for specifying the project location inside your `TestInfo`), then you must create a *BuildFolderMacro* for this path macro.
The name of this *BuildFolderMacro* should start with *mps\.macro*, followed by the name of the respective path macro.
In the example below, you instruct MPS via *mps.macro.mbeddr.github.core.home* to create a path macro *mbeddr.github.core.home* that points to the relative path location specified in the other *BuildFolderMacro* *mbeddr.github.core.home*.

```
folder mps.macro.mbeddr.github.core.home = $mbeddr.github.core.home
```

Furthermore, you need to mark solutions containing type system tests as *content: (with sources and tests)*. To achieve this, please perform the following steps: 

1. Inside your *BuildProject* move your cursor to the solution that contains your type system tests.
2. Open the inspector.
3. Inside the inspector, select the node sources, open the context menu, and choose *sources and tests* from it.

To get your tests executed, you first need to add the *module-tests* plugin to your *use plugins:* section (on top of your *BuildProject*).
When you can't add the node *module-tests* to this section, import it from *jetbrains.mps.build.mps.tests.accessories*.
Finally, create a *BuildMpsLayout_TestModules* (a _test configuration_) at the bottom of your *BuildProject* and list all solutions that contain type system tests that the script should execute.

#### Configurations for Generator and Compiler

To ensure code is generated and compiled the same way as in MPS, you must add the following configurations (*BuildSource_JavaOptions* and *BuildMps_GeneratorOptions*) to your *BuildProject*'s project structure. Those configurations control the generator engine and the Java compiler to ensure we have the same build behavior as in the IDE.

```
generator options <project default> 
  strict mode true 
  multiple threads true 
  number of threads 4 
  inplace transform true 
  hide warnings false 
  resort to static references true 

java options <project default> 
  generate debug info true 
  generate no warnings false 
  fork false 
  compiler <default compiler> 
  java compliance level 1.6 
  java compiler options <no additional options> 
  copy resources false 
```

### Building a Release

To prepare a mbeddr release, you can modify the version number set for the mbeddr plugins by overwriting the *major\.version*, *minor.version*, and *build* (see screenshot below).
However, you don't change these values inside the MPS build scripts. Instead, either you change them in the global gradle script (*mbeddr.core/build.gradle*), or you overwrite them via the command line while spawning a new release build:

``` -PmajorVersion=1 -PbuildVersion=0 -PminorVersion=0000 build_mbeddr publishMbeddrAllInOnePublicationToMavenRepository```

![version numbers in MPS build scripts](images/mbeddr_version_numbers.png)

