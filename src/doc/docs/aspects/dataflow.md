---
title: Dataflow aspect
tags:
- aspect
---

# Dataflow aspect

> A language's data flow aspect allows you to find unreachable statements, detect unused assignments, or check whether a variable might not be initialized before it's read.
> 
> — <cite>MPS documentation</cite>

- [official documentation](https://www.jetbrains.com/help/mps/data-flow.html)

!!! question "Where can you find good examples to understand how dataflow works?"

    Have a look at the data flow builders of ^^jetbrains.mps.baselanguage^^. You can also search for usages of
    {{ mps_url("@mps.DataFlowBuilderDeclaration") }} in general.
