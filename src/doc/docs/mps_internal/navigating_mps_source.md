---
comments: true
tags:
- internals
- sources
---

This page describes the folder structure of the MPS sources that you can check out with Git from https://github.com/JetBrains/MPS.
The readme of the repository contains more information.

## .idea

The `artifacts` directory contains the artifact-related settings. [Artifacts | IntelliJ IDEA](https://www.jetbrains.com/help/idea/working-with-artifacts.html) contains more information. Artifacts in this project are the generated jar files
such as `mps-core.jar` and `vcs-core.jar`:

![mps artifacts dialog](images/mps_artifacts.png)

The directory also contains settings for code styles, copyright info, and enabled inspections. The paths to the used libraries (*.jar) are also specified in the `libraries` subfolder. The run configurations, search scopes as well as
many other IntelliJ-specific project settings,

## .mps

This folder also contains run configurations and scopes but also other settings:

- *codeStyleSettings.xml*: style settings used for Base Language (e.g., default field and parameter prefix)
- *compiler.xml*: the version of the Java compiler (currently: 11)
- *encodings.xml*: encoding of the files (should be: UTF-8)
- *migration.xml*: list of executed MPS migrations in the current project 
- *misc.xml*: miscellaneous settings (e.g., settings of favorites manager)
- *modules.xml*: a list of modules of this project MPS loads on startup
- *vcs.xml*: version control settings
- *version.xml*: project version (not used anymore)
- *settings of different components* (e.g., console history, messages view tool, project view)

## bin

This folder contains executable files for the different operating systems (Windows, Mac, Linux). All of them use the executable *fsnotifier* to react to file system changes. OS-specific files:

- Linux
    - *libdgbm*: GNU dbm ('gdbm') is a library of database functions that use extendible hashing and works similarly to the standard UNIX *dbm* function [source](https://packages.debian.org/de/sid/libgdbm-dev)
    - *restart.py*: restarts MPS

- Mac
    - *libmacscreenmenu64.dylib*: native access to the [Apple menu bar](https://support.apple.com/guide/mac-help/menu-bar-mchlp1446/mac).
    - *libnst64.dlib*: native access to the Apple MacBook Pro [Touch Bar](https://support.apple.com/guide/mac-help/use-the-touch-bar-mchlbfd5b039/mac). The library is called NST (NextStep Touch Bar).
    - *printenv*: prints the environment variables
  
- Windows
    - *breakgen(64).dll*: gracefully shut down a running process (not possible with Java).
    - *elevator.exe*: a sudo-like tool for Windows to deal with UAC ([source](https://stackoverflow.com/questions/53023013/elevator-exe-in-android-studio-update))
    - *IdeaWin32/64.dll*: native file system functions
    - *launcher.exe*: launches MPS
    - *restarter.exe*: restarts MPS
    - *runnerw.exe*: an old library for Windows process management. [WinP](https://github.com/jenkinsci/winp) superseded it.
    - *WinProcessListHelper.exe*: lists Windows processes
    - *WinShellIntegrationBridge.dll*: integration with the Windows shell
    - *wslhash*: hash calculation (?) for the [Windows Subsystem for Linux](https://www.jetbrains.com/help/idea/how-to-use-wsl-development-environment-in-product.html)
    - *wslproxy*: proxy (?) for the [Windows Subsystem for Linux](https://www.jetbrains.com/help/idea/how-to-use-wsl-development-environment-in-product.html)

## build

The dependency manager of the project is [Apache Ivy](https://ant.apache.org/ivy/). The corresponding folder is `build/ivy`.
 The build tool is [Apache Ant](https://ant.apache.org/).
The `artifacts` folder contains the generated jar files. An artifact might look like this:

- *languages*: contains MPS languages
- *modules*: contains Java classes
- *lib*: Jar dependencies
- *META-INF*: contains the [plugin configuration file](https://plugins.jetbrains.com/docs/intellij/plugin-configuration-file.html)
- *build.properties*: contains the MPS version and IntelliJ plugin this artifact belongs to.

The `dependencies` folder contains the [Gradle configuration properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_configuration_properties).

`home/.ant/lib` contains additional Java libraries that can be used with Ant.

The `resources` folder contains image resources as well as the following files:

- *mps*: executable file to start MPS
- *mps-dmg.sh*: Create an [Apple Disk image](https://www.howtogeek.com/362166/what-is-a-dmg-file-and-how-do-i-use-one/) for macOS
- *mps-sign.sh*: [signs](https://developer.apple.com/library/archive/documentation/Security/Conceptual/CodeSigningGuide/Introduction/Introduction.html) the MPS macOS application

The `tests` folder contains Ant scripts for executing tests.
The `tools` folder contains scripts for signing and creating DMGs and a version of the Java Runtime Environment and NSIS (Nullsoft Scriptable Install System) for creating an installer for Windows.
The other XML files are also Ant scripts for different tasks (getting dependencies, building MPS languages, migration projects, etc.).
The `run_build.sh` and `run_test.sh` can be used to run the build and tests
on Linux/Mac. `update.xml` lists all MPS versions and helps with the automatic MPS update management.

## core

The `aspects` folder contains the languages for the language aspects.
The `baselanguage` folder contains the Base Language implementation and all its extensions, such as extension methods, closures, or the collection language.

The folder `devkit` contains the four main devkits:

- ^^jetbrains.mps.devkit.bootstrap-languages^^: contains all the jetbrains.mps.lang languages
- ^^jetbrains.mps.devkit.general-purpose^^: Base Language + smodel + text +  quotation language
- ^^jetbrains.mps.devkit.language-design^^ + the previous 2 devkits + an intermediate language for baselanguage (baseLanguageInternal) + a language for resources
- ^^jetbrains.mps.devkit.templates^^: general-purpose + generator languages

### kernel

It contains core languages of MPS such as loaders for Java stubs, classes for persistence, language checkers,
make classes, and runtime classes for smodel such as `SConceptOperations.java` and `SModelOperations.java`.  

### languages

This folder contains all core languages such as smodel, quotation, access, quotations, and pattern.

### make

Everything related to the make facet is in this folder.

### stub

This folder contains all stub models provided by MPS, for example, stubs for annotations (like [JetBrains annotations](https://github.com/JetBrains/java-annotations)), Java core classes (JDK, e.g., `java.util.List`), and all MPS-related Java classes are located in solutions that start with the naming pattern `MPS.*` (e.g., MPS.Core).

### tool

This folder contains classes for accessing MPS from Java (e.g., `MPSEnvironment`) and other tool-related classes, such as accessing Ant from Java.

## platform

This folder contains languages and solutions for the following platform features:

- build language
- console
- HTTP server
- make
- migrations
- model checker
- Java to MPS parsing
- spell checker
- debugging information (traceInfo)
- version control
- integrations with the IDEA platform
- integration for MPS plugin into IntelliJ IDEA

## samples

This folder contains the samples that MPS ships with. When first accessed through the start screen, MPS unpacks them automatically into a folder in the home directory.

## tests

This folder contains classes for executing tests and all kinds of tests, such as generator tests or tests for the constraint aspect.

## workbench

This folder contains subfolders for:

- [MPS debugger](https://www.jetbrains.com/help/mps/using-mps-debugger.html)
- [Context actions](https://www.jetbrains.com/help/mps/context-actions-tool.html)
- editor related actions
- run configurations + execution of Base Language and other languages
- refactorings
- UI components and tools such as the dependency viewer, the new module dialog as well as different finders
- all other actions (jetbrains.mps.ide and jetbrains.mps.ide.mpsdevkit)
- editor tabs for the various language aspects