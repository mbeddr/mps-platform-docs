---
tags:
- infrastructure
- mps_extensions
- mbeddr
- iets3
---

# Platform build scripts

This page describes the {{ mps_extensions() }} and {{ iets3() }} build scripts. They might look different in the future but this guide should still be helpful. The build scripts from {{ mbeddr() }} work
similar but there's more than just one, so let's focus on the other two platforms.

##[MPS-extensions/build.gradle](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle)

Let's ignore [Modelix](https://modelix.github.io/) related stuff. The script uses the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin) which already contains some useful tasks for Gradle-based builds with MPS.

[Line 2](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L2): the [build script block](https://github.com/mbeddr/mps-gradle-plugin) lists the used dependency repositories: the new itemis nexus server ([https://artifacts.itemis.cloud](https://artifacts.itemis.cloud/repository/maven-mps/)) and also the old one ([projects.itemis.de](https://projects.itemis.de/nexus/content/repositories/mbeddr)).

[Line 8](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L8): The dependency block contains the reference to the mps-gradle-plugin.

[Line 15](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L15): for publishing artifacts to GitHub, the plugin [gradle-github-plugin](https://github.com/riiid/gradle-github-plugin) can be used. It's important to import the classes from the mps-gradle-plugin: `import de.itemis.mps.gradle.*.`

[Line 28](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L28): the [gradle wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) can be used to specify the Gradle version that 
should be downloaded: it must be compatible with the used Java version ([compatibility matrix](https://docs.gradle.org/current/userguide/compatibility.html))

[Line 34](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L34): the variable *ciBuild* can affect the build, for example, by using a different version identifier for the artifacts.

[Line 47](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L47): The path
to the Java installation must be set. For the build it isn't important if it's a normal JDK or a JBR, only the Java version must
be correct.

[Line 71](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L71): a few different ways exist to specify properties for the build. [This guide](https://tomgregory.com/gradle-project-properties-best-practices/) explains them.

[Line 77](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L77): This list contains the Nexus repositories that are used for fetching the dependencies. The actual declaration is done on [line 138](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle#L138).

[Line 83-109](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L83): the logic for deciding the version identifier. It uses hardcoded values, the branch name and *ciBuild* and the class [GitBasedVersioning](https://github.com/mbeddr/mps-gradle-plugin/blob/9135418e30d9a5fe963d275410a91f3b595ddb7f/src/main/groovy/de/itemis/mps/gradle/GitBasedVersioning.groovy#L6) to create a suitable identifier. A local build gets the version *1.0-SNAPSHOT* as described in the [Maven guide](https://maven.apache.org/guides/getting-started/index.html#What_is_a_SNAPSHOT_version). More information can be found in [this StackOverflow question](https://stackoverflow.com/questions/5901378/what-exactly-is-a-maven-snapshot-and-why-do-we-need-it).

[Line 112-123](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L112): the plugins directory varies depending on the operating system ([Plugins directory | MPS](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#plugins-directory)).

[Line 125](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L125): The following variables contain the Nexus repositories that are used for publishing the artifacts.

[Line 130-136](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L130): a new [configuration](https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.Configuration.html) named *mps* is declared. It's used for declaring the dependency on MPS. The dependencies block declares the dependency. The dependency isn't automatically resolved because a custom configuration is used. The resolution task is created on [line 150](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L150) and the following lines. `configurations.mps.resolve()` downloads the zip file, `zipTree`unzips it into the MPS home directory.

[Line 168-174](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L168): This dependency is needed to support Junit ant tasks.
[Line 183-199](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L183): Some system variables are set by prepending `-D` in front of the key-value pairs. These variables are declared in the build solution in the build script of the MPS project. They can be overridden from the command line this way.

[Line 204-219](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L204): The all script is a special MPS build script that calls all other build scripts. This task has the type *BuildLanguages* as described in the Gradle plugin documentation and executes the xml file that was created by the MPS build language. The next lines also declare tasks for building the languages and running the tests. They call the corresponding build scripts from the build module of this project (^^de.itemis.mps.extensions.build^^).

[Line 221](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L221): this task installs the nativelibs\.loader plugin which can be used for loading native code(e.g. C code) that is needed for a Java library (e.g. C debugger). A special plugin is needed because special methods for loading native code in Java exist. Normal
MPS solutions shouldn't be used for this task because they can be reloaded in MPS which isn't possible with native libraries. This plugin is implemented as an IntelliJ plugin which is not affected by the MPS reloading mechanism.

[Line 250](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L250): This block declares the Junit ant dependency.

[Line 260-270](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L260): These two tasks create zip files from the artifacts.

[Line 272](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L272): the clean tasks removes the generated MPS files, cleans the temporary folder and remove the content of the artifact folder.

[Line 279-317](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L279): This block uses the [Maven publishing plugin](https://docs.gradle.org/current/userguide/publishing_maven.html) to publish the generated artifacts to different repositories such as Nexus and GitHub maven repositories. The credentials can be stored
on the build server (e.g. TeamCity) or in the GitHub project itself, when the project is built with [GitHub actions](https://docs.github.com/en/actions).

[Line 319-339](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L326): This block defines one single publication *de.itemis.mps:extensions*. It also publishes a Maven [pom file](https://maven.apache.org/pom.html) that lists all the dependencies of this artifact (in this case: only MPS).

[Line 376](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L376): This block declares the publication for GitHub. **Warning**: it's not possible to publish an artifact with the same name on GitHub, it won't be overridden.

The rest of the build script uses [modelix/mpsbuild](https://github.com/modelix/mpsbuild), a replacement for the MPS build language. Visit [Exploring modelix/mpsbuild - Specific Languages](https://specificlanguages.com/posts/2022-05/30-exploring-modelix-mpsbuild/) for some initial information on this project.

##[iets3.opensource/build.gradle](https://github.com/IETS3/iets3.opensource/blob/master/build.gradle)

The build script looks like the script from MPS-extensions, so let's focus only on the differences.

[Line 68-112](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L68): The project has a dependency on mbeddr which can be overridden with a local dependency by setting the project variable *forceLocalDependencies*.

[Line 134-139](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L134): A few configurations are declared in this block. The dependencies of these configurations are resolved in different Gradle tasks, for example in the task *resolvePcollections* on [line 179](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L179).

[Line 259-264](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L259): Additional to exporting the languages and solutions, the project also creates a [standalone IDE (RCP)](https://www.jetbrains.com/help/mps/building-standalone-ides-for-your-languages.html.)

[Line 332-406](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L332): This time there a multiple publications. Not only the languages and tests are published but also some runtime Java libraries that are needed 
by KernelF (e.g. *org.iets3.core.expr.datetime.runtime* for the datetime language).

[Line 409-421](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L409): This task reads project libraries from projectlibraries.properties and generates *libraries.xml* in the *.mps* directory. Libraries are loaded in MPS during the start. A library is, for example, mbeddr. The task is used by the *setup* tasks which should be executed when cloning the project.

## Mbeddr build scripts

The main [build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build.gradle) can be found in the root directory. A *build* subfolder exists. The most important build files are [com.mbeddr/build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build/com.mbeddr/build.gradle) which build mbeddr itself and [com.mbeddr/platform/build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build/com.mbeddr/platform/build.gradle) which builds the mbeddr platform.