# Design Patterns

## Language Hierarchy

- number of languages
    - many small languages are hard to maintain
    - big languages have long build-times in the IDE
- Try to avoid cycles between languages and modules
    - a language and its runtime may contain cycles
    - MPS is able to handle cycles to a specific amount
    - for the command-line-build you can set the bootstrap-property in the mps-buildscripts to true
    - cycles between language aspects
        - cycles in the structure aspect can be handled, but may influence the order in which generators are applied
        - cycles between other aspects within a language can be critical
        - model-cycles can be critical, try to avoid them in general

## Language Design

- [Inline Definitions](https://specificlanguages.com/articles/patterns/inline-definitions/){target=_blank} (Specific Languages Blog)
- [Escape hatch](https://specificlanguages.com/posts/2022-04/26-language-design-pattern-escape-hatch/){target=_blank} (Specific Languages Blog)
- [Externalized names](https://specificlanguages.com/posts/2022-04/08-language-design-pattern-externalized-names/){target=_blank} (Specific Languages Blog)
- [Empty lines](https://specificlanguages.com/posts/2022-04/07-language-design-pattern-empty-lines/){target=_blank} (Specific Languages Blog)
- [Externalized names (and other common attributes)](https://www.f1re.io/externalized-names){target=_blank} (F1RE Blog)
- [Multiple generators for same language](https://www.f1re.io/multi-generators){target=_blank} (F1RE Blog)