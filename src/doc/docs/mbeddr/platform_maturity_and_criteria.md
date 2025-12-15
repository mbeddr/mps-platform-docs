!!! warning "This document describes how the mbeddr team used Git for contributing changes in the past. The guide was written some years ago, so it might no longer reflect the workflow and guidelines of newer committers."

# Maturity

We distinguish the following levels of maturity in the mbeddr Platform:

## Stable
* Meets the Criteria below
* Will be maintained
* Will stay stable
    * No incompatible changes
    * Or, (preferably automated) migration path
* Can be expected to "just work"

## Staging
* Not yet as mature as Stable
* Aims to get there
* Won't stay in Staging forever -- either develops to be Stable or drops out
* Maximum time in Staging: 3 months

## Rest

* Everything required in the platform for historic reasons, but not meeting the criteria above
* No guarantees whatsoever (might be deleted, reworked, changed, ... in the future)

# Transitional Criteria

To move from "big collection of interesting parts of unknown maturity" to Future Criteria, we introduce Transitional Criteria. Stable Platform elements should strive to meet Future Criteria, but are sufficient to meet Transitional Criteria. Platform elements not meeting Future Criteria after this date will be considered Staging.

## Code quality

* No log or other unintentional output
* All dependencies met, no unnecessary dependencies
* Only unavoidable (i. e. false positive) errors/warnings / infos in model check on all models (including languages, solutions)
* No code duplication
* No exceptions thrown / visible at normal operations

## Build / Deployment

* Code, tests, documentation, and examples are added to the appropriate automated builds
* Works when used from or available in
    * source model
    * project library
    * IDEA plugin

## Examples

* Examples available for common uses

## Documentation

* Pointer to examples for self-explanatory cases
* At least a brief description for complex cases

## Organization

* Used in at least two Consultings, Projects, Products
* Adheres to the [Development Guide](development_guide.md)

# Future Criteria

## Code quality
* No log or other unintentional output
* All dependencies met, no unnecessary dependencies
* Only unavoidable (i. e. false positive) errors/warnings/infos in model check (including languages, solutions, tests, documentation, examples, generators)
* No code duplication
* No exceptions thrown / visible at normal operations

## Build/Deployment

* Code, tests, documentation, and examples are added to the appropriate automated builds
* Works when used from or available in
    * source model
    * project library
    * application library
    * IDEA plugin
    * IDEA plugin with stripped models

## Tests

* If all tests are green, we need to be sure it works
* Maybe exception for UI-heavy stuff (hard to test)

## Documentation

* All user-facing features and options are documented, preferably in mbeddr doc language, and integrated withthe  documentation aspect
* A pointer to examples is sufficient for self-explanatory cases

## Examples

* Examples available for all user-facing features and options

## Organization

* At least two people know and understand the implementation
* Used in at least two Consultings, Projects, Products
* Adheres to the [Development Guide](development_guide.md)