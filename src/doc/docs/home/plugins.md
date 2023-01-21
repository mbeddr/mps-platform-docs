---
tags:
- plugins
---

!!! question "Where can you use a created language?[^1]"

    They can be used in MPS itself, or in a custom IDE based on MPS (a so called RCP).

!!! question "Are MPS language often used as plugins in Intellij IDEs instead of MPS itself? (an IntelliJ IDEA plugin, not custom RCP)"

    No, this functionality is not used very often.

!!! question "How can you find plugins on the JetBrains marketplace that are usable in MPS?"

    Searching for the word [MPS](https://plugins.jetbrains.com/search?products=mps&search=MPS) in all categories should do the trick.

!!! question "Why do many IntelliJ plugins don't work with MPS?"

    Many of these plugins operate on lines in a text editor. MPS uses projectional editors which are not normal text editors. It doesn't use
    documents and the [PSI](https://plugins.jetbrains.com/docs/intellij/psi.html) because MPS models are not text based.
    Using plugins that are not developed for MPS can interfere with certain features of MPS (e.g. find usages isn't working anymore).

!!! question "Are there any general purpose plugins for MPS from the community?"
    Have a look at the [plugin section](https://mps.rocks/#awesome-MPS) of [mps.rocks](https://mps.rocks).

!!! question "Which kinds of plugins are there?"

    {{ blog('sl',false) }}[Two kinds of MPS plugins](https://specificlanguages.com/posts/2022-01/24-two-kinds-of-plugins/)

!!! question "How do I disable notifications for fatal errors?"

    Add `#!properties idea.fatal.error.notification=disabled` to [idea.properties](https://www.jetbrains.com/help/mps/tuning-the-ide.html#configure-platform-properties).

!!! question "Are there existing projects regarding MPS on the web?"

    Have a look at [deployment options for MPS](https://www.itemis.com/en/it-services/methods-and-tools/dsls-mps-deployment-options), [this list](https://mps.rocks/#other-projects) and [WebMPS](https://blog.jetbrains.com/mps/2021/02/webmps-faq/?_ga=2.195764009.441906427.1635067376-1212584208.1633605628) by JetBrains.
    
    - {{ blog('sl',false) }}[Web-based projectional editing is moving forward](https://specificlanguages.com/posts/2022-02/15-mps-and-the-web/)
    - {{ blog('sl',false) }}[MPSServer and WebEditKit](https://specificlanguages.com/posts/2022-02/16-mpsserver-and-webeditkit/)

!!! question "How do you translate every part of MPS?[^2]"

    Install a [language pack](https://plugins.jetbrains.com/search?tags=Language%20Pack) for Intellij. Hardcoded parts of MPS can't be translated.
    There are also known bugs with extented characters (MPS-31835) and [unicode](https://youtrack.jetbrains.com/issues/MPS?q=unicode)
    in general in case you want to use special characters.
    Further information can be found in this article: [Localizing an IntelliJ Plugin](https://www.plugin-dev.com/intellij/general/plugin-localization/).

!!! question "Can you get information about a MPS installation via an HTTP request?"

    Yes, this is possible through the [IntelliJ Platform REST API](https://www.develar.org/idea-rest-api/):
    Send a GET request (or enter it into the browser address bar): [http://localhost:63342/api/about?more=true](http://localhost:63342/api/about?more=true).
    Make sure that you don't have IntelliJ opened at the same time as it has the same API. Example output:

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
        - Select first node: *Set as First Node in Diff*.
        - Select second node: *Show Diff with First Node*.

!!! failure "jetbrains.mps.module.ModuleClassLoaderIsNullException: ClassLoader of module XY could not be found."
    
    Make sure that the solution kind is not set to none.
 [^2]:[Any way to translate all of MPS?](https://mps-support.jetbrains.com/hc/en-us/community/posts/4407050689042-Any-way-to-translate-the-whole-MPS-)

[^1]:[MPS forum - Plugin](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010679519-Plugin)