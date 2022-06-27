!!! question "What is this aspect used for?"

    It is part of Shadowmodels in [mps-extensions](https://jetbrains.github.io/MPS-extensions/). Consult the [documentation](https://jetbrains.github.io/MPS-extensions/extensions/shadowmodels/)
    for more information.

!!! question "What is a fork?"

    <img src="../../../img/fork.png" alt="fork" />

    - can group a list of rules which can be applied
    - If there are nodes in the output where one of the transformations would again be applicable, nothing will happen unless you enable the fixpoint mode.
    - If you use the transform keyword it will just copy the input and all its descendants.  
    - If any input concept matches a transformation rule parameter in the auto apply part it will transform the input according to the matched transformation.

!!! question "What does the transform statement do?"

    - has the same meaning as a `COPY_SRC` macro in MPS
    - It will just copy the input node and apply a rule.