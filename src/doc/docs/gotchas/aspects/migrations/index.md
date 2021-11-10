!!! question "What are the best practises?[^1]"
    Have a look at [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403121681810/comments/4403173175826).

!!! question "I want to migrate an MPS project that is many years old. How do I do that?"

    For old projects you have to edit the module files manually because the structure slightly changed. Open the .mpl files in an text editor
    and change all occurences of `<language id="%ID" fqName="%FQNAME" version="%VERSION" />` into 
    `<language slang="l:%ID:%FQNAME" version="%VERSION" />`. The next step is to start the migration assistant. It will fail because it can't find
    migrations for some language versions. For example: jetbrains.mps.lang.editor only has a migration starting with version 7.You have to find all occurences
    of this language in your project with an terxt editor and change the attribute version to 7. Then run the migration assistant again and hope that everything
    works. Some concepts cannot be migrated automatically such as the substitute and transformation menues. There will also be other issues that have to be fixed manually.

[^1]:[MPS forum - Migration scripts best practice](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403121681810-Migration-scripts-best-practic)
