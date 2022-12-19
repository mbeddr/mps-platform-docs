---
tags:
- general
- beginner
- troubleshooting
---

!!! question "Who is MPS for?"

    {{ blog('sl',false) }}[Who is MPS for?](https://specificlanguages.com/posts/who-is-mps-for/)

!!! hint "I am a MPS beginner. Where do I start?"

    If you are new to MPS and want to learn more about MPS, start with the following links:

    - [Learn MPS | official JetBrains landing page](https://www.jetbrains.com/mps/learn)
    - [Get started with MPS | mps.rocks](https://mps.rocks/#get-started-with-mps)
    - [Learning MPS | mps.rocks](https://mps.rocks/#learning-mps)

??? question "Is there a high level presentation that I can have a look at?"

    Yes, there is a presentation from 2020 by [Václav Pech](https://github.com/vaclav).

    <iframe src="https://drive.google.com/file/d/1ofeLyO4mGC9tkDN88xPedCCxp8cpflqK/preview" width="100%" height="640px" allow="autoplay" framborder="0"></iframe>

!!! question "What are the most important shortcuts?"

    F1RE blog: [JetBrains MPS Shortcuts](https://www.f1re.io/mps-shortcuts)

!!! warning "What can you do if a problem occurs that isn't in this list?"

    Try {{ image_popup("https://www.jetbrains.com/help/mps/invalidate-caches.html", "invalidating the cache", "../../img/invalidate_cache.gif", "invalidate cache") }} and restarting MPS (same menu).
    Search the [forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) and [issue tracker](https://youtrack.jetbrains.com/issues/MPS). 
    Ask a question on [Slack](http://slack-mps.jetbrains.com).

!!! warning "I changed something in a settings page and nothing changed."

    There might be a bug related to caching. Reopening the dialog, invalidating the cache or restarting the project might help.

!!! question "Which standard IDE settings should you change?"
    
    The {{ image_popup("https://www.jetbrains.com/help/mps/tuning-the-ide.html#common-jvm-options", "maximum heap size", "../../img/maximum_heap_size.gif", "maximum heap size") }} setting should be changed to a higher values such as 8 GB when using many languages or plugins.
    Another reason for high memory usage can be many (poorly) implemented checking rules. 

!!! warning "I am running low on memory or the IDE is running slow. What can you do without restarting MPS?" 

    When you have enabled the {{ image_popup("https://www.jetbrains.com/help/mps/status-bar.html?q=memory%20indicator#status-bar-icons", "loaded models indicator", "../../img/memory_indicator.gif", "memory indicator") }} in the lower right corner of the screen, you can click on the text to [unload not needed models](https://blog.jetbrains.com/mps/2019/12/mps-2019-3-is-released/#:~:text=Model%20unloading).
    The memory indicator at the same location can be used to free memory. As a last resort the {{ image_popup("https://www.jetbrains.com/help/mps/status-bar.html?q=Power%20Save#status-bar-icons", "power saving mode", "../../img/power_saving_mode.gif", "power saving mode") }} can be enabled which disables background tasks such as the model checker (not recommended).

!!! question "What is a module, model, node, concept...?"

    - {{ blog('sl',false) }}[Ambiguous terms: Modules and models](https://specificlanguages.com/posts/2022-02/25-ambiguous-terms-modules-models/)
    - {{ blog('lv',false) }}[How MPS Identifies Things](https://blog.logv.ws/2021/04/21/how-jetbrains-mps-identifies-things/)

!!! question "Can you explain the MPS technology stack, project concepts, and OpenAPI relations?"

    DSLFoundry blog: [MPS technology stack, project concepts, and OpenAPI relations explained visually](https://dslfoundry.com/mps-technology-stack-project-concepts-and-openapi-relations-explained-visually/)

!!! question "What's a SRepository and how's it structured?"

    The answer can be found in the [MPS source code](https://github.com/JetBrains/MPS/blob/78a8983d975c3177461ae2553fd253bdc63baab6/core/openapi/source/org/jetbrains/mps/openapi/module/SRepository.java#L24).Multiple repositories could be available in the feature. Given a repository, references to modules/models/nodes can be resolved.
    There's no need in making ids unique globally as each subsystem knows, which exact repository it needs to use at any moment.
    (e.g. the type-system knows where it stores its type-nodes, so it will not try to resolve references to them )

    A repository contains modules, modules have model roots, each model root can load models.
    Also a module can be a models container itself (without model root).
    A model is then a set of root nodes.
    Each root node is a root of a tree of nodes, So that overall, a repository is a tree structure.

    ```kroki-mermaid
    %%{init: {'theme':'base'}}%%
    graph LR;
    REP[(repository)]
    MOD1[[module 1]]
    MOD2[[module 2]]
    MODN[[module n]]

    REP --> MOD1;
    REP --> MOD2;
    REP --> MODN;
    MOD2 --> MR1[\model root 1\];
    MR2 --> MD1{model 1};
    MD1 --> RN1(root node 1);
    MD1 --> RN2(root node 2);
    MD1 --> RNN(root node n);
    MOD2 --> MR2[\model root 2\];
    MOD2 --> MRN[\mmodel root n\];
    ``` 

!!! question "Is there an existing expression/scripting language?"

    There is the expressions sample project. For a full language that can also be evaluated, have a look at
    [KernelF](http://voelter.de/data/pub/kernelf-reference.pdf) available at {{ iets3() }}.

!!! question "How do you organize large projects in MPS?"

    Read the two answers in [this thread](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010373120-How-to-organize-large-projects-in-MPS-).

!!! question "How do you debug MPS projects?"
    
    Have a look at [this blog post](https://dslfoundry.com/how-to-debug-in-mps/) or [this guide](../../files/mps_debugging.pdf).

!!! question "Where are the log messages?"

    `log info` logs to the MPS log file {{ image_popup("https://intellij-support.jetbrains.com/hc/en-us/articles/207241085-Locating-IDE-log-files", "idea.log", "../../img/show_log.gif", "show log") }}, 
    `message info` logs to the {{ image_popup("https://www.jetbrains.com/help/mps/messages-tool-window.html", "messages view", "../../img/messages_view.png", "messages view") }}.

!!! question "Which log level should you use?"

    Have a look at [this Stack Overflow answer](https://stackoverflow.com/a/2031209).

!!! question "How to you export data from MPS?"

    - {{ blog('sl',false) }}[The simplest way to export your data from MPS](https://specificlanguages.com/posts/simplest-export-from-mps/)
    - {{ blog('sl',false) }}[Good and bad ways of exporting DSL models](https://specificlanguages.com/posts/good-and-bad-ways-of-exporting-dsl-models/)
    - {{ blog('sl',false) }}[Translation vs export](https://specificlanguages.com/posts/translation-vs-export/)

!!! question "Why is a project read-only?"

    {{ blog('sl',false) }}[Why is my project suddenly read-only?](https://specificlanguages.com/posts/2022-03/11-why-is-my-project-read-only/)

??? question "How do you work with more than one project in MPS?"

    > Given I want to work on a MPS project that uses other projects and I want to switch between tasks that sometimes need changes on both, in the dependent project and the root project. I would like to switch back and forth between using the default prepackaged project dependencies and my own repository of them where I build them myself. How could I do that?

    **Option 0**: Open multiple projects in MPS at the same time

    - Works when doing small changes
    - fast
    - unreliable: when changing dependencies in my source models, this leads to a reload operation on the repository, which sometimes messes up the loaded repository and caches

    **Option 1**: Publish and pull from local maven ({{ iets3() }})

    - reliable
    - [example](https://github.com/IETS3/iets3.opensource/wiki/Building-IETS3#building-against-local-mbeddr)
    - gradle script needs to be told to pull from local repository
    -- e.g. by providing `-PforceLocalDependencies` to IETS3
    -- or use dependency overrides

    **Option 3**: Changing project libraries

    - does not affect command line builds

    **Option 3a**: Command line setup Task ({{ iets3() }})
    We usually have a `./gradlew setup` task in our projects that replaces your `.mps/libraries.xml`. When you want to change the project, you'll need to change the configuration of that command line setup task and rerun it.

    **Option 3b**: MPS *Path variables* in settings (deprecated)

    In the MPS setttings, you can configure path variables that can be used in `.mps/libraries.xml` to pinpoint to the location of a target project.

    They will only configure the MPS behavior and not affect the command line builds. So in most cases, you don't want to use them and instead let your build script setup these files.

    {{ contribution_by('abstraktor') }}

!!! question "Why is MPS shipped with JBR instead of using an installed JDK/JRE?"

    JBR is a fork of OpenJDK with specific bugfixes and improvements for JetBrains IDEs. More info can be found in @JetBrains/JetBrainsRuntime. In some of the platform build scripts the environment ariable `JB_JAVA11_HOME` can be used to set the JDK home.
    For older MPS versions that used Java 8, there was the environment variable `JB_JAVA11_HOME`.

!!! question "Are there any resources/communities about domain-specific languages and MPS?"

    - [DSL & MPS books](https://voelter.de/books.html) by Markus Voelter
    - {{ blog('Strumenta',false) }}[The complete guide to (external) Domain Specific Languages](https://tomassetti.me/domain-specific-languages/)
    - {{ blog('Strumenta',false) }}[68 Resources To Help You To Create Programming Languages](https://tomassetti.me/resources-create-programming-languages/)
    - [Strumenta Virtual Meetups](https://d.strumenta.community/t/new-link-for-virtual-meetups/1024)
