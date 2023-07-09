---
title: Migration Aspect
tags:
- aspect
---

# Migration Aspect

> To nicely support language evolution, migrations automatically upgrade client code to use the latest version of a language or multiple languages.
>
> — <cite>MPS documentation</cite>

- [official documentation](https://www.jetbrains.com/help/mps/migrations.html)
- [MPS, Feature Branches and Language Migrations: DOs and DON’Ts](https://languageengineering.io/mps-feature-branches-language-migrations-dos-and-donts-bbce593eee4d)(languageengineering.io)
- [Preparing migrations with Git rebase](https://specificlanguages.com/posts/2022-05/27-preparing-migrations-with-git-rebase/){{ blog('sl') }}
- [Checking for pending migrations](https://specificlanguages.com/posts/2022-05/02-checking-for-pending-){{ blog('sl') }}

## General

!!! question "How do I search for instances of a deprecated concept?"

    - [Migrations: Searching for instances](https://specificlanguages.com/posts/2022-06/01-migrations-searching-for-instances/){{ blog('sl') }}

!!! question "How do I remove migrations?"

    - [Removing migrations](https://specificlanguages.com/posts/2022-03/21-removing-migrations/){{ blog('sl') }}

!!! question "I want to migrate an MPS project that's many years old. How do you do that?"

    First of all, make sure that you don't skip too many MPS versions; otherwise, the migration won't succeed. For old projects, you have to edit the module files manually because the structure slightly changed. Open the .mpl files in a text editor
    and change all occurrences of `<language id="%ID" fqName="%FQNAME" version="%VERSION" />` into 
    `<language slang="l:%ID:%FQNAME" version="%VERSION" />`. 

    The next step is to start the migration assistant. It will fail because it can't find migrations for some language versions.
    For example, ^^jetbrains.mps.lang.editor^^ only has a migration starting with version 7. You have to find all occurrences
    of this language in your project with a text editor and change the attribute version to 7. Then run the migration assistant again and hope that everything
    works. Some concepts cannot be migrated automatically, such as the substitute and transformation menus. There will also be other issues that have to be fixed manually.

!!! hint "I want to replace node *A* with another node *B* where *A* and *B* share the same super-concept."

    Use the class [RefactoringRuntime](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765036703346). This class can be used to set/unset properties or replace nodes with other ones.
    Example: `RefactoringRuntime.replaceWithNewConcept(old, concept/ComponentConfigRef/)`

!!! question "Are there any best practices for feature branches and language migrations?"

    - [languageengineering.io: MPS, Feature Branches and Language Migrations: DOs and DON'Ts](https://languageengineering.io/mps-feature-branches-language-migrations-dos-and-donts-bbce593eee4d)

!!! question "How can you detect that migrations are running?"

    > I have code that needs to know if migrations are currently executed, e.g., model listeners that update the model when a change by the user appears.
    
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
    {{ contribution_by('abstraktor') }}

!!! question "How can you find all references to a specified root node and change these references so they point to another root node?"

    Search through the methods in [RefactoringRuntime](http://127.0.0.1:63320/node?ref=528ff3b9-5fc4-40dd-931f-c6ce3650640e%2Fr%3Af69c3fa1-0e30-4980-84e2-190ae44e4c3d%28jetbrains.mps.lang.migration.runtime%2Fjetbrains.mps.lang.migration.runtime.base%29%2F4853505765036703346).

    Example with finders:

    ```java
    SearchResults<node<>> results = execute finders(NodeUsages, node, unspecified scope, <default>); 

    foreach result in results.getSearchResults() {
    node<> resultObject = result.getObject();
    sequence<reference> references = resultObject.references.where({~it => it.target :eq: node; });
    references.forEach({~it => resultObject/.setReferenceTarget(it.link, reuseact); });
    }
    ```
!!! question "What are module versions, and how/why can other modules depend on modules with different versions than the current module version?"

    You start with language and module version 0.
    Reasons why the language version of a language updates:
    
    - A new migration was added manually.
    - You've executed the action "Correct Language Version."
    - You've set it manually in the module properties.
    - A concept was moved to a different language through the refactoring menu, and a migration script was written.
    
    Reasons why the module version of a language updates:
    
    - You've set it manually in the module properties.
    - A concept/property/link was moved to a different language through the refactoring menu, and a refactoring log was written.
    
    Reasons why both versions don't update:
    
    - The language was renamed.
    - Nodes/models are moved to a different solution.
    
    The module version of a solution can't change automatically. I also don't know why you would change it manually. Devkits don't even have the option to change the module version.
    A good example of a language with different language and module versions is ^^jetbrains.mps.lang.feedback.problem.scopes^^ (language: 0, module: 1) because it only has a refactoring step but no other migrations.

## Troubleshooting

- [The migration frustration](https://specificlanguages.com/posts/2022-03/31-the-migration-frustration/){{ blog('sl') }}

!!! failure "When creating root nodes as part of language migration via *java model\.add root(someRoot)*, it throws the exception *UnsupportedOperationException*."

    Make sure that the affected model is not non-editable.

[^1]:[MPS forum - Migration scripts: the best practice](https://mps-support.jetbrains.com/hc/en-us/community/posts/4403121681810-Migration-scripts-best-practic)
