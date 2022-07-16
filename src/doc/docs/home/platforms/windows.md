# Windows

!!! error "Compilation from the command line might fail due to none ASCII chars."

    The error message looks something like this:

    ```
    [generate] NewLanguage\behavior\rtzj__BehaviorDescriptor.java : Invalid character constant (line: 27) 
    ```
    If this happens, set the environment variable `JAVA_TOOL_OPTIONS` to `"-Dfile.encoding=UTF8"` 
    
    More info can be found in MPS-23526.

!!! warning "Tests are failing with a message, that a filename or extension is too long (Windows)."

    The error message looks loike this: `#!text Caused by: java.io.IOException: CreateProcess error=206, The filename or extension is too long?`
    There is a path that is too long for Windows in the build script. 
    Choose the option 'compressArgs' in 'test modules' node to fix the issue.
    More info can be found in MPS-24137.