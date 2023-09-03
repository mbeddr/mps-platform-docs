# Pull Request Checklist

!!! abstract "Structure Aspect"

    === "Basic"
    
        - [ ] Names of concepts are self-explanatory.
        - [ ] Concepts have aliases.
        - [ ] The cardinality of children and references was checked.
        - [ ] Properties need to be properties and shouldn't be referencable ( use children or references otherwise).
    
    === "Advanced"
    
        - [ ] Concepts/Interfaces are located in the correct virtual package.
        - [ ] New concepts were added to the language that groups similar concepts e.g. data mappings to the data mappings language.
        - [ ] Concepts have a short description.
        - [ ] Enumerations are the right choice and should not be replaced by concepts.
        - [ ] A decision was made between constraint datatypes and property constraints.
    
    === "Expert"
    
        - [ ] Multiple references disable smart references. A custom substitute menu was used instead.

!!! abstract "Editor Aspect"

    === "Basic"

        - [ ] Code completion works.
        - [ ] Deletion of elements (doesn't) work.
        - [ ] No duplicated entries in the code completion menu.
        - [ ] Code completion menu descriptions are sufficient to differentiate entries.

    === "Advanced"

        - [ ] Collapsible blocks work correctly.
            - [ ] Error messages still have enough information when collapsed.
            - [ ] Cardinality inconsistency: the real value vs. the expected value is shown in the error message.
        - [ ] Substitute menus vs. grammar cells was decided
        - [ ] A decision was made on how to enter stuff
            - for example: code completion vs. context assistant cell vs. side transformations.
        - [ ] Intentions are used when side transformations are too confusing for the user.
        - [ ] Links are consistent (e.g. always use ctrl + click).
    
    === "Expert"

        - [ ] Strange errors in the editor are fixed or reported (maybe upstream platform or MPS issue).
        - [ ] Important entries in the code completion menu are at the first positions (priorities).
        - [ ] Code completion + side transformations: longer descriptions are used instead of just single words.

    === "User Perspective"

        - [ ] The feature was tried from a user perspective. What annoyed you? Can you enter everything and not too much?
        - [ ] Check usability: Nothing should be deletable when it is mandatory. It also should not be deletable and raise an error.
        - [ ] The user can input something wrong and is notified instead of preventing him from entering something.


!!! abstract "Constraints Aspect"

    === "Basic"

        - [ ] Scopes tests were added when many scopes were changed or when the logic was complicated.
        - [ ] Constraints are set correctly for new features
            - For example: only specific containers, parents, links, etc. are allowed.
            - By default, the scope of the model is used.
        - [ ] Scopes work in tests and generators.
        - [ ] Properties have constraints for their values or implement common interfaces/concepts like *INamedConcept*.
            - Alternatively, the constraints can be enforced on the type system level.

    === "Advanced"

        - [ ] When using KernelF: unnecessary concepts are filtered through the *can be ancestor* constraint.

    === "Expert"

!!! abstract "Behavior Aspect"

    === "Basic"

        - [ ] All abstract methods are implemented.
        - [ ] Methods that should be overridable have the *virtual* flag set.
        - [ ] Methods that should override a super method have been marked as *overrides*.
        
    === "Advanced"

        - [ ] Default implementations exist for used concepts that have abstract unimplemented methods.
        - [ ] Usage of static flags was checked for all methods.
        - [ ] Methods are generalized correctly and are moved to a super concept if needed.
        - [ ] Methods that return a collection return an empty list if there is no result.

    === "Expert"

        - [ ] Languages with multiple generators don't pollute the behavior aspect with generator-specific methods.

!!! abstract "Typesystem Aspect"

    === "Basic"

        - [ ] Tests were added for every single new type system error/warning.
        - [ ] Checks are displayed at places where it is clear where the error is. Alternatively: more information was added to make the error locatable.
        - [ ] Structural checks consider all relevant properties/children/references.
        - [ ] When using types, it is checked if they must match exactly or just be subtypes.
        - [ ] Checks cover all corner cases.

    === "Advanced"

        - [ ] Checks were done for the right concepts e.g. enum literals vs. enum type and are displayed at the right node.
        - [ ] A quick fix or an (error) intention is used and not both.

    === "Expert"

        - [ ] Performance impacts were checked (see: [performance](performance.md))

!!! abstract "Plugin Aspect"

    === "Basic"

        - [ ] A plugin solution is used instead of a plugin aspect.
        - [ ] Actions were added to groups so that the user could invoke them from the UI.
        - [ ] The right type of plugin was chosen (project vs. application plugin).
        - [ ] All functionality in plugin solutions/aspects was manually tested and don't throw errors.

    === "Advanced"

        - [ ] Actions have keyboard shortcuts.

    === "Expert"

        - [ ] Actions have the right kind of access (command, editor command, read, none).
        - [ ] All actions were disabled (NonDumbAwareActions) that shouldn't be available while indexing.

!!! abstract "Test Aspect"

    === "Basic"

        - [ ] All corner cases are tested (see: [testing](testing.md)).
        - [ ] Test methods have reasonable names that explain what they are testing.
        - [ ] Test methods don't test too many different things.
        - [ ] Test aspects have each a *TestInfo* node.

    === "Advanced"

        - [ ] Complex migrations are tested using a *MigrationTestCase*.
        - [ ] Complex scopes are tested using scope tests.
        - [ ] *has error* and *has warning* checks have references to the error statement.
        - [ ] The *before tests* block is used to set up tests.
        - [ ] The *after tests* block is used to clean up tests.

    === "Expert"

        - [ ] Temporary models created in tests are disposed of after testing.
        - [ ] The generator was called manually for tests where the generator tests were not fine-grained enough.
        - [ ] Visual diffing through the MPS diff tool is integrated for more complex tests.

!!! abstract "Generator Aspect"

    === "Basic"

        - [ ] Tests were added/changed when modifications were made in generators.
        - [ ] Preprocessing and postprocessing scripts are used sparingly.
        - [ ] Custom generation plans are used when needed or priority rules are set.

    === "Advanced"

        - [ ] Performance impacts were checked (see: [performance](performance.md)
            - [ ] Slow operations in the generator were saved in variables/in a cache.
            - [ ] Code is not executed more often than needed.
        - [ ] Mapping configurations have an applicable block set.
        - [ ] The generator runs deterministically.
        - [ ] Necessary attributes are not lost between generation steps.
        - [ ] `Pick output` is used instead of `get output to have scoping checks.

    === "Expert"

        - [ ] Naming convention: for templates meant to be used via explicit calls from other templates instead of in reduction rules, the "map_" prefix was instead of "reduce_".
        - [ ] No usages of .forEach in generator use *foreach var in iterator* (performance)
        - [ ] COPY_SRCL was used instead of LOOP+CALL
        - [ ] Model pruning is used to increase the performance.
        - [ ] The exact generator settings were decided (strict mode, parallel mode, apply transformations in place, etc.).

!!! abstract "Intentions Aspect"

    === "Basic"

        - [ ] The *is applicable* block was set up correctly.

    === "Advanced"

        - [ ] Helpful additional intentions were added such as an intention to remove all items in a list.
        - [ ] Intentions were grouped using the language ^^com.mbeddr.mpsutil.intentions^^.

    === "Expert"

        - [ ] When changing the model, the focus and selection are correctly set using the editor context.


??? abstract "Documentation Aspect"

    === "Basic"

        - [ ] Documentation was written for new features.
        - [ ] There are no instances of technical details and terms in the documentation that the users don't understand.
        - [ ] New features that are not mentioned in the documentation are self-explanatory.
            - [ ] Generated files are self-explanatory as well or contain comments.

    === "Advanced"

        - [ ] Screenshots/embedded nodes are used and have captions.
        - [ ] It was decided which kind of documentation is necessary
            - For example: Word documents, HTML pages, and documentation inside MPS.

    === "Expert"

        - Interactive exercises are provided for users.

??? abstract "Actions Aspect"

    === "Basic"

        - [ ] For common substitutions, node factories are set up.

??? abstract "Feedback Aspect"

    - [ ] The aspect was used to override error messages that are not helpful for the user (e.g. structural checks, failing property constraints).

??? abstract "Refactorings Aspect"

    === "Basic"

        - [ ] Refactorings were used instead of directly renaming concepts/properties etc. (they update the resolve info too).

??? abstract "Scripts Aspect"

    - [ ] Enhancement scripts were used to let the user perform changes to the models in batches.

??? abstract "Find Usages Aspect"

    - [ ] To help the user find specific nodes more easily, custom finders were added.

??? abstract "Data Flow Aspect"

    === "Basic"

        - [ ] Unreachable statements/expressions are checked.
        - [ ] Unitialized reads are checked.
        - [ ] Unused assignments are checked.
        - [ ] Unused variables are checked.
        - [ ] Returns are checked.

    === "Advanced"

        - [ ] The Data Flow check is integrated into the type system.
        - [ ] Nullable analysis is implemented.

??? abstract "TextGen Aspect"

    === "Basic"

        - TextGen is used for scenarios where the generator is not needed.
        - The class *TextGeneratorEngine* is used to get the generated text when needed.
        - Text gen components have the right extension and file encoding.

    === "Advanced"

        - The generated files have valid names according to the operation system or used software.

??? abstract "Migration Aspect"

    === "Basic"

        - [ ] Refactorings were used to move methods, concepts, etc. to not break models.
        - [ ] For deprecated concepts is was decided if they need an error message, if entering them should be disallowed, or if they should be removed completely.
        - [ ] Migrations were tested locally or through migration tests.
        - [ ] New migrations were executed in the project.

    === "Advanced"

        - [ ] Old code is not immediately deleted but deprecated first. The code is deleted after a certain period.
        - [ ] When using the refactoring menu, a migration script or refactoring log was written for situations where existing models need to be updated.

    === "Expert"

        - [ ] Users are not using different distributions with different language versions to create models.

??? abstract "Accessory Models"

    - [ ] It was decided how to ship libraries for users.
        - [ ] Should they be customizable?
        - [ ] Part of the user repository?
        - [ ] Be Overridable?

??? abstract "Listener Aspect"

    === "Basic"

        - [ ] Listeners are the right choice and simple buttons, intentions or quick fixes can't solve the problem.
        - [ ] Constructors, node factories, reference handlers, and similar features can't solve the problem.
        - [ ] Listeners are not added for *BaseConcept* to preserve performance.
    
    === "Advanced"

        - [ ] Updates of the models don't cause jumping cursors or lost focus in the editor.
        - [ ] Big updates are done in background threads to not freeze the editor.