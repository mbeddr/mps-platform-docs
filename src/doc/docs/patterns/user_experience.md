# User experience and user interfaces

## Basics

- [7 Graphic Design Principles to Up-Level your Graphics](https://mariahalthoff.com/blog/7-graphic-design-principles)
- [7 Gestalt Principles of Design](https://ux360.design/gestalt-principles-design/)
- [10 Graphic Design Rules You Should Never Break](https://www.business2community.com/web-design/10-graphic-design-rules-never-break-01935942)
- [20 Most Important UI Design Principles for UI Designer](https://www.mockplus.com/blog/post/ui-design-principle/?r=cherry)
- [What are the basic rules of user interface design? (quora)](https://www.quora.com/What-are-the-basic-rules-of-user-interface-design)

## Text

- [UX Writing: Handy Tips on Text Improving User Experience](https://blog.tubikstudio.com/user-experience-tips-ux-writing/)
- [The Punctuation Guide](https://www.thepunctuationguide.com/index.html)
- [Technical Writing Essentials – Document Design](https://pressbooks.bccampus.ca/technicalwriting/part/documentdesign/)
- [Word Choices and Language in UX, Part Three: User Interface Labels & Messages](https://quinnkeast.medium.com/word-choices-and-language-in-ux-part-three-user-interface-labels-messages-c1a383793e6a)

## UI

- [Design Better Forms](https://medium.com/nextux/design-better-forms-96fadca0f49c)
- [IntelliJ Platform UI Guidelines](https://jetbrains.github.io/ui/)

## UX/Usability

- [Ten Usability Heuristics for User Interface Design](https://www.nngroup.com/articles/ten-usability-heuristics/)
- [UX Design: How to Make User Interface Readable](https://blog.tubikstudio.com/ux-design-readable-user-interface/)

## Dark theme

Use the predefined colors in MPS or define your own colors using the class  [JBColor](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.ui%28MPS.IDEA%2F%29%2F%7EJBColor) with the constructor `JBColor(light theme color, dark theme color)`. By using this class, it shouldn't be necessary to verify if the user is [using the Darcula theme](https://stackoverflow.com/c/itemis-mps/questions/426). The MPS colors already support the light and dark theme because they inherit from `JBColor`. As seen in the screenshot below, the colors can be different when using the dark theme (for example: the white and black colors). Don't use hard-coded hex colors or the class [Color](http://127.0.0.1:63320/node?ref=6354ebe7-c22a-4a0f-ac54-50b52ab9b065%2Fjava%3Ajava.awt%28JDK%2F%29%2F%7EColor).

<figure markdown>
  ![light theme](light_theme_colors.png)
  <figcaption>Light theme</figcaption>
</figure>

<figure markdown>
  ![dark theme](dark_theme_colors.png)
  <figcaption>Dark theme</figcaption>
</figure>

Make sure that the foreground color is readable for the chosen background (see preceding screenshots). You can use an online [contrast checker tool](https://webaim.org/resources/contrastchecker/) to verify that the color combination is readable.

Example for colors with a good contrast ratio (foreground: black, the ratio can be found after the hex code):

![good color ratio](colors_good_contrast_ratio.png)

If this change isn't feasible, you can switch to the default theme (useful for RCPs):

```java
class LookAndFeel {
    void set() {
        LafManager lafManager = LafManager.getInstance();
        QuickChangeLookAndFeel.switchLafAndUpdateUI(lafManager, LafManagerImpl.getTestInstance().getDefaultLightLaf(), false);
    }
}
```

Additional useful resources:

- [ColorUtil](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.ui%28MPS.IDEA%2F%29%2F%7EColorUtil) (fromHex, darker, brighter, withAlpha, saturate, desaturate...)

- MPS color definitions: [MPSColors.java](https://github.com/JetBrains/MPS/blob/master/editor/editor-runtime/source/jetbrains/mps/nodeEditor/MPSColors.java)

- JBColor.[brighter](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.ui%28MPS.IDEA%2F%29%2F%7EJBColor.brighter%2528%2529)() + JBColor.[darker](http://127.0.0.1:63320/node?ref=498d89d2-c2e9-11e2-ad49-6cf049e62fe5%2Fjava%3Acom.intellij.ui%28MPS.IDEA%2F%29%2F%7EJBColor.darker%2528%2529)() e.g. `new JBColor(JBColor.PINK, JBColor.PINK.darker().darker())`

- IntelliJ IDEA color definitions: [JBColor](https://github.com/JetBrains/intellij-community/blob/master/platform/util/ui/src/com/intellij/ui/JBColor.java#L354)

- IntelliJ IDEA platform colors + explanation: [JBUI](https://github.com/JetBrains/intellij-community/blob/master/platform/util/ui/src/com/intellij/util/ui/JBUI.java) + [Platform theme colors](https://jetbrains.github.io/ui/principles/platform_theme_colors/)