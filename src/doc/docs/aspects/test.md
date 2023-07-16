---
title: Test Aspect
tags:
- aspect
---

# [Test Aspect](https://www.jetbrains.com/help/mps/testing-languages.html)

> Testing is an essential part of a language designer's work.
>
> — <cite>MPS documentation</cite>

- [Testing in MPS: What and Why](https://languageengineering.io/testing-in-jetbrains-meta-programming-system-what-and-why-3efd4f52f236){{ blog('langio') }}
- [The Language Testing Triangle](https://markusvoelter.medium.com/the-language-testing-triangle-917214826e93){{ blog('mv') }}

## General

Fore more information about testing in general, read [MPS Internals | Testing](testing.md).

!!! question "Can you add an annotation to skip tests like it usually works with JUnit?"

    It isn't supported. You must comment out the test case or add the \@Ignore attribute in the reflective editor. The only official statement supporting this functionality is the *assert* statement of KernelF ({{ mps_url("@iets3.AssertTestItem") }}).

!!! question "What's the *TestInfo* node used for?"

    [How to create a TestInfo node for your tests](https://specificlanguages.com/posts/how-to-create-testinfo-node-for-your-tests/){{ blog('sl') }}

!!! warning "How do node tests work?"

    [How do node tests work?](https://specificlanguages.com/posts/2022-02/23-how-node-tests-work/){{ blog('sl') }}

!!! question "Can you invoke an action by ID?"

    Yes, use the statement *invoke action by id*.

!!! question "How do you enter multiple words when using the *type* statement in an editor test?"

    Enter them as one long word without spaces in between, for example, *publictransientclass*.

!!! warning "How to know if some MPS code is inside a test?"

    > I am writing some code in MPS that is supposed to run if we're not running tests. How can I detect if I'm running a test?

    1. Consider mocking something out instead or ensuring that you are testing on a low-enough level.
    2. Here are two options if you need to do this:

    ```java
    // true if running tests from inside the MPS process or from the command line
    jetbrains.mps.RuntimeFlags.getTestMode().isInsideTestEnvironment()
   
    // true if running tests from the command line only
    jetbrains.mps.RuntimeFlags.isTestMode()
    ```

    {{ contribution_by('abstraktor') }}

!!! question "How do I access the current project inside a node test case?"

    There is a [project](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590388%28jetbrains.mps.lang.test.structure%29%2F1225467090849) expression that you should use.

??? question "Why does the node ID change during a node test?"

    > Given I have a node test case. My test case has a check node called *data*, and my test case has a test *test1* which prints the node ID of *data*.
    > My test case has a test *test2* which prints the node ID of *data*.
    > When I run the test, *test1* and *test2* print different node IDs.

    >**Why is that?**

    >![node with id changes test](images/test/node_with_id_changes_test.png){width="800px"}

    >Terms used:

    > - **check node** for these fixture nodes that you enter into the test case under _nodes_
    > - **test case** for the root node, the _chunk_ that contains the tests
    >- **tests** for the test methods of which we have *test1* and *test2*

    - Each test case runs on a copy of its model. 

    MPS tries to keep tests reproducible and isolated even when being run in-process. For that, MPS copies the whole model into a temporary model. Modifications of one test case will then be invisible to the next test case since it will work on a new temporary model. This solution prevents test cases from interacting.

    Running tests in a separate model ensures that they will never modify the original model (as long as you don't explicitly start acting on other models).

    - Check nodes per test

    A test case may have multiple tests, though. MPS also isolates single tests within the same test case. For that, the check nodes are copied once for each test. Each test may then act on its copy.

    ```java
    // there is one data node in the model for each test
    assert 2 equals data.model.nodes(Data).size
    ```

    - All tests of a test case share their referenced nodes

    To save memory, these check nodes all lie in the same model for each test case. References to other nodes outside the test case will only need to be copied once and shared by all tests of that test case. As a result, the IDs of check nodes change, and non-check-node IDs are the same as in the original model.

    ```java
    // nodes in this model that are not check-nodes of this test case will only be there once
    assert 1 equals dataRef.model.nodes(Chunk).size;
    ```

    Consequently, multiple tests of the same test case are only partially isolated. In the following example, both tests assert and do the same, yet *test3* passes while *test4* fails. The data element is now located in a separate chunk outside the test case, and the check node references it. As a result, *test4* is running red because *test3* already modified the referenced node.

    ![tests share non check nodes](tests_share_non_check_nodes.png){width="600px"}

    - Kinds of tests

    * I checked this behavior in-depth for node tests.
    * I think it is similar for editor tests.
    * I am sure that this does not apply to baseLang-tests since they don't prepare a temporary model for you.

    **Practical effects of this**

    These are some rules of thumb that result from that:

    - The tests of a test case may interact, so you should inline all modified nodes into the test case to be _check nodes_.
    - When modifying many nodes in the model, consider writing a migration and migration test instead.
    - Remember that the console and each test will output separate IDs for the conceptually same node. And they will change from run to run.
    - It is easy to be confused by that and draw false conclusions, especially when stepping through tests.
    - Whenever your code queries for the nodes of a model, be ready to see duplicates for each test (as in the *dataRef* example). You may test this by asserting that something is included or excluded instead of asserting true equality of the expected and actual lists.
    - Another source for duplicates is if the test model imports itself.
    - If you need full power on the temporary model, consider writing a Base Language test and creating your repository and model by hand. [jetbrains.mps.smodel.TestModelFactory](https://github.com/JetBrains/MPS/blob/master/core/kernel/tests/jetbrains/mps/smodel/TestModelFactory.java) allows to do that, for example, the [ModelListenerTest](https://github.com/JetBrains/MPS/blob/master/core/kernel/tests/jetbrains/mps/smodel/ModelListenerTest.java) uses that TestModelFactory. It is unfortunately not available as stubs, so you'll need to copy it to your project.

     {{ contribution_by('abstraktor') }}

## How to Test

This section deals with practical questions regarding testing. Testing should be a big part of the CI pipeline to ensure that
changes don't introduce bugs and new feature work as intended. Not everything needs to be tested and manual testing can not
fully be avoided. Still, every single test gives you confidence in your changes, so don't ignore this part of language development.
Base Language and KernelF have support for test cases and assert statements.

!!! question "How do you implement custom tests?"

     [Implementing custom tests](https://specificlanguages.com/posts/2022-03/23-custom-tests/){{ blog('sl') }}

??? question "How to set up a generator smoke test?"

    > I want to write a generator smoke test. Therefore, I have some solutions with models (regular ones, not *@test* models) built from the command line, and the generators invoked are generating some .c files.
    
    > In addition, I also have a *@test* model in the same solution with some unit tests, which checks if the output directories of these models contain any generated files. I don't invoke the generation of the models programmatically but rely on the Ant task which generates the solution.
    
    > Unfortunately, this setup always leads to broken tests. The unit tests are executed before the models (which are built during the CI run) and though the test fails.

    {{ question_by('arimer') }}

    When the tests work fine from within the IDE, the problem is that when your tests are executed, they run from the JARs, not the sources. The generator output location points into the jar file that the tests are executed from and not to the real source location.
    
    You could change the packaging to include the *source_gen* folder for your specific test solution.
    
    Make this change to the default layout of your build model:
    
    ![layout: module myTestSolution](images/test/layout_module_my_test_solution.png)
    
    In this case, you would need to detect if you are running from sources or from a JAR in CI and change the location where you look for the generated files.
    
    In this case, you need to detect if you are running from sources or a JAR in CI and change the location where you look for the generated files.
    You can calculate a relative path for the test solution containing the packed sources.

    ```java
    //case running from .jar
    if (module instanceof AbstractModule && ((AbstractModule) module).getModuleSourceDir() != null) { 
      AbstractModule s = ((AbstractModule) module); 
      if (s.isPackaged() && s.getModuleSourceDir().getBundleHome() != null) { 
         
        IFile bundleHome = s.getModuleSourceDir().getBundleHome(); 
        return bundleHome.getFileSystem().getFile(bundleHome.getPath() + "!" + path); 
      } 
      
    // case: running from sources 
      IFile relativePath = s.getModuleSourceDir().getDescendant(path); 
      return relativePath; 
    }
    ```
    
    The easier solution is to place the tests in a separate solution and then invoke the make process for the solution that contains your input programmatically, so you can assert over the output. An example implementation of how the make process is invoked can be found in the [mbeddr-c part](http://127.0.0.1:63320/node?ref=r%3A35144171-bbda-419f-9015-4d1f075e1db4%28com.mbeddr.core.runconfiguration.pluginSolution.plugin%29%2F7943990500389317776).

    {{ answer_by('coolya') }}

??? question "How to write editor tests for context assistants?"

    > I need to unit test [context assistants](https://www.jetbrains.com/help/mps/context-assistant.html), ideally with an EditorTestCase, but it is not supported out of the box.

    This snippet allows to automatically test the context assistant in the code section of the `EditorTestCase`:

    ```java
    // Context assistants take some time to pop up, otherwise getActiveAssistant returns null  
    Thread.sleep(3000); 
    ContextAssistantManager contextAssistantManager = editor component.getEditorContext().getContextAssistantManager(); 
    final ContextAssistantController controller = ((ContextAssistantController) contextAssistantManager.getActiveAssistant()); 
    foreach menuItem in contextAssistantManager.getActiveMenuItems() { 
      if ("Item Name" :eq: ((ActionItemBase) menuItem).getLabelText("")) { 
        // Execute it in a BaseEditorTestBody context  
        final Project project = _this.[Project] <no instance>.getProject(); 
        _this.[void] <no instance>.runUndoableInEDTAndWait(new Runnable() { 
          @Override 
          public void run() { 
            project.getModelAccess().executeCommand({ => controller.executeActionItem((ActionItemBase) menuItem); }); 
          } 
        }); 
      } 
    }
    ```

    Note:  
    \- "Item Name" must be replaced with the name of the item as shown in the editor  
    \- "\_this" is a concept from internalBaseLanguage DSL.

    {{ contribution_by('cmoine') }}

??? question "How do you name check errors with dynamic messages?"

    > When I make the error text dynamic:

    > ![dynamic error message](images/test/dynamic_error_message.png){width="300px"}

    > Then my error is named `UnnamedError`, and I have a hard time selecting the right one:

    > ![dynamic error message select](images/test/dynamic_error_message_select.png)

    > How do I name errors with dynamic messages?

    1. Go to your error statement in your checking rule.
    2. Import the language ^^jetbrains.mps.lang.test^^.
    3. Run the intention *Add Message Annotation*.
    4. Type a nice name.

    > ![dynamic error message fix](images/test/dynamic_error_message_fix.png){width="300px"}

    > ![dynamic error message fix select](images/test/dynamic_error_message_fix_selection.png)

    Note that this does not work for errors that result from _constraints_.

    {{ contribution_by('abstraktor') }}

!!! question "What's the best way to test the contents of the code completion/substitution menu for a given cursor position using a *NodesTestCase* or an *EditorTestCase*?"

    Example for an `EditorTestCase`:

    ```java
    SubstituteInfo si = (editor component.getSelectedCell()).getSubstituteInfo();
    list<SubstituteAction> actions = si.getMatchingActions("", false);
    assert actions.size == 4;
    assert actions.any({ it => it.getMatchingText().equals("something"); });
    ```

!!! question "How do you test with two-step deletion enabled?"

    Example:

    ```java
    EditorTestUtil.runWithTwoStepDeletion({ => 
    invoke action -> Backspace 
    editor component.getEditorContext().getRepository().getModelAccess().runReadAction({ => assert true DeletionApproverUtil.isApprovedForDeletion(editor component.getEditorContext(), node) ; }); 
    invoke action -> Delete 
    assert true DeletionApproverUtil.isApprovedForDeletion(editor component.getEditorContext(), editor component.getSelectedNode()) ; 
    }, true)
    ```

!!! question "How do you test with typing over existing text enabled?"

    Example:

    ```java
    EditorTestUtil.runWithTypeOverExistingText({ => type " final" }, false)
    ```

!!! question "How do you test that you use a language?"

    Example:

    ```java
    UsedLanguagesUtils.assertLanguageUsed(editor component, language/jetbrains.mps.lang.editor.menus.extras.testLanguage/)
    ```

!!! question "How do you access the error cells in the inspector?"

    ```java
    EditorComponent inspector = project.getComponent(InspectorTool.class).getInspector();
    Set<EditorCell> errorCells = inspector.getCellTracker().getErrorCells();
    ```

!!! question "How do you click on anything in a test?"

    You can execute intentions and actions programmatically. You can use the *press mouse(x,y)*
    and *release mouse* statements for UI elements like buttons.

!!! question "How can you test that code completion works?"

    You can use a scope test to check if all items are visible in the menu. To check the number of actions in the menu, call: 

    ```java
    assert true editor component.getNodeSubstituteChooser().isVisible() && editor component.getNodeSubstituteChooser().getNumberOfActions() == n;
    ```

!!! question "How do I run some checks of the model checker?"

    Example code:

    ```java
    IChecker<SNode, NodeReportItem> structureChecker = new  StructureChecker();
    IAbstractChecker<ModelCheckerBuilder.ItemsToCheck, IssueKindReportItem> checker = new  ModelCheckerBuilder(false).createChecker(new arraylist<IChecker<?, ? extends IssueKindReportItem>>{structureChecker, new SuppressErrorsChecker()});
    checker.check(ModelCheckerBuilder.ItemsToCheck.forSingleModel(modelToCheck), modelToCheck/.getRepository(), new  CollectConsumer<IssueKindReportItem>(), new  EmptyProgressMonitor());
    ```

!!! question "How do I run unit tests through a run configuration?"

    Example code:

    ```java
    command process<jUnit> process = jUnit(project = project,tests = allTests, 
        virtualMachineParameter = vmParams
        workingDirectory = workingDir);
    int exitcode = process.startAndWait(TimeUnit.MINUTES.toMillis(1));
    ```

!!! question "Can I test the actions menu?"

    For internal tests in MPS, there is the following code:

    ```java
    list<TransformationMenuItem> items = MenuLoadingUtils.loadNamedMenu(editor component, node-ptr/WithExecutableAction/, "test location");
    ActionItem item = (ActionItem) items.get(0);
    item.execute("");
    ```

    [MenuLoadingUtils.java](https://github.com/JetBrains/MPS/blob/master/testbench/testsolutions/editor.menus.tests/test_gen/jetbrains/mps/lang/editor/menus/tests/MenuLoadingUtils.java) and [WithExecutableAction](https://github.com/JetBrains/MPS/blob/master/testbench/testsolutions/testlangs/editor.menus.testLanguage/source_gen/jetbrains/mps/lang/editor/menus/testLanguage/editor/WithExecutableAction.java) are not public, so they have to be created manually.

!!! question "How can I run a Base Language test ([BTestCase](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902d7%28jetbrains.mps.baseLanguage.unitTest.structure%29%2F1171931851043)) in an MPS environment?"

    Add the [MPSLaunch](http://127.0.0.1:63320/node?ref=920eaa0e-ecca-46bc-bee7-4e5c59213dd6%2Fjava%3Ajetbrains.mps%28Testbench%2F%29%2F%7EMPSLaunch) annotation to the test case and extend the class [EnvironmentAwareTestCase](http://127.0.0.1:63320/node?ref=920eaa0e-ecca-46bc-bee7-4e5c59213dd6%2Fjava%3Ajetbrains.mps.testbench%28Testbench%2F%29%2F%7EEnvironmentAwareTestCase).

    Example:

    ```java
    @MPSLaunch 
    test case Test extends EnvironmentAwareTestCase {
        <<members>>
        
        <<before test>>
        
        <<after test>>
        
        
        test test {
            read action with MPSModuleRepository.getInstance() {
                foreach module in MPSModuleRepository.getInstance().getModules() {
                    System.out.println(module.getModuleName());
                }
            }
        }
    }
    ```

## Troubleshooting

Some of the issues with testing have to do with the way tests are executed. Tests can be executed in the same MPS instance
or a new instance. In the latter case, a complete new environment is started. Some editor test in {{ mps_extensions() }}
can only be executed in a new instance. This is probably also true for other type of tests.

Additionally, the tests are executed in temporary models which results in changed node IDs and root nodes become normal nodes with parents in tests.
Avoid adapting your code to work in the test models and avoid adding checks to see if you are in a test model.

!!! warning "Tests aren't running at all."

    A [test info node](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c89590388%28jetbrains.mps.lang.test.structure%29%2F5097124989038916362) has to
    be added to the model of the tests so that the tests can find the project's path. The project path also has to be set
    in this node. Ensure you create variables in this path in *Preferences* --> *Appearance & Behavior* --> *Path Variables*
    ([TestInfo | MPS](https://www.jetbrains.com/help/mps/testing-languages.html#testinfo)).

!!! warning "Tests have a long warm-up time and run slowly."

    When running the tests from a run configuration, enable `Execute in the same process` in the configuration settings.
    Check the box *Allow parallel run* ([Running the tests | MPS](https://www.jetbrains.com/help/mps/testing-languages.html#runningthetests)).

!!! warning "The tests only work in MPS and not on the command line"

    [Why does my test fail when run from Ant but not when run from MPS?](https://specificlanguages.com/posts/2023-06/07-why-does-my-test-fail-when-run-from-ant/){{ blog('sl') }}

!!! failure "Why does the test execution fail with "Test project '$...' is not opened. Aborted"?"

    It happens because you didn't set the variable in the `TestInfo`. Go to *File* --> *Settings* --> *Path Variables* and create an entry for your variable with a path to the project location on your hard drive.

!!! failure "java.lang.IllegalStateException: The showAndGet() method is for modal dialogs only."

    One of the reasons why this message pops up is that a dialog should be displayed in a headless environment like a build server. There is only one way to avoid this exception than not showing the dialog.
    According to the IntelliJ documentation, it can also happen when the dialog is not shown on the EDT thread or the dialog is not modal.