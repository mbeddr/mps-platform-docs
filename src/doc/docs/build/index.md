---
comments: true
tags:
- mps_language
- build
---

# [Build Language](https://www.jetbrains.com/help/mps/build-language.html)

- [Escaping to Ant from the build language](https://specificlanguages.com/posts/2022-03/24-escaping-to-ant-from-build-language/){{ blog('sl') }}
- [3 small changes to improve your build scripts](https://specificlanguages.com/posts/2024-01/02-3-small-changes-to-improve-your-build-scripts/){{ blog('sl') }}

!!! question "How can you override the build directory name *build* to something different?"

    You can do it when you invoke Ant by passing `#!properties -Dbuild.dir=otherDir`.

!!! warning "Dependencies on a module are not visible from the current *build* project."

    [Build script error: "Dependency on a module not visible from current build project"](https://specificlanguages.com/posts/build-script-errors/dependency-on-a-module-not-visible-from-current-build-project/){{ blog('sl') }}

!!! warning "Build script error: unsatisfied dependency :beginner:"

    [Build script error: "Unsatisfied dependency"](https://specificlanguages.com/posts/build-script-errors/unsatisfied-dependency/){{ blog('sl') }}

!!! warning "Build script error: can't find used language in dependencies."
    
    [Build script error: "Cannot find used language in dependencies"](https://specificlanguages.com/posts/build-script-errors/cannot-find-used-language-in-dependencies/){{ blog('sl') }}

!!! warning "Can't find extended language in dependencies."
    
    Check [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004407199/comments/360000679499).

!!! question "How do you build an MPS project with Maven?" 

    [Building MPS projects using Maven - a sample](https://specificlanguages.com/posts/building-mps-projects-using-maven/){{ blog('sl') }}

!!! question "How can you find out the supported MPS version of a project?"

    Search the readme for this information. You can find this information
    in the file build.gradle (for example, in [this line](https://github.com/JetBrains/MPS-extensions/blob/3e137bcf269f8a2ac79589d4e4938f78900cf294/build.gradle#L81) if the project uses Gradle.
    in {{ mps_extensions() }}). For older MPS projects, there is no way of finding out the version.

!!! question "What do you need to put into the *\.gitignore* file?"

    Have a look at this [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore) file.

!!! question "Why is it possible to successfully build models with missing imports?"

    [Why can I successfully build models with missing imports?](https://specificlanguages.com/posts/2022-02/11-successfully-build-models-with-errors/) {{ blog('sl') }}

!!! warning "X errors before generation :beginner:"
    
    [3358 errors before generation](https://specificlanguages.com/posts/2022-02/17-errors-before-generation/){{ blog('sl') }}

!!! question "How do you clean the generated files in MPS?"

    Possible solutions:

    - [mpsclean](https://specificlanguages.com/posts/2022-01/17-mpsclean/){{ blog('sl') }}
    - Have a dedicated clean task ([gradle example](https://github.com/JetBrains/MPS-extensions/blob/ade5d7798c2a233ce850ad539336362ed8ec437e/build.gradle#L272)) when using a build script.

    The idea of having such a task is not only to make it easier to clean the generated files but also keep downloaded dependencies. If you have, for example, MPS as dependency in your project, *git clean -xdf* will remove all dependencies including MPS.

!!! warning "The [files from](http://127.0.0.1:63320/node?ref=r%3Ae9081cad-d8c3-45f2-b4ad-1dabd5ff82af%28jetbrains.mps.build.structure%29%2F2750015747481074431) operation from the MPS build model changes the access permissions of the copied-over files."

    You can use [Buildlayout_Filemode](https://app.slack.com/client/T3XHGU6G0/C3YUV3YK0/thread/C3YUV3YK0-1657543516.836299#:~:text=BuildLayout_Filemode) as a workaround or unzip the files using Gradle.

!!! question "How can you unpack JAR files?"

    - [Build language tricks: Unpacking JAR files](https://specificlanguages.com/posts/2022-03/28-build-language-tricks-unpacking-jar-files/){{ blog('sl') }}

!!! question "How can you measure code coverage?"

    - [Measuring code coverage with the MPS build language](https://specificlanguages.com/posts/2022-06/25-measuring-code-coverage-with-mps-build-language/){{ blog('sl') }}

## MPS Build Script

The build language is one of the oldest parts of MPS, designed to generate the Apache Ant files and stayed the same over the years. The generator of the build language has to find out what, for example, *the solution needs Base Language* means at the runtime level. The JVM needs the file *baselanguage.jar* on the classpath to execute code from the solution. The more dependencies the solution has, the more complex the generated Ant file becomes because the generator must consider all these transitive dependencies. The generator needs to know what artifact a module generates and how the generated artifact/module is used at runtime. Therefore, the JARs must be on the classpath.

The modules in the mps-groups in the MPS build script contains information from the serialized descriptors (.msd files, .mpl files, …). The *Reload all modules from disk* intention loads them explicitly. MPS doesn't read the descriptor files before generation, so you should always verify whether your MPS build scripts are up-to-date before you push. For every dependency added to a module or a changed reexport flag, this intention has to be triggered by hand.

There is a problem with the language: The current implementation of the build language isn't extensible, because it always looks into the original model. The central part of the Ant file generation is the dependency analysis (for the modules), and for this, it needs to access the original model for some technical reasons. This approach limits you to languages that MPS provides. For example, You can't use your patterns and write an extension that picks all modules from a folder, generates an IntelliJ plugin, stores the result in a zip file, and generates all the code required for the command-line build.

The code generator of the build language has to verify for dependencies like JARs in stub models and JARs at runtime, but the error messages aren't well-designed. For example, you have a JAR file xyz.jar entered as a Java runtime dependency of the language abc. Instead of something like "you have to enter xyz.jar to your build layout plugin-123, cause language abc specifies it as java runtime dependency", you get, for example, "jar stub library should be extracted into build-script: `${my.project}/very/long/path/lib/xyz.jar`"‚ which isn't helpful.

The model checker could also find many problems the generator finds, but the checks are done at generation time and implemented as "gencontext.show error" in the generator.

## Generated Ant Scripts (*build.xml*)

MPS build scripts generate Ant scripts, which generate the modules.
The Ant script starts a headless MPS instance with all required dependencies, puts JARs on the classpath, and does some further magic.
You can pass tasks to the Ant script, like the *generate* task.

Modules have several models with dependencies. For example, for a language, the behavior uses the structure aspect; the type system uses the behavior aspect, etc., which can result in complex dependencies between these models. These have to be considered when the models are generated and compiled. The order is derived by the code generator of the build language and results in an execution plan where the compile units are grouped in chunks. Chunks with bootstrap dependencies are explicitly marked, which means all modules in the chunk have to be compiled at the same time.

MPS consists of hundreds of JAR files that must be on the classpath for the code generation and compilation, which leads to giant Ant scripts (with some thousand lines). Even simple MPS build scripts, which only use Base Language, result in big Ant scripts.

The build layout in the MPS build script defines the packaging of your modules, for example, as Zip files containing multiple plugins, as a simple plugin folder, as a lib folder with a flat list of JARs, etc.

The Ant script needs to know the path to the local MPS installation and where your modules and dependencies are. This is usually done using folder macros in the MPS build script, generated as "properties" in the Ant script. This approach makes the build independent of your local machine, and you can execute the Ant script on the CI or any other machine.

The headless MPS, started by the Ant script, sometimes behaves differently than an IDE/MPS. For example, the IDE can resolve circular dependencies by applying *Make Project* multiple times, which doesn't work on the command line and thus also fails on the CI.
Dependencies in the IDE are only sometimes visible in the MPS build script/Ant script and can result in failing builds. MPS holds one global repository with all modules loaded into the modules pool (project libraries, global libraries, etc.). Everything's always visible in the IDE, and the IDE can resolve wrong dependencies, but the build can fail on the command line because the referenced model isn't loaded. The build language generator doesn't check the nodes, for example, that references out of scope (like the model-checker does). It only looks into metadata/model properties and relies on that information.

## Shell Scripts

Some scripts, like MPS's start scripts, are developed using Windows Batch Scripting on Windows and Bash Shell Scripting on Mac/Linux. To learn more about those two scripting languages, consult the following list:

- [Windows Batch Scripting | wikibooks.org](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
- [Using batch files | learn.microsoft.com](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490869(v=technet.10))
- [Bash Shell Scripting | wikibooks.org](https://en.wikibooks.org/wiki/Bash_Shell_Scripting)
- [Bash Reference Manual | gnu.org](https://www.gnu.org/software/bash/manual/bash.html)
