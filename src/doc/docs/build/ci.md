---
comments: true
tags:
- infrastructure
---

# Continuous Integration

Continuous integration (CI) is a software development practice integrating code changes from multiple contributors into a single software project. It’s a primary DevOps best practice, allowing developers to frequently merge code changes into a central repository where builds and tests are run. Automated tools assert the new code’s correctness before integration. A VCS is the crux of the CI process. The version control system also has other checks like automated code quality tests, syntax style review tools, and more.

The main benefits of continuous integration are:

- It reduces the risk of integration conflicts and bugs by detecting them early and often.
- It improves the quality and reliability of the software by ensuring that every change is tested and verified.
- It speeds up the delivery and deployment of the software by automating the build and test process.
- It enhances collaboration and communication among the developers and other stakeholders by providing a shared and consistent view of the code.

## Tools

Some MPS projects used the following CI tools in the past:

- [Jenkins](https://www.jenkins.io/) is an open-source CI server that supports various plugins and integrations.
- [Bamboo](https://www.atlassian.com/de/software/bamboo): is a commercial CI server that integrates with Jira, Bitbucket, and other Atlassian products.

Some MPS projects used the following popular CI tools:

- [TeamCity](https://www.jetbrains.com/teamcity/) is a commercial CI server that supports various languages, platforms, and technologies. It offers real-time feedback, smart triggers, code quality analysis, and more. Itemis and JetBrains use it.
- [GitLab CI](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/) is a cloud-based or self-hosted CI service that integrates with GitLab, a web-based Git repository manager. It allows you to define your pipelines as code, run tests in parallel, deploy to any environment, and more.
- [GitHub Actions](https://github.com/features/actions) is a cloud-based CI service that integrates with GitHub, a web-based Git repository hosting service. It allows you to create workflows that automate your software development lifecycle, such as building, testing, and deploying your code. You can also use pre-built actions from the GitHub Marketplace or create custom actions.

## Challenges

CI with MPS projects can provide some challenges:

- MPS projects are not text-based but use an abstract syntax tree (AST) representation that MPS stores in XML files. That means that you have to review all model-related changes in MPS. When opening PRs, you can still do other checks: incorrect merges/rebasing can be detected manually by examining the commit history. The CI tool will detect conflicting files, and failing tests or model check errors can be reported as typical JUnit test results. Compilation errors when building the MPS modules will also fail the build. [Advanced GitHub workflow](advanced_github_workflow.md) mentions other checks that can be automated or done manually.
- MPS projects may depend on external libraries or plugins that must be installed and configured on the CI agents. Those dependencies may require additional steps or scripts to ensure compatibility and availability. A good approach is to use isolated environments where you install all the dependencies. A standard solution is doing [CI with Docker](https://docs.docker.com/build/ci/). When using the [model check](https://github.com/mbeddr/mps-gradle-plugin/tree/v1.x#model-check) plugin from the mps-gradle-plugin, additional plugins might need to be loaded through *pluginsProperty* if your MPS languages depend on one of the core MPS plugins. This Gradle plugin starts MPS only with a bare minimum number of plugins.
- MPS projects may generate code in different languages or formats, such as Java, C, XML, HTML, and more. These additional languages may require other tools or plugins to compile, test, and deploy the generated code. Example: Most MPS platforms, including mbeddr, use this [DockerFile](https://github.com/mbeddr/mbeddr.build.docker/blob/master/Dockerfile) for building.

## Blog Posts

- [Setting up CI with MPS: self-contained projects](https://specificlanguages.com/posts/2022-03/25-simplest-ci-scenario-with-mps-self-contained-projects/){{ blog('sl') }}
- [Maturity levels of MPS deployment](https://specificlanguages.com/posts/2022-04/14-maturity-levels-of-mps-deployment/){{ blog('sl') }}
- [The Business-DSL DevOps Process](https://markusvoelter.medium.com/the-business-dsl-devops-process-fb5531bf1f50){{ blog('mv') }}

??? question "How to attach the debugger to a CI build on GitHub actions?"

    *Note*: GitHub actions can be run locally with [act](https://github.com/nektos/act).

    The plan is first to teach the build to open up a reachable SSH connection and then tunnel a local port onto it so that we can connect IntelliJ to it.

    - Sign up with ngrok and get your auth token

    Since build agents usually are not reachable from the web, we'll need someone to bridge the build agents' firewalls. A common solution for that seems to be https://ngrok.com/ which requires free signup. I tried tmate as well, but that doesn't support port forwarding.

    - Open ssh from your `.github/workflows/build.yml`

    There are prepared GitHub actions that start sshd with ngrok. I used [debug-via-ssh](https://github.com/marketplace/actions/debug-via-ssh). All we need to give it is our `ngrok authtoken` from above and our public ssh key of the key we want to use to get into the machine.

    Given we already have `.github/workflows/build.yml`, I added a step right before the failing step:

    ```yml
    # …
    - name: Start SSH session
    uses: luchihoratiu/debug-via-ssh@main
    with:
        NGROK_AUTH_TOKEN: 2343953890afgaegaewgiöoio2332äää
        SSH_PASS: ssh-rsa AAAJOAKJFLJWKLJLEKJLEFKJLFEKJLK…JAOIFJOFA bkruck@itemis.com
    # …
    ```

    Since this is a private repository, I was fine with pasting my authtoken and public SSH key into it (I didn't have permission to add secrets to the repo). After the whole session, I reset my ngrok auth token.

    Another note worth mentioning is that we trust the author of the action and ngrok to not man-in-the-middle us.

    - Tell MPS to wait for us.

    Now we can run the GitHub build and see that ngrok is stopping the build at the desired location, being ready for us to connect. Our agent should be listed with a domain name and port in the [endpoints list](https://dashboard.ngrok.com/endpoints/status). Taking the two, we can now ssh into it:

    ```
    # SSH through ngrok onto the build machine, already forwarding local 5020 to the remote machine
    ssh -L 5020:localhost:5020 -p11720 runner@4.tcp.ngrok.io
    ```

    If you are asked for a password, fix the casing of *-p*.
    If still asked for a password, check which user runs the build. On GitHub, that user is called *runner* right now. Even though he has sudo rights.

    We now want to teach MPS to open the debug ports and wait for us to connect before running any tests. On CLI, this doesn't work with *.vmoptions* files. Instead, we're running the tests from an ant-file in this project.

    Since the *allScripts* generation was already performed, we only need to open the ant-file and add a JVM argument. I like to open `build/myProject/build-tests.xml` with Vim and then execute the following search expression: `%s/<\/jvmargs>/  <arg value="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5020" \/>\r      <\/jvmargs>/g`. In other terms: Look for `</jvmargs>` and add `<arg value="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5020" \/>` right in front of it. The `suspend=y` will tell Java not to start doing anything before we are connected, while the `address=5020` tells it to welcome us on port 5020.

    ```
    --- build/myProject/build-tests.xml    2021-09-17 21:15:50.000000000 +0200
    +++ build/myProject/build-tests.xml.before 2021-09-17 21:32:09.000000000 +0200
    @@ -342,7 +342,6 @@
        <jvmargs>
            <arg value="-ea" />
            <arg value="-Xmx3072m" />
    -        <arg value="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5020" />
        </jvmargs>
        <macro name="mps_home" path="${mps_home}" />
        <macro name="myProject.home" path="${myProject.home}" />
    ```

    - Run the tests from within SSH

    Since I don't know how to move ngrok into the background while proceeding with the build, I just ran the next GitHub action by hand:

    ```
    $ cd worker/myProject
    $ ./gradlew testLanguages
    …
    …
    Listening for transport dt_socket at the address: 5020
    ```

    We should now see the MPS start-up command line and say it is waiting for us on *5020*.

    - Connect with your local IntelliJ instance.

    Assuming that you have the MPS sources checked out, opened it in IntelliJ, and added the sources of your project as a module, we should be ready to connect now:

    Just start a remote debugging session on port 5020. It will forward the requests over SSH to the agent machine. Once connected, you can set breakpoints (for example, I set an Exception breakpoint for `StackOverflowError`) and then proceed the build to run into the breakpoint.

    - Cleanup

    After you find your issue and everything is shiny, remember to remove the step from your GitHub workflow again and reset your ngrok auth token.

!!! warning "The build fails with exit code 137"

    [Exit code 137](https://specificlanguages.com/posts/2022-07/14-exit-code-137){{ blog('sl') }}

!!! info "How can you make merging branches easier when you have maintenance branches?"

    [Automating cascading merges](https://specificlanguages.com/posts/2024-01/05-automating-cascading-merges/){{ blog('sl') }}

