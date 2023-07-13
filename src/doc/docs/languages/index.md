!!! question "What's the relationship between *mbeddr\.platform*, *iets3.opensource* and *mps-extensions*?"

    Older versions of the {{ mbeddr_platform() }} and {{ iets3() }} contain a dependency on {{ mps_extensions() }}, and they repack it. The newest version of
    the {{ mbeddr_platform() }} doesn't repack it. {{ mps_extensions() }} contains many extensions that were part of the {{ mbeddr_platform() }}.

!!! question "Why are some of these languages not migrated to {{ mps_extensions() }}?"

    Some languages have dependencies that we must migrate to {{ mps_extensions() }}. Other languages need to be more stable and vital so that we migrate them.