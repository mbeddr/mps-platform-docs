---
comments: true
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

## Next Steps

1. Open project `mbeddr.core\tools\BigProject` with MPS.
2. When the migration wizard starts automatically, execute migrations, otherwise:
    1. Check for the popup *Migration suspended* in the bottom right corner. It tells you which languages need to be built/deployed.
    2. Build or rebuild all languages in that list. Usually, MPS must build all languages and a set of solutions for the wizard to start automatically.
   
		
