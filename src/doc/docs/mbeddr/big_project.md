If you have introduced a migration to mbeddr and need to execute, you need to execute it on all MPS projects contained in mbeddr.
Otherwise, migrations pop up at for other people who work on other parts of mbeddr. This is an unclean workflow.
To avoid this, you can either open all the projects in `mbeddr.core\code\languages` individually and run the migration wizard, but this is tedious.
A better approach is to use the BigProject contained in the mbeddr repository. This project loads all languages and solutions available in the individual projects, thus you can run a migration once that executes on all these modules.

1. Open project `mbeddr.core\tools\BigProject` with IntelliJ IDEA community edition.
2. In Idea click in the menu on `Run > Run BigProjectGenerator`
    1. If an SDK isn't configured, follow the error message in the bottom right corner or via project settings and select a Java 11 SDK installed on your system
    2. use "default" for project language level
    3. If a project compiler output path isn't configured, set it to `mbeddr.core\tmp\BigProject`
    4. Close and open the project again to run the project generator.
3. Check generation feedback. It looks like this:
   ```
    === TOTAL ===
    Languages: 214
    Solutions: 305
    Devkits: 22
   ```
4. Open project `mbeddr.core\tools\BigProject` with MPS
5. When the migration wizard starts automatically, execute migrations, otherwise
    1. Check for the popup "Migration suspended" in the right bottom corner. It tells you, which languages aren't built /deployed
    2. Build or rebuild all languages in that list. Usually, MPS must build all languages and a set of solutions for the wizard to start automatically.
   
		
