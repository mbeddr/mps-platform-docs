---
title: Feedback Aspect
hide:
- toc
tags:
- aspect
---

# Feedback Aspect

The feedback aspect defines custom messages to show to the user when an error or a warning is detected in the model.

- [official documentation](https://www.jetbrains.com/help/mps/feedback.html)

!!! question "Can I override error messages? Can I customize any messages that way?"

    Yes, in this aspect: [Feedback - MPS](https://www.jetbrains.com/help/mps/feedback.html). No, only the messages that 
    support overriding.

!!! question "Can I use parameters such as the node or concept in the custom message? Can I add new parameters?"

    Use the code completion in the show message part of the editor, for example, `%concept`. New parameters can't be added because
    they are hard coded.

!!! question "Where can I find these messages in the MPS source code?"

    Some of those checks come from the [structure checker](https://github.com/JetBrains/MPS/blob/master/core/project-check/source/jetbrains/mps/project/validation/StructureChecker.java).
    There is also the [reference scope checker](https://github.com/JetBrains/MPS/blob/master/core/project-check/source/jetbrains/mps/checkers/RefScopeChecker.java) and the 
    [ConstraintsChildAndPropFacade](https://github.com/JetBrains/MPS/blob/master/core/kernel/source/jetbrains/mps/smodel/constraints/ConstraintsChildAndPropFacade.java), which applies checks.
    