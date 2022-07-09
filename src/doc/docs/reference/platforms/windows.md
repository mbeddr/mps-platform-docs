# Windows

## Windows and none ASCII chars

Compilation from the command line might fail due to none ASCII chars when run on Windows and possibly also on Linux. The error message will look something like this:

```
[generate] NewLanguage\behavior\rtzj__BehaviorDescriptor.java : Invalid character constant (line: 27) 
```

If this happens the environment variable `JAVA_TOOL_OPTIONS` should be set to `"-Dfile.encoding=UTF8"`.

The issue is tracked upstream at JetBrains as MPS-23526.

!!! warning "Tests fail with a message, that a filename or extension is too long (Windows)."

    There is a path that is too long for Windows in the build script. 
    Choose the option 'compressArgs' in 'test modules' node to fix the issue.
    More info can be found in MPS-24137.