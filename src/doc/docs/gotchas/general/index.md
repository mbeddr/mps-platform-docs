!!! warning "I have a problem that is not in this list."

    Try [invalidating the cache](https://www.jetbrains.com/help/mps/invalidate-caches.html) and restarting MPS (same menu). Search the [forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) and [issue tracker](https://youtrack.jetbrains.com/issues/MPS). 
    Ask a question on [Slack](http://slack-mps.jetbrains.com).

!!! warning "I changed something in a settings page and nothing changed."

    There might be a bug related to caching. Reopening the dialog or invalidating the cache or restarting the project might help.

!!! question "Are there any recommended MPS settings that should be changed?"

    The [Maximum Heap Size](https://www.jetbrains.com/help/mps/tuning-the-ide.html#common-jvm-options) in Help->Change Memory setting should be changed to a higher values such as 8 GB when using many languages or plugins.

!!! warning "I am running low on memory or MPS is running slowly. What can I do without restarting MPS?"

    When you have enabled the Loaded models indicator in the lower right corner of the screen, you can click on the text to [unload not needed models](https://confluence.jetbrains.com/display/MPS/What%27s+New+in+2019.3#What'sNewin2019.3-Modelunloading).
    The memory indicator at the same location can be used to free memory. As a last resort the [power saving mode](https://www.jetbrains.com/help/mps/status-bar.html?q=Power%20Save#status-bar-icons) can be enabled which disables background tasks such as the model checker.

!!! question "What is a SRepository and how is it structured?"
    The answer can be found in the MPS source code[^1].There can be multiple repositories available. Given a repository, references to modules/models/nodes can be resolved.
    There's no need in making ids unique globally as each subsystem knows, which exact repository it needs to use at any moment.
    (e.g. the type-system knows where it stores its type-nodes, so it will not try to resolve references to them )
    <p/>
    A repository contains modules, modules have model roots, each model root can load models.
    Also a module can be a models container itself (without model root).
    A model is then a set of "root" nodes.
    Each "root" node is a root of a tree of nodes. So that overall, repository is a tree structure.
    <pre>
     repository
     -module1
            model root 1
                model1
                  root_node_1
                    child_node_1
                      child_node_1_1
                    child_node2
            model root 2


!!! question "Are there othere languages besides Base Language?"
    Have a look at the [MPS Languages Repository](https://confluence.jetbrains.com/display/MPS/MPS+Languages+Repository?_ga=2.190406190.441906427.1635067376-1212584208.1633605628).

!!! question "Is there an existing expression/scripting language?"

    There is the expressions sample project. For a full language that can also be evaluated, have a look at
    [KernelF](http://voelter.de/data/pub/kernelf-reference.pdf) available at [iets3.opensource](https://github.com/IETS3/iets3.opensource).

!!! question "How do I organize large projects in MPS?"
    Read the two answers in [this thread](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010373120-How-to-organize-large-projects-in-MPS-).

!!! question "How to I debug MPS projects?"
    Have a look at [this blog post](https://dslfoundry.com/how-to-debug-in-mps/).

!!! question "Where are my log messages?"

    `log info` logs to the MPS log file ([idea.log](https://intellij-support.jetbrains.com/hc/en-us/articles/207241085-Locating-IDE-log-files)), `message info` logs to the [messages view](https://www.jetbrains.com/help/mps/messages-tool-window.html).

!!! question "Which log level should I use?"

    Have a look at [this Stack Overflow answer](https://stackoverflow.com/a/2031209).

[^1]: [SRepository.java](https://github.com/JetBrains/MPS/blob/78a8983d975c3177461ae2553fd253bdc63baab6/core/openapi/source/org/jetbrains/mps/openapi/module/SRepository.java#L24)
