!!! question "How do I get the textgen for a node?"

    Use the class [TextGeneratorEngine](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.text%28MPS.Core%2F%29%2F%7ETextGeneratorEngine).
    It only works for root nodes such as [ClassConcept](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902ca%28jetbrains.mps.baseLanguage.structure%29%2F1068390468198)
    and returns null when there is no text output.

!!! question "Can I also generate text from the generator aspect?"

    Yes. Use the language `com.dslfoundry.plaintextgen` from [mps-extensions](https://jetbrains.github.io/MPS-extensions/).