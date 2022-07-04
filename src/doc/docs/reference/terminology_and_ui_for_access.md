# Terminology and UI for Access

This section lists the main terms used in this document, including a brief description, their relation to other terms (also via document structure), and the place in the MPS IDE where to access it.

We capitalize all terms with specific meaning to MPS.

## Settings
**UI:**  File menu

All global and project settings.

<a name="global_settings"></a>
### IDE Settings (aka Global Settings)
Settings applied to all projects opened with this MPS installation ([official documentation](https://www.jetbrains.com/help/mps/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.htm)).

<a name="path_variables"></a>
#### Path Variables
**UI:** Entry in Settings Dialog

Variables pointing to some place in the file system. For any path selected in MPS contained within one of these Path Variables, the path is stored relative to the variable. ([official documentation](https://www.jetbrains.com/help/mps/absolute-path-variables.html))

Known pre-defined Path Variables:

* `${module}` containing Module
* `${user.home}` user home directory
* `${language_descriptor}` descriptor file of current language
* `${solution_descriptor}` descriptor file of current solution 
* `${project}` directory containing the Project
* `${mps_home}` directory of MPS installation

Do **not** point Path Variables to a sub-path of another Path Variable, as MPS will always apply the first (pre-defined before user-defined, user-defined in order of definition) one matching.

	INVALID example:
	Path Variable a --> /some/dir
	Path Variable b --> /some/dir/below

<a name="global_libraries"></a>
#### Global Libraries
**UI:** Entry in Settings Dialog

Paths recursively scanned for modules.

<a name="idea_plugin"></a>
#### (IDEA) Plugins
**UI:** Entry in Settings Dialog

A packaged set of contributions to the [IntelliJ IDEA Platform](http://www.jetbrains.org/display/IJOS/Writing+Plug-ins), which MPS is based upon.

Contained in one of the following places:

* `${mps_home}/plugins`
* `«GlobalSettingsDir»/plugins`

There are other things called plugins, known as MPS plugins, bearing no relationship to IDEA Plugins.
However, MPS Plugins can be packaged into IDEA Plugins, just as any other content of MPS.

<a name="project_settings"></a>
### Project Settings
**UI:** Entry in Settings Dialog

Settings applied to one project. Stored in `${project}/.mps/`.


<a name="project_libraries"></a>
#### Project Libraries
**UI:** Entry in Settings Dialog

Paths recursively scanned for modules.

<a name="modules_pool"></a>
## Modules Pool
**UI:** Second root entry in Logical View

All content known to MPS is contained in its *Modules Pool*. This Modules Pool is shared between all windows of the same MPS installation. In some future MPS version, every window should have its independent Modules Pool.

If a Module is contained more than once in the Modules Pool (e.g. present both in the current Project and in a Global Library), the behavior is undefined (i.e. will mess up badly, don't do this).

<a name="mps_window"></a>
## MPS Window
**UI:** *If already open:* Window menu; *New:* File menu, Open..., New Window

Every Project is contained in its own window.

<a name="_project"></a>
## Project
**UI:** First root entry in Logical View

Collection of Modules. A Module can be part of more than one Project. They can be added via "Project Paths" context menu entry of the Project.

Modules can be nested in folders. These folders are stored in the project, i.e. the same Module can be in different folders inside different Projects. Folders are only for visual organization, they don't have any effect on storage location, generation or anything else.

