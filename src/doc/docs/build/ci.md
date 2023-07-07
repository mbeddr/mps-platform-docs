---
tags:
- infrastructure
---

# Continuous integration

- [Setting up CI with MPS: self-contained projects](https://specificlanguages.com/posts/2022-03/25-simplest-ci-scenario-with-mps-self-contained-projects/){{ blog('sl') }}
- [Maturity levels of MPS deployment](https://specificlanguages.com/posts/2022-04/14-maturity-levels-of-mps-deployment/){{ blog('sl') }}
- [The Business-DSL DevOps Process](https://markusvoelter.medium.com/the-business-dsl-devops-process-fb5531bf1f50){{ blog('mv') }}

??? question "How to attach the debugger to a CI build on GitHub actions?"

    Note: GitHub actions can be run locally with [act](https://github.com/nektos/act).

    The plan is to first teach the build to open up a reachable SSH connection, and then tunnel a local port onto it so that we can connect IntelliJ to it.

    - Sign up with ngrok and get your auth token

    Since build agents usually are not reachable from the web, we'll need someone to bridge the build agents' firewalls. A common solution for that seems to be https://ngrok.com/ which requires free signup. I tried tmate as well, but that doesn't support port forwarding.

    - Open ssh from your `.github/workflows/build.yml`

    There are prepared GitHub actions that start sshd with ngrok. I used [debug-via-ssh](https://github.com/marketplace/actions/debug-via-ssh). All we need to give it is our `ngrok authtoken` from above, and our public ssh key of the key that we want to use to get into the machine.

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

    Another note worth mentioning is, that we trust the author of the action and ngrok to not man-in-the-middle us.

    - Tell MPS to wait for us

    Now we can run the GitHub build and see that ngrok is stopping the build at the desired location, being ready for us to connect. In the [endpoints list](https://dashboard.ngrok.com/endpoints/status), our agent should be listed with a domain name and port. Taking the two, we can now ssh into it:

    ```
    # SSH through ngrok onto the build machine, already forwarding local 5020 to the remote machine
    ssh -L 5020:localhost:5020 -p11720 runner@4.tcp.ngrok.io
    ```

    If you are asked for a password, fix the casing of *-p*.
    If still asked for a password, check which user is running the build. On GitHub, that user seems to be called *runner* right now. Even though he has sudo rights.

    We now want to teach MPS to open the debug ports and wait for us to connect before running any tests. On CLI, this doesn't work with *.vmoptions* files, but instead, we're running the tests from an ant-file in this project.

    Since the *allScripts* generation was already performed, we only need to open the ant-file and add a JVM argument. I like to open `build/myProject/build-tests.xml` with Vim and then execute the following search expression: `%s/<\/jvmargs>/  <arg value="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5020" \/>\r      <\/jvmargs>/g`. In other terms: Look for `</jvmargs>` and add `<arg value="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5020" \/>` right in front of it. The `suspend=y` will tell Java to not start doing anything before we are connected, while the `address=5020` tells it to be welcoming us on port 5020.

    ```
    --- build/myProject/build-tests.xml	2021-09-17 21:15:50.000000000 +0200
    +++ build/myProject/build-tests.xml.before	2021-09-17 21:32:09.000000000 +0200
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

    Since I don't know how to move ngrok into the background while proceeding with the build, I just ran the next gitHub action by hand:

    ```
    $ cd worker/myProject
    $ ./gradlew testLanguages
    …
    …
    Listening for transport dt_socket at the address: 5020
    ```

    We should now see the command line MPS start-up and say that it is waiting for us on *5020*.

    - Connect with your local IntelliJ

    Assuming, that you have the MPS sources checked out, opened it in IntelliJ, and added the sources of your project as a module, we should be ready to connect now:

    Just start a remote debugging session on port 5020. It will forward the requests over SSH to the agent machine. Once connected, you'll be able to set breakpoints (for example, I set an Exception breakpoint for `StackOverflowError`), and then proceed the build to run into the breakpoint.

    - Cleanup

    After you found your issue and everything is shiny, remember to remove the step from your GitHub workflow again and reset your ngrok auth token.

!!! warning "The build fails with exit code 137"

    Specific Languages blog: [Exit code 137](https://specificlanguages.com/posts/2022-07/14-exit-code-137)

