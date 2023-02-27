---
tags:
- mps_language
- build
---

- [official documentation](https://www.jetbrains.com/help/mps/build-language.html)
- [Escaping to Ant from the build language](https://specificlanguages.com/posts/2022-03/24-escaping-to-ant-from-build-language/){{ blog('sl') }}

# Build language

!!! question "How can you override the build directory name *build* to something different?"

    You can do it when you invoke Ant by passing `#!properties -Dbuild.dir=otherDir`.

!!! warning "Dependencies on a module not visible from the current *build* project."

    {{ blog('sl',false) }}[Build script error: "Dependency on a module not visible from current build project"](https://specificlanguages.com/posts/build-script-errors/dependency-on-a-module-not-visible-from-current-build-project/)

!!! warning "Build script error: unsatisfied dependency."

    {{ blog('sl',false) }}[Build script error: "Unsatisfied dependency"](https://specificlanguages.com/posts/build-script-errors/unsatisfied-dependency/)

!!! warning "Build script error: can't find used language in dependencies."
    
    {{ blog('sl',false) }}[Build script error: "Cannot find used language in dependencies"](https://specificlanguages.com/posts/build-script-errors/cannot-find-used-language-in-dependencies/)

!!! warning "Can't find extended language in dependencies."
    
    Check [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004407199/comments/360000679499).

!!! question "How do you build an MPS project with maven?" 

    Specific Languages blog: [Building MPS projects using Maven - a sample](https://specificlanguages.com/posts/building-mps-projects-using-maven/)

!!! question "How can you find out the supported MPS version of a project?"

    Search the readme for this information. If the project uses a gradle script, you can most likely find this information
    in the file build.gradle (for example in [this line](https://github.com/JetBrains/MPS-extensions/blob/3e137bcf269f8a2ac79589d4e4938f78900cf294/build.gradle#L81)
    in mps-extension). For older MPS projects there is no waying of finding out the version.

!!! question "What do you need to put into the *\.gitignore* file?"

    Have a look at this [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore) file.

!!! question "Why is it possible to successfully build models with missing imports?"

    {{ blog('sl',false) }}[Why can I successfully build models with missing imports?](https://specificlanguages.com/posts/2022-02/11-successfully-build-models-with-errors/)

!!! warning "X errors before generation."
    
    {{ blog('sl',false) }}[3358 errors before generation](https://specificlanguages.com/posts/2022-02/17-errors-before-generation/)

!!! question "How do you clean the generated files in MPS?"

    Possible solutions:

    - Specific Languages Blog: [mpsclean](https://specificlanguages.com/posts/2022-01/17-mpsclean/)
    - When using a build script, have a dedicated clean task ([gradle example](https://github.com/JetBrains/MPS-extensions/blob/ade5d7798c2a233ce850ad539336362ed8ec437e/build.gradle#L272)).

!!! warning "The [files from](http://127.0.0.1:63320/node?ref=r%3Ae9081cad-d8c3-45f2-b4ad-1dabd5ff82af%28jetbrains.mps.build.structure%29%2F2750015747481074431) operation from the MPS build model, changes the access permissions of the copied over files."

    As a workaround you can use [Buildlayout_Filemode](https://app.slack.com/client/T3XHGU6G0/C3YUV3YK0/thread/C3YUV3YK0-1657543516.836299#:~:text=BuildLayout_Filemode) or unzip the files using Gradle.

!!! question "How can you unpack JAR files?"

    - [Build language tricks: Unpacking JAR files](https://specificlanguages.com/posts/2022-03/28-build-language-tricks-unpacking-jar-files/){{ blog('sl') }}

!!! question "How can you measure code coverage?"

    - [Measuring code coverage with the MPS build language](https://specificlanguages.com/posts/2022-06/25-measuring-code-coverage-with-mps-build-language/){{ blog('sl') }}

## MPS build script

The build-language is one of the oldest parts of MPS, designed to generate the ant files in an easier way, but it isn't refactored until today. The generator of the build language has to find out what, for example, “solution needs baselanguage” means at runtime-level. To execute code from the solution, the JVM needs the baselanguage.jar on the classpath. The more dependencies the solution has, the more complex becomes the generated ant file, because the generator has to consider all these transitive dependencies. The generator needs to know what artefact a module generates and how the generated artefact/module is used at runtime. Therefore, the jars must be on the classpath.

The modules in the mps-groups in the MPS build script contain information from the serialized descriptors (.msd files, .mpl files, …). The *Reload all modules from disk* intention loads them explicitly. The descriptor files aren't read before generation, so that you should always verify before you push if your MPS build scripts are up-to-date. For every dependency added to a module or a changed reexport flag, this intention has to be triggered by hand.

Problem: the current implementation of the build-language isn't extensible, because it always looks into the original model. The main part of the ant file generation is the dependency analysis (for the modules), and for this it needs to access the original model for some technical reasons. These limit you to languages which are provided by MPS. You can't use your own patterns, for example, you can't write an extension which picks all modules from a folder, generates an intellij-plugin out of them and stores the result in a zip file and generates all the code required for the command-line build. But this isn't possible because of the build-language-inherent dependency analysis mechanism.

The code generator of the build language has to verify for dependencies like jars in stub-models, jars at runtime etc., but the error messages aren't well-designed. For example, you have a jar file xyz.jar entered as java runtime dependency of the language abc. Instead of something like “you have to enter xyz.jar to your build layout plugin-123, cause language abc specifies it as java runtime dependency” you get for example "jar stub library should be extracted into build-script: `${my.project}/very/long/path/lib/xyz.jar`"‚ which isn't helpful.

Many problems the generator finds could also be found by the model checker, but the checks are done at generation time and implemented as "gencontext.show error" in the generator.

## Generated ant scripts (*build.xml*)

The mps build scripts are generated to ant scripts, which then generate the modules.
The ant script starts a headless-MPS with all required dependencies, puts jars on the classpath and does some further magic.
Tasks can be passed to the ant script like the “generate” task.

Modules have several models with dependencies. For example, for a language, the behavior uses the structure aspect; the type-system uses the behavior aspect etc. which can result in complex dependencies between these models. These have to be considered when the models are generated and compiled. The order is derived by the code generator of the build language and results in an execution plan where the “compile units” are grouped in “chunks”. Chunks with bootstrap-dependencies are explicitly marked, which means all modules in the chunk have to be compiled at the same time.

MPS consists of hundreds of jar files which must be on the classpath for the code generation and compilation, which leads to giant ant scripts (with some thousand lines). Even simple mps build scripts, which only use BaseLanguage result into big ant scripts.

The build layout in the MPS build script defines how your modules are packaged e.g. as zip containing multiple plugins, as simple plugin-folder, as lib-folder with a flat list of jars, etc.

The ant script needs to know where the local MPS is installed and where your modules and dependencies are located. This is usually done using folder macros in the mps build script which are generated as "properties" in the Ant script. This makes the build independent of your local machine and the ant script can be executed on the CI or any other machine.

The Headless-MPS, which is started by the ant script, behaves sometimes differently compared to an IDE-MPS. For example, circular dependencies can be resolved in the IDE by just applying *Make Project* multiple times, which doesn't work on the command line and thus also fails on the CI.
Dependencies which are visible in the IDE aren't always visible in the MPS build script/ ant script and can result in failing builds. MPS holds one big global repository, where all modules are loaded into the modules pool (project libraries, global libraries, …). In the IDE everything's always visible and wrong dependencies can be resolved but on the command line the build can fail, because the referenced model isn't loaded. The build language generator doesn't check the nodes for e.g. references out of scope (like the model-checker does), it only looks into meta-data/model-properties and relies on that information.

## Shell scripts

Some scripts like the start script of MPS are developed using Windows Batch Scripting on Windows and Bash Shell Scripting on Mac/Linux. To learn more about
those two scripting language, consult the following list:

- [Windows Batch Scripting | wikibooks.org](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
- [Using batch files | learn.microsoft.com](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490869(v=technet.10))
- [Bash Shell Scripting | wikibooks.org](https://en.wikibooks.org/wiki/Bash_Shell_Scripting)
- [Bash Reference Manual | gnu.org](https://www.gnu.org/software/bash/manual/bash.html)
