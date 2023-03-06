---
tags:
- windows
- mac
- linux
- bugs
- native
---

## Native crashes

Native crashes are crashes where MPS crashes internally (C/C++ code) and shows an error dialog. First search the following Youtrack projects:

- [MPS](https://youtrack.jetbrains.com/issues/MPS): MPS related crashes
- [IntelliJ IDEA](https://youtrack.jetbrains.com/issues/IDEA): IntelliJ (platform) related crashes
- [JetBrains Runtime](https://youtrack.jetbrains.com/issues/JBR): mostly UI and JCEF related issues

For crashes on macOS, have a look at [Identifying the Cause of Common Crashes | developer.apple.com](https://developer.apple.com/documentation/xcode/identifying-the-cause-of-common-crashes).

## Windows

!!! failure "Compilation from the command line might fail due to none ASCII chars."

    The error message looks something like this:

    ```
    [generate] NewLanguage\behavior\rtzj__BehaviorDescriptor.java : Invalid character constant (line: 27) 
    ```
    If this happens, set the environment variable *JAVA_TOOL_OPTIONS* to `#!properties -Dfile.encoding=UTF8` (MPS-23526).

!!! warning "Tests are failing with a message, that a filename or extension is too long (Windows)."

    The error message looks like this: `Caused by: java.io.IOException: CreateProcess error=206, The filename or extension is too long`.
    It can also look like this: `Process fork failed.`
    There is a path that is too long for Windows in the build script. 
    Choose the option *compressArgs* in *test modules* node to fix the issue (MPS-24137).

!!! failure "Cannot run MPS.bat on Windows 10/11."

    Create a link that runs the MPS.bat script and started this one instead.
    The Link target should look like this: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "& 'C:\Program Files\JetBrains\MPS_YOUR_VERSION\bin\mps.bat'"`

    {{ contribution_by('HeikoBecker') }}

## Mac

You might run into issues with newer macOS versions One of the is [notarizing macOS software before distribution](https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution) which is not supported by the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin/issues/99). There were also changes introduced with the M1 chips (new architecture: arm64). MPS already provides extra downloads for the new Macs (.dmg Apple Silicon). The commit can be found [here](https://github.com/JetBrains/MPS/commit/f2760552e00d2e58dc0d8f23747c68efdf86b3a2). If you want to provide your own RCP you might want to look at this commit. A separate version of JBR called jbr-osx-aarch64 might also be needed.

!!! question "How do I get my defined environment variables?"

    Execute `printenv` on a shell.

!!! warning "Using ^^com.mbeddr.mpsutil.datepicker^^ doesn't work when look and feel is set to macOS Light."

    Use the default light theme. There is no other workaround at the moment (MPS-3388,MBEDDR-2203).

!!! warning "Can't find TBItem with uid 'XY'."

    This is a MacBook Pro with touchbar related issue. No workaround at the moment (MPS-31728).

!!! question "What other active bugs are there?"

    - Standalone application: impossible to define application icon (MPS-32971)

## Linux

!!! failure "Autocompleting doesn't work with MPS + i3 (linux window manager)."

    No solution at the moment (MPS-30499).

!!! warning "Completion menu on wrong screen in multi monitor setup (linux+i3)."

    No solution at the moment (MPS-33689).

    