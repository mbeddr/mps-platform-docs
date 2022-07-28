## Questions

!!! info "How do you set up a gradle build for an MPS project?"

    There is a gist for a [minimal build](https://gist.github.com/coolya/46706883a6563f0d63527baed8091d75). There is a [mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin). For more complex projects look at build scripts of big projects such as [MPS-extensions](https://github.com/JetBrains/MPS-extensions/blob/master/build.gradle).

!!! question "Is there a Gradle plugin for downloading things?"

    Yes, [gradle-download-task](https://github.com/michel-kraemer/gradle-download-task).

!!! question "Is there a Gradle plugin for making HTTP requests?"

    Yes, [gradle-http-plugin](https://http-builder-ng.github.io/gradle-http-plugin/).

!!! warning "The gradle build fails with exception: incremental build fails during generation on no changed models"

    Run `git clean -xdf` and rebuild everything (MPS-33541.)

!!! question "How can you fetch dependencies using Gradle?"

    Specific Languages blog: [Fetching dependencies with Gradle](https://specificlanguages.com/posts/2022-01/31-fetching-dependencies-with-gradle/)

??? question "How to get dependencies from private GitHub repositories within a GitHub action?"

    Follow the default way for GitHub packages access, as described in [GitHub Actions](https://docs.github.com/en/actions).
    It might simply work if the other private repository is part of the same organization.

    If not, ensure the *GITHUB_TOKEN* permissions are correct: [Permissions for the *GITHUB_TOKEN*](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token)

    Depending on the organizational settings, it might be impossible to obtain the artifact via the generic *GITHUB_TOKEN*. In this case you need to create a new [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) (PAT).

    Next, add this token as a secret to the project (e.g. as *PRIVATE_REPO_ACCESS_ACTOR* and *PRIVATE_REPO_ACCESS_TOKEN*): [Granting additional permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#granting-additional-permissions)

    - Make sure that this secret is not in an environment but generally available.

        - Also add the username. Even though no username is required for token access, an error will occur if you leave it empty.

        - Make sure you authorize the PAT for the SSO org (warning: this resets when changing permissions!)

    Next you need to access this special token in your workflow yaml file, e.g:

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
    
    Within your gradle file you can then access these variables via:

    ```kotlin title="build.gradle.kts"
        [...]
        repositories {
            
            val gpr_user: String? by extra
            val gpr_token: String? by extra
            val githubUsername = System.getenv("GITHUB_ACTOR") ?: gpr_user
            val githubToken = System.getenv("GITHUB_TOKEN") ?: gpr_token
        
            if(githubUsername == null || githubUsername == "" ) {
                throw GradleException("No credentials found via envrionment variable (\$GITHUB_ACTOR) or via gradle properties (gpr_user) for auth towards Github packages")
            }
        
            if(githubToken == null || githubToken == "") {
                throw GradleException("No credentials found via envrionment variable (\$GITHUB_TOKEN) or via gradle properties (gpr_token) for auth towards Github packages")
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
                throw GradleException("No private credentials found via envrionment variable (\$PRIVATE_ACTOR) or via gradle properties (private_user) for auth towards Github packages")
            }
        
            if(privateToken == null || privateToken == "") {
                throw GradleException("No credentials found via environment variable (\$PRIVATE_TOKEN) or via gradle properties (private_token) for auth towards Github packages")
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

!!! question "How to run a Gradle task from java code?"    

    Using the Gradle wrapper or the Gradle tooling API as described in this [StackOverflow answer](https://stackoverflow.com/a/49877200/16577108).

## Gradle Tips

| Item               | Description                                                                                                                                                                                                                                                                                |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| closures           | The closure does `it (delay)  {}` which will delay the value propagation to execution instead of configuration time.                                                                                                                                                                       |
| buildAll scripts   | This is the meta build script (platforms only). This build model is generated and its artifact (ant-xml task) is committed to the gradle repo.                                                                                                                                             |
| project properties | <ul><li>can be defined as *ext.myPropName*</li><li>passed through: -<b>P</b>myPop_name from CL</li><li> can be access like variables in the build project</li><li>can be checked if the are set or not </li></ul>                                                                          |
| System properties  | <ul><li>passed through <b>-D</b> from CL</li><li>are available in the gradle build file though norma java mechanism: <i>System.getProperty();</i></li><li>Project properties can be specified as system properties. They need to be prefixed with <i>org.gradle.project.NAME</i></li></ul> |
| gradle.properties  | <ul><li>are by default project properties</li><li>if they are prefixed with systemProp. they are system properties</li></ul>                                                                                                                                                               |
| configurations     | are also separated in the same way as dependencies                                                                                                                                                                                                                                         |

## Gradle Wrapper (*gradlew/gradlew.bat*)

The gradle wrapper script downloads gradle in the specified version, independent of your local installed gradle, and then starts the downloaded gradle.
It consists of a small java program (located under `./gradle/wrapper/gradle-wrapper.jar`), an init-file which contains the gradle version (`./gradle/wrapper/gradle-wrapper.properties`) and start scripts for Windows, Mac and Linux (`./gradlew` and `./gradlew.bat`).

Why do we use gradle? Gradle build scripts have the advantage that you write code instead of XML, like it's the case using Maven or Ant.
We use gradle to download MPS and the dependencies in the correct version and put them in the right place, generate the Ant scripts from the mps build scripts using a `build-allScripts.xml` Ant scripts and then start Ant with correct parameters (where is MPS on disc, where are the dependencies on disc, ...). This is easier than doing it with and directly.
For defining the gradle scripts you can use groove (`build.gradle`) or kotlin (`build.gradle.kts`), both can do the same. Groovy is enough for smaller building scripts, but it's dynamically typed and thus fails late when the gradle task is executed. Kotlin provides type-checking and the auto-completion works better compared to groovy (with Intellij); this makes it easier to use with complex scripts.

## Dependencies

### Dependencies inside the buildScript{...} block

- are placed on the classpath of the build script itself (for the current gradle file which will also be compiled (like java))
- To be able to compile the build script into bytecode, its dependencies need to be resolved

### Dependencies outside the buildScript{...} block

- are project dependencies
- these dependencies are added to the project code’s classpath
- example: Gson is used inside a gradle project and needs to be on the classpath of the project to be able to compile the project.

If the dependency in only used in the buildscript (i.e. only from the `build.gradle` file) then it should be in a `buildscript { }` block. Dependencies used in both project code and build scripts will effectively need to be listed twice.

A good explanation of gradle configurations can be found in [Gradle Configurations Explained: What is the difference between API and Implementation? | medium.com](https://medium.com/agorapulse-stories/gradle-configurations-explained-4b9608dd5e35).

## Creating a gradle plugin

There are three choices:

- build script
- buildSrc project
- standalone project

### Standalone project
- define all dependencies in gradle file
- create a properties file in the resource folder with the same name as the plugin id
    - example:  `org.samples.greeting.properties` in `src/main/resources/META-INF/gradle-plugins/`
- plugin IDs
    - full qualified identifiers, similar to Java packages
    - Use pattern component/company/plugin-name
    - examples
        - `com.github.[name].[plugin-name]`
        - `com.github.[arimer].[migration-checker]`