---
tags:
- files
- tools
---

## Import/export

!!! question "How do you write an importer?"

    - {{ blog('sl',false) }}[Writing an importer: Introduction](https://specificlanguages.com/posts/2022-01/06-writing-an-importer-introduction/)
    - {{ blog('sl',false) }}[Writing an importer: Adding the action to a menu](https://specificlanguages.com/posts/2022-01/14-writing-an-importer-adding-action-to-menu/)
    - {{ blog('sl',false) }}[Writing an importer: Invoking from the editor](https://specificlanguages.com/posts/2022-01/18-writing-an-importer-invoking-from-editor/)
    - {{ blog('sl',false) }}[Writing an importer: Error handling considerations](https://specificlanguages.com/posts/2022-01/25-writing-an-importer-error-handling-considerations/)
    - {{ blog('sl',false) }}[Writing an importer: Updating existing nodes](https://specificlanguages.com/posts/2022-02/14-writing-an-importer-updating-existing-nodes/)

    Alternative solution: use [custom persistence](https://www.jetbrains.com/help/mps/custom-persistence-cookbook.html).

!!! question "How do you deal with errors when writing an importer?"

    - Create a new tab in the messages view and show the errors.
    - Create error concepts in the language. If the import fails for a particular node, it can be replaced with one of these error nodes in the output model and some error message can be appended. By doing this you can also implement checking rules for the error nodes so that they errors also are displayed as part of model checking. You can also use finders to find all occurrences of errors in the model.

!!! question "Is there a wizard available to set up an MPS language based on an XML schema (defined in .xsd files)?"

    No, not possible at the moment but you can create new projects from local or GitHub hosted templates with [Lochkarte](https://github.com/coolya/Lochkarte).

!!! question "Where do you put JARs?"
    
    Specific Languages blog: [Where do I put my JARs?](https://specificlanguages.com/posts/2022-03/04-where-do-i-put-my-jars/)

## Tools

!!! question "How can you run an LSP server for MPS grammars?"

    There is no support for this in IntelliJ products (see IDEABKL-7409) and also no implementation exist in MPS.

!!! question "How can you use databases in MPS?"

    - MPS doesn't have any special support for databases or for frameworks such as Spring Boot (unlike IntelliJ IDEA) .
    - {{ blog('sl',false) }}[MPS is not a (relational) database](https://specificlanguages.com/posts/2022-01/12-mps-is-not-a-relational-database/)

!!! question "How can you create a standalone utility (not a complete IDE) for language generation with MPS?[^2]"

    This is not possible at the moment but you can interact with MPS models from Java when you setup the necessary dependencies:

    ```java
    import jetbrains.mps.smodel.ModelAccess;
    import jetbrains.mps.tool.environment.EnvironmentConfig;
    import jetbrains.mps.project.Project;
    import jetbrains.mps.tool.environment.MpsEnvironment;
    import org.jetbrains.mps.openapi.model.SModel;
    import org.jetbrains.mps.openapi.module.SModule;
    
    import java.io.File;
    
    public class Test {
        static String projectDir = "your MPS project path";
    
        public static void main(String[] args) {
            EnvironmentConfig config = EnvironmentConfig.emptyConfig();
            MpsEnvironment ourEnv = new MpsEnvironment(config);
            ourEnv.init();
            Project myProject = ourEnv.openProject(new File(projectDir));
            myProject.getModelAccess().runReadAction(() -> {
                for(SModule module:myProject.getProjectModules()) {
                    for(SModel model:module.getModels()) {
                    System.out.println(model.getName());
                    }
                }
            });
        }
    }
    ```

!!! question "How can you share MPS snippets?"

    You can use [Skadi Cloud Gists](https://gist.skadi.cloud).

!!! question "How can you run MPS in the browser?"

    You can try [Skadi Cloud](https://skadi.cloud/). There is also [Modelix](https://github.com/modelix/modelix) and [JetBrains Projector](https://blog.logv.ws/2021/03/16/jetbrains-projector-a-game-changer-for-jetbrains-mps-projects/).

!!! question "How can you embed a web browser in MPS?"

    Since Intellij 2020.1 it is possible to use the [Java Chromium Embedded Framework](https://plugins.jetbrains.com/docs/intellij/jcef.html).
    Create a new swing component in the editor:
    ```java
    JBCefBrowser myBrowser = new JBCefBrowser(myUrl);
    return myBrowser.getComponent();
    ```
 [^1]:[MPS forum - How to migrate existing data into MPS?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010855700-How-to-migrate-existing-data-into-MPS-)
[^2]:[MPS forum - Standalone language generator](https://mps-support.jetbrains.com/hc/en-us/community/posts/360006153579-Standalone-language-generator)