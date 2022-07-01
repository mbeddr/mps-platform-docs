# Development Guide

This document describes how we use git in the mbeddr project for contributing changes.

## Commit messages

In general, we try to follow [this guide](https://chris.beams.io/posts/git-commit/) with some exceptions for minor changes:

In case you commit a major change that relates to a GitHub issue, then your commit message should always start with a short title (less than 50 char), ideally it contains the title of the GitHub issue if it fits. If you can't fit the issue title please reference the issue ID with `#4711` notation in the title. The title is  followed by a **short** optional paragraph (not longer than 80 chars) describing the change:
```
ClassCastException on FilteringActionManager #1207

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
```

In contrast, if your commit is just a minor fix, then you simply mention the modified mbeddr subsystem (e.g., `mpsutil:`, `core:` or `ext:`) and provide a short description, followed by a **short** optional paragraph (not longer than 80 chars) describing the change:
```
core,ext: Lorem ipsum dolor sit amet.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
```

The optional paragraph at the end of your commit message contains further information about the change: tests were added or describe why the fix was necessary, maybe there are special conditions when the issue surfaces. This is also the place where you can put GitHub [issue command](https://help.github.com/articles/closing-issues-via-commit-messages/) to close or reference other issues.

Further information and ideas how to write good commit messages can be [here](https://github.com/erlang/otp/wiki/writing-good-commit-messages) and [here](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

## Branches
In our development process we make heavy use of branches. You should commit your changes on a branch, if your task requires more than one commit.

We have two types of branches: `feature` and `refactor`. First should be used for new features, second for bug fixes or code refactorings. They are  distinguished by prefix: a feature branch **my-awesome-stuff** would be named `feature/my-awesome-stuff` or `refactor/my-awesome-stuff`, if it is a refactoring branch. Both kind of branches should be short living (a couple of days) to reduce the risk of diverting to far from master and causing huge afford to merge. Ideally, no commits happen directly to master and every commit is first evaluated on a feature/refactoring branch.

### Merging
Once your work is done it needs to be integrated into the master branch. Because your branch most likely  diverted from master, merging it into master would normally end up with a merge commit on the master branch. We have learned the hard way that merging clutters git history and makes all intermediate commits of the branch end up in master. To prevent this, our suggested workflow is to rebase your branch onto master and thereby squash all your commits into a single one.

## Example

This example shows you how to integrate your branch into the master branch by using **rebase** instead of **merge**.

The list of commands to use is:
```
git fetch
git rebase -i origin/master
git checkout origin/master
git pull
git merge --ff-only feature/my-awesome-stuff
git pull --rebase
git push
```
They are all explained below.

Below you can see our starting point in the repository:
```
* 1ed51e3        (HEAD -> master) added another file
* 5cee848        initial commit
```

Now we create our new feature branch named `feature/my-awesome-stuff` and commit some changes on it. While we worked on our branch someone else committed changes into the master branch. Hence, for integrating our changed into master we would end up with a merge:

```
* 3c36424        (HEAD -> master) fixed some super important issue
| * 66beba4      (feature/my-awesome-stuff) more work on my awesome feature
| * cca995e      did some stuff
|/
* 1ed51e3        added another file
* 5cee848        initial commit
```

In order to get our commits into master, we first all make sure our local history is up-to-date by running `git fetch`. Next, we rebase our commits and this way prevent a merge from happening. This is achieved with the following git command on our branch: `git rebase -i origin/master`. Git will now ask us how to proceed with our commits:
```
pick cca995e did some stuff
pick 66beba4 more work on my awesome feature
```

We now squash all commits into a single commit while rebasing:

```
pick cca995e did some stuff
squash 66beba4 more work on my awesome feature
```

After we did this, git will ask us to enter a message for the new commit. The default message it offers is simple a concatenation of all the commits messages from the commits to squash. However, you want to make the new commit message fit the pattern described in
[Commit Messages](https://github.com/mbeddr/mbeddr.core/wiki/Development-Guide#commit-messages).

After rebasing our git history looks like this:
```
* afc0fb5        (HEAD -> feature/my-awesome-stuff)  42: super awesome feature
* 3c36424        (master) fixed some super important issue
* 1ed51e3        added another file
* 5cee848        initial commit
```

We still have to branch, now it's time to merge them! Change your git branch to master using `git checkout origin/master`. Make sure you have pulled from the remote and your branch is up-to-date! Now run `git merge --ff-only feature/my-awesome-stuff` the `--ff-only` is important to force git to not merge if it would produce a merge commit.

Now git history looks like this:

```
* afc0fb5        (HEAD -> master, feature/my-awesome-stuff)  42: super awesome feature
* 3c36424        fixed some super important issue
* 1ed51e3        added another file
* 5cee848        initial commit
```

We have not created a merge commit and all commits from our branch appear as a single commit in the git history. You are good to go to push back to the repo. But wait, what if somebody has changes things in the meantime on remote, wouldn't the pull create a new merge? Yes it would! Therefor **don't** use a plain `git pull` but use `git pull --rebase` in case you are pulling from the repo into your local master branch. This way git will not produce a new merge commit but rebase your local changes on top of the remote changes.

## Test Organization
### Naming
The test solution for language `com.mbeddr.x.lang` should be named `test.com.mbeddr.x.lang`. Respectively, the test solution for solution `com.mbeddr.y.sol`should be named `test.com.mbeddr.y.sol`. If we need a special language for testing purposes, it should be named `test.com.mbeddr.x.[lang|sol].testsupport` (or similar suffix).

This way, we can easily discriminate between "real" code below namespace `com.mbeddr` and test code below namespace `test`. We should also place any demo or playground modules outside the `com.mbeddr` namespace for the same reason.

By following this scheme, we can easily build productive code in the UI by building everything below `com.mbeddr` in the Modules Pool, and be assured not to be interfered by test, demo, or playground code.

### Project Structure
All languages, solutions, tests, demos, and playgrounds of one feature should be placed below a common virtual folder bearing the name of the feature. An exception might be build models.

Generator must be present only if they are required. Empty generators must be deleted.

This allows us to quickly access all artifacts constituting one feature.

### File System
All test code should be placed in a special folder in the file system:
```
${PROJECT_HOME}/
  solutions/   Contains all productive solutions
  languages/   Contains all productive languages
  tests/       Contains all solutions and languages required for test, demo, playground
```


## Build

### Build Script Setup

In mbeddr we have different build scripts. They are used on our local machines for building our languages and on the build server for various build-related tasks, such as testing or packaging. This documentation guides you in following the mbeddr standards for setting up your `BuildProject` and integrating it into Mbeddr's build infrastructure.

#### Required BuildFolderMacros

In your `BuildProject` (the build script's model representation in MPS) you first need a `BuildFolderMacro` (a _folder_) named "mps.home" (see code snippet below). If you want to run the generated ant script in your MPS, then you should specify the location of your MPS installation in a relative way, otherwise you don't need a path for `mps.home`. At script execution time, we will redefine `mps.home`, to point to the folder where your MPS installation is located at.

```
folder mps.home = <no defaultPath>
```

Next, you need a `BuildFolderMacro` named "artifacts.root" that does not require a path (see snippet below). When executing the ant script, generated  from your `BuildProject`, we define this macro from outside to point to the folder where all of your plugin dependencies (e.g., `mbeddr.platform`) are located.

```
folder artifacts.root = <no defaultPath>
```

For each `BuildProjectDependency` (the dependency's section below your folders) we need a separate `BuildFolderMacro` that follows the naming convention <BuildProject name>.artifacts and points to `$artifacts.root/<BuildProject name>`. At build script execution time, those macros will point to the folders, where your required plugins are located. In the code snippet below you can see the resulting `BuildFolderMacros` for a `BuildProject` with two dependencies: mps-sl-all and com.mbeddr.platform.

```
folder sl-all.artifacts = $artifacts.root/mps-sl-all 
folder platform.artifacts = $artifacts.root/com.mbeddr.platform
```

#### Type System Tests

In case you want to build type system tests that require a specific Path Macro (e.g., for specifying the project location inside your `TestInfo`), then you must create a 'BuildFolderMacro' for this Path Macro. The name of this `BuildFolderMacro` should start with "mps.macro.", followed by the name of the respective Path Macro. In the example below, we instruct MPS via `mps.macro.mbeddr.github.core.home` to create a Path Macro `mbeddr.github.core.home` that points to the relative path location specified in the other `BuildFolderMacro` `mbeddr.github.core.home`.

```
folder mps.macro.mbeddr.github.core.home = $mbeddr.github.core.home
```

Further, solutions containing type system tests need to be marked as 'content: (with sources and tests) '. To achieve this, please perform the following steps: (1) Inside your `BuildProject` move your cursor to the solution that contains your type system tests. (2) open the inspector. (3) Inside the Inspector select the node 'sources', open the context menu and select 'sources and tests' from it.

Next, in order to get your tests executed, you first need to add the `module-tests` plugin to your *use plugins:' section (on top of your `BuildProject`). In case you cannot add the node 'module-tests' to this section, please first import it from jetbrains.mps.build.mps.tests.accessories (pressing `CTRL+R` opens the import dialog). Finally, create a 'BuildMpsLayout_TestModules' (a _test configuration_) at bottom of your `BuildProject` and list there all solutions that contain type system tests to be executed.

#### Configurations for Generator and Compiler

To make sure code is generated and compiled the same way as in MPS, you have to add the following configurations (`BuildSource_JavaOptions` and `BuildMps_GeneratorOptions`) to your `BuildProject`'s project structure. Those configurations control the generator engine and the Java compiler to make sure we have the same build behavior as in the IDE.

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

For preparing a mbeddr release, you can modify the version number that is set for the mbeddr plugins by overwriting the values of ```major.version```, ```minor.version``` and ```build```(see screenshot below). However, you do not modify these values inside the MPS build scripts, instead, either you modify them in our global gradle script (```mbeddr.core/build.gradle```), or you overwrite them via the command line while spawning a new release build:

``` -PmajorVersion=1 -PbuildVersion=0 -PminorVersion=0000 build_mbeddr publishMbeddrAllInOnePublicationToMavenRepository```

<img src="../../img/mbeddr_version_numbers.png" alt="version numbers in MPS build scripts" />

