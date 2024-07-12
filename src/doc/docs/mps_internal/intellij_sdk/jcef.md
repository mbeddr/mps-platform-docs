---
comments: true
tags:
- internals
- intellij
- java
---

Start with the page [JCEF - Java Chromium Embedded Framework](https://plugins.jetbrains.com/docs/intellij/jcef.html) of the IntelliJ platform plugin SDK.

JCEF should work with MPS 2021.1.4 and higher. Although introduced in IntelliJ IDEA 2020.1, it might not work in older MPS versions because of classloading issues. You can embed The browser (`JBCefBrowser`) in the MPS editor with a Java Swing component cell.
For simple use cases, it is enough to call `browser.loadHTML` to load some HTML code. The content can be created by Java or by
calling the MPS generator or [TextGen](http://localhost:8000/mps-platform-docs/aspects/textgen).

Existing Java documentation and examples on the web:

- [Java JCEF example](https://github.com/viglucci/app-jcef-example) that showcases all kinds of handlers and dialogs
- [IntelliJ Markdown preview](https://github.com/JetBrains/intellij-community/blob/master/plugins/markdown/core/src/org/intellij/plugins/markdown/ui/preview/jcef/MarkdownJCEFHtmlPanel.kt)
- [How do I use JCEF with Intellij?](https://stackoverflow.com/questions/65480681/how-do-i-use-jcef-with-intellij)
- [CEF documentation (non Java version)](https://bitbucket.org/chromiumembedded/cef/wiki/Home)

The third link contains an answer on how to do bidirectional communication between the embedded browser and Java (MPS): You have
to create a browser pipe between Java ([implementation](https://github.com/xm-online/xm-online-idea-plugin/blob/cf85d39901af4d89ba8b7bd5099d3ec25b49af27/src/main/kotlin/com/icthh/xm/actions/WebDialog.kt#L138)) and JS ([implementation](https://github.com/xm-online/xm-online-idea-plugin/blob/5d511177394067d87f68e50898f0d631adb5dbd8/src/main/webapp/src/index.html)). The communication uses JS. You then have a `subscribe` method that you can use to
listen to events posted through a specific tag or create an event using the `post` method. These methods are available in Java and JS.

**Warning**: MPS and the IntelliJ IDEA use Swing to create all the UI components. They are considered lightweight because Java itself draws them. JCEF uses native code, and it is a heavyweight component. Especially with MPS' reloading capabilities, t is important to dispose of the browser when it isn't needed. The following code registers a listener for the editor component
dispose event and also closes the browser:

```java
class SwingComponent {
    void create() {
        // ...
        EditorComponent editorComponent = (EditorComponent) editorContext.getEditorComponent();
        editorComponent.addDisposeListener(new EditorComponent.EditorDisposeListener() {
            @Override
            public void editorWillBeDisposed(@NotNull() EditorComponent p1) {
                browser.getCefBrowser().close(true);
            }
        });
        // ...
    }   
}
```

When the browser is not correctly disposed of, it might be drawn in different components or on top of MPS editors. Some issues are known where JCEF makes the IDE crash (JBR-4667 + linked related issues, JBR-2206 + linked related issues).  

## Demo + WebSockets

A demo for the JCEF integration can be found in the repository [mps_jcef_minimal](https://github.com/alexanderpann/mps_jcef_minimal). Read the readme for more information. The demo contains two branches, one shows the internal communication via JS, and the other branch uses WebSocket for the communication. The WebSocket server is modeled after this [tutorial](https://medium.com/@irunika/how-to-write-a-http-websocket-server-using-netty-f3c136adcba9) and uses the existing IntelliJ libraries of Netty. The handling of web socket frames is described in more detail in [Chapter 12. WebSocket - Netty in Action](https://livebook.manning.com/book/netty-in-action/chapter-12/40).