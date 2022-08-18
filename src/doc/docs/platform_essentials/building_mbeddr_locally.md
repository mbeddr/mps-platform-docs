When trying to build [mbeddr](https://github.com/mbeddr/mbeddr.core) locally, there are some stumblings blocks that you have to overcome. This article isn't a full build instruction but rather a rough guideline. It should make mbeddr build so far than you can make changes to the non C parts of the project. You probably need to install all tools from the page [Required Tools and Versions | mbeddr.com](http://mbeddr.com/download.html#RequiredToolsAndVersions), especially the C related tools, if you want to get everything build. Help for extending this guide is always appreciated.

1. `git clone git@github.com:mbeddr/mbeddr.core.git`
2. Switch to the branch that you need, in case it isn't the master branch e.g. MPS 2021.1.4: `git checkout maintenance/mps20211`
3. Open the *com.mbeddr.debugger* project in MPS (there are multiple projects in the code/languages folder) and run `./gradlew install` on Mac/Linux or `gradlew.bat install` on Windows in the command line. This command should build the full project and takes probably more than 10 minutes. You don't have to start this command from inside MPS but when you execute it on the normal command line, you might need to pass `-PMPS_PATHS_SELECTOR`to gradle to set the path to the MPS home directory. When everything works, the script should install a plugin named *spawner* into your MPS installation. This plugin contains libraries for the [Eclipse C/C++ development tooling](https://www.eclipse.org/cdt/) and needs to be installed. It also install the idea plugin for the actionsfilter language, that needs to be installed to be able to use the language.
4. If not also set, open MPS, go to preferences --> *Appearance&Behavior*-->*Path Variables* and set *mbeddr.github.core.home* to the root directory of the mbeddr.core repository.
5. You can now build all projects. Start with these projects in this order:

    - *com.mbeddr.debugger*
    - *com.mbeddr.mpsutil*
    - *com.mbeddr.core*
    - *com.mbeddr.ext*
    - ...

If you get compilation error, try a different order. Some projects like *com.mbeddr.doc* and *com.mbeddr.doc.aspect* don't have as many dependencies to other projects as other projects.

If there are many errors in the *com.mbeddr.debugger* project, you probably don't have the spawner plugin installed.

In case anything went wrong, and you want to start over, just clean the generated files: `git clean -xdf`. After you've made a change, just (re)build the parts of the project that you've changed and push the branch so that the build server can make a full build + execute the tests.

   You don't need to open all dependent projects if you make a change in one project.