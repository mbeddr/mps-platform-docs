---
tags:
- mbeddr
---

# General

The old homepage at [mbeddr.com](http://mbeddr.com/) and the [mbeddr user guide](http://mbeddr.com/userguide/UserGuideExport.html)
are still a good introduction to {{ mbeddr() }} itself. Most of the time, you will only be interested into the {{ mbeddr_platform() }},
the reusable parts of mbeddr that don't deal with C code. The platform comes with a dependency on {{ mps_extensions() }}.

!!! question "Why are there two context action tools?"

    The context actions tool from ^^com.mbeddr.mpsutil.contextactions^^ came first. Later, JetBrains developed a
    tool that works the same as the one from mpsutil. Nowadays, both tool windows coexist.

!!! warning "I am using some mbeddr languages in my project, but some aren't deployed."

    There might be some additional plugins that you need to install:

    - ^^com.mbeddr.mpsutil.actionsfilter^^
    - ^^mbeddr.spawner^^

    You can install them by calling `gradlew.bat install "-PMPS_Installation=<path to MPS>"`
    from the root folder of the mbeddr.core repository when building from source. The actions filter plugin
    is necessary for the actions filter language.


