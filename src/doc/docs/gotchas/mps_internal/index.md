# CoreComponent

!!! question "How to I get MPS core components from code?"

    From the console:
    ``` Java
    MPSProject p = ((MPSProject) #project); 
    Platform host = (Platform) p.getPlatform();
    #print host.findComponent(MakeServiceComponent.class);
    ```
!!! question "How to I convert between different Project classes?"
    Use the class [ProjectHelper](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.ide.project%28MPS.Platform%2F%29%2F%7EProjectHelper).

!!! question "What interesting MPS utility classes can I use in my code?"
    - [DirUtil](http://127.0.0.1:63320/node?ref=r%3Af8580193-afc4-4673-a635-d4757ca591cf%28jetbrains.mps.internal.make.runtime.util%29%2F6106640680373200863) - directory related utilities
    - [MatchingUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.lang.pattern.util%28MPS.Core%2F%29%2F%7EMatchingUtil) - check if two nodes match
    - [SubtypingUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.newTypesystem%28MPS.Core%2F%29%2F%7ESubtypingUtil) - subtyping related utilities
    - [CopyUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel%28MPS.Core%2F%29%2F%7ECopyUtil) - utility for copying models, nodes etc.
    - [FileUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7EFileUtil) - file related utilities
    - [JavaNameUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7EJavaNameUtil) utilities related to java naming
    - [NameUtil](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.util%28MPS.Core%2F%29%2F%7ENameUtil) - name related utilities such as pluralizing or escaping strings
    - [CopyPasteUtil](http://127.0.0.1:63320/node?ref=r%3A84719e1a-99f6-4297-90ba-8ad2a947fa4a%28jetbrains.mps.ide.datatransfer%29%2F6299533519672638253)/[TextPasteUtil](http://127.0.0.1:63320/node?ref=r%3A84719e1a-99f6-4297-90ba-8ad2a947fa4a%28jetbrains.mps.ide.datatransfer%29%2F6299533519672652334) - copy paste related utilities
    - [ActionUtils](http://127.0.0.1:63320/node?ref=742f6602-5a2f-4313-aa6e-ae1cd4ffdc61%2Fjava%3Ajetbrains.mps.workbench.action%28MPS.Platform%2F%29%2F%7EActionUtils) - action related utilities; can be used to execute an action programmatically
    - [NewModuleUtil](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895904ab%28jetbrains.mps.ide.newSolutionDialog%29%2F5890305283801268194) - utilities related to created new modules such as creating solutions or languages
    - [TemporaryModels](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.smodel.tempmodel%28MPS.Core%2F%29%2F%7ETemporaryModels) - utilities for creating temporary models
    - [UIUtil](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.util.ui%28MPS.IDEA%2F%29%2F%7EUIUtil) - utilities related to the Intellij UI such as checking for dark mode (isUnderDarcula()).

!!! warning "I want to change something inside a SModule such as adding a dependency but can't find the right method."
    Try casting it to [AbstractModule](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.project%28MPS.Core%2F%29%2F%7EAbstractModule) first.

!!! question "How does class loading work in MPS?"
    See [this comment](http://127.0.0.1:63320/node?ref=6ed54515-acc8-4d1e-a16c-9fd6cfe951ea%2Fjava%3Ajetbrains.mps.classloading%28MPS.Core%2F%29%2F9026887257679817888),
    [Dependencies and Classpath in MPS](https://github.com/mbeddr/mbeddr.core/wiki/MPS:-Deps-and-Classpath) and [classloading issues](https://github.com/mbeddr/mbeddr.core/wiki/Misc-Topics#classloading-issues).
