---
tags:
- mbeddr
---

# General

!!! question "Why are there two context action tools?"

    The context actions tool from ^^com.mbeddr.mpsutil.contextactions^^ came first. Later, JetBrains developed a
    tool that works the same as the one from mpsutil. Nowadays, both tool windows coexist.

!!! warning "I am using some mbeddr languages in my project, but some aren't deployed."

    There might be some additional plugins that you need to install:
    
    - ^^de.itemis.mps.nativelibs.loader^^
    - ^^com.mbeddr.mpsutil.actionsfilter^^
    - ^^mbeddr.spawner^^

    You can install them by calling `gradlew.bat install "-PMPS_Installation=<path to MPS>"`
    from the root folder of the mbeddr.core repository when building from source. The actions filter plugin
    is necessary for the actions filter language.


