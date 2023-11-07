!!! question "What's the major difference between the mbeddr library and the platform library that are shared in the repository? What is the relation to {{ mps_extensions() }}? :beginner:"

    You have mbeddr itself in the repository, an integrated approach to embedded development where C programming, DSLs, domain-specific extensions to C, product line variability, requirements traceability, and model checking are supported directly. The reusable parts were grouped together as the mbeddr platform where most of the modules start with the prefix com.mbeddr.mpsutil ([documentation](http://mbeddr.com/mps-platform-docs/platform_essentials/mpsutils/))

    A few of the better ones (especially the editor-related extensions) were moved to MPS-Extensions quite a few years ago ([full extensions list](https://jetbrains.github.io/MPS-extensions/extensions/full_extensions_list/)). The mbeddr platform depends on MPS-Extensions. [This page](http://mbeddr.com/mps-platform-docs/reference/issue_trackers/) should help a bit to find the right platform based on the package name.

    Another notable subproject of the platform is com.mbeddr.doc together with com.mbeddr.doc.aspect for writing exportable documentation
    and showing documentation in MPS itself respectively. The (unfortunately) outdated documentation about the documentation language can be found [here](http://mbeddr.com/files/documentationdocumentation.pdf). Some Common interfaces and generic concepts of mbeddr like assessments or cycle detection are located in com.mbeddr.core.base ([documentation](http://mbeddr.com/mps-platform-docs/platform_essentials/common_concepts_and_interfaces/#base)) which is part of the platform as well.

!!! question "Why are some of these languages not migrated to {{ mps_extensions() }}?"

    Some languages have dependencies that we must migrate to {{ mps_extensions() }}. Other languages need to be more stable and vital so that we migrate them.