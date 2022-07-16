# General

!!! question "What languages are old/deprecated and should not be used anymore?"

    - `com.mbeddr.mpsutil.breadcrumb` (removed in a recent version of mbeddr)
    - `com.mbeddr.mpsutil.buildutil` (experimental)
    - `com.mbeddr.mpsutil.contextactions` (use MPS [context actions](https://www.jetbrains.com/help/mps/context-actions-tool.html) instead)
    - `com.mbeddr.mpsutil.multilingual` (unused/unmaintained)
    - `com.mbeddr.mpsutil.typesystem.trace` (use MPS [Type system trace](https://www.jetbrains.com/help/mps/typesystem-debugging.html#type-systemtrace) instead)
    - `com.mbeddr.mpsutil.test.util` (not needed)
    - `com.mbeddr.mpsutil.bldoc` (obsolete since MPS java doc refactoring)
    - `com.mbeddr.mpsutil.langstats` (not needed)
    - `com.mbeddr.mpsutil.javainterpreter` (can only interpret expression, was build as a demo for the interpret framework) 
    - `com.mbeddr.mpsutil.spreferences` (rarely used)
    - `com.mbeddr.mpsutil.uniquenames`(performance issues)
    - `com.mbeddr.mpsutil.iconchar` (replaced with MPS concept)
    - `com.mbeddr.mpsutil.propertydefault` (not used)
    - `com.mbeddr.mpsutil.testScope` (not used)
    - `com.mbeddr.mpsutil.varscope` (replaced with MPS scopes)

!!! question "Why are there two context action tools?"

    The context actions tool from `com.mbeddr.mpsutil.contextactions` was developed first. Later MPS developed their own
    tool that works the same as the one from mpsutil. Nowadays both tool windows coexist.

!!! question "Why are some of these language not migrated to mps-extensions?"

    Some language have dependencies that would also need to be migrated to [mps-extensions](https://jetbrains.github.io/MPS-extensions/). Other languages
    are deemed as not stable or important enough to be migrated.

!!! warning "I am using some mbeddr languages in my project but some of them aren't deployed."

    There might be some additional plugins that need to be installed:
    
    - de.itemis.mps.nativelibs.loader
    - com.mbeddr.mpsutil.actionsfilter
    - mbeddr.spawner

    They can be installed by calling `gradlew.bat install "-PMPS_Installation=<path to MPS>"`
    from the root folder of the mbeddr.core repository when building from source. The actionsfilter plugin
    is necessary for the actionsfilter language.


