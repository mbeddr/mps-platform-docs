!!! warning "Dependencies on a module not visible from current build project."
    Check [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004407199/comments/360000677619).

!!! warning "Cannot find extended language in dependencies."
    Check [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/360004407199/comments/360000679499).

!!! info "I want to have a gradle build for my MPS project."

    There is a gist for a [minimal build](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75). There is a [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin). For more complex projects look at build scripts of big projects such as [MPS-extensions](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle).

!!! warning "The gradle build fails with exception: Incremental build fails during generation on no changed models"

    [Known bug](https://youtrack.jetbrains.com/issue/MPS-33541). Run `git clean -xdf` and rebuild everything.

!!! question "How can I find out the supported MPS version of a project?"

    Search the readme for this information. If the project uses a gradle script, you can most likely find this information
    in the file build.gradle (for example in [this line](https://github.com/JetBrains/MPS-extensions/blob/3e137bcf269f8a2ac79589d4e4938f78900cf294/build.gradle#L81)
    in mps-extension). For older MPS projects there is no waying of finding out the version.

!!! question "What do I need to put into the .gitignored file?"

    Have a look at this [.gitignore](https://github.com/JetBrains/MPS-extensions/blob/master/.gitignore) file.