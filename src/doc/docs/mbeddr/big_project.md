---
tags:
- mbeddr
- utility
---

If you have introduced a migration to mbeddr and need to execute it, you need to execute it on all MPS projects contained in mbeddr.
Otherwise, migrations pop up for people working on other parts of mbeddr. This workflow would be unclean.
To avoid this, you could open all the projects in `mbeddr.core\code\languages` individually and run the migration wizard, but this is tedious.
A better approach is to use the BigProject contained in the mbeddr repository. This project loads all languages and solutions available in individual projects. Thus you can run a migration once that executes on all these modules.

## New Usage

- From the command line: run `gradlew.bat :BigProject:run` or `./gradlew :BigProject:run` from the Git checkout root.
- From IntelliJ IDEA: Open the Git checkout root as a (Gradle) project in IDEA and run Generate Big Project run configuration.

## Old Usage

1. Open project `mbeddr.core\tools\BigProject` with IntelliJ IDEA community edition.
2. In IntelliJ IDEA, click in the menu on *Run* --> *Run BigProjectGenerator*.
    1. If you didn't configure an SDK, follow the error message in the bottom right corner or via project settings and select a Java 11/17 SDK (depending on the MPS version) installed on your system.
    2. Use *default* for the project language level.
    3. If you didn't configure a project compiler output path, set it to `mbeddr.core/tmp/BigProject`.
    4. Close and open the project again to run the project generator.
3. Check generation feedback. It looks like this:
   ```
    === TOTAL ===
    Languages: 214
    Solutions: 305
    Devkits: 22
   ```
   
## Next Steps

1. Open project `mbeddr.core\tools\BigProject` with MPS.
2. When the migration wizard starts automatically, execute migrations, otherwise:
    1. Check for the popup *Migration suspended* in the bottom right corner. It tells you which languages need to be built/deployed.
    2. Build or rebuild all languages in that list. Usually, MPS must build all languages and a set of solutions for the wizard to start automatically.
   
		
