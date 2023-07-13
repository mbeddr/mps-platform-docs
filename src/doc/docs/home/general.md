---
hide:
- toc
tags:
- general
- beginner
- troubleshooting
alias: general
---

This page answers some general questions about MPS and is most useful for :beginner: beginners.

!!! question "Who is MPS for?"

    [Who is MPS for?](https://specificlanguages.com/posts/who-is-mps-for/){{ blog('sl') }}

!!! hint "I am an MPS beginner. Where do I start?"

    If you are new to MPS and want to learn more about MPS, start with the following links:

    - [Learn MPS | official JetBrains landing page](https://www.jetbrains.com/mps/learn)
    - [Get started with MPS | mps.rocks](https://mps.rocks/#get-started-with-mps)
    - [Learning MPS | mps.rocks](https://mps.rocks/#learning-mps)
    - Getting Started: [Part I](https://www.f1re.io/getting-started){{ blog('F1RE') }}, [Part II](https://www.f1re.io/getting-started-pt2){{ blog('F1RE') }}

??? question "Is there a high-level presentation that I can have a look at?"

    Yes, there is a presentation from 2020 by [Václav Pech](https://github.com/vaclav).

    <iframe src="https://drive.google.com/file/d/1ofeLyO4mGC9tkDN88xPedCCxp8cpflqK/preview" width="100%" height="640px" allow="autoplay" framborder="0"></iframe>

!!! question "Are there any video tutorials besides the official videos?"

    Yes, [Heavy Meta TV](https://heavymeta.tv) hosts in-depth tutorials about MPS for a total length of 20 hours.
    @coolya filmed the tutorials as part of a series of live streams in 2018/2019.

!!! question "I want to learn more about domain-specific languages. Where do I start?"

    Start with the slides: [Introduction to Domain-Specific Languages](http://voelter.de/data/presentations/dslIntro2023.pdf) by [Markus Völter](https://voelter.de/publications.html). On the [books page](https://voelter.de/books.html), there are also a few relevant books like DSL Engineering (2013) and How to Understand Almost Anything - A Practitioner's Guide to Domain Analysis (2013).

!!! question "What are the essential shortcuts?"

    [JetBrains MPS Shortcuts](https://www.f1re.io/mps-shortcuts){{ blog('F1RE') }}

!!! question "Which directory contains the MPS project?"

    [Which directory contains the MPS project?](https://specificlanguages.com/posts/2022-08/08-which-directory-contains-the-mps-project/){{ blog('sl') }}

!!! warning "What can you do if a problem isn't on this list?"

    Try {{ image_popup("https://www.jetbrains.com/help/mps/invalidate-caches.html", "invalidating the cache", "../../img/invalidate_cache.gif", "invalidate cache") }} and restarting MPS (same menu).
    Search the [forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) and [issue tracker](https://youtrack.jetbrains.com/issues/MPS). 
    Ask a question on [Slack](http://slack-mps.jetbrains.com).

!!! warning "I changed something in the preferences, and nothing changed."

    There might be a bug related to caching. Reopening the dialog, invalidating the cache, or restarting the project might help.

!!! question "Which standard IDE settings should you change?"
    
    When using many languages or plugins, the {{ image_popup("https://www.jetbrains.com/help/mps/tuning-the-ide.html#common-jvm-options", "maximum heap size", "../../img/maximum_heap_size.gif", "maximum heap size") }} should be changed to a higher value, such as 8 GB.
    Another reason for high memory usage can be many (poorly) implemented checking rules. 

!!! warning "I am running low on memory, or the IDE is running slow. What can you do without restarting MPS?" 

    When you have enabled the {{ image_popup("https://www.jetbrains.com/help/mps/status-bar.html?q=memory%20indicator#status-bar-icons", "loaded models' indicator", "../../img/memory_indicator.gif", "memory indicator") }} in the lower right corner of the screen, you can click on the text to [unload not needed models](https://blog.jetbrains.com/mps/2019/12/mps-2019-3-is-released/#:~:text=Model%20unloading).
    To free memory, use the memory indicator. As a last resort, enable the {{ image_popup("https://www.jetbrains.com/help/mps/status-bar.html?q=Power%20Save#status-bar-icons", "power-saving mode", "../../img/power_saving_mode.gif", "power-saving mode") }}. It turns off background tasks like the model checker (not recommended).

!!! question "What are modules, models, nodes, and concepts?"

    - [What goes where: the basic architecture of MPS projects](https://specificlanguages.com/posts/2022-04/28-what-goes-where/){{ blog('sl') }}
    - [Ambiguous terms: Modules and models](https://specificlanguages.com/posts/2022-02/25-ambiguous-terms-modules-models/){{ blog('sl') }}
    - [How MPS Identifies Things](https://blog.logv.ws/2021/04/21/how-jetbrains-mps-identifies-things/){{ blog('lv') }}

!!! question "Can you explain the MPS technology stack, project concepts, and OpenAPI relations?"

    [MPS technology stack, project concepts, and OpenAPI relations explained visually](https://dslfoundry.com/mps-technology-stack-project-concepts-and-openapi-relations-explained-visually/){{ blog('dslf') }}

!!! question "What's an SRepository, and how's it structured?"

    The [MPS sources](https://github.com/JetBrains/MPS/blob/78a8983d975c3177461ae2553fd253bdc63baab6/core/openapi/source/org/jetbrains/mps/openapi/module/SRepository.java#L24) contain the answer. Multiple repositories could be available in the future. If you have a repository, it can resolve references to modules, models, and nodes.
    There's no need to make IDs globally unique as each subsystem knows which exact repository to use at any moment
    (e.g., the type system knows where it stores its type nodes, so it will not try to resolve references to them).

    A repository contains modules, modules have model roots, and each model root can load models.
    A module can also be a model container itself (without a model root).
    A model is then a set of root nodes.
    Each root node is a root of a tree of nodes. Overall, a repository is a tree structure.

    ```kroki-mermaid
@from_file:home/diagrams/srepository_example.mermaid
    ```

!!! question "Is there an existing expression/scripting language?"

    MPS ships with the expressions sample project. A complete and evaluable language is
    [KernelF](http://voelter.de/data/pub/kernelf-reference.pdf) which is available at {{ iets3() }}.

!!! question "How do you organize large projects?"

    Read the two answers in [this thread](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010373120-How-to-organize-large-projects-in-MPS-).

!!! question "How do you debug MPS projects?"
    
    Have a look at [this blog post](https://dslfoundry.com/how-to-debug-in-mps/) or [this guide](/files/mps_debugging.pdf).

!!! question "Where are the log messages?"

    `log info` logs to the MPS log file {{ image_popup("https://intellij-support.jetbrains.com/hc/en-us/articles/207241085-Locating-IDE-log-files", "idea.log", "../../img/show_log.gif", "show log") }}, 
    and `message info` logs to the {{ image_popup("https://www.jetbrains.com/help/mps/messages-tool-window.html", "messages tool window", "../../img/messages_view.png", "messages tool window") }}.

!!! question "Which log level should you use?"

    Have a look at [this Stack Overflow answer](https://stackoverflow.com/a/2031209).

!!! question "How do you export data from MPS?"

    - [The simplest way to export your data from MPS](https://specificlanguages.com/posts/simplest-export-from-mps/){{ blog('sl') }}
    - [Good and bad ways of exporting DSL models](https://specificlanguages.com/posts/good-and-bad-ways-of-exporting-dsl-models/){{ blog('sl') }}
    - [Translation vs export](https://specificlanguages.com/posts/translation-vs-export/){{ blog('sl') }}

!!! question "Why is a project read-only?"

    [Why is my project suddenly read-only?](https://specificlanguages.com/posts/2022-03/11-why-is-my-project-read-only/){{ blog('sl') }}

??? question "How do you work with more than one project in MPS?"

    > Given that, I want to work on an MPS project that uses other projects and switch between tasks that sometimes need changes on both the dependent and the root projects. I want to switch back and forth between using the default prepackaged project dependencies and my repository of them, where I build them myself. How could I do that?

    **Option 0**: Open multiple projects in MPS at the same time

    - Works when doing small changes
    - fast
    - Unreliable: When changing dependencies in my source models, this leads to a reload operation on the repository, which sometimes messes up the loaded repository and caches

    **Option 1**: Publish and pull from local maven ({{ iets3() }})

    - reliable
    - [example](https://github.com/IETS3/iets3.opensource/wiki/Building-IETS3#building-against-local-mbeddr)
    - The gradle script needs to be told to pull from a local repository e.g. by providing `-PforceLocalDependencies` to IETS3 or use dependency overrides

    **Option 3**: Changing project libraries

    - does not affect command-line builds

    **Option 3a**: Command line setup Task ({{ iets3() }})
    We usually have a `./gradlew setup` task in our projects that replaces your `.mps/libraries.xml`. When you want to change the project, you'll need to change the configuration of that command line setup task and rerun it.

    **Option 3b**: MPS *Path variables* in settings (deprecated)

    In the MPS settings, you can configure path variables that can be used in `.mps/libraries.xml` to pinpoint the location of a target project.

    They will only configure the MPS behavior and not affect the command line builds. So in most cases, you don't want to use them and instead let your build script set up these files.

    {{ contribution_by('abstraktor') }}

!!! question "Can I configure MPS path variables per project?"

    No, this is not possible. This problem often arises when MPS should open multiple instances (e.g., different branches) of the same project.
    It is possible to create localized MPS configurations that enable running numerous independent instances of various MPS versions.
    For Linux you can use [nkoester/mps-zookeeper](https://github.com/nkoester/mps-zookeeper).
    
    As a general solution, you can download multiple instances of MPS and edit the following paths in [bin/idea.properties](https://www.jetbrains.com/help/mps/tuning-the-ide.html#configure-platform-properties): *idea.config.path*, *idea.system.path*, *idea.plugins.path*, and *idea.log.path*.
    When you have a repository "repo," you can, for example, replace the name of the MPS version with repo1, repo2, repo3, or a different naming scheme.
    When using [remote debugging](https://specificlanguages.com/articles/remote-debugging/), use other ports for the MPS
    instances (e.g.5005, 5006...500n), or MPS won't start.

!!! question "Why is MPS shipped with JBR instead of an installed JDK/JRE?"

    JBR is a fork of OpenJDK with specific bug fixes and improvements for JetBrains IDEs. @JetBrains/JetBrainsRuntime contains more information about this topic. In some platform build scripts, the environment variable `JB_JAVA11_HOME` can set the JDK home.
    For older MPS versions that used Java 8, there was the environment variable `JB_JAVA8_HOME`.

!!! question "Are there any resources/communities about domain-specific languages and MPS?"

    - [DSL & MPS books](https://voelter.de/books.html) by Markus Voelter. Note: Some of these books might be outdated and do not cover the latest features of MPS.
    - [The complete guide to (external) Domain Specific Languages](https://tomassetti.me/domain-specific-languages/){{ blog('Strumenta') }}
    - [68 Resources To Help You To Create Programming Languages](https://tomassetti.me/resources-create-programming-languages/){{ blog('Strumenta') }}
    - [Strumenta Virtual Meetups](https://d.strumenta.community/t/new-link-for-virtual-meetups/1024)
