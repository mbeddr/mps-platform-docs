## Base Language
Language: ^^jetbrains.mps.baselanguage^^

For a full list of baselanguage bugs and feature request, have a look at [this ticket search](https://youtrack.jetbrains.com/issues/MPS?q=%23Open%20%23BaseLanguage).

!!! warning "Paste as Java class doesn't work."

    Not all newer Java features can be pasted such as the double colon operator(::) and static imports. Loops with more
    than one variable also don't work.

!!! warning "Set 'Export' flag at the moduleX import"

    You are using a class that extends another class that is situated in another solution. That means that the export flag for the other
    solutions should be set in the current module, so that there is automatically a dependency to this module.
    A better explanation can be found [here](https://github.com/mbeddr/mbeddr.core/wiki/MPS:-Deps-and-Classpath#export-flag).

!!! question "What Java language features are not supported in Base Language?"

    The following features are not supported (yet):

    - [local classes](https://www.baeldung.com/java-nested-classes)
    - [multiline strings/text blocks](https://www.baeldung.com/java-multiline-string)
    - [records](https://www.baeldung.com/java-record-keyword)
    - [sealed classes](https://www.baeldung.com/java-sealed-classes-interfaces)
    - [pattern matching for switch statements](https://docs.oracle.com/en/java/javase/17/language/pattern-matching-switch-expressions-and-statements.html)
    - [pattern matching for instanceof](https://www.baeldung.com/java-pattern-matching-instanceof)
    - [double brace initialization](https://www.geeksforgeeks.org/double-brace-initialization-java)


!!! warning "I have written a function with base language code but doesn't return anything when called"
    Base Language allows implicit returns that means that the last statement is automatically returned. There are some
    places where implicit returns are not support such as when return a new ListScope class. Make sure to add a return
    statement in such places.

## Var Variable
Language: ^^jetbrains.mps.baselanguage.varVariable^^

!!! warning "TextGen not found for concept of X language."

    Bug (can't find ticket). Wrong generator order of languages. The generators of language x are executed first and then the generator of
    the var variable. It should be the other way around. You can specify a custom generation plan to fix this issue.

## Closures
Language: ^^jetbrains.mps.baselanguage.closures^^

!!! warning "Exception when passing closure literal as a parameter in a behaviour method call"

    Closures can't be used for functional interface types such as `java.util.Runnable` in behaviour methods (see [this ticket](https://youtrack.jetbrains.com/issue/MPS-31866))

## Collections

!!! question "How do I create a sequence with one element?"

    Use the singleton constructor: `#!java new singleton<string>("single")`

!!! question "How do convert from a Java ArrayList to a Base Language list?"

    Use the copy constructor: `#!java new arraylist<string>(copy: yourArrayList)`

!!! question "How do I convert base language collections to a Java Stream?"

    First convert your collection to a list that you downcast to a Java List.
    Then you can convert it into a stream `#!java StreamSupport.stream(list/.spliterator(), false)`

## CheckedDots
Language: ^^jetbrains.mps.baselanguage.checkeddots^^

- avoid NullPointerExceptions when a method call on a variable happens, which is null e.g. `myObject.?toString()` will not throw a NullPointerException, if `myObject` is null.
- **bold** methods or dot-expression are null safe (by hand-shake), e.g. `new arraylist<string>()`.**where**`({~it => })`

## Access
Language: ^^jetbrains.mps.lang.access^^

- [official documentation](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage)

## Transactional property cells
Language: ^^jetbrains.mps.lang.editor.structure^^

- A regular property-cell (string, int, boolean) can be marked as transactional via an intention
- The editor is updated, when the cursor leaves the cell (= commit).
- The commit-handler must be defined in the inspector.
    - benefit: the editor is not permanently updated on every key typed
- useful for example if you set your text-color dynamically

## Images
Language: ^^jetbrains.mps.lang.editor.figures^^

- Statically embed images into the editor.

Example:

<img src="../../../img/image_cell.png" alt="image cell" />