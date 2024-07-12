---
comments: true
---

!!! success "Code"

    === "Basic"

        - [ ] Code duplication avoidance: a new interface/method was created when code occurred more than twice
        - [ ] For Container-like structures: Is a uniqueness check necessary? How unique? (block, global)
        - [ ] Unsupported inputs can't be entered.
        - [ ] Constraints are used to restrict input on the model validation level.
        - [ ] Scopes are restricted to the bare minimum.

    === "Advanced"

        - [ ] The right data structures were used for the implementation.
        - [ ] Model access through locks is handled correctly.

    === "Expert"

        - [ ] BaseConcept is not referenced and the referenced interface/concept is as generic as possible.
        - [ ] Concurrent code was implemented the right way.
        - [ ] New code reused MPS code or features from the IntelliJ platform.

!!! success "Sub-projects/other teams"

    === "Basic"

        - [ ] Changes were made in all build scripts.
        - [ ] Migrations were run in all sub-projects.
        - [ ] Usages for code were checked in all sub-projects.
        - [ ] Other teams are okay with the changes.

    === "Advanced"

        - [ ] All sub-projects use the same version of a language or plugin.

    === "Expert"

        - [ ] Big projects are separated into different code owners (e.g. per module).
