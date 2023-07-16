---
hide:
- toc
---

The term *plugin* can refer to different things: A plugin solution is a language aspect that you can use to integrate your code
with the MPS IDE functionality. The preferred way is to create a custom plugin solution instead which provides the same functionality. When you export your languages,
you can also create plugins that others can install. In this case, the term
*plugin* refers to IntelliJ IDEA plugins. You can install other plugins such as the Java plugin or a Markdown plugin in IntelliJ IDEA
the same way you install MPS plugins. They use the same mechanisms from the IntelliJ platform.
This page answers only general questions about plugins. You can find more information about plugins in [Plugins](plugins.md)
which deals with the plugin aspect.

!!! question "Where can you use a created language?"

    Use them in MPS or a custom IDE based on MPS (a so-called RCP). You need to create a build script, so you can export your plugins
    as real IntelliJ plugins that others can install. To ship all the plugins together with a custom branding, create an RCP.
    It has the advance that it can be provided to the end users as a single download or preinstalled on his computer. He doesn't have to
    install plugins himself through the market place or other storage locations and also doesn't have to deal with dependencies
    between plugins.

!!! question "Are MPS languages often used as plugins in IntelliJ IDEs instead of MPS itself? (an IntelliJ IDEA plugin, not custom RCP)"

    The MPS community uses this functionality only sparingly or not at all. Most of the time, developers create custom RCPs for the end users.

!!! question "How can you find plugins on the JetBrains marketplace usable in MPS?"

    Searching for the word [MPS](https://plugins.jetbrains.com/search?products=mps&search=MPS) in all categories should do the trick.

!!! question "Why do many IntelliJ plugins don't work with MPS?"

    Many of these plugins operate on the lines in text files. MPS uses a projectional editor, which is incompatible with regular text editors. It doesn't use
    a document model or [PSI](https://plugins.jetbrains.com/docs/intellij/psi.html) because MPS models are not text-based.
    Plugins that don’t officially support MPS can interfere with certain features of MPS (e.g., find usages might not work while using a plugin).

!!! question "Are there any general-purpose plugins for MPS from the community?"
    Have a look at the [plugin section](https://mps.rocks/#awesome-MPS) of [mps.rocks](https://mps.rocks).

!!! question "Which kinds of plugins are there?"

    - [Two kinds of MPS plugins](https://specificlanguages.com/posts/2022-01/24-two-kinds-of-plugins/){{ blog('sl') }}
    - [MPS plugins vs. IDEA plugins](https://specificlanguages.com/posts/2022-05/09-mps-plugins-vs-idea-plugins/){{ blog('sl') }}

!!! question "How do I turn off notifications for fatal errors?"

    Add `#!properties idea.fatal.error.notification=disabled` to [idea.properties](https://www.jetbrains.com/help/mps/tuning-the-ide.html#configure-platform-properties).

!!! question "Are there existing projects regarding MPS on the web?"

    Look at [deployment options for MPS](https://www.itemis.com/en/it-services/methods-and-tools/dsls-mps-deployment-options), [this list](https://mps.rocks/#other-projects), and [WebMPS](https://blog.jetbrains.com/mps/2021/02/webmps-faq/?_ga=2.195764009.441906427.1635067376-1212584208.1633605628) by JetBrains.
    
    - [Web-based projectional editing is moving forward](https://specificlanguages.com/posts/2022-02/15-mps-and-the-web/){{ blog('sl') }}
    - [MPSServer and WebEditKit](https://specificlanguages.com/posts/2022-02/16-mpsserver-and-webeditkit/){{ blog('sl') }}

!!! question "How do you translate every part of MPS?"

    You can install a [language pack](https://plugins.jetbrains.com/search?tags=Language%20Pack) for IntelliJ-based projects. A complete translation of MPS is not feasible because some parts are hard coded. 
    There are also known bugs with extended characters (MPS-31835) and [Unicode](https://youtrack.jetbrains.com/issues/MPS?q=unicode)
    if you want to use special characters.
    The article [Localizing an IntelliJ Plugin](https://www.plugin-dev.com/intellij/general/plugin-localization/) contains further information.

!!! question "Can you get information about an MPS installation via an HTTP request?"

    Getting information is possible through the [IntelliJ Platform REST API](https://www.develar.org/idea-rest-api/):
    Send a GET request (or enter it into the browser address bar): [http://localhost:63342/api/about?more=true](http://localhost:63342/api/about?more=true).
    Ensure that you don’t have IntelliJ opened simultaneously, as it has the same API. Example output:

    ```json
    {
        "name": "MPS 2021.2.5",
        "productName": "MPS",
        "baselineVersion": 212,
        "buildNumber": "212.5284.1355",
        "vendor": "JetBrains s.r.o.",
        "isEAP": false,
        "productCode": "MPS",
        "buildDate": 1647561654804,
        "isSnapshot": false,
        "configPath": "/Users/user/Library/Application Support/JetBrains/MPS2021.2",
        "systemPath": "/Users/user/Library/Caches/JetBrains/MPS2021.2",
        "binPath": "/Applications/mps/mac/MPS-2021.2.app/Contents/bin",
        "logPath": "/Users/user/Library/Logs/JetBrains/MPS2021.2",
        "homePath": "/Applications/mps/mac/MPS-2021.2.app/Contents"
    }
    ```

!!! question "How can you compare two nodes?"

    - Select them in the logical view, right-click --> *Compare two nodes*.
    - Use the language ^^com.mbeddr.mpsutil.nodediff^^:
        - Select the first node: *Set as First Node in Diff*.
        - Select the second node: *Show Diff with First Node*.

!!! question "How do I access the current project from anywhere?"

    - [How to get the current project from anywhere](https://specificlanguages.com/posts/2022-04/27-how-to-get-the-current-project-from-anywhere/){{ blog('sl') }}

!!! failure "jetbrains.mps.module.ModuleClassLoaderIsNullException: ClassLoader of module XY could not be found."
    
    Make sure to avoid setting the solution kind to none.