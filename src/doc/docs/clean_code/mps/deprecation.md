---
comments: true
hide:
- toc
tags:
- baselanguage
- best_practise
---

You can find deprecated code through *Main menu* --> *Migration* --> *Deprecated Code*. Many found instances in the MPS
codebase are deprecated for many years. They could get unsupported or removed in any new MPS version, so make sure to
find a replacement for such code early.

## SRepository

SRepositories store modules and needs to be referenced directly when you don't want to use the deprecated concepts.
The automatically used global repository that was used in earlier MPS versions is deprecated and might be unsupported in the future.

- Don't use commands from the access language without a repository (see: [access language](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage)). 
- Don't use [node/myNode](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1219352745532). Use [node-ptr](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F7400021826774799413)(myNode).resolve(repository) instead.
- Don't use [model/myModel](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F559557797393017698). Use [model-ptr](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1863527487546129879)(myModel).resolve(repository) instead.
- Don't use [module/myModule](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F4040588429969021681) or [language-module](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F4040588429969069898). Use [module-reference/myModule](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1678062499342629858) instead.

## Other deprecation

This section lists some other common deprecated code.

- Don't use [linkNode/concept:link/](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1226359078165). Use [link:concept:link/](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F2644386474301421077) instead.
- Don't use [conceptNode/concept/](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1172424058054). Use [concept/concept/](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F2644386474300074836) instead.
- Don't use [node.delete](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1140133623887). Use [node.detach](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1228341669568) instead.
- Don't use [node.containingRole](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F1960721196051541146). Use [node.getContainmentLink](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590301%28jetbrains.mps.lang.smodel.structure%29%2F7504436213544206332) instead.
- Don't use the interface [IDon'tSubstituteByDefault](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590288%28jetbrains.mps.lang.core.structure%29%2F1835621062190663819). Create an empty default substitute menu for the concept instead.
- Don't use [print](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959057f%28jetbrains.mps.baseLanguage.logging.structure%29%2F1168401810208), `#!java System.out` or `#!java System.err` for logging. Use [log](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959057f%28jetbrains.mps.baseLanguage.logging.structure%29%2F2034914114981261497) for low-level logging or [message](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959057f%28jetbrains.mps.baseLanguage.logging.structure%29%2F6332851714983831325) for high-level logging instead.
- Use the explicit presentation of a node when used in a string. For example: `#!java "my node: " + node.getPresentation()` instead of `#!java "my node: " + node`.
- Don't use counter variables in LoopMacro. Use `#!java LOOP index` in the code instead.
- Don't use [IOperationContext](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel%28MPS.Core%2F%29%2F%7EIOperationContext). You can find more info in the attached comment on the interface.