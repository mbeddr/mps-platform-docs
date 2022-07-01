# Windows

## Windows and none ASCII chars

Compilation from the command line might fail due to none ASCII chars when run on Windows and possibly also on Linux. The error message will look something like this:

```
[generate] NewLanguage\behavior\rtzj__BehaviorDescriptor.java : Invalid character constant (line: 27) 
```

If this happens the environment variable `JAVA_TOOL_OPTIONS` should be set to `"-Dfile.encoding=UTF8"`.

The issue is tracked upstream at JetBrains as [MPS-23526](https://youtrack.jetbrains.com/issue/MPS-23526)