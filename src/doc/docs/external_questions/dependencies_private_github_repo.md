??? question "How to obtain dependencies from private github repositories within a GitHub action?"

    Follow the default way for github packages access, as described in [GitHub Actions](https://docs.github.com/en/actions).
    It might simply work if the other private repository is part of the same organization.

    **If not**: Ensure the `GITHUB_TOKEN` permissions are correct: [Permissions for the GITHUB_TOKEN](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token)

    Depending on the organizational settings, it might be impossible to obtain the artifact via the generic `GITHUB_TOKEN`. In this case you need to create a new [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) (PAT).

    Next, add this token as a secret to the project (e.g. as `PRIVATE_REPO_ACCESS_ACTOR` and `PRIVATE_REPO_ACCESS_TOKEN`): [Granting additional permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#granting-additional-permissions)

    - Make sure that this secret is **not** in an environment but generally available.

        - Also add the username. Even though no username is required for token access, an error will occur if you leave it empty.

        - Make sure you authorize the PAT for the SSO org (warning: this resets when changing permissions!)

    Next you need to access this special token in your workflow yaml file, e.g:

    ```yaml
        name: Build and Test Languages
        
        [...]
        
        # Obtain tokens and secrets from github repository secrets
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
    
    You can locally set teh token by adding the following entries to your `gradle.properties` file (assuming your token has the correct access rights for the repositories):
    
        gpr_user=XXX
        gpr_token=YYY
        private_user=XXX
        private_token=YYY

    {{ contribution_by('nkoester') }}