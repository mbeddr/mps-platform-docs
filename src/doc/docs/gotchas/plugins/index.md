!!! question "Where can I use my languages that I have created?[^1]"

    The main platform is MPS itself, or a custom IDE based on MPS (so called RCP).

!!! question "Are MPS language often used as plugins in Intellij IDEs instead of MPS itself? (an IntelliJ IDEA plugin, not custom RCP)"

    No, this functionality is not used very often.

!!! question "How can I find plugins on the JetBrains Marketplace that are usable in MPS?"

    Searching for the word [MPS](https://plugins.jetbrains.com/search?products=mps&search=MPS) in all categories should do the trick.

!!! question "Why do many IntelliJ plugins don't work with MPS?"

    Many of these plugins are working in combination with the text editor. MPS uses custom editors. It doesn't use
    documents and the [Program Structure Interface(PSI)](https://plugins.jetbrains.com/docs/intellij/psi.html) because MPS models are not text based.
    Using plugins that are not developed for MPS can interfere with certain features of MPS (e.g. find usages isn't working anymore).

!!! warning "My plugin is incompatible with the current RCP version."
    Specific Languages Blog &mdash; [Fixing the 'Plugin incompatible with the current [CUSTOM RCP] version' error](https://specificlanguages.com/posts/plugin-incompatible-with-current-version/){target=_blank}

!!! question "Are there any general purpose plugins for MPS from the community?"
    Have a look at the [plugin section](https://mps.rocks/#awesome-MPS) of [mps.rocks](https://mps.rocks).

!!! question "Which kinds of plugins are there?"
    Specific Languages Blog &mdash; [Two kinds of MPS plugins](https://specificlanguages.com/posts/2022-01/24-two-kinds-of-plugins/){target=_blank}

!!! question "How do I disable notifications for fatal errors?"

    Add `idea.fatal.error.notification=disabled` to idea.properties.

!!! question "How can I customize the welcome screen in an RCP?"

    - Specific Languages Blog &mdash; [Customizing your RCP welcome screen: removing unwanted tabs](https://specificlanguages.com/posts/2022-06/13-simplifying-welcome-screen/){target=_blank}
    
    The used library [xml-patch](https://github.com/dnault/xml-patch/) uses XPath path selectors. A cheat sheet for the syntax can be found [here](https://devhints.io/xpath). 
    
    - Specific Languages Blog &mdash; [Customizing your RCP welcome screen: stripping down even further](https://specificlanguages.com/posts/2022-06/14-simplifying-welcome-screen-even-further/){target=_blank}
    - Specific Languages Blog &mdash; [A fully custom welcome screen](https://specificlanguages.com/posts/2022-06/16-custom-welcome-screen/){target=_blank}    

!!! info "I want to know about existing projects regarding MPS in the web."

    Have a look at [Deployment options for MPS](https://www.itemis.com/en/it-services/methods-and-tools/dsls-mps-deployment-options), [this list](https://mps.rocks/#other-projects) and [WebMPS](https://blog.jetbrains.com/mps/2021/02/webmps-faq/?_ga=2.195764009.441906427.1635067376-1212584208.1633605628) by JetBrains.
    
    - Specific Languages Blog &mdash; [Web-based projectional editing is moving forward](https://specificlanguages.com/posts/2022-02/15-mps-and-the-web/){target=_blank}
    - Specific Languages Blog &mdash; [MPSServer and WebEditKit](https://specificlanguages.com/posts/2022-02/16-mpsserver-and-webeditkit/){target=_blank}

!!! info "I want to translate all of MPS.[^2]"

    Install a [language pack](https://plugins.jetbrains.com/search?tags=Language%20Pack) for Intellij. Hardcoded parts of MPS can't be translated.
    There are also known bugs with extented characters [ticket](https://youtrack.jetbrains.com/issue/MPS-31835?_ga=2.198252074.441906427.1635067376-1212584208.1633605628) and [unicode](https://youtrack.jetbrains.com/issues/MPS?q=unicode)
    in general in case you want to use special characters.

[^2]:[Any way to translate the whole MPS?](https://mps-support.jetbrains.com/hc/en-us/community/posts/4407050689042-Any-way-to-translate-the-whole-MPS-)

[^1]:[MPS forum - Plugin](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010679519-Plugin)