---
tags:
- infrastructure
- mbeddr
---

When building [mbeddr](https://github.com/mbeddr/mbeddr.core) locally, you must overcome some stumbling blocks. This article isn't a complete build instruction but rather a rough guideline. It should make mbeddr build so far that you can make changes to the non-C parts of the project. If you want to get everything built, install all tools from the page [Required Tools and Versions | mbeddr.com](http://mbeddr.com/download.html#RequiredToolsAndVersions), especially the C-related tools.

## Automatic Build

1. `git clone git@github.com:mbeddr/mbeddr.core.git`
2. Switch to the branch that you need, if it isn't the master branch, for example, MPS 2021.1.4: `git checkout maintenance/mps20211`
3. If not also set, open MPS, go to preferences --> *Appearance&Behavior*-->*Path Variables*, and set *mbeddr.github.core.home* to the root directory of the mbeddr\.core repository.
4. Run `./gradlew build_mbeddr -PdisableMavenLocal=true` to build mbeddr fully.
5. Run `./gradlew -PdisableMavenLocal=true` instead to only build the platform.
6. You have to build the tests and sandboxes manually.

## Manual Build

1. Open the *com.mbeddr.debugger* project in MPS (multiple projects are located in the code/languages folder) and run `./gradlew install` on Mac/Linux or `gradlew.bat install` on Windows in the command line. This command should build the entire project and takes more than 10 minutes. You don't have to start this command from inside MPS, but when you execute it on the regular command line, you might need to pass `-PMPS_PATHS_SELECTOR`to gradle to set the path to the MPS home directory. When everything works, the script should install a *spawner* plugin into your MPS installation. This plugin contains libraries for the [Eclipse C/C++ development tooling](https://www.eclipse.org/cdt/) and needs to be installed. It also installs the idea plugin for the actions filter language, which you needs to install to use the language.
2. You can now build all projects. Start with these projects in this order:

    - *com.mbeddr.debugger*
    - *com.mbeddr.mpsutil*
    - *com.mbeddr.core*
    - *com.mbeddr.ext*
    - ...

If you get compilation errors, try a different order. Some projects like *com.mbeddr.doc* and *com.mbeddr.doc.aspect* don't have as many dependencies on other projects as other projects.

If a lot of errors occur in the *com.mbeddr.debugger* project, you don't have the spawner plugin installed.

!!! warning "When anything goes wrong, and you want to start over, clean the generated files: `git clean -xdf`. After you've made a change, (re)build the parts of the project that you've changed and push the branch so that the build server can make a complete build + execute the tests."

!!!hint "You don't need to open all dependent projects if you make a change in one project."