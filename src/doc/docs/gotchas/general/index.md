!!! warning "I have a problem that is not in this list."

    Try invalidating the cache and restarting MPS. Search the [forum](https://mps-support.jetbrains.com/hc/en-us/community/topics) and [issue tracker](https://youtrack.jetbrains.com/issues/MPS). 
    Ask a question on [Slack](http://slack-mps.jetbrains.com).

!!! warning "I changed something in a model, in a settings page and nothing changed"

    There might be a bug related to caching. Reopening a dialog or invalidating the cache or restarting the project might help.

!!! warning "Are there any recommended MPS settings that should be changed?"

    The Maximum Heap Size in Help->Change Memory settings should be changed to a higher values such as 6 or 8 GB when using many languages or plugins.

!!! question "What is a SRepostory and how is it structured?"
    The answer can be found in the MPS source code[^1].There can be multiple repositories available. Given a repository, references to modules/models/nodes can be resolved.
    There's no need in making ids unique globally as each subsystem knows, which exact repository it needs to use at any moment.
    (e.g. the type-system knows where it stores its type-nodes, so it will not try to resolve references to them )
    <p/>
    A repository contains modules, modules have model roots, each model root can load models.
    Also module can be a models container itself (without model root).
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

    `log info` logs to the MPS log file (idea.log), `message info` logs to the messages view.

[^1]: [SRepository.java](https://github.com/JetBrains/MPS/blob/78a8983d975c3177461ae2553fd253bdc63baab6/core/openapi/source/org/jetbrains/mps/openapi/module/SRepository.java#L24)
