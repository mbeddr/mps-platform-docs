# UI Patterns and Anti patterns

Go through your editors and check the following list.

??? hint "Texts are readable."
    The contrast ratio between the background color and the foreground text color should be at least 4.5:1 [article](https://www.majesticsignstudio.com/blog/best-color-combinations-for-readability/).
    [Contrast checkers](https://webaim.org/resources/contrastchecker) can also help you.
    Here are some colors with a high contrast:

    ![colors with good contrast ratio](colors.png)

    When using a gray scale color, make sure that the text color doesn't exceed 48% brightness ([source](https://uxmovement.com/content/why-your-gray-text-should-never-exceed-46-brightness/)). Make also sure to provide different colors for different color schemes (e.g. darcula theme vs light theme).

    **Bad example #1**

    ![bad readability](bad_readability_1.png)

    **Bad example #2**

    ![bad readability](bad_readability_2.png)

??? hint "Bold and underline aren't used together."

    This is an anti-pattern. More information can be found in [this article](https://blog.velocitymedia.agency/bold-italics-and-underlines-how-to-use-them-effectively).
    MPS related summary:

    - Bold
        - important phrases
        - highlighting keywords
        - Italic/Emphasis
        - Used to highlight quotes (some use blockquotes).
        - Foreign words. 
    - Underline
        - Used for links
    - CAPS
        - Used for acronyms

??? hint "You use buttons correctly."

    (Swing) Buttons use appropriate symbols/text to make clear what they do. Buttons can alse be used as up and down keys. Buttons can also be hidden to not disrupt the text editing:
    ![hidable buttons](hide_buttons.png)
    
    Add option to hide buttons (checkbox, editor hint, action, etc.).

??? hint "Clickable elements appear clickable."
    
    When elements are clickable, they should appear clickable: They should use an indicator or different style (e.g. underlines and blue or styled like a button).

??? hint "You align collections when possible."
    
    Alignment is an important aspect in design ([introduction](https://venngage.com/design-dictionary/alignment-design-principle-definition/)). Use vertical grids instead of vertical collections to align cells nicely.
    It is also very important for readability.

??? hint "You use color for emphasis and to convey information."
    
    Not only bold font can be used to emphasize words but also color. Make sure that the used color is correctly associated by the user.
    
    **Bad example**

    Greyscale editor + grey is associated with disabled content/meta information such as comments.
    ![grey editor](grey_editor.png)


    **Good example**
    
    ![use of color](use_of_color.png)
    
    Color is used to distinguish different language features: BLUE for numbers, lila/green for CONSTANTS.

??? hint "You use labels in a consistent way."
    
    Labels should be used consistently in the design (e.g. always bold, colon after label), the same goes for key value pairs.
    There is no best practise for the separation between label and text. Some ideas and common guidelines can be found [here](https://ux.stackexchange.com/questions/3611/should-label-and-field-be-separated-with-colon).
    
    ![key value pair](key_value_pair.png)

??? hint "The context of UI elements is consistent."
    
    Counterexample: There are 3 buttons next to each other that look similar: One opens an external documentation, the other navigates to a root node and the third one undos
    a change. This could be confusing and frustrating for the user.

??? hint "A default empty statement exists."
    
    There should always be a default concept that acts as an empty line or
    empty text. It should be editable and support autocompletion. They should have an indicator that they are editable. The easist way is to provide a placeholder value.
    
    **Bad example**
    
    ![missing empty statement](missing_empty_statement.png){width="500px"}

??? hint "Different groups are distinguishable from each other."

    Groups can be separated for example by whitespace, by drawing a border (box) or drawing brackets around the content.

??? hint "You emphasize non-standard operations/literals."
    
    Emphasize special operations or literals to make it clear that they are not. Another good examples in baselanguage are extension methods.

    ![emphasize special operations](emphasize_special_operations.png)

??? hint "Enough paddings surround elements."
    
    Make sure there is enough space between the content and its border (padding) otherwhise the editor looks too packed.
    More information from a design perspective can be found [here](https://medium.com/wayfair-design/more-padding-please-b95e19422acc).

??? hint "You use existing stylesheets."

    For *baselanguage* there is [BaseLanguageStyle](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c895902c3%28jetbrains.mps.baseLanguage.editor%29%2F1186415538255).
    You can search globally for instances of [Stylesheet](http://127.0.0.1:63320/node?ref=r%3A00000000-0000-4000-0000-011c8959029e%28jetbrains.mps.lang.editor.structure%29%2F1186402211651) to find more styles.

??? hint "The font size conveys hierarchy."

    More information can be found in this [beginner's guide to typographic hierarchy](https://uxcel.com/blog/beginners-guide-to-typographic-hierarchy).

    Example hierarchy (source: [Font Size And Weight Matters](https://type-ed.com/resources/rag-right/2017/11/13/font-weight-size)) : ![example hierarchy](https://images.squarespace-cdn.com/content/v1/577811363e00be9cc0da688a/1510632311898-TLJBKRTD7WC8J782TN3G/e553d9a7-19b7-47e2-8ce8-e8ef390d6e8b.gif)

??? hint "You use the full window with for your editor."
    
    Often times the space in editor components is not good used and a lot of space is left empty on the right side of the window. 
    This can be improved by using multiple groups next to each other or using the right hand side of the screen for some sort of legend for graphics or meta information about the (root) node (e.g. code review).

??? hint "Headers follow general UI principles."

    The following principles should be followed:

    - hierarchical relationship of ideas
    - consistency
    - readability
    - specificity

    More information can be found in [Technical writing essentials - Headings](https://pressbooks.bccampus.ca/technicalwriting/chapter/headings).

??? hint "Headers are distinguishable from content."

    **Bad example**

    ![header_content keywordbold](header_content_keyword_bold.png)

    The header and the start of the child concepts use bold font and the same text.
    In this example the text "Output" is redundant. The header should be larger in size.

    A common layout is header-input-output: At the top is the header, then there are the
    inputs/declarations, followed by the output/body. Make sure to separated this
    three groups in some ways (such as horizontal lines or empty lines).

    **Mixed example**

    ![header-input-output](header_input_output.png)

??? hint "Lines aren't too thick and not textual."

    A good maximum width for borders and other lines is 3 pixels. This is just a rough guideline but with thicker lines the design becomes overwhelming.

    **Bad example**

    ![bad lines](bad_lines.png)

??? hint "You don't emphasize meta/not important information."

    **Good example**

    ![state machine](meta_information_grey1.png)

    A smaller font, light gray color or maybe a different font seems to work well. Inherited value can also be shown this way: display them as placeholder values in a light gray color.
    Don't emphasize comments by making them bold or stand out in any way.

    **Bad example**

    ![emphasized comments](emphasized_comments.png)

??? hint "The reflective editor is never shown."

    The reflective editor provides a default editor for nodes. The editor is
    only readonly and should only be used for debugging purposes.

    **Bad example**

    ![reflective editor](reflective_editor.png){width="300px"}

??? hint "You use The right form of projection for the task in the editor."

    The right projections are used (text, tables, diagrams..) and different kind of projections are provided when necessary (switchable by menu or editor hints).

    **Example: multiple projections**

    ![multiple projections](multiple_projections.png)

??? hint "You didn't forget to enable anti aliasing for custom swing components."

    When you create a custom component and have a paint-Method, call [EditorComponent.turnOnAliasingIfPossible](http://127.0.0.1:63320/node?ref=1ed103c3-3aa6-49b7-9c21-6765ee11f224%2Fjava%3Ajetbrains.mps.nodeEditor%28MPS.Editor%2F%29%2F%7EEditorComponent.turnOnAliasingIfPossible%2528java.awt.Graphics2D%2529)
    to enable anti aliasing. More information can be found in the [Java documentation](https://docs.oracle.com/javase/tutorial/2d/advanced/quality.html).

??? hint "All usages of symbols are clear."
    
    When using symbols, make sure that the user understands what it means. 
    A Plus symbol might be easy to understand (add, increase), a complex shape that is not usuable used might be not. Common icons can be found for example in the [fontawesome icon pack](https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free).

??? hint "You abbreviate often used words and symbol."

    Abbreviate words that are often used in the editor or use symbols.
    Examples:

    - The Letter "m" or a red star *\**{: style="color: red"} is often used to mark a field as mandatory.
    - The plus sign ⊕ is used to indicate an "add" action.