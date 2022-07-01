In case you have introduced a migration to mbeddr and need to execute, you need to execute it on all MPS projects contained in mbeddr.
Otherwise, the migration will pop up at other people, who work on other parts of mbeddr, which is an unclean workflow.
To avoid this, you can either open all the projects in `mbeddr.core\code\languages` individually and run the migration wizard, but this is very tedious.
A better approach is to use the BigProject contained in the mbeddr repository. This project will load all languages and solutions available in the individual projects, thus you can run a migration once, and it will be executed on all these modules.

1. Open project `mbeddr.core\tools\BigProject` with Intellij Idea (community edition)
2. In Idea click in the menu on `Run > Run BigProjectGenerator`
    1. In case an SDK is not configured, follow the error message in the bottom right corner or via project settings and select a Java 11 SDK installed on your system
    2. use "default" for project language level
    3. In case project compiler output path is not configured, set it to `mbeddr.core\tmp\BigProject`
    4. Close and open the project again to run the project generator.
3. Check generation feedback. It looks like this:
   ```
    === TOTAL ===
    Languages: 214
    Solutions: 305
    Devkits: 22
   ```
4. Open project `mbeddr.core\tools\BigProject` with MPS
5. When the migration wizards starts automatically, execute migrations, otherwise
    1. Check for the popup "Migration suspended" in the right bottom corner. It will tell you, which languages are not build/deployed
    2. (Re-)build all languages in that list (usually all languages and a set of solutions need to be build for the wizard to start automatically)
   
		
