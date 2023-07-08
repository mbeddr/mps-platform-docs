# Terminology and User Interface for Access

This section lists terms that aren't mentioned in the MPS guide or aren't explained well. [MPS project structure](https://www.jetbrains.com/help/mps/mps-project-structure.html) should give an overview of the most important terms.

## Settings

**UI**: File menu

All global and project settings.

### Ide Settings (AKA Global Settings)

Settings applied to all projects opened with this MPS installation ([official documentation](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.htm)).

#### (IDEA) Plugins

**UI**: entry in the settings dialog

A packaged set of contributions to the [IntelliJ IDEA platform](https://plugins.jetbrains.com/docs/intellij/welcome.html), on which MPS is based upon.

Contained in one of the following places:

- *${mps_home}/plugins*
- *«GlobalSettingsDir»/plugins*

MPS plugins bear no relationship to IDEA Plugins.
However, you can package MPS plugins into IDEA plugins, just as any other content of MPS.

### Project Settings

**UI**: Entry in the settings dialog

Settings applied to one project. Stored in *${project}/.mps/*.

## Modules Pool

**UI**: second root entry in the logical view

All content known to MPS is contained in its modules pool. This modules pool is shared between all windows of the same MPS installation. In some future MPS version, every window should have its independent modules pool.

If a module is contained more than once in the modules pool (e.g. present both in the current project and in a global Library), the behavior is undefined (i.e. will mess up badly, don't do this).


## MPS Window

**UI**: If already open: *Window* menu, *New* File* menu: *Open...* --> *New Window*

Every Project is contained in its own window.

## Project

**UI**: first root entry in the logical view

A project is a collection of modules. A module can be part of more than one project. They can be added via the *Project Paths* context menu entry of the project.

Modules can be nested in folders. These folders are stored in the project, i.e. the same module can be in different folders inside different Projects. Folders are only for visual organization, they don't have any effect on storage location, generation, or anything else.

!!! question "What are some known predefined path variables?"

    - *&#36{module}*: the containing module
    - *&#36{user.home}*: the user home directory
    - *&#36{language_descriptor}*: the descriptor file of the  current language
    - *&#36{solution_descriptor}*: the descriptor file of the current solution
    - *&#36{project}*: the directory containing the project
    - *&#36{mps_home}*: the directory of th MPS installation
    
    Don't point path variables to a subpath of another path variable. MPS always applies the first (predefined before user-defined, user-defined in order of definition) one matching.

	INVALID example:

	- Path Variable *a* --> /some/dir
	- Path Variable *b* --> /some/dir/below

