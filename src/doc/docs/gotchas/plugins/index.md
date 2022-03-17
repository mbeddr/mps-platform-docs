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

[^1]:[MPS forum - Plugin](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010679519-Plugin)