# Gradle Tips

| Item               | Description                                                                                                                                                                                                                                                                                |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Closures           | The closure does `it (delay)  {}` which will delay the value propagation to execution instead of configuration time.                                                                                                                                                                       |
| buildAll scripts   | This is the meta build script. this build model is generated and its artifact (ant-xml task) is committed to the gradle repo.                                                                                                                                                              |
| Project properties | <ul><li>can be defined as *ext.myPropName*</li><li>passed through: -<b>P</b>myPop_name from CL</li><li> can be access like variables in the build project</li><li>can be checked if the are set or not </li></ul>                                                                          |
| System properties  | <ul><li>passed through <b>-D</b> from CL</li><li>are available in the gradle build file though norma java mechanism: <i>System.getProperty();</i></li><li>Project properties can be specified as system properties. They need to be prefixed with <i>org.gradle.project.NAME</i></li></ul> |
| gradle.properties  | <ul><li>are by default project properties</li><li>if they are prefixed with systemProp. they are system properties</li></ul>                                                                                                                                                               |
| Configurations     | are also separated in the same way as dependencies                                                                                                                                                                                                                                         |

## Dependencies

### Dependencies **inside** the buildScript{...} block

- are placed on the classpath of the build script itself (for the current gradle file which will also be compiled (like java))
- To be able to “compile” my buildscript into bytecode, its dependencies need to be resolved

### Dependencies **outside** the buildScript{...} block

- are project dependencies
- these dependencies are added to the project code’s classpath
- example: GSON ist used inside a gradle project and gson needs to be on the classpath of the project to be able to compile the project.

If the dependency in only used in the buildscript (i.e. only from the build.gradle file) then it should be in a ‘buildscript { }’ block. Dependencies used in both project code and build scripts will effectively need to be listed twice.

A good explanation of gradle configurations can be found [here](https://medium.com/agorapulse-stories/gradle-configurations-explained-4b9608dd5e35).

## Creating a gradle plugin

There are three choices:

- build script
- buildSrc project
- standalone project

### Standalone project
- define all dependencies in gradle file
- create a properties file in the resource folder with the same name as the plugin id
    - example:  `org.samples.greeting.properties` in `src/main/resources/META-INF/gradle-plugins/`
- plugin IDs
    - full qualified identifiers, similar to Java packages
    - Use pattern component/company/plugin-name
    - examples
        - `com.github.[name].[plugin-name]`
        - `com.github.[arimer].[migration-checker]`