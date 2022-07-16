## Baselanguage
Language: ^^jetbrains.mps.baselanguage^^

For a full list of `baselanguage` bugs and feature requests, have a look at [this ticket search](https://youtrack.jetbrains.com/issues/MPS?q=%23Open%20%23BaseLanguage).

!!! warning "Paste as Java class doesn't work."

    Not all newer Java features can be pasted such as the double colon operator(::) and static imports. Loops with more
    than one variable also don't work. This issues might be fixed in newer MSP versions.

!!! warning "Set the 'Export' flag at the moduleX import."

    You are using a class that extends another class that is situated in another solution. That means that the export flag for the other
    solutions should be set in the current module, so that there is automatically a dependency to this module.
    More information can be found in [dependencies: export flag](dependencies.md#export-flag).

!!! question "What Java language features aren't supported in `baselanguage`?"

    The following features are not supported (yet):

    - [local classes](https://www.baeldung.com/java-nested-classes)
    - [multiline strings/text blocks](https://www.baeldung.com/java-multiline-string)
    - [records](https://www.baeldung.com/java-record-keyword)
    - [sealed classes](https://www.baeldung.com/java-sealed-classes-interfaces)
    - [pattern matching for switch statements](https://docs.oracle.com/en/java/javase/17/language/pattern-matching-switch-expressions-and-statements.html)
    - [pattern matching for instanceof](https://www.baeldung.com/java-pattern-matching-instanceof)
    - [double brace initialization](https://www.geeksforgeeks.org/double-brace-initialization-java)


!!! warning "A function with `baselanguage` code doesn't return anything when called."
    `baselanguage permits implicit returns. The last statement is automatically returned. In some
    places implicit returns aren't supported, such as when returning a new `ListScope` class. Make sure to add a return
    statement in such places.

## Var Variable
Language: ^^jetbrains.mps.baselanguage.varVariable^^

!!! warning "TextGen not found for concept of X language."

    Bug (can't find ticket). Wrong generator order of languages. The generators of language x are executed first and then the generator of
    the var variable. It should be the other way around. You can specify a custom generation plan to fix this issue.

## Closures
Language: ^^jetbrains.mps.baselanguage.closures^^

!!! warning "Exception when passing closure literal as a parameter in a behaviour method call"

    Closures can't be used for functional interface types such as `java.util.Runnable` in behaviour methods (see MPS-31866)

## Collections

!!! question "How can you create a sequence with one element?"

    Use the singleton constructor:
    ```java
    java new singleton<string>("single")`
    ```

!!! question "How do you convert from a Java `#!java ArrayList` to a baselanguage list?"

    Use the copy constructor: 
    ```java
    new arraylist<string>(copy: yourArrayList)`
    ```

!!! question "How do you convert `baselanguage` collections to a Java Stream?"

    First convert your collection to a list that you downcast to a Java List.
    Then you can convert it into a stream `#!java StreamSupport.stream(list/.spliterator(), false)`

??? question "Why doesn't `yield` work inside a select operation?"

    > Given I have this code: `myNode.items.select({~it => yield it.index})`
    > When I run it, then I expect the result `[0,1,2,3,4]` but unexpectedly, I get the same list of nodes, as if I ran `myNode.items`
    > What's happening?

    `Yield` does not work with `.select({…})`

    The yield statement doesn't work in a select.
    It will do what you expected if you just call `.selectMany({…})` instead. That'll also make it clear what happens if you `yield` multiple times during an iteration, and that the control flow doesn't end when you're yielding.

    {{ contribution_by('abstraktor') }}

??? question "How do you sort a collection of children?"

    > Given I have a node `myNode` with a child collection `myNode.children`.
    > How do I sort them by their `toString()`?
    > I tried `myNode.children/.sort(Ordering.lexical())`, but that doesn't do anything. Stepping revealed that it seems to create a copy of that list and sort that one.

    Use the bold sort, call `toList` to materialize the result, and then `.clear` and `.addAll` it:

    ```java
    sequence<T> sorted = list.sort({~a,~b => ORDERING.compare(a, b); }, asc).toList;
    list.clear;
    list.addAll(sorted);
    ```

    {{ contribution_by('abstraktor') }}

## CheckedDots
Language: ^^jetbrains.mps.baselanguage.checkeddots^^

- voids `NullPointerException` when Java executes a method call on a null variable. For example, it won't throw a `NullPointerException`, if `myObject` is null.
- **bold** methods or dot-expression are null safe by hand-shake, for example `new arraylist<string>()`.**where**`({~it => })`

## Access language
Language: ^^jetbrains.mps.lang.access^^

- [Managing concurrent access | MPS](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage)

## Transactional property cells
Language: ^^jetbrains.mps.lang.editor.structure^^

- An intention can mark a regular property-cell such as string, int, and boolean as transactional.
- MPS updates the editor, when the cursor leaves the cell (= commit).
- You must define the commit-handler in the inspector.
    - Benefit: the editor isn't permanently updated on every key typed
- Can be useful, for example, if you set your text-colour dynamically.

## Images
Language: ^^jetbrains.mps.lang.editor.figures^^

- Statically embed images into the editor.

<figure markdown>
  ![image cell](image_cell.png)
  <figcaption>example: image cell</figcaption>
</figure>