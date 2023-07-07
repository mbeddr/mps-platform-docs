---
hide:
- toc
---

All platforms use [TeamCity](https://www.devopsschool.com/blog/what-is-teamcity-and-how-it-works-an-overview-and-its-use-cases/) for [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration). [Extensive official documentation](https://www.jetbrains.com/help/teamcity/getting-started-with-teamcity.html) is available for TeamCity on the web. The TeamCity server can be reached at [build.mbeddr.com](https://build.mbeddr.com). When a new commit is pushed to a branch in one of the Git repositories, the platforms are built on the server, tested, and published to the [itemis Nexus repository](https://artifacts.itemis.cloud/#browse/browse:maven-mps).
This is configured through [VCS triggers](https://www.jetbrains.com/help/teamcity/configuring-vcs-triggers.html).

The test results are collected from [Ant JUnit reports](https://ant.apache.org/manual/Tasks/junitreport.html) and make the builds fail if not all tests pass. Tests can be [muted](https://www.jetbrains.com/help/teamcity/investigating-and-muting-build-failures.html). This might be necessary when tests return both passes and failures despite no changes ([flake tests](https://www.jetbrains.com/teamcity/ci-cd-guide/concepts/flaky-tests/)). This can happen, for example, if the test is timing-dependent, an algorithm is not [deterministic](https://en.wikipedia.org/wiki/Deterministic_system) or a timeout happens.

All GitHub repositories are connected directly to TeamCity and show the build status at the bottom of pull requests and next to pushed commits with the help of the [Commit Status Publisher](https://www.jetbrains.com/help/teamcity/commit-status-publisher.html). The main repositories require the build to succeed before a pull request can be merged:

![GitHub build status](GitHub_build_status.png)


One or multiple [build configurations](https://www.jetbrains.com/help/teamcity/creating-and-editing-build-configurations.html) exist per platform. They are described here only superficially because they might change in the future. Each sub-item is a separate build configuration. Some configurations depend on other configurations ([snapshot dependencies](https://www.jetbrains.com/help/teamcity/snapshot-dependencies.html)).

- **MPS-Extensions**
    - build the project: `gradle build`
        - it is not triggered by changes in the documentation
    - build the documentation
    - build and publish to Nexus/GitHub: `gradle build publish`
        - only executed once a day

- **mbeddr platform**
    - build and publish: `gradle publishMbeddrPlatformPublicationToMavenRepository publishMbeddrAllScriptsPublicationToMavenRepository`
        - depends on MPS-Extensions
- **mbeddr**
    - build and publish: `gradle build:com.mbeddr:languages:publish`
        - depends on the mbeddr platform
    - analyses test: `gradle test_mbeddr_analysis`
- **iets3**
    - build and publish: `gradle build publish`
        - depends on the mbeddr platform
          - builds are only triggered for specific naming conventions and some special branches: *master*, *feature/\**, *bugfix/\**, *refactor/\**, *maintenance/\**
    - publish to GitHub
- **Publish JDK** ([build.publish.jdk](https://github.com/mbeddr/build.publish.jdk))
    - publish to Nexus
- **Update MPS** ([build.publish.mps](https://github.com/mbeddr/build.publish.mps))
    - publish to Nexus and GitHub
- **MPS Gradle plugin** ([mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin))
    - publish

The following diagram shows a simplified version of the [build chain](https://www.jetbrains.com/help/teamcity/build-chain.html) that shows the dependencies between the projects/configurations:

```kroki-plantuml
@from_file:build/diagrams/teamcity_build_chain.puml
```

Although all these repositories use Gradle for build management, TeamCity has a lot of bundled plugins. Many are described in [Configuring Build steps | TeamCity On-Premises](https://www.jetbrains.com/help/teamcity/configuring-build-steps.html). The builds are executed by [build agents](https://www.jetbrains.com/help/teamcity/build-agent.html). The Docker image of the agents can be found in the [mbeddr.build.docker](https://github.com/mbeddr/mbeddr.build.docker/blob/master/Dockerfile) repository.

9 agents are available for running builds simultaneously. They are hosted at multiple different locations (in server rooms and the cloud). The agents are running Linux, except one agent which is running
Windows 10 and one agent that is running Mac OS X, version 10.15.7.

## Docker

{{ mbeddr() }}, {{ mps_extensions() }}, {{ iets3() }}

Docker is a Linux container technology that the platform projects use a lot. You can think of it as a lightweight virtual machine. Besides the container runtime, Docker also includes the tools required to build preconfigured images that are then executed in the container.
These images are built from a Dockerfile.

Essentially, everything in the infrastructure is provisioning using docker from the TeamCity frontend over the database to the build agent. For the building agent, this approach allows us to keep the building agents consistent with their installed software and their versions. The Dockerfile for our general-purpose agents can be found on GitHub. The docker image build from the docker file is published to Docker Hub, a hosting service for images, and then used in our build server.

The complete docker configuration for our build server is hosted on GitLab. It also included the scripts that download/update the docker image and run the agent. Since our TeamCity setup uses multiple containers, a separate container for the database, or the web server that handles the encrypted connection, we are using docker-compose as an orchestration tool. 