---
tags:
- baselanguage
- baselanguage-extension
---

## Base Language
> ^^jetbrains.mps.baselanguage^^

Look at [this ticket search](https://youtrack.jetbrains.com/issues/MPS?q=%23Open%20%23BaseLanguage) for a complete list of Base Language bugs and feature requests.

### Blog Posts

- [Get feedback from users with generic comments](https://specificlanguages.com/posts/get-feedback-from-users-with-generic-comments/){{ blog('sl') }}
- [Empty lines and comments](https://specificlanguages.com/posts/2022-04/06-empty-lines-and-comments/){{ blog('sl') }}

!!! warning "Paste as Java class doesn't work."

    You can't paste some newer Java features, such as the double colon operator(::). Loops with more than one variable also don't work.

!!! warning "Set the Export flag at the moduleX import."

    You are using a class that extends another class located in another solution. That means that the export flag for the other
    solutions should be set in the current module so that there is automatically a dependency on this module.
    [Dependencies: export flag](dependencies.md#export-flag) contains some more information.

!!! question "What Java language features aren't supported in Base Language?"

    The following features are not supported (yet):

    - [local classes](https://www.baeldung.com/java-nested-classes)
    - [multiline strings/text blocks](https://www.baeldung.com/java-multiline-string)
    - [records](https://www.baeldung.com/java-record-keyword)
    - [sealed classes](https://www.baeldung.com/java-sealed-classes-interfaces)
    - [pattern matching for switch statements](https://docs.oracle.com/en/java/javase/17/language/pattern-matching-switch-expressions-and-statements.html)
    - [pattern matching for instanceof](https://www.baeldung.com/java-pattern-matching-instanceof)
    - [double brace initialization](https://www.geeksforgeeks.org/double-brace-initialization-java)


!!! warning "A function with Base Language code doesn't return anything when called."

    Base Language permits implicit returns. Methods automatically return the last statement. In some
    places, implicit returns aren't supported, such as when returning a new `ListScope` class. Make sure to add a return
    statement in those cases.

!!! question "What library does MPS use to parse Java code?"

    It uses the parser of the Eclipse Java Development Tools (JDT). [Eclipse JDT - Abstract Syntax Tree (AST) and the Java Model](https://www.vogella.com/tutorials/EclipseJDT/article.html) describes the AST.    

!!! question "How do you know if you've commented out a node? How can I comment out nodes programmatically?"

    Use the class [CommentUtil](http://127.0.0.1:63320/node?ref=r%3Ab9f36c08-4a75-4513-9277-a390d3426e0f%28jetbrains.mps.editor.runtime.impl.cellActions%29%2F6549307287717228796). It has methods for commenting/uncommenting and checking if the node is commented out (`CommentUtil#isCommentedOut`).

## Var Variable

> ^^jetbrains.mps.baselanguage.varVariable^^

This extension allows declaring local variables with the type automatically inferred from the initializer, which must not be empty. Example:

```java
var value = (ISimple) {var input => return 1; }
var x=0c710
```

!!! warning "TextGen is not found for concept of X language."

    A wrong generator order of languages can be the issue. Example: The generators of language x execute first, and then the generator of
    the *var* variable of the same language is called. It should be the other way around. You can specify a custom generation plan to fix this issue.

## Closures

> ^^jetbrains.mps.baselanguage.closures^^

!!! warning "Exception when passing closure literal as a parameter in a behavior method call"

    You can use closures for functional interface types such as `java.util.Runnable` in behavior methods (see MPS-31866)

## Collections

!!! question "How can you create a sequence with one element?"

    Use the singleton constructor:
    ```java
    new singleton<string>("single")`
    ```

!!! question "How do you convert from a Java *ArrayList* to a Base Language list?"

    Use the copy constructor: 
    ```java
    new arraylist<string>(copy: yourArrayList)`
    ```

!!! question "How do you convert Base Language collections to Java streams?"

    First, convert your collection to a list you downcast to a Java list.
    Then you can convert it into a stream `#!java StreamSupport.stream(list/.spliterator(), false)`

!!! question "Why doesn't *yield* work inside a select operation?"

    > Given I have this code: `myNode.items.select({~it => yield it.index})`
    > When I run it, then I expect the result `[0,1,2,3,4]`, but unexpectedly, I get the same list of nodes as if I ran `myNode.items`
    > What's happening?

    `Yield` does not work with `.select({…})`.
    It will do what you expected if you call `.selectMany({…})` instead. That'll also clarify what happens if you `yield` multiple times during an iteration and that the control flow doesn't end when you're yielding.

    {{ contribution_by('abstraktor') }}

!!! question "How do you sort a collection of children?"

    > Given I have a node `myNode` with a child collection `myNode.children`.
    > How do I sort them by their `toString()`?
    > I tried `myNode.children/.sort(Ordering.lexical())`, but that doesn't do anything. Stepping revealed that it creates a copy of that list and sorts that one.

    Use the bold sort, call `toList` to materialize the result, and then `.clear` and `.addAll` it:

    ```java
    sequence<T> sorted = list.sort({~a,~b => ORDERING.compare(a, b); }, asc).toList;
    list.clear;
    list.addAll(sorted);
    ```

    {{ contribution_by('abstraktor') }}

## Checked Dots

> ^^jetbrains.mps.baselanguage.checkeddots^^

- It voids `NullPointerException` when Java executes a method call on a null variable. For example, it won't throw a `NullPointerException`, if `myObject` is null.
- **Bold** methods or dot-expressions are null safe, for example, `new arraylist<string>()`.**where**`({~it => })`

## Access Language 

> ^^jetbrains.mps.lang.access^^

- [Managing concurrent access | MPS](https://www.jetbrains.com/help/mps/smodel-language.html#accesslanguage)

## Transactional Property Cells

> ^^jetbrains.mps.lang.editor.structure^^

- An intention can mark a regular property cell such as string, int, and boolean as transactional.
- MPS updates the editor when the cursor leaves the cell (= commit).
- Define the commit handler in the inspector. The benefit is that the editor doesn't permanently update after every keyboard event.
- For example, this cell can be helpful if you dynamically set your text color.

## Images

> ^^jetbrains.mps.lang.editor.figures^^

- Statically embed images into the editor.

<figure markdown>
  ![image cell](image_cell.png)
  <figcaption>example: image cell</figcaption>
</figure>

## Base Language Internal

Specific Languages blog: [Poor man's cross-model generation: baseLanguageInternal](https://specificlanguages.com/posts/2022-04/25-poor-mans-cross-model-generation/)

## Sax Parser

> ^^jetbrains.mps.core.xml.sax^^

You can use [SAX](https://www.baeldung.com/java-sax-parser), also known as the Simple API for XML, for parsing XML documents. This language allows the creation of SAX parsers. The parser can take parameters and save data into variables. You start by specifying the *root* element and then at *rules* for XML tags.

### Rules

The rule can have an optional *creator*, which creates a Java object from the current element. They support a complete and compact view. You can then declare attributes (*attr*), and children who take can have an optional handler. It has two arguments: the *result*, which has the same type as the type of the rule, and the *child*, which is the parsed child object. The attribute can be mandatory, and the child can override the tag and supports conditional invocation. Use the *default* child block for children with any tags. Next, there can be a *text* handler that supports an optional handler that can process the text content of an XML element. At last, you can validate the element in the *validate* method, which should return a boolean value depending on if the validation succeeds or fails. You can also handle text through the *global text handler text*. 
Example:

```java
sax parser ModelReader8 { 
  parameters 
    interfaceOnly : boolean 
    ...
  variables 
    model : DefaultSModel 
    ...
   
  root model 
   
  rule model for tag model() -> ModelLoadResult { 
    create()->ModelLoadResult throws SAXException { 
      model = new  DefaultSModel(PersistenceFacade.getInstance().createModelReference(modelUID), header); 
      hasSkippedNodes = false; 
      helper = new  ReadHelper(model.getReference()); 
      return new  ModelLoadResult((SModel) model, ModelLoadingState.NOT_LOADED); 
    } 
     
    required attr modelUID 
       
    ...
      
    child with tag devkit => module_reference() 
      (result, child)->void throws SAXException { 
        model.addDevKit(child); 
      } 

    ...
     
    validate(result)->boolean throws SAXException { 
      result.setState(hasSkippedNodes ? (interfaceOnly ? ModelLoadingState.INTERFACE_LOADED : ModelLoadingState.NO_IMPLEMENTATION) : ModelLoadingState.FULLY_LOADED); 
      return true; 
    } 
  } 
  ...
    
  compact rule ignoredLink for tag link() -> <no type> { 
    <no creator> 
    attr role 
    ...
  } 
   
  global text handler <no globalText> 
}
```

Use [InternalClassCreator](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895903ac%28jetbrains.mps.baseLanguageInternal.structure%29%2F1100832983841311024) from Base Language Internal to use the generated parser. Example:

`#!java new [ XMLSAXHandler ] jetbrains.mps.smodel.persistence.def.v8.LineToContentMapReader8Handler (withPropertyValues, withAssociationTarget)`

## Property References

> ^^jetbrains.mps.lang.checkedName^^

Use this language to reference properties. `property/<node>,<role>/`is the main expression that has the type `propRef<>`. To access the value, use `.value`. Example: 
```java
propRef<string> property = property/node/Class/ | name/;
#print property.value;
```
This expression is the node pendant for the `property/<concept>:<name>/` expression from `jetbrains.mps.lang.smodel` which takes a concept as an argument and returns an instance of class [SProperty](http://127.0.0.1:63320/node?ref=8865b7a8-5271-43d3-884c-6fd1d9cfdd34%2Fjava%3Aorg.jetbrains.mps.openapi.language%28MPS.OpenAPI%2F%29%2F~SProperty).

## Properties File

> ^^jetbrains.mps.core.properties^^

This language adds support for [Java \.properties](https://en.wikipedia.org/wiki/.properties) files. The generator automatically escapes the keys and values when they contain special characters. The generated properties file has the encoding ISO-8859-1.
Example:
```properties 
mps_home=/Applications/MPS.app 
deploy.dir=./artifacts 
 
# locale 
encoding=utf-8 
locale=en_US
```

### Forms (Checkbox)

> ^^jetbrains.mps.lang.editor.forms^^

This language adds support for checkboxes. Text-based checkboxes (text checkbox UI) and image checkboxes (platform checkbox UI) are available. You can style the text-based checkbox like any other constant text. The checkbox cell has an *ui* parameter which allows switching between both styles. A boolean property backs the state. The label specifies the visible text. The checkbox can be toggled by clicking and pressing space.

![forms: checkbox](forms_checkbox.png)

### Image Generation for Nodes

> ^^jetbrains.mps.lang.editor.imageGen^^

The single concept [ImageGenerator](http://127.0.0.1:63320/node?ref=r%3Aa7cbf330-9260-4b6d-8d53-3b6cb70171c0%28jetbrains.mps.lang.editor.imageGen.structure%29%2F2359976223559993484) can generate an image for a node. It accepts a file name and a scale (1 is 100%) and needs a reference to a node. You must provide a node ID if you didn't set the reference. The facet [GenerateImages](http://127.0.0.1:63320/node?ref=r%3Ac3ac4b0a-a487-4481-b87d-bcfbfdd6a85d%28jetbrains.mps.lang.editor.imageGen.plugin%29%2F448727181061901862) generates the image. The facet executes after the generate facet. Execute the following code on the console to get the list of supported file formats:
```java
IIORegistry registry = IIORegistry.getDefaultInstance(); 
StringBuilder builder = new  StringBuilder(); 
Iterator<ImageWriterSpi> serviceProviders = registry.getServiceProviders(ImageWriterSpi.class, false); 
while (serviceProviders.hasNext()) { 
  ImageWriterSpi next = serviceProviders.next(); 
  builder.append(String.format("description: %-27s   format names: %s%n", next.getDescription(Locale.ENGLISH), Arrays.toString(next.getFormatNames()))); 
} 
#print builder.toString();
```