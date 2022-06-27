Troubleshooting Guide (aka "The Battle Plan")

this is a non-exhaustive list of common problems with MPS and itemis platform projects. We have tried to provide step-by-step guides that exclude the most common causes as well as pointers where further help can be found. When there is a guide for your problem, please exhaust it before asking people for help.

## MPS

### MPS is sluggish and doesn't work properly

Edit the file mps64.vmoptions (or mps.vmoptions?) and give it sufficient heap space: `-Xmx4g`

### MPS behaves strange (for instance: claims that a method is missing although it exists)

1. **Tools > Reload All Classes**
1. **File > Invalidate Caches**, then Restart
1. **File > Invalidate Caches**, Shutdown MPS, In the repository in question: run `git clean -fxd -e build.properties -e gradle.properties`, Rebuild with Gradle (`./gradlew`), Start MPS again

### MPS cannot find languages / solutions (for instance: "language X is not deployed" errors)

1. **File > Invalidate Caches**, Shutdown MPS
1. in both OS and CORE: run `./gradlew setup --refresh-dependencies`
1. start MPS again

## MPS wouldn't let me write what I need to write / I cannot see an Intention that should be there

1. check: is the concept / intention visible in the model? (open a context menu where baselanguage code is allowed and search for classes / concepts from the same language)
- no -> Use **Edit > Add Language Import** to import the language containing the concept / the intention.
2. check: Concept: is the type of the concept suitable for the place where you want to create an instance? Does it implement the right interface?
3. check: Intention: is the `isApplicable()`-method called? (add a `System.err.println()` to the method and what MPS's stdout)
* no -> the intention is most probably not visible in the model -> see above
* yes -> make sure the method returns true
4. Concept: does a constraint on one of the ancestor-nodes prohibit you from creating it?

## MPS-Build fails

1. does the MPS Model-Checker report problems?
    * yes -> fix identified problems
2. does the build log report intelligible problems?
    * yes -> fix identified problems
3. does it build in Gradle?
    * no -> see "Gradle-Build fails"

# Gradle

## Gradle-Build fails

1. did you call `git clean -fxd -e build.properties` before `./gradlew`?
* no -> do it, retry

2. did you call `./gradlew` with `--refresh-dependencies`?
* no -> retry with `--refresh-dependencies`

3. Does the error message start with "dependencies should be extracted into build script"?
* In MPS, apply the model-checker to the "_build"-package. Many problems can be fixed by applying the intention "Reload modules from disk".
* rebuild the "_build"-package
* retry the Gradle-Build.

4. do you have local changes?
   yes -> Use `git stash` to stash them away, retry
* when the build works without your changes, then your changes are the problem. Redo them one-by-one to find the one that causes the problem.

5. does it work on CI?
* yes -> is the CI build recent?
    * no -> retrigger via a Whitespace-only commit
    * yes -> search for differences between your local Gradle-Build and the CI-Build (versions)
* no -> is it the same error message?
    * no -> search for differences between your local Gradle-Build and the CI-Build (versions)
* is the master-Build green on CI?
  no -> find out who broke it and make him fix it. After it is fixed, continue
* is the master-Build recent?
    * no -> re-trigger it via a Whitespace-only commit
    * yes -> merge master into your branch, retry
6. If nothing helped: try re-cloning your repo
7. -- out of options. Get yourself help --


# CI

## Tests are failing on CI, but run green in my local MPS

### What about the local Gradle Build?
The tests can be executed locally with `./gradlew ant-build-tests -Dmps.home=/Applications/MPS\ 2017.3.3.app/Contents/` afterwards the test results can be found in `build/iets3-allScripts`.

* runs green -> there is a discrepancy between the CI and your local Gradle Build
    - make sure you are on the same branch / commit as the CI
* shows the same test failures as the CI -> there is a discrepancy between the MPS Build and the Gradle Build
    - rebuild the build scripts in MPS
    - try running the tests in a seperate Process (edit the run configuration in MPS)
    - make sure your MPS uses the same (versions of the) dependencies as the gradle build
        - this can be achieved in 2 different ways:
            - run `./gradlew dependencies` to see which versions of which dependency gradle uses and
              make sure the OS and Mbeddr repos are checked out on the right branches / commits
            - remove the file `projectlibraries.overrides.properties` from your CORE and OS repo and execute
              `./gradlew setup` in both. This configures MPS to directy use the Java class files from the Gradle Artifacts instead of the checked-out repos.
