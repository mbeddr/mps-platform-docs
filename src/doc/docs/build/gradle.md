---
comments: true
tags:
- infrastructure
---

[gradle.org](https://docs.gradle.org/current/userguide/what_is_gradle.html) contains documentation about Gradle.
[A Groovy Build Script Primer](https://docs.gradle.org/current/userguide/groovy_build_script_primer.html) explains the used
features of the Groovy languages. If you want to use Kotlin instead, start with the [Gradle Kotlin DSL Primer](https://docs.gradle.org/current/userguide/kotlin_dsl.html). [Migrating build logic from Groovy to Kotlin](https://docs.gradle.org/current/userguide/migrating_from_groovy_to_kotlin_dsl.html) might also be helpful. To automatically convert between Groovy and Kotlin syntax, you can use [Gradle Kotlinize](https://gradle-kotlinize.web.app/). Many manual corrections are still necessary.

Why do we use Gradle? Gradle build scripts have the advantage that you write code instead of XML, like it's the case using Maven or Ant.
We use Gradle to download MPS and the dependencies in the correct version and put them in the right place, generate the Ant scripts from the MPS build scripts using a `build-allScripts.xml` Ant script and then start Ant with correct parameters (where is MPS on disc, where are the dependencies on disc, ...).
You can define the Gradle scripts using Groovy (`build.gradle`) or Kotlin (`build.gradle.kts`). Groovy is enough for smaller building scripts, but it's dynamically typed and thus fails late when the Gradle task executes. Kotlin provides type checking; auto-completion works better with Kotlin than Groovy inside IntelliJ IDEA.

To get a better idea how our build scripts look like, head over to [Platform Essentials: Platform Build Scripts](platform_build_scripts.md).

## Useful Gradle Plugins for MPS Projects

- **[mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin)** contains miscellaneous practical tasks when building MPS-based projects with Gradle. Many projects use this plugin.
- **[Maven publish plugin](https://docs.gradle.org/current/userguide/publishing_maven.html)**: a Gradle plugin for publishing build artifacts to Apache Maven repositories (such as nexus repositories)
- **[nu.studer.credentials](https://plugins.gradle.org/plugin/nu.studer.credentials)**: a Gradle plugin for storing and accessing encrypted credentials
- **[github-release-gradle-plugin](https://github.com/BreadMoirai/github-release-gradle-plugin)**: a Gradle Plugin to send releases to GitHub

## Questions

!!! info "How do you set up a Gradle build for an MPS project?"

    There is a gist for a [minimal build](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75), and there is a [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin). Look at the build scripts of big projects, such as [MPS Extensions](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle), for more complex setups.

!!! info "I need help understanding the dependencies between Gradle tasks."

    Read the Gradle documentation about [authoring tasks](https://docs.gradle.org/current/userguide/more_about_tasks.html).
    For visualizing task graphs to understand a task's dependencies, use the Gradle plugin [gradle-taskinfo](https://gitlab.com/barfuin/gradle-taskinfo).

!!! question "Is there a Gradle plugin for downloading things?"

    Yes, [gradle-download-task](https://github.com/michel-kraemer/gradle-download-task).

!!! question "Is there a Gradle plugin for making HTTP requests?"

    Yes, [gradle-http-plugin](https://http-builder-ng.github.io/gradle-http-plugin/).

!!! warning "The Gradle build fails with exception: incremental build fails during generation on no changed models."

    Run `git clean -xdf` and rebuild everything (MPS-33541.)

!!! question "How can you fetch dependencies using Gradle?"

    [Fetching dependencies with Gradle](https://specificlanguages.com/posts/2022-01/31-fetching-dependencies-with-gradle/){{ blog('sl') }}

??? question "How to get dependencies from private GitHub repositories within a GitHub action?"

    Follow the default way for GitHub Packages access, as described in [GitHub Actions](https://docs.github.com/en/actions).
    It may work if the other private repository is part of the same organization.

    If not, ensure the *GITHUB_TOKEN* permissions are correct: [Permissions for the *GITHUB_TOKEN*](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token).

    DDepending on the organizational settings, obtaining the artifact via the generic *GITHUB_TOKEN*. In this case, you must create a new [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) (PAT).

    Next, add this token as a secret to the project (e.g., as *PRIVATE_REPO_ACCESS_ACTOR* and *PRIVATE_REPO_ACCESS_TOKEN*): [Granting additional permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#granting-additional-permissions)

    - Ensure this secret is not in an environment but is generally available.

        - Also, add the username. Even though no username is required for token access, an error will occur if you leave it empty.

        - Ensure you authorize the PAT for the SSO org (warning: this resets when changing permissions!)

    Next, you need to access this special token in your workflow yaml file, for example:

    ```yaml
        name: Build and Test Languages
        
        [...]
        
        # Obtain tokens and secrets from GitHub repository secrets
        {% raw %} 
        env:
          GITHUB_ACTOR: ${{ github.actor }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          PRIVATE_ACTOR: ${{ secrets.PRIVATE_REPO_ACCESS_ACTOR }}
          PRIVATE_TOKEN: ${{ secrets.PRIVATE_REPO_ACCESS_TOKEN }}
         {% endraw %} 
        [...]
        
        jobs:
          buildAndTest:
        
        [...]
        
            - name: Build with Gradle
              uses: gradle/gradle-build-action@v1.3.3
              with:
                arguments: buildLanguages
    ```
    
    Within your Gradle file, you can then access these variables via:

    ```kotlin title="build.gradle.kts"
        [...]
        repositories {
            
            val gpr_user: String? by extra
            val gpr_token: String? by extra
            val githubUsername = System.getenv("GITHUB_ACTOR") ?: gpr_user
            val githubToken = System.getenv("GITHUB_TOKEN") ?: gpr_token
        
            if(githubUsername == null || githubUsername == "" ) {
                throw GradleException("No credentials found via envrionment variable (\$GITHUB_ACTOR) or via Gradle properties (gpr_user) for auth towards Github packages")
            }
        
            if(githubToken == null || githubToken == "") {
                throw GradleException("No credentials found via envrionment variable (\$GITHUB_TOKEN) or via Gradle properties (gpr_token) for auth towards Github packages")
            }
        
            maven {
                url = uri("https://maven.pkg.github.com//mbeddr/mbeddr.core")
                credentials {
                    username = githubUsername
                    password = githubToken
                }
            }
        
            val private_user: String? by extra
            val private_token: String? by extra
            val privateUsername = System.getenv("PRIVATE_ACTOR") ?: private_user
            val privateToken = System.getenv("PRIVATE_TOKEN") ?: private_token
        
            if(privateUsername == null || privateUsername == "") {
                throw GradleException("No private credentials found via envrionment variable (\$PRIVATE_ACTOR) or via Gradle properties (private_user) for auth towards Github packages")
            }
        
            if(privateToken == null || privateToken == "") {
                throw GradleException("No credentials found via environment variable (\$PRIVATE_TOKEN) or via Gradle properties (private_token) for auth towards Github packages")
            }
        
            maven {
                url = uri("https://maven.pkg.github.com/ORGANIZATION/PRIVATE-PROJECT/")
                credentials {
                    username = privateUsername
                    password = privateToken
                }
            }
        [...]
    ```
    
    You can locally set the token by adding the following entries to your *gradle.properties* file (assuming your token has the correct access rights for the repositories):
    
        gpr_user=XXX
        gpr_token=YYY
        private_user=XXX
        private_token=YYY

    {{ contribution_by('nkoester') }}

!!! question "How to run a Gradle task from Java code?"    

    Use the Gradle wrapper or the Gradle tooling API as described in this [StackOverflow answer](https://stackoverflow.com/a/49877200/16577108).

## MPS Gradle Tips

A common question with Gradle in MPS is: how to you pass values to Ant scripts. In general, there are two types of properties:

### Project Properties

- can be defined as *ext.myPropName*
- can be passed through *PmyPop_name* from the command line
- can be accessed like variables in the build projects
- can be checked if they are set or not

### System Properties

- can be passed through *-D* from the command line
- are available in the Gradle build file through normal Java mechanism: `System.getProperty()`
- Project properties can be specified as system properties. Prefix them with *org.gradle.project.NAME*.

The properties in this file are by default project properties. If they are prefixed with `systemProp.`, they are system properties.

## Gradle Wrapper (*gradlew/gradlew.bat*)

The Gradle wrapper script downloads Gradle in the specified version, independent of your locally installed Gradle, and then starts the downloaded Gradle.
It consists of a small java program (located under `./gradle/wrapper/gradle-wrapper.jar`), an init-file that contains the Gradle version (`./gradle/wrapper/gradle-wrapper.properties`), and start scripts for Windows, Mac, and Linux (`./gradlew` and `./gradlew.bat`).

## Location of Dependencies

Read more about [BuildScripts Blocks in Gradle](https://www.baeldung.com/gradle-buildscripts-blocks).
Dependencies inside the build script block are placed on the classpath of the build script itself (for the current Gradle file, which will also be compiled like Java). To be able to compile the build script into bytecode, Gradle needs to resolve its dependencies.

Dependencies outside the build script block are project dependencies. These dependencies are added to the project code's classpath. For example, Gson is used inside a Gradle project and needs to be on the project's classpath to compile the project.

If the dependency is only used in the build script (i.e., only from the `build.gradle` file), then it should be in a `buildscript { }` block. Dependencies used in both project code and build scripts will effectively need to be listed twice.

[Gradle Configurations Explained: What is the difference between API and Implementation? | medium.com](https://medium.com/agorapulse-stories/gradle-configurations-explained-4b9608dd5e35) contains a good explanation of Gradle configurations.

## Miscellaneous

- To delay the execution of code in Groovy build script, use closures. They will delay the value propagation to execution instead of configuration time ([documentation](https://www.baeldung.com/groovy-closures)).
- Creating a custom Gradle Plugin is described in [Developing Custom Gradle Plugins | gradle.org](https://docs.gradle.org/current/userguide/custom_plugins.html).
- A standalone project defines all dependencies in the Gradle file. Create a properties file in the resource folder with the same name as the plugin id, for example, `org.samples.greeting.properties` in `src/main/resources/META-INF/gradle-plugins/`
- plugin IDs are full qualified identifiers, similar to Java packages Use the pattern *component/company/plugin-name* form them,
  for example, `com.github.[name].[plugin-name]` or `com.github.[arimer].[migration-checker]`.