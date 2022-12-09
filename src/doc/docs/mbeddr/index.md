---
tags:
- mbeddr
---

# General

!!! question "Why are there two context action tools?"

    The context actions tool from ^^com.mbeddr.mpsutil.contextactions^^ was developed first. Later, JetBrains developed their own
    tool that works the same as the one from mpsutil. Nowadays both tool windows coexist.

!!! warning "I am using some mbeddr languages in my project but some of them aren't deployed."

    There might be some additional plugins that need to be installed:
    
    - ^^de.itemis.mps.nativelibs.loader^^
    - ^^com.mbeddr.mpsutil.actionsfilter^^
    - ^^mbeddr.spawner^^

    They can be installed by calling `gradlew.bat install "-PMPS_Installation=<path to MPS>"`
    from the root folder of the mbeddr.core repository when building from source. The actionsfilter plugin
    is necessary for the actionsfilter language.


