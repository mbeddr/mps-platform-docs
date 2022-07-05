!!! question "How do I write an importer?"

    - Specific Languages Blog &mdash; [Writing an importer: Introduction](https://specificlanguages.com/posts/2022-01/06-writing-an-importer-introduction/){target=_blank}
    - Specific Languages Blog &mdash; [Writing an importer: Adding the action to a menu](https://specificlanguages.com/posts/2022-01/14-writing-an-importer-adding-action-to-menu/){target=_blank}
    - Specific Languages Blog &mdash; [Writing an importer: Invoking from the editor](https://specificlanguages.com/posts/2022-01/18-writing-an-importer-invoking-from-editor/){target=_blank}
    - Specific Languages Blog &mdash; [Writing an importer: Error handling considerations](https://specificlanguages.com/posts/2022-01/25-writing-an-importer-error-handling-considerations/){target=_blank}
    - Specific Languages Blog &mdash; [Writing an importer: Updating existing nodes](https://specificlanguages.com/posts/2022-02/14-writing-an-importer-updating-existing-nodes/){target=_blank}

!!! question "Where do I put my JARs?"
    Specific Languages Blog &mdash; [Where do I put my JARs?](https://specificlanguages.com/posts/2022-03/04-where-do-i-put-my-jars/){target=_blank}

## Files

!!! info "I want to load an external file into MPS / I want to migrate existing data into MPS.[^1]"

    Write a solution that imports the files and converts them to your model or use custom persistence.
    [Here](https://specificlanguages.com/posts/2022-01/06-writing-an-importer-introduction/) is a tutorial series to get started
    Make sure to search the [other posts](https://specificlanguages.com/posts/) for followup posts of this tutorial.

## Tools

!!! info "I want to run an LSP server for MPS grammars."
    There is no support for this in IntelliJ products (see [IDEABKL-7409](https://youtrack.jetbrains.com/issue/IDEABKL-7409))
    and also no implementation in MPS.

!!! info "I want to use databases in MPS."

    - MPS doesn't have any special support for databases or for example Spring Boot  (unlike IntelliJ IDEA) .
    - Specific Languages Blog &mdash; [MPS is not a (relational) database](https://specificlanguages.com/posts/2022-01/12-mps-is-not-a-relational-database/){target=_blank}

!!! info "I want to create a standalone utility (not a complete IDE) for language generation with MPS.[^2]"

    Not possible at the moment but you can interact with MPS models from Java when you setup the necessary dependencies:
    ``` Java
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

!!! info "I want to share MPS snippets."

    You can use [Skadi Cloud Gists](https://blog.logv.ws/2021/10/19/skadi-cloud-gist-2/).

!!! info "I want to run MPS in the browser."

    You can try [Skadi Cloud](https://skadi.cloud/).

!!! question "How do I correctly run git clean?"
    Specific Languages Blog &mdash; [mpsclean](https://specificlanguages.com/posts/2022-01/17-mpsclean/){target=_blank}

[^1]:[MPS forum - How to migrate existing data into MPS?](https://mps-support.jetbrains.com/hc/en-us/community/posts/360010855700-How-to-migrate-existing-data-into-MPS-)
[^2]:[MPS forum - Standalone language generator](https://mps-support.jetbrains.com/hc/en-us/community/posts/360006153579-Standalone-language-generator)