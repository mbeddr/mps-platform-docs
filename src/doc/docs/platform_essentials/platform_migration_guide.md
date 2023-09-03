This guide walks you through migrating all MPS platforms starting from uploading the new JBR and ending at migrating {{ iets3() }}.
*MPS_VERSION* stands for the MPS version such as 2022.3. Before starting the migration process, read [Migration Guide | MPS Documentation](https://www.jetbrains.com/help/mps/migration-guide.html) first. Before starting a migration for a platform, make sure that
all commits have landed on master by merging the maintenance branches into each other starting from the oldest version.
The last maintenance branch should then be merged into master, so that master has all the changes and can be used as the base
for the new branch (cascading merge, [example](https://github.com/JetBrains/MPS-extensions/pull/656)).

## [build.publish.jdk](https://github.com/mbeddr/build.publish.jdk)

This repository is responsible for publishing the [JetBrains Runtime Environment](https://github.com/JetBrains/JetBrainsRuntime) to GitHub
and the Nexus repository. It is needed by the [download-jbr task of the mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin/tree/v1.x#download-jetbrains-runtime).

- [ ] Create a new branch mps/*MPS_VERSION* and update the file [gradle.properties](https://github.com/mbeddr/build.publish.jdk/blob/master/gradle.properties). To find the new version, open MPS, go to *About MPS*, and read the Runtime version.
 On a Mac, you can also open the file `jbr/Contents/Info.plist` in the MPS installation.
- [ ] Make sure that the published flavor still exists for the JBR version. You can find the newest JBR version for the corresponding IntelliJ platform [here](https://github.com/JetBrains/JetBrainsRuntime#releases-based-on-jdk-17) ([example for JBR 17](https://github.com/JetBrains/JetBrainsRuntime/releases/tag/jbr-release-17.0.6b653.34)).
- [ ] Create a PR ([example](https://github.com/mbeddr/build.publish.jdk/pull/10)) and merge it into master. If you update a maintenance MPS version, use the existing branch as the target branch.
- [ ] If the *downloadJBR* task from the [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin/pull/139) doesn't work anymore, for example due to a change in the structure of the JBR or
a different naming convention, create a PR for the [v1.x](https://github.com/mbeddr/mps-gradle-plugin/tree/v1.x) branch in the plugin
  ([example PR](https://github.com/mbeddr/mps-gradle-plugin/pull/139)).
- [ ] If it doesn't exist: create a branch for the old master branch, named mps/*MPS_VERSION*.
- [ ] If everything worked, you should find the artifact on the Nexus server ([example](https://artifacts.itemis.cloud/#browse/browse:maven-mps:com%2Fjetbrains%2Fjdk%2Fjbr%2F17.0.7-b1000.6)).

## [build.publish.mps](https://github.com/mbeddr/build.publish.mps)

This repository is responsible for publishing MPS to GitHub and the Nexus repository. It is necessary to download MPS in the build script ([example](https://github.com/JetBrains/MPS-extensions/blob/5d96c3e69192f8902cf9aa7d846d05ccfb65253d/build.gradle#L139)) which can then be set as the home directly for the Ant build script ([example](https://github.com/JetBrains/MPS-extensions/blob/5d96c3e69192f8902cf9aa7d846d05ccfb65253d/build.gradle#L206)).

- [ ] Create a new branch mps/*MPS_VERSION* and update *ext.mpsMajor* and *ext.mpsBuild* to *MPS_VERSION* in [build.gradle](https://github.com/mbeddr/build.publish.mps/blob/master/build.gradle).
- [ ] Check that all the JARs that are published still exist and were not removed or renamed. Change the paths accordingly and update the README.
  - [ ] Optional: Add this new information to the MPS Platform Docs in [Reference->Included Libraries](http://mbeddr.com/mps-platform-docs/reference/included_libraries/).
- [ ] Create a PR ([example](https://github.com/mbeddr/build.publish.mps/pull/7)) and merge it into master. If you update a maintenance MPS version, use the existing branch as the target branch ([example](https://github.com/mbeddr/build.publish.mps/pull/9)).
- [ ] If it doesn't exist: create a branch for the old master branch, named mps/MPS_VERSION.
- [ ] If everything worked, you should find the artifact on the Nexus server ([example](https://artifacts.itemis.cloud/#browse/browse:maven-mps:com%2Fjetbrains%2Fmps%2F2022.3)).

## [MPS-Extensions](https://github.com/JetBrains/MPS-extensions)

- [ ] Check if there is already an existing branch mps/*MPS_VERSION* to start with.
- [ ] Update *jbrVersion* and *ext.mpsMajor* in [build.gradle](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle)
- [ ] Follow the migration guide for {{ iets3() }} unless not applicable.
- [ ] Update the badge in [README.md](https://github.com/JetBrains/MPS-extensions/blob/master/README.md) to show the newly supported MPS version.
- [ ] Update the current supported versions in the documentation.
- [ ] Check all sandboxes and actions in the project manually to ensure that no errors are thrown.
- [ ] Check that no (new) error messages appear in the [log file](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#logs-directory). If the error/warning is fixable has
 to be decided on a case-by-case basis.
- [ ] Create a PR and merge it into master ([example](https://github.com/JetBrains/MPS-extensions/pull/622)). If you update a maintenance MPS version, use the existing branch as the target branch ([example](https://github.com/JetBrains/MPS-extensions/pull/648)).

## [mbeddr.core](https://github.com/mbeddr/mbeddr.core)

- [ ] Read the [Mbeddr section](http://mbeddr.com/mps-platform-docs/mbeddr/building_mbeddr_locally/), especially how to run the migrations in all projects using *BigProject*.
- [ ] Follow the MPS-Extensions Guide unless not applicable.
- [ ] Follow the migration guide for {{ iets3() }} unless not applicable.
- [ ] For the manual testing part, focus especially on the tools and actions.
- [ ] If it doesn't exist: create a branch for the old master branch, named maintenance/MPS_VERSION.

## [iets3.opensource](https://github.com/IETS3/iets3.opensource)

- [ ] When possible, merge open pull requests first.
- [ ] Create a new branch: feature/*MPS_VERSION* (e.g., feature/mps20212)
- [ ] Update *jbrVersion*, *major*, *minor*, *ext.mpsVersion*, *mbeddrVersion* in [build.gradle](https://github.com/IETS3/iets3.opensource/blob/master/build.gradle).
- [ ] Regenerate the *all scripts* build file (build-allScripts.xml) with a single commit, and regenerate the build model.
- [ ] Remove references to languages that don’t exist anymore, for example when a language was removed in a different platform.
- [ ] Execute migrations (*Migrations* → *Run Migration Assistant*).
- [ ] Update the README (currently supported version).
- [ ] Create a pull request ([example](https://github.com/IETS3/iets3.opensource/pull/674)) for master. If you update a maintenance MPS version, use the existing branch as the target branch ([example](https://github.com/IETS3/iets3.opensource/pull/706)).
- [ ] Fix tests that don't work. Remove the commit with the migration if necessary and run the migration again after the fixes.
- [ ] If it doesn't exist: create a branch for the old master branch, named maintenance/MPS_VERSION.
- [ ] Update the base branch of the pull requests that were not merged yet to the old master branch.

## Getting Help

This section gives some hints on how to find information and get help if you are getting stuck.

Things to read about the new MPS version:

- [What's New in MPS | MPS](https://www.jetbrains.com/mps/whatsnew/)
- [Known issues | YouTrack (e.g., MPS 2023.2)](https://youtrack.jetbrains.com/issues/MPS?q=Affected%20versions:%202023.2)

Things to read about the new IntelliJ platform version in case there is a change:

- [Incompatible Changes | IntelliJ Platform SDK](https://plugins.jetbrains.com/docs/intellij/api-changes-list.html)
- [Notable API changes | IntelliJ Platform SDK](https://plugins.jetbrains.com/docs/intellij/api-notable.html)
- [Internal API Migration | IntelliJ Platform SDK](https://plugins.jetbrains.com/docs/intellij/api-internal.html)

For getting other help, please ask [@apann](https://jetbrains-mps.slack.com/team/U02BYFW82LA) on Slack. He can send you to the
right people if necessary.

## Things to Test

Despite having automatic tests, there are still a lot of topics that should be manually tested:

- [ ] Can I run tests?
- [ ] Can I run tests in the same process?
- [ ] Do I see any suspicious fatal error messages in the bottom right corner?
- [ ] Do actions with dynamic texts (e.g., *Run* -> *Run KernelF tests*) still work?
- [ ] Do different graphical notations still work? (e.g., tables, vertical and horizontal lines)
- [ ] Do I see any changes in the editor of the collections test suite (many tests)?
- [ ] Does anything bad happen when I click *Tools* -> *Reload all classes*?
- [ ] Does anything bad happen when I restart MPS?

## Additional Tips

- [ ] To make sure that all resolve infos are up to date, execute *File* --> *Force Save All* before pushing. 
    - If you use the linters from [mps-qa](https://github.com/mbeddr/mps-qa/tree/master): there is a linter to check the resolve infos
- [ ] Run *git clean -dfx* if you run into any troubles and need to remove all files including the generated ones.
- [ ] When you update the dependencies in the build script and nothing happens, execute: `./gradlew setup --refresh-dependencies` or `gradle.bat setup --refresh-dependencies` on Windows.
- [ ] **Do not** disable languages/features because you can't fix the issue. Ask for help!
- [ ] The decision which MPS platforms are maintained are which are not is decided internally based on usage in projects. Please ask, if you have any questions.