# Troubleshooting guide

This is a non-exhaustive list of common problems with MPS and platform projects. It is assumed that Gradle is used for building the project.

## MPS

!!! warning "The IDE is sluggish and doesn't work the way it should."

    Edit the file mps(64).vmoptions and give it sufficient heap space: `-Xmx8g`

!!! warning "MPS behaves strange."

    > For instance: claims that a method is missing, although it exists.*

    1. Check if you have mixed dependencies for different MPS versions or are opening the project with the wrong MPS version.
    2. *Tools* --> *Reload All Classes*.
    3. *File* --> *Invalidate Caches*, then restart.
    4. *File* --> *Invalidate Caches*, shutdown MPS; in the repository in question: run `git clean -fxd -e build.properties -e gradle.properties`, rebuild with Gradle (`./gradlew`), restart MPS.

!!! error "MPS cannot find languages / solutions."

    > For instance: "language X is not deployed" errors.

    1. *File* --> *Invalidate Caches*, shutdown MPS.
    2. Run `./gradlew setup --refresh-dependencies`.
    3. Start MPS again.
 
!!! warning "The IDE doesn't let you enter some text / an intention isn't visible that should be there."

    1. Check: was the intention disabled by the user by accident?

    ![example:disable an intention](disable_intention_example.png)

    In this case, the intention can be enabled through preferences --> MPS intentions and manually searching for the disabled intention:

    ![preferences menu:MPS intentions](mps_intentions_preferences.png)

    2. Check: is the concept / intention visible in the model? (open a context menu where baselanguage code is allowed and search for classes / concepts from the same language)
        - :octicons-x-circle-16: --> Use *Edit* --> *Add Language Import* to import the language containing the concept / the intention.
    3. Check the concept: is the type of the concept suitable for the place where you want to create an instance? Does it implement the right interface?
    4. Check the intention: is the `#!java isApplicable()`-method called? (add a `#!java System.err.println()` to the method and check what MPS outputs)
        - :octicons-x-circle-16: --> The intention is most probably not visible in the model --> see above
        - :octicons-check-circle-16: --> Make sure the method returns true
    5. Concept: does a constraint on one of the ancestor-nodes prohibit you from creating it?

!!! error "MPS build fails."

    1. Does the MPS Model-Checker report problems? :octicons-check-circle-16: --> Fix identified problems.
    2. Does the build log report intelligible problems? :octicons-check-circle-16: --> Fix identified problems.
    3. Does it build in Gradle? :octicons-x-circle-16: --> See: [Gradle-Build fails](#gradle).

## Gradle

!!! error "Gradle build fails."

    1. Did you call `git clean -fxd -e build.properties` before `./gradlew`? :octicons-x-circle-16: --> Do it, retry.
    2. Did you call `./gradlew` with `--refresh-dependencies`? :octicons-x-circle-16: --> Retry with `--refresh-dependencies`.
    3. Does the error message start with "dependencies should be extracted into build script"?
        - In MPS, apply the model-checker to the "_build"-package. Many problems can be fixed by applying the intention "Reload modules from disk".
        - Rebuild the "_build"-package.
        - Retry the gradle build.
    4. Do you have local changes?
        - :octicons-check-circle-16: --> Use `git stash` to stash them away, retry.
        - When the build works without your changes, then your changes are the problem. Redo them one-by-one to find the one that causes the problem.
    5. Does it work on CI?
        - :octicons-check-circle-16: --> Is the CI build recent?
            - :octicons-x-circle-16: --> Retrigger via a Whitespace-only commit.
            - :octicons-check-circle-16: --> Search for differences between your local Gradle build and the CI build (versions).
        - :octicons-x-circle-16: --> Is it the same error message?
            - :octicons-x-circle-16: --> Search for differences between your local Gradle build and the CI build (versions).
        - is the master build green on CI?
            - :octicons-x-circle-16: --> Find out who broke it and make him fix it. After it is fixed, continue.
        - is the master build recent?
            - :octicons-x-circle-16: --> Retrigger it via a whitespace-only commit.
            - :octicons-check-circle-16: --> Merge master into your branch, retry.
    6. If nothing helped: try cloning your repo again.
    7. Out of options. Ask somebody for help.

## CI

!!! warning "Tests are failing on CI, but run green in the local MPS installation."

    What about the local Gradle build?
    The tests can be executed locally with: `./gradlew ant-build-tests -Dmps.home=PATH_TO_YOU_MPS_INSTALLTION`. Afterwards the test results can be found in `build/iets3-allScripts` ({{ iets3() }}).

    - It runs (green) -> there is a discrepancy between the CI and your local Gradle build.
        - Make sure you are on the same branch/commit as the CI,
    - It shows the same test failures as the CI --> there is a discrepancy between the MPS Build and the Gradle Build
        - Rebuild the build scripts in MPS.
        - Try running the tests in a seperate Ppocess (edit the run configuration in MPS).
        - Make sure your MPS uses the same (versions of the) dependencies as the gradle build.
            - This can be achieved in 2 different ways:
                - Run `./gradlew dependencies` to see which versions of which dependency gradle uses and
              make sure the OS and Mbeddr repos are checked out on the right branches / commits ({{ iets3() }}).
                - Remove the file *projectlibraries.overrides.properties* from your repo and execute
              `./gradlew setup` in both. This configures MPS to directy use the Java class files from the Gradle artifacts instead of the checked out repos.

## Explanations

- git clean -xdf
    - removes untracked files from the working tree (= also files generated by MPS)
    - *x*: remove only files ignored by Git. This may be useful to rebuild everything from scratch, but keep manually created files.
    - *d*: remove untracked directories in addition to untracked files.
    - *f*: If the Git configuration variable clean.requireForce is not set to false, git clean will refuse to delete files or directories unless given -f, -n or
    - *e*: Use the given exclude pattern in addition to the standard ignore rules.