!!! question "What are the best practises?[^1]"
    Have a look at [this answer](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403121681810/comments/4403173175826).

!!! question "I want to migrate an MPS project that is many years old. How do I do that?"

    For old projects you have to edit the module files manually because the structure slightly changed. Open the .mpl files in an text editor
    and change all occurences of `<language id="%ID" fqName="%FQNAME" version="%VERSION" />` into 
    `<language slang="l:%ID:%FQNAME" version="%VERSION" />`. The next step is to start the migration assistant. It will fail because it can't find
    migrations for some language versions. For example: jetbrains.mps.lang.editor only has a migration starting with version 7.You have to find all occurences
    of this language in your project with an terxt editor and change the attribute version to 7. Then run the migration assistant again and hope that everything
    works. Some concepts cannot be migrated automatically such as the substitute and transformation menues. There will also be other issues that have to be fixed manually.

!!! hint "I want to replace a node A with another node B where A and B share the same super concept."

    Use the class [RefactoringRuntime](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765036703346). This class can be use to set/unset property or replace nodes with other ones.
    Example: `RefactoringRuntime.replaceWithNewConcept(old, concept/ComponentConfigRef/)`

!!! question "Are there any best practises concerning feature branches and language migrations?"

    - [languageengineering.io &mdash; MPS, Feature Branches and Language Migrations: DOs and DON'Ts](https://languageengineering.io/mps-feature-branches-language-migrations-dos-and-donts-bbce593eee4d)

!!! question "How can I detect that migrations are running?"

    > I have code that needs to know if migrations are currently executed e.g. modelisteners that update the model when a change by the user appears.
    
    > I would like to detect when migrations are executed to prevent this code from executing in the middle of a migration to prevent manipulating the model in an incomplete state during the migration.

    `#!java PersistenceRegistry.getInstance().isFastSearch()` returns `false` while migrations are running. You can check it in the model lister:

    ```java
    model listener for MyNode { 
        child added in role values (instance, child)->void {
        // don't run as part of migrations.
        if(!PersistenceRegistry.getInstance().isFastSearch()) { return; }
        }
    }
    ```
    
    <sub>Contribution by: [@abstraktor](https://github.com/abstraktor)<sub>

[^1]:[MPS forum - Migration scripts best practice](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403121681810-Migration-scripts-best-practic)
