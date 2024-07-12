---
comments: true
tags:
- infrastructure
- mps_extensions
- mbeddr
- iets3
---

# Platform Build Scripts

This page describes the {{ mps_extensions() }}, and {{ iets3() }} build scripts. They might look different in the future, but this guide should still be helpful. The build scripts from {{ mbeddr() }} work similarly, but there's more than just one, so let's focus on the other two platforms.

##[MPS-extensions/build.gradle](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle)

Let's ignore [Modelix](https://modelix.github.io/)-related stuff. The script uses the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin), which contains some valuable tasks for Gradle-based builds with MPS.

[Line 2](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L2): The [build script block](https://github.com/mbeddr/mps-gradle-plugin) lists the used dependency repositories: the new itemis nexus server ([https://artifacts.itemis.cloud](https://artifacts.itemis.cloud/repository/maven-mps/)) and the old one ([projects.itemis.de](https://projects.itemis.de/nexus/content/repositories/mbeddr)).

[Line 8](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L8): The dependency block contains the reference to the mps-gradle-plugin.

[Line 15](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L15): Use the plugin [gradle-github-plugin](https://github.com/riiid/gradle-github-plugin) for publishing artifacts to GitHub. It's important to import the classes from the mps-gradle-plugin: `import de.itemis.mps.gradle.*.`

[Line 28](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L28): Use the [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) to specify the Gradle version that Gradle should download: it must be compatible with the used Java version ([compatibility matrix](https://docs.gradle.org/current/userguide/compatibility.html))

[Line 34](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L34): The variable *ciBuild* can affect the build, for example, by using a different version identifier for the artifacts.

[Line 47](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L47): Set the path
to the Java installation.

[Line 71](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L71): A few different ways exist to specify properties for the build. [This guide](https://tomgregory.com/gradle-project-properties-best-practices/) explains them.

[Line 77](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L77): This list contains the Nexus repositories that Gradle uses for fetching the dependencies. [Line 138](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle#L138) contains the actual declaration.

[Line 83-109](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L83): The logic for deciding the version identifier. It uses hardcoded values, the branch name, *ciBuild*, and the class [GitBasedVersioning](https://github.com/mbeddr/mps-gradle-plugin/blob/9135418e30d9a5fe963d275410a91f3b595ddb7f/src/main/groovy/de/itemis/mps/gradle/GitBasedVersioning.groovy#L6) to create a suitable identifier. A local build gets version *1.0-SNAPSHOT* as described in the [Maven guide](https://maven.apache.org/guides/getting-started/index.html#What_is_a_SNAPSHOT_version). [This StackOverflow question](https://stackoverflow.com/questions/5901378/what-exactly-is-a-maven-snapshot-and-why-do-we-need-it) contains more information.

[Line 112-123](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L112): The plugins directory varies depending on the operating system ([Plugins directory | MPS](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#plugins-directory)).

[Line 125](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L125): The following variables contain the Nexus repositories the script uses to publish the artifacts.

[Line 130-136](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L130): A new [configuration](https://docs.gradle.org/current/dsl/org.gradle.api.artifacts.Configuration.html) named *mps* is declared, used for declaring the dependency on MPS. The dependencies block declares the dependency. Gradle doesn't automatically resolve the dependency because a custom configuration is used. [Line 150](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L150) and the following lines create the resolution task. `configurations.mps.resolve()` downloads the zip file, `zipTree` unzips it into the MPS home directory.

[Line 168-174](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L168): This dependency is needed to support the Junit Ant task.
[Line 183-199](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L183): Some system variables are set by prepending `-D` before the key-value pairs. These variables are declared in the build solution in the build script of the MPS project. Use this way to overwrite them on the command line.

[Line 204-219](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L204): The *all* script is a special MPS build script that calls all other build scripts. This task has the type *BuildLanguages* as described in the Gradle plugin documentation and executes the XML file created by the MPS build language. The following lines also declare tasks for building the languages and running the tests. They call the corresponding build scripts from the build module of this project (^^de.itemis.mps.extensions.build^^).

[Line 221](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L221): This task installs the nativelibs\.loader plugin, which you can use for loading native code (e.g., C code) that is needed for a Java library(e.g., C debugger). A special plugin is needed because special methods for loading native code in Java exist. Don't use ordinary MPS solutions for this task because they can be reloaded in MPS, which isn't possible with native libraries. This plugin is implemented as an IntelliJ plugin and is unaffected by the MPS reloading mechanism.

[Line 250](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L250): This block declares the Junit Ant dependency.

[Line 260-270](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L260): These two tasks create zip files from the artifacts.

[Line 272](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L272): The clean task removes the generated MPS files, cleans the temporary folder, and removes the artifact folder's content.

[Line 279-317](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L279): This block uses the [Maven publishing plugin](https://docs.gradle.org/current/userguide/publishing_maven.html) to publish the generated artifacts to different repositories, such as Nexus and GitHub Maven repositories. When building the project with [GitHub Actions](https://docs.github.com/en/actions), the credentials are storable on the build server (e.g., TeamCity) or in the GitHub project.

[Line 319-339](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L326): This block defines one publication *de.itemis.mps:extensions*. It also publishes a Maven [pom file](https://maven.apache.org/pom.html) that lists all the dependencies of this artifact (in this case: only MPS).

[Line 376](https://github.com/JetBrains/MPS-extensions/blob/67e482fe58ea9568649af0a99b8671203019ae20/build.gradle#L376): This block declares the publication for GitHub. **Warning**: It's impossible to publish an artifact with the same name on GitHub. It doesn't get overwritten.

The rest of the build script uses [modelix/mpsbuild](https://github.com/modelix/mpsbuild), a replacement for the MPS build language. Visit [Exploring modelix/mpsbuild - Specific Languages](https://specificlanguages.com/posts/2022-05/30-exploring-modelix-mpsbuild/) for initial information on this project.

##[iets3.opensource/build.gradle](https://github.com/IETS3/iets3.opensource/blob/master/build.gradle)

The build script looks like the script from {{ mps_extensions() }}, so let's focus only on the differences.

[Line 68-112](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L68): The project has a dependency on mbeddr which you can override with a local dependency by setting the project variable *forceLocalDependencies*.

[Line 134-139](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L134): This block declares a few configurations. The dependencies of these configurations are resolved in different Gradle tasks, for example, in the task *resolvePcollections* on [line 179](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L179).

[Line 259-264](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L259): Additional to exporting the languages and solutions, the project also creates a [standalone IDE (RCP)](https://www.jetbrains.com/help/mps/building-standalone-ides-for-your-languages.html.)

[Line 332-406](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L332): This time, multiple publications exist. Not only the languages and tests are published but also some runtime Java libraries that KernelF needs (e.g. *org.iets3.core.expr.datetime.runtime* for the datetime language).

[Line 409-421](https://github.com/IETS3/iets3.opensource/blob/7f47230011022dc54e12daf3405c738fba3e5654/build.gradle#L409): This task reads project libraries from projectlibraries.properties and generates *libraries.xml* in the *.mps* directory. During startup, MPS loads libraries. A library is, for example, mbeddr. The *setup* tasks use the task which you should execute when cloning the project.

## Mbeddr Build Scripts

The root directory contains the main [build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build.gradle). A *build* subfolder exists. The most crucial build files are [com.mbeddr/build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build/com.mbeddr/build.gradle), which build mbeddr, and [com.mbeddr/platform/build.gradle](https://github.com/mbeddr/mbeddr.core/blob/master/build/com.mbeddr/platform/build.gradle), which builds the {{ mbeddr_platform() }}.