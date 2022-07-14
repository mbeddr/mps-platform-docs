# Build

For details see: https://www.jetbrains.com/help/mps/build-language.html

!!! warning "Dependencies on a module not visible from current build project."
Specific Languages Blog &mdash; [Build script error: "Dependency on a module not visible from current build project"](https://specificlanguages.com/posts/build-script-errors/dependency-on-a-module-not-visible-from-current-build-project/){target=_blank}

!!! warning "Build script error: Unsatisfied dependency"
Specific Languages Blog &mdash; [Build script error: "Unsatisfied dependency"](https://specificlanguages.com/posts/build-script-errors/unsatisfied-dependency/){target=_blank}

!!! warning "Build script error: Cannot find used language in dependencies"
Specific Languages Blog &mdash; [Build script error: "Cannot find used language in dependencies"](https://specificlanguages.com/posts/build-script-errors/cannot-find-used-language-in-dependencies/){target=_blank}

!!! warning "Cannot find extended language in dependencies."
Check [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004407199/comments/360000679499).

!!! info "I want to have a gradle build for my MPS project."

    There is a gist for a [minimal build](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75). There is a [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin). For more complex projects look at build scripts of big projects such as [MPS-extensions](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle).

!!! question "How do I build an MPS project with maven?"
Specific Languages Blog &mdash; [Building MPS projects using Maven - a sample](https://specificlanguages.com/posts/building-mps-projects-using-maven/){target=_blank}

!!! warning "The gradle build fails with exception: Incremental build fails during generation on no changed models"

Run `git clean -xdf` and rebuild everything (MPS-33541.)

!!! question "How can I find out the supported MPS version of a project?"

    Search the readme for this information. If the project uses a gradle script, you can most likely find this information
    in the file build.gradle (for example in [this line](https://github.com/JetBrains/MPS-extensions/blob/3e137bcf269f8a2ac79589d4e4938f78900cf294/build.gradle#L81)
    in mps-extension). For older MPS projects there is no waying of finding out the version.

!!! question "What do I need to put into the .gitignore file?"

    Have a look at this [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore) file.

!!! warning "Command line generation fails on Windows if using non-ASCII characters"

    It happens because the generation is started with a Window encoding. Set the following environment variable before starting the build:
    `set JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"` (MPS-34059).

!!! question "How can I fetch dependencies using Gradle?"
Specific Languages Blog &mdash; [Fetching dependencies with Gradle](https://specificlanguages.com/posts/2022-01/31-fetching-dependencies-with-gradle/){target=_blank}

!!! question "Why can I successfully build models with missing imports?"
Specific Languages Blog &mdash; [Why can I successfully build models with missing imports?](https://specificlanguages.com/posts/2022-02/11-successfully-build-models-with-errors/){target=_blank}

!!! warning "X errors before generation."
Specific Languages Blog &mdash; [3358 errors before generation](https://specificlanguages.com/posts/2022-02/17-errors-before-generation/){target=_blank}

!!! question "How do I clean the generated files in MPS?"

    Possible solutions:

    - Specific Languages Blog &mdash; [mpsclean](https://specificlanguages.com/posts/2022-01/17-mpsclean/){target=_blank}
    - When using a build script, have a dedicated clean task ([gradle example](https://github.com/JetBrains/MPS-extensions/blob/ade5d7798c2a233ce850ad539336362ed8ec437e/build.gradle#L272)).



## MPS build script

The build language is one of the oldest parts of MPS and was designed to generate the ant files in a more easy way, but it is not refactored until today. The generator of the build language has to find out, what e.g. “Solution needs BaseLanguage” means at runtime-level. To execute code from the Solution, the jvm needs the baselanguage.jar on the classpath. The more dependencies the Solution has, the more complex becomes the generated ant file, because the generator has to consider all these transitive dependencies. The generator needs to know what artefact is generated from a module and how is the generated artefact/module used at runtime and thus the jars have to be put on the classpath and so on.

The modules (in the mps-groups) in the MPS build script contain information from the serialized descriptors (.msd files, .mpl files, …), which are loaded via “Reload all modules from disk” intention explicitly. The descriptor-files are not read before generation, so that you should always check before you push if your mps build scripts are up-to-date. For every dependency added to a module or changed reexport flag, this intention has to be triggered by hand.

Problem: the current implementation of the build language is not extensible, because it always looks into the original model. The main part of the ant file generation is the dependency analysis (for the modules) and for this it needs to access the original model for some technical reasons. These limit you to languages which are provided by MPS; you cannot use your own patterns, e.g. you cannot write an extension which picks all modules from a folder, generates an intellij-plugin out of them and stores the result in a zip file and generates all the code required for the command-line build. But this is not possible because of the build-language-inherent dependency analysis mechanism.


The code generator of the build language has to check for dependencies like jars in stub-models, jars at runtime etc., but the error messages are not well-designed. For example, you have a jar file xyz.jar entered as java runtime dependency of the language abc. Instead of something like “you have to enter xyz.jar to your build layout plugin-123, cause language abc specifies it as java runtime dependency” you get e.g. “jar stub library should be extracted into build script: ${my.project}/very/long/path/lib/xyz.jar”, which is not very helpful.

Many problems the generator finds could also be found by the model checker, but the checks are done at generation time and implemented as "gencontext.show error" in the generator.

## Generated Ant Scripts ("build.xml")

The mps build scripts are generated to ant scripts, which then generate the modules.
The ant script starts a headless-MPS with all required dependencies, puts jars on the classpath and does some further magic.
Tasks can be passed to the ant script like the “generate” task.

Modules have several models with dependencies, e.g. for a language the behavior uses the structure aspect, the type-system uses the behavior aspect etc. which can result in complex dependencies between these models. These have to be considered when the models are generated and compiled. The order is derived by the code generator of the build language and results in an execution plan where the “compile units” are grouped in “chunks”. Chunks with bootstrap-dependencies are explicitly marked, which means all modules in the chunk have to be compiled at the same time.

MPS consists of hundreds of jar files which must be on the classpath for the code generation and compilation, which leads to giant ant scripts (with some thousand lines). Even simple mps build scripts, which only use BaseLanguage result into big ant scripts.

The build layout in the MPS build script defines how your modules are packaged e.g. as zip containing multiple plugins, as simple plugin-folder, as lib-folder with a flat list of jars, etc.

The ant-script needs to know where the local MPS is installed and where your modules and dependencies are located. This is usually done using folder macros in the mps build script which are generated as “properties'' in the ant script. This makes the build independent of your local machine and the ant script can be executed on the CI or any other machine.

The Headless-MPS, which is started by the ant script, behaves differently
in some cases compared to an IDE-MPS. For example circular dependencies can be resolved in the IDE by just applying "Make Project" multiple times, which does not work on the command line and thus also fails on the CI.
Dependencies which are visible in the IDE are not always visible in the MPS build script/ ant script and can result in failing builds. MPS holds one big global repository, where all modules are loaded into the modules pool (project libraries, global libraries, …). In the IDE everything is always visible and wrong dependencies can be resolved but on the command line the build can fail, because the referenced model is not loaded. The build language generator does not check the nodes for e.g. references out of scope (like the model-checker does), it only looks into meta-data/model-properties and relies on that information.

## Gradle Wrapper ("gradlew/gradlew.bat")

The gradle wrapper script downloads gradle in the specified version, independent of your local installed gradle, and then starts the downloaded gradle.
It consists of a small java program (located under ./gradle/wrapper/gradle-wrapper.jar), an init-file which contains the gradle version (./gradle/wrapper/gradle-wrapper.properties) and start scripts for Windows, Mac and Linux (./gradlew and ./gradlew.bat).
Why do we use gradle?
Gradle build scripts have the advantage that you write code instead of XML, like it is the case using maven or ant.
We use gradle to download MPS and the dependencies in the correct version and put them in the right place, generate the ant scripts from the mps build scripts using a “build-allScripts.xml” ant scripts and then start ant with correct parameters (where is MPS on disc, where are the dependencies on disc, ...). This is easier than doing it with and directly.
For defining the gradle scripts you can use groove (build.gradle) or kotlin (build.gradle.kts), both can do the same. Groovy is sufficient for smaller build scripts, but is dynamically typed and thus fails very late when the gradle task is executed. kotlin provides type-checking and the auto-completion works better compared to groovy (with Intellij); this makes it easier to use with complex scripts.

