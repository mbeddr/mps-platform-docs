Basic code:

```java
public class CommandLineTool { 
   
  public static void main(string[] args) throws Exception {
    final string projectPath = /* (1) Get project path, e.g. from args or system properties */;

    final EnvironmentConfig config = EnvironmentConfig
      .emptyConfig()
      .withDefaultPlugins()
      .withBootstrapLibraries();
    config.addPlugin("http-support", "jetbrains.mps.ide.httpsupport");
    final IdeaEnvironment env = new IdeaEnvironment(config);
    env.init();

    final Project project = env.openProject(new File(projectPath));
    Throwable thrown = null;
    try {
        doSomething(); // 2
    } catch (Exception e) {
      thrown = e;
    } finally {
      env.dispose();
    }
    if (thrown != null) {
      System.err.println("ERROR:");
      thrown.printStackTrace();
      System.exit(1);
    } else {
      // System.exit is needed even in case of success to kill threads that MPS plugins may be leaving behind.
      System.exit(0);
    }
  }
}
```

What can you do with the project (at point 2)? Here is how you invoke a static method `foo()` on class `Bar` in module `Baz`:

```java
ModuleRepositoryFacade facade = new ModuleRepositoryFacade(project);
ReloadableModule module = (ReloadableModule) (facade.getModule(module-reference/Baz/));
Class<?> classToInvoke = module.getClass("somepackage.Bar");
Method methodToInvoke = classToInvoke.getMethod("foo");
methodToInvoke.invoke(null);
```

Why all the reflection tricks and why not call the class directly instead? The answer is that when MPS is initialized and a project is opened, it sets up classloaders for us, putting on the classpath any dependencies that module `Baz` might have, so we don't have to specify them ourselves.

We still need to have on the classpath the initial set of JARs to run our class and start MPS. Here is how you would run our tool from Gradle:

```groovy
task runCommandLineTool(type: JavaExec) { 
    main = 'CommandLineTool' 
    classpath file('solutions/commandline/classes_gen') // Location of CommandLineTool.class
    classpath fileTree("$mps_home/lib") // $mps_home points to the MPS installation
}
```

Alternatively, MSP can be added to the gradle dependencies block:

```groovy
dependencies {
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.7.2'
    testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine:5.7.2'
    implementation fileTree("$mps_home/lib")
}
```