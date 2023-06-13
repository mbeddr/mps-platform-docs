!!! question "What's the relationship between *mbeddr.\platform*, *iets3.opensource* and *mps-extensions*?"

    Older versions of {{ mbeddr_platform() }} and {{ iets3() }} contain a dependency to {{ mps_extensions() }} and they repack it. The newest version of
    {{ mbeddr_platform() }} doesn't repack it. {{ mps_extensions() }} contains many extensions that were part of {{ mbeddr_platform() }}.

!!! question "Why are some of these languages not migrated to MPS-extensions?"

    Some languages have dependencies that would also need to be migrated to {{ mps_extensions() }}. Other languages
    are deemed as not stable or important enough to be migrated.