---
tags:
- reference
- troubleshooting
---

## Reporting bugs

Before reporting bugs, you might want to read: [How to Report Bugs Effectively](https://www.chiark.greenend.org.uk/~sgtatham/bugs.html)
This page should then help you find existing issues for MPS and the MPS platforms and help you decide which issue tracker an
issue belongs to. Most of the time, the package name tells you the correct project. Nearly all editor-related languages
(diagrams, tables, tree notations...) are located in {{ mps_extensions() }}. The following list gives a rough overview:

- {{ mps() }}
    - ^^[jetbrains.*](core_languages.md)^^
    - ^^MPS.*^^
    - ^^collections.runtime.*^^
    - ^^collections_trove.runtime.*^^
    - ^^closures.runtime.*^^
- {{ mbeddr_platform() }}
    - ^^com.mbeddr.core.*^^
    - ^^com.mbeddr.mpsutil.*^^
    - ^^com.mbeddr.doc.*^^
- {{ mbeddr() }}
    - ^^com.mbeddr.core.*^^
- {{ iets3() }}
    - org.iets3.*
- {{ mps_extensions() }}
    - ^^com.mbeddr.*^^
    - ^^de.itemis.*^^
    - ^^de.slisson.*^^
    - ^^de.q60.*^^
    - ^^com.dslfoundry.*^^ ([DSLFoundry](https://github.com/DSLFoundry))
    - ^^org.modelix.model*^^ (if it is related to the API, otherwise go to [modelix](https://github.com/modelix?type=source) itself)
- JetBrains Runtime Environment or [OpenJDK](https://github.com/openjdk/jdk)
    - ^^com.sun.*^^
    - ^^java.*^^
    - ^^javax.*^^
    - ^^jdk.*^^
    - ^^org.w3c.*^^
    - ^^org.xml.sax.*^^

## MPS (YouTrack)

This is the public issue tracker of [JetBrains MPS](https://github.com/JetBrains/MPS) itself. Consult the [documentation](https://www.jetbrains.com/help/mps/getting-started.html#report-bug) for instructions on how to report an issue.

- [open critical/show-stopper issues](https://youtrack.jetbrains.com/issues/MPS?q=%23Critical%20%23Show-stopper%20%20%23Open%20)
- [open critical/major issues](https://youtrack.jetbrains.com/issues/MPS?q=Priority:%20Major%20Priority:%20Critical%20%23Open%20)
- [open issues sorted by votes](https://youtrack.jetbrains.com/issues/MPS?q=sort%20by:%20votes%20desc%20%23Open%20)
- [open issues sorted by comments](https://youtrack.jetbrains.com/issues/MPS?q=sort%20by:%20comments%20%20desc%20%23Open%20)
- [search query reference | jetbrains.com](https://www.jetbrains.com/help/youtrack/server/Search-and-Command-Attributes.html)
- [MPS X Release Notes (example)](https://youtrack.jetbrains.com/releaseNotes/MPS?q=%23Resolved%20Fix%20versions:%202021.1.4&title=MPS%202021.1.4%20Release%20Notes&_ga=2.50080358.1125194593.1665382985-2058359210.1628057624&_gl=1*19vge7b*_ga*MjA1ODM1OTIxMC4xNjI4MDU3NjI0*_ga_9J976DJZ68*MTY2NTM4NTY0My4zMzMuMS4xNjY1Mzg1ODE5LjQxLjAuMA..)
- [tickets which encourage contributions](https://youtrack.jetbrains.com/issues/MPS?q=%23mps-contribution%20%23Open%20)

## MPS-extensions

If you are unsure which languages are part of this platform, please consult the [full extension list](https://jetbrains.github.io/MPS-extensions/extensions/all/) page.

- [open issues](https://github.com/JetBrains/MPS-extensions/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
- [reference: search issues and pull requests | github.com](https://docs.github.com/en/search-github/searching-on-github/searching-issues-and-pull-requests)
- [diagram:meta issue](https://github.com/JetBrains/MPS-extensions/issues/120)

## Mbeddr

This is the issue tracker related to [mbeddr.core](https://github.com/mbeddr/mbeddr.core). You can find there issues related
to the [mbeddr platform](http://mbeddr.com/platform.html) which is used, for example, by IETS3.OS. Please note that nearly
all editor-related languages were moved to {{ mps_extensions() }}, so please submit those tickets in the corresponding issue tracker.


- [open issues](https://github.com/mbeddr/mbeddr.core/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
- [open platform issues](https://github.com/mbeddr/mbeddr.core/issues?q=is%3Aopen+label%3Aplatform+sort%3Aupdated-desc)

## IETS3.OS

This issue tracker is most of the time needed for tickets related to [KernelF](https://voelter.de/data/books/kernelf-designEvoUse.pdf).

- [open issue](https://github.com/IETS3/iets3.opensource/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)

## IntelliJ platform

This issue tracker contains issues for IntelliJ IDEA/[the IntelliJ platform SDK](https://plugins.jetbrains.com/docs/intellij/welcome.html) which MPS is based on. The used IntelliJ platform can be found on the 
[MPS download page](https://www.jetbrains.com/de-de/mps/download/) or through MPS --> About MPS. The build number consists
of three parts. Example: `MPS 2021.3.1 Build: 213.7172.958`. *213* stands for 2021.3, and the IntelliJ platform version is 213.7172 which
can be checked by visiting the [IntelliJ IDEA download page](https://www.jetbrains.com/de-de/idea/download/other.html).
If an MPS issue is related to the platform, it is forwarded by the MPS team to the platform team.

- [open IntelliJ IDEA issues](https://youtrack.jetbrains.com/issues/IDEA?q=%23Open%20)

## JetBrains Runtime

> JetBrains Runtime is a fork of OpenJDK available for Windows, Mac OS X, and Linux. It includes several enhancements in font rendering, HiDPI support, windowing/focus subsystems, performance improvements and general bugfixes.

!!!info "It's highly unlikely that you have to submit an issue to this tracker yourself."

This issue tracker is relevant for [JCEF](https://plugins.jetbrains.com/docs/intellij/jcef.html), UI-related glitches and
complete Java crashes as MPS is using the JetBrains Runtime instead of the normal JRE. The JetBrains runtime is installed
in the *jbr* folder of the MPS installation. The corresponding JBR version for an IntelliJ platform release can be found
in the [JetBrainsRuntime readme](https://github.com/JetBrains/JetBrainsRuntime#releases-based-on-jdk-11).

- [open issues](https://youtrack.jetbrains.com/issues/JBR?q=%23Open%20)
- [open JCEF issues](https://youtrack.jetbrains.com/issues/JBR?q=%23Open%20%23jcef%20)

## OpenJDK

!!!info "It's highly unlikely that you have to submit an issue to this tracker yourself."

This issue tracker is only listed for reference purposes. If there's an OpenJDK issue that affects JetBrains products, it
will likely be fixed in the JetBrains Runtime.

- [open issues](https://bugs.openjdk.org/projects/JDK/issues/)