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

    [Known bug](https://youtrack.jetbrains.com/issue/MPS-33541). Run `git clean -xdf` and rebuild everything.

!!! question "How can I find out the supported MPS version of a project?"

    Search the readme for this information. If the project uses a gradle script, you can most likely find this information
    in the file build.gradle (for example in [this line](https://github.com/JetBrains/MPS-extensions/blob/3e137bcf269f8a2ac79589d4e4938f78900cf294/build.gradle#L81)
    in mps-extension). For older MPS projects there is no waying of finding out the version.

!!! question "What do I need to put into the .gitignore file?"

    Have a look at this [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore) file.

!!! warning "Tests fail with a message, that a filename or extension is too long (Windows)."

    There is a path that is too long for Windows in the build script. 
    Choose the option 'compressArgs' in 'test modules' node to fix the issue.
    More info can be found in the [ticket](https://youtrack.jetbrains.com/issue/MPS-24137).

!!! warning "Command line generation fails on Windows if using non-ASCII characters"
    
    This is a known bug ([ticket](https://youtrack.jetbrains.com/issue/MPS-34059)). It happens because the generation is
    started with a Window encoding. Set the following environment variable before starting the build:
    `set JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF8"`

!!! question "How can I fetch dependencies using Gradle?"
    Specific Languages Blog &mdash; [Fetching dependencies with Gradle](https://specificlanguages.com/posts/2022-01/31-fetching-dependencies-with-gradle/){target=_blank}

!!! question "Why can I successfully build models with missing imports?"
    Specific Languages Blog &mdash; [Why can I successfully build models with missing imports?](https://specificlanguages.com/posts/2022-02/11-successfully-build-models-with-errors/){target=_blank}

!!! warning "X errors before generation"
    Specific Languages Blog &mdash; [3358 errors before generation](https://specificlanguages.com/posts/2022-02/17-errors-before-generation/){target=_blank}

