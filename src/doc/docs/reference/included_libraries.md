# Included Java Libraries

The following list contains the Java libraries in the *lib* folder that are installed in MPS 2021.1 and later by default.
Jars that are removed in later MPS versions are not mentioned because it is too hard to figure out if they were just merged
into one of the 3rd-party JARs.

## MPS

- *bootstrap.jar* - the bootstrap classes for MPS
- *branding.jar* - the branding resources for MPS
- *mps-annotations.jar* - MPS-specific Java annotations such as \@GeneratedClass, \@Hack and \@ToRemove
- *mps-behavior-api.jar* - Java API of the [behavior](https://www.jetbrains.com/help/mps/behavior.html) aspect
- *mps-behavior-runtime.jar* - Java runtime classes of the [behavior](https://www.jetbrains.com/help/mps/behavior.html) language
- *mps-boot-util.jar* - Java utility classes needed on startup
- *mps-boot.jar* - the [launcher](https://raw.githubusercontent.com/JetBrains/MPS/master/startup/src/jetbrains/mps/Launcher.java) class that starts MPS
- *mps-closures.jar* - Java runtime classes of the [closures](https://www.jetbrains.com/help/mps/closures.html) language
- *mps-collections.jar* - Java runtime classes of the [collections](https://www.jetbrains.com/help/mps/collections-runtime.html) language
- *mps-constraints-runtime.jar* - Java runtime classes of the [constraints](https://www.jetbrains.com/help/mps/constraints.html) language
- *mps-context.jar* - Java runtime classes of the [feedback](https://www.jetbrains.com/help/mps/feedback.html) aspect
- *mps-core.jar* - the core plugin of MPS
- *mps-editor-api.jar* - Java API of the [editor](https://www.jetbrains.com/help/mps/editor.html) aspect
- *mps-editor-runtime.jar* - Java runtime classes of the [editor](https://www.jetbrains.com/help/mps/editor.html) aspect
- *mps-editor.jar* - all classed needed for the [editor](https://www.jetbrains.com/help/mps/editor.html) aspect
- *mps-environment.jar* - the Java classes that describe the environment that MPS is started with (e.g. standalone or as an IntelliJ IDEA plugin)
- *mps-feedback-api.jar* - Java API of the [feedback](https://www.jetbrains.com/help/mps/feedback.html) aspect
- *mps-generator.jar* - Java runtime classes of the [generator](https://www.jetbrains.com/help/mps/mps-generator.html) aspect
- *mps-icons.jar* - the JAR file that contains all [icons](icons.md)
- *mps-logging.jar* - Java runtime classes of the [logging](https://www.jetbrains.com/help/mps/logging.html) language
- *mps-messages-api.jar* - Java API for sending messages using the logging framework
- *mps-messages-for-legacy-constraints.jar* - Java classes for legacy constraints
- *mps-messages-for-rules.jar* - Java classes for rules of the [feedback](https://www.jetbrains.com/help/mps/feedback.html) aspect
- *mps-messages-for-structure.jar* - Java classes for problems in the structure aspect
- *mps-messaging.jar* - Java runtime classes for sending messages using the logging framework
- *mps-openapi.jar* - Java classes of the [Open API](https://www.jetbrains.com/help/mps/open-api-accessing-models-from-code.html)
- *mps-persistence.jar* - Java classes of the MPS [persistency](https://www.jetbrains.com/help/mps/custom-persistence-cookbook.html) framework
- *mps-platform.jar* - contains the IDE extension functionality, such as the console, VFS support, model checking, build language, and more.
- *mps-problem.jar* - Java classes for describing problems in the [feedback](https://www.jetbrains.com/help/mps/feedback.html) aspect
- *mps-project-check.jar* - Java classes of project-wide checks such as the constraint checker, model properties checker, and reference scope checker.
- *mps-references.jar* - Java runtime classes to support [call by reference](https://en.wikipedia.org/wiki/Evaluation_strategy#Call_by_reference) in Base Language
- *mps-resources.jar* - additional resources for MPS
- *mps-resources_en.jar* - the resource bundle that contains the translated strings of MPS
- *mps-test.jar* - Java runtime classes of the [testing](https://www.jetbrains.com/help/mps/testing-languages.html) languages
- *mps-textgen.jar* - Java runtime classes of the [TextGen](https://www.jetbrains.com/help/mps/textgen.html) aspect
- *mps-tips.jar* - contains the [tips of the day](https://www.jetbrains.com/help/mps/getting-started.html#d070c87c)
- *mps-tuples.jar* - Java runtime classes of the [tuples](https://www.jetbrains.com/help/mps/tuples.html) language
- *mps-workbench.jar* - Java runtime classes of the workbench. It provides integration with the IntelliJ Platform, the implementation of many UI elements, and it supports execution and debugging.
- *resources.jar* - the resources for MPS
- *resources_en.jar* - the English resources for MPS

## Ant

All the files are located in the folder */lib/ant/lib* and are used by [Apache Ant](https://ant.apache.org/). Most of the JARs
contain [tasks](https://ant.apache.org/manual/index.html) that can be executed by Ant.

- *ant-antlr.jar* - a [task](https://ant.apache.org/manual/Tasks/antlr.html) that integrates the ANTLR parser generator
- *ant-apache-bcel.jar* - a task that uses the [Apache BCEL](https://commons.apache.org/proper/commons-bcel/) library to manipulate bytecode
- *ant-apache-bsf.jar* - a [task](https://ant.apache.org/manual/Tasks/script.html) that allows scripting languages supported by the [Apache BSF](https://commons.apache.org/proper/commons-bsf/) framework to be used
- *ant-apache-log4j.jar* - a [task](https://ant.apache.org/manual/listeners.html) that configures and uses the [Apache Log4j](https://logging.apache.org/log4j/2.x/) logging system
- *ant-apache-oro.jar* - a [task](https://ant.apache.org/manual/Types/regexp.html) that provides regular expression support using the [Apache ORO](https://jakarta.apache.org/oro/) library
- *ant-apache-regexp.jar* - a [task](https://ant.apache.org/manual/Types/regexp.html) that provides regular expression support using the [Jakarta Regexp](https://jakarta.apache.org/regexp/) library
- *ant-apache-resolver.jar* - a task that resolves XML entities using the [Apache XML Commons Resolver](https://xerces.apache.org/xml-commons/components/resolver/#overview)
- *ant-apache-xalan2.jar* - a [task](https://ant.apache.org/manual/Tasks/style.html) for that performs XSL transformations using the [Xalan-J 2.x processor](https://xml.apache.org/xalan-j/)
- *ant-commons-logging.jar* - a task that enables logging using the [Jakarta Commons Logging API](https://commons.apache.org/proper/commons-logging/)
- *ant-commons-net.jar* - a task that provides network-related tasks using the [Jakarta Commons Net library](https://commons.apache.org/proper/commons-net/)
- *ant-jai.jar* - a [task](https://ant.apache.org/manual/Tasks/image.html) that performs image processing operations using the [Java Advanced Imaging API](https://www.oracle.com/java/technologies/advanced-imaging-api.html)
- *ant-javamail.jar* - a [task](https://ant.apache.org/manual/Tasks/mail.html) that sends email messages using the [JavaMail API](https://javaee.github.io/javamail/)
- *ant-jdepend.jar* - a [task](https://ant.apache.org/manual/Tasks/jdepend.html) that measures the design quality of Java code using the [JDepend](http://www.testingtoolsguide.net/tools/jdepend/) tool
- *ant-jmf.jar* - a task that plays media files using the [Java Media Framework API](https://www.oracle.com/java/technologies/javase/java-media-framework.html)
- *ant-jsch.jar* - a [task](https://ant.apache.org/manual/Tasks/scp.html)/[task](https://ant.apache.org/manual/Tasks/sshsession.html) that supports SSH2 and SCP operations using the [JSch](http://www.jcraft.com/jsch/) library
- *ant-junit.jar* - a [task](https://ant.apache.org/manual/Tasks/junit.html) that runs unit tests using the JUnit 3.x or 4.x framework
- *ant-junit4.jar* - a [task](https://ant.apache.org/manual/Tasks/junitlauncher.html) that runs unit tests using the JUnit 4.x framework
- *ant-junitlauncher.jar* - a [task](https://ant.apache.org/manual/Tasks/junitlauncher.html) that runs unit tests using the JUnit Platform Launcher API
- *ant-launcher.jar* - a [launcher](https://ant.apache.org/manual/install.html) that sets up the classpath and invokes the main class
- *ant-mps.jar* - a set of [tasks and types](https://www.jetbrains.com/help/mps/2021.2/howto-mps-and-ant.html) that support building and running MPS projects
- *ant-netrexx.jar* - a task that compiles [NetRexx](https://netrexx.org/) source files to Java bytecode
- *ant-swing.jar* - a task that displays a Swing-based user interface for selecting targets to execute
- *ant-testutil.jar* - a utility class that facilitates writing test cases for tasks and types
- *ant-xz.jar* - a [task](https://ant.apache.org/manual/Tasks/pack.html) that supports compressing and decompressing files using the XZ format
- *ant.jar* - the core classes and tasks of [Apache Ant](https://ant.apache.org/), a Java-based build tool
- *mpsant/mps-run.jar* - a library for running MPS applications from within an Ant build script
- *mpsant/mps-tool.jar* - a library for invoking MPS tools such as generators and checkers from within an Ant build script

## IntelliJ Platform

- *annotations.jar* - [JetBrains Java annotations](https://github.com/JetBrains/java-annotations) (useful Java annotations such as \@NotNull and \@ScheduledForRemoval)
- *ap-validation.jar* - [AP Validation](https://github.com/JetBrains/ap-validation) is a library for validating statistics events before sending them to the server
- *asm-all.jar* - [ASM](https://asm.ow2.io/) is a Java bytecode manipulation and analysis framework
- *automaton.jar* - [Automaton](http://www.brics.dk/automaton/) is a Java library that contains a DFA/NFA (finite-state automata) implementation with Unicode alphabet (UTF16) and support for the standard regular expression operations and several non-standard operations
- *batik-codec.jar* - [Apache Batik SVG Toolkit](https://xmlgraphics.apache.org/batik/) is a Java-based toolkit for applications or applets that want to use images in the Scalable Vector Graphics (SVG) format for various purposes, such as display, generation or manipulation
- *batik-transcoder.jar* - additional library for Apache Batik for [transcoding](https://xmlgraphics.apache.org/batik/using/transcoder.html) SVG documents to other formats
- *blockmap.jar* - [BlockMap](https://github.com/JetBrains/plugin-blockmap-patches) is a library for efficient block-based file operations
- *bouncy-castle-provider.jar* - the [Bouncy Castle Provider](https://www.bouncycastle.org/) is a Java cryptography API that provides implementations of various cryptographic algorithms, protocols, and standards
- *byte-buddy-agent.jar* - the Java agent for [Byte Buddy](https://bytebuddy.net) is a code generation and manipulation library for creating and modifying Java classes during the runtime of a Java application and without the help of a compiler
- *caffeine.jar* - [Caffeine](https://github.com/ben-manes/caffeine) is a high performance, near-optimal caching library
- *cds/classesLogAgent.jar* - a library for logging class-loading events
- *cglib-nodep.jar* - [cglib](https://github.com/cglib/cglib) is a high-level API to generate and transform JAVA byte code
- *classgraph.jar* - [ClassGraph](https://github.com/classgraph/classgraph) is an uber-fast parallelized classpath scanner and module scanner
- *cli-parser.jar* - [CLI Parser](https://github.com/spullara/cli-parser) is a library for parsing various kinds of command line arguments or property lists
- *commons-cli.jar* - [Apache Commons CLI](https://commons.apache.org/proper/commons-cli/) provides an API for parsing command line options passed to programs. It's also able to print help messages detailing the options available for a command line tool.
- *commons-codec.jar* - [Apache Commons Codec](https://commons.apache.org/proper/commons-codec/) provides implementations of common encoders and decoders such as Base64, Hex, Phonetic and URLs.
- *commons-collections.jar* - [Apache Commons Collections](https://commons.apache.org/proper/commons-collections/) extends and augments the Java Collections Framework
- *commons-compress.jar* - [Apache Commons Compress](https://commons.apache.org/proper/commons-compress/) defines an API for working with ar, cpio, Unix dump, tar, zip, gzip, XZ, Pack200, bzip2, 7z, arj, lzma, snappy, DEFLATE, lz4, Brotli, Zstandard, DEFLATE64, and Z files.
- *commons-httpclient.jar* - [Apache Commons HttpClient](https://hc.apache.org/httpclient-legacy/) was a library for accessing HTTP resources
- *commons-imaging.jar* - [Apache Commons Imaging](https://commons.apache.org/proper/commons-imaging/) is a library that reads and writes a variety of image formats, including fast parsing of image info (size, color space, ICC profile, etc.) and metadata.
- *commons-io.jar* - [Apache Commons IO](https://commons.apache.org/proper/commons-io/) is a library of utilities to help with developing IO functionality.
- *commons-lang3.jar* - [Apache Commons Lang](https://commons.apache.org/proper/commons-lang/) is a library for enhancing the core Java classes
- *commons-logging.jar* - [Apache Commons Logging](https://commons.apache.org/proper/commons-logging/) a library for logging abstraction
- *dom-impl.jar* - DOM implementation for the IntelliJ platform
- *dom-openapi.jar* - DOM Open API for the IntelliJ platform
- *ecj.jar*: [Eclipse Compiler for Java](https://wiki.eclipse.org/JDT_Core_Programmer_Guide/ECJ)
- *error_prone_annotations.jar* - Annotations for [Error Prone](https://github.com/google/error-prone), a static analysis tool for Java that catches common programming mistakes at compile-time
- *ext/diffutils.jar* - [DiffUtils](https://github.com/java-diff-utils/java-diff-utils) is a library for performing the comparison operations between texts: computing diffs, applying patches, generating unified diffs or parsing them, generating diff output for easy future displaying (like side-by-side view) and so on.
- *external-system-rt.jar* - [External System Runtime](https://github.com/JetBrains/intellij-community/tree/master/platform/external-system-rt) library of the IntelliJ platform
- *fluent-hc.jar* - the [Fluent API](https://hc.apache.org/httpcomponents-client-4.5.x/current/tutorial/html/fluent.html) of client of [Apache HttpComponents](https://hc.apache.org/)
- *forms-preview.jar* - previewer of [JGoodies Forms](https://github.com/JFormDesigner/swing-jgoodies-forms), a framework that helps you lay out and implement elegant Swing panels quickly and consistently
- *forms_rt.jar* - runtime classes of [JGoodies Forms](https://github.com/JFormDesigner/swing-jgoodies-forms)
- *grazie-spellchecker.jar* - [Grazie Spellchecker](https://blog.jetbrains.com/idea/2019/11/meet-grazie-the-ultimate-spelling-grammar-and-style-checker-for-intellij-idea/), the spell checking in IntelliJ IDEA
- *groovy.jar* - a library for [Groovy](https://groovy.apache.org/index.html), a Java-based scripting language
- *groovy-json.jar* - a [library](https://groovy-lang.org/processing-json.html) for JSON processing with Groovy
- *groovy-jsr223.jar* - a [library](https://groovy-lang.org/integrating.html) for scripting with Groovy and JSR 223
- *groovy-templates.jar* - a [library](https://docs.groovy-lang.org/docs/next/html/documentation/template-engines.html) for template engines with Groovy
- *groovy-xml.jar* - a [library](https://groovy-lang.org/processing-xml.html) for XML processing with Groovy
- *grpc-core.jar* - [gRPC Core](https://github.com/grpc/grpc-java), the Java implementation of gRPC. gRPC is a high-performance, open source, general-purpose RPC framework.
- *grpc-kotlin-stub.jar* - [gRPC Kotlin Stub](https://github.com/grpc/grpc-kotlin) is a Kotlin implementation of gRPC, providing runtime support for client-stubs and server-side code.
- *grpc-netty-shaded.jar* - support for [Netty-based](https://github.com/grpc/grpc-java/tree/master/netty/shaded) transport for gRPC
- *grpc-protobuf.jar* - [Protobuf](https://github.com/grpc/grpc-java/tree/master/protobuf) support for gRPC which allows defining service contracts and data structures using the Protocol Buffers language
- *grpc-stub.jar* - a library that provides [stub classes](https://github.com/grpc/grpc-java/tree/master/stub) for gRPC, which are abstract classes or interfaces that define the methods and parameters of a gRPC service
- *gson.jar* - [Gson](https://github.com/google/gson) is a Java library that can be used to convert Java Objects into their JSON representation
- *guava.jar* - [Guava](https://github.com/google/guava) is a set of core Java libraries from Google that includes new collection types (such as multimap and multiset), immutable collections, a graph library, and utilities for concurrency, I/O, hashing, primitives, strings, and more
- *http-client.jar* - [HTTP Client](https://www.jetbrains.com/help/idea/http-client-in-product-code-editor.html) plugin allows you to create, edit, and execute HTTP requests directly in the IntelliJ IDEA
- *icons.jar* - [IntelliJ icons](https://jetbrains.design/intellij/resources/icons_list/)
- *icu4j.jar* - [ICU4J](https://unicode-org.github.io/icu/userguide/icu4j/) is a library that provides robust and full-featured Unicode services on a wide variety of platforms
- *idea_rt.jar* - the IDEA Runtime library, a library for running IDEA-based applications
- *imageio-tiff.jar* - [ImageIO TIFF](https://imageio.readthedocs.io/en/v2.8.0/format_tiff.html) is a library for reading and writing TIFF images
- *imgscalr-lib.jar* - [Imgscalr](https://github.com/rkalla/imgscalr) is a library for image scaling and manipulation
- *ini4j.jar* - [Ini4j](https://ini4j.sourceforge.net/) is a simple Java API for handling configuration files in Windows .ini format
- *intellij-coverage-agent.jar* - [IntelliJ Coverage Agent](https://github.com/JetBrains/intellij-coverage) is a coverage agent for code coverage analysis
- *intellij-deps-fastutil.jar* - [IntelliJ Fastutil](https://github.com/JetBrains/intellij-deps-fastutil) is a library for fast and memory-efficient collections
- *intellij-dvcs.jar* - [IntelliJ DVCS](hhttps://github.com/iterative/intellij-dvc) is a library for distributed version control systems
- *intellij-test-discovery-agent.jar* - [IntelliJ Test Discovery Agent](https://github.com/JetBrains/intellij-coverage) is a coverage agent for code coverage analysis
- *intellij-xml.jar* - adds support for [XML](https://www.jetbrains.com/help/idea/working-with-xml.html) in IntelliJ IDEA
- *ion-java.jar* - [Ion](https://github.com/amazon-ion/ion-java) is a Java implementation of the Ion data notation
- *isorelax.jar* - [ISO RELAX](https://iso-relax.sourceforge.net/) contains public interfaces useful for applications to support RELAX Core
- *jackson-core.jar* - [Jackson Core](https://github.com/FasterXML/jackson-core) contains the core low-level incremental ("streaming") parser and generator abstractions used by the [Jackson Data Processor](https://github.com/FasterXML/jackson)
- *jackson-databind.jar* - [Jackson Databind](https://github.com/FasterXML/jackson-databind) contains the general-purpose data-binding functionality and tree-model for [Jackson Data Processor](https://github.com/FasterXML/jackson)
- *jackson-module-kotlin.jar* - adds support for serialization/deserialization of [Kotlin](https://github.com/FasterXML/jackson-module-kotlin) classes and data classes [Kotlin support]() for the Jackson library
- *java-api.jar* - API of the IntelliJ Java plugin
- *java-compatibility.jar* - [Java9Compatibility](https://github.com/JetBrains/intellij-deps-java-compatibility) contains classes from JDK8 excluded from JDK9
- *java-impl.jar* - implementation classes of the IntelliJ Java plugin
- *java-string-similarity.jar* - the [Java String Similarity](https://github.com/tdebatty/java-string-similarity) library, a library for string similarity metrics
- *java_resources_en.jar* - the English resources for the MPS Java module
- *javac2.jar* - [IntelliJ-specific implementation](https://github.com/JetBrains/intellij-community/blob/master/java/compiler/javac2/src/com/intellij/ant/Javac2.java) of javac with special support for checking \@NotNull annotation at runtime.
- *javax.activation.jar*: [JavaBeans(TM) Activation Framework](https://www.oracle.com/java/technologies/java-beans-activation.html) is a Java library that provides a way to handle data of different types and formats in a uniform way. It allows applications to determine the type of a piece of data, access it, and perform operations on it using JavaBeans components
- *javax.annotation-api.jar* - [Jakarta Annotations](https://github.com/jakartaee/common-annotations-api) defines a collection of annotations representing common semantic concepts that enable a declarative style of programming that applies across a variety of Java technologies
- *jaxb-api.jar* - [Java XML Binding API](https://docs.oracle.com/javase/8/docs/technotes/guides/xml/jaxb/index.html) provides an API and tools that automate the mapping between XML documents and Java objects.
- *jaxb-api.jar*: [Jakarta XML API](https://github.com/jakartaee/jaxb-api) provides an API and tools that automate the mapping between XML documents and Java objects.
- *jaxen.jar* - [Jaxen](https://github.com/jaxen-xpath/jaxen) is a [XPath](https://en.wikipedia.org/wiki/XPath) engine for Java
- *jb-jdi.jar* - [JetBrains JDI](https://github.com/JetBrains/intellij-deps-jdi) is a fork of the [jdk.jdi](https://docs.oracle.com/en/java/javase/13/docs/api/jdk.jdi/module-summary.html) module.
- *jcef-api.jar* - API of [JCEF](jcef.md)
- *jcip-annotations.jar* - [JCIP Annotations](https://github.com/stephenc/jcip-annotations) is an implementation of the [JCIP](http://jcip.net/) Annotations
- *jdom.jar* - [JDOM](http://www.jdom.org/) is a Java-based solution for accessing, manipulating, and outputting XML data
- *jediterm-pty.jar* - [JediTerm PTY](https://github.com/JetBrains/jediterm) provides a pure Java terminal widget that can be easily embedded into an IDE
- *jetCheck.jar* - the [JetCheck](https://github.com/JetBrains/jetCheck) is a property-based testing library for Java 8+, inspired by QuickCheck and Hypothesis
- *jing.jar* - [Jing](https://relaxng.org/jclark/jing.html) is a [RELAX NG](https://relaxng.org/) validator
- *jna-platform.jar* - [JNA platform](https://github.com/java-native-access/jna) is a library for native access to platform-specific libraries
- *jna.jar* - [JNA](https://github.com/java-native-access/jna) is a library for native access to shared libraries
- *jps-model.jar* - Model part of [JPS](https://github.com/JetBrains/intellij-community/tree/master/jps). JPGS is a Gant-based build framework + DSL.
- *jps/jps-build-test.jar* - Jar that belongs to [JPS](https://github.com/JetBrains/intellij-community/tree/master/jps)
- *jsch.jar* - [JSch](http://www.jcraft.com/jsch/) is a Java implementation of the [SSH2 protocol](https://datatracker.ietf.org/wg/secsh/about/).
- *jshell-frontend.jar* - the [JShell](https://www.jetbrains.com/help/idea/jshell-console.html) Frontend library, a library for JShell integration
- *json.jar* - support for the [JSON format](https://www.jetbrains.com/help/idea/json.html) for IntelliJ IDEA
- *jsonpath.jar* - the [JsonPath](https://github.com/json-path/JsonPath) library, a library for JSON querying
- *jsoup.jar* - [Jsoup](https://jsoup.org/) is a library for HTML parsing
- *jsp-base-openapi.jar* - [JSP Base Open API](https://github.com/dernasherbrezon/jsp-openapi) is a library for rendering open API specification
- *junit4.jar*: [JUnit 4](https://junit.org/junit4/) is a unit testing framework
- *kotlin-reflect.jar* - a library for [Kotlin reflections](https://kotlinlang.org/docs/reflection.html)
- *kotlin-stdlib-jdk8.jar* - a library for the [Kotlin standard library](https://kotlinlang.org/docs/whatsnew18.html) for JDK 8
- *kotlin-test.jar* - [Kotlin Test](https://kotlinlang.org/docs/jvm-test-using-junit.html) is a library for Kotlin testing utilities
- *kotlinx-coroutines-jdk8.jar* - [Kotlinx Coroutines](https://github.com/Kotlin/kotlinx.coroutines) for JDK 8
- *kryo.jar* - [Kryo](https://github.com/EsotericSoftware/kryo) is a fast and efficient binary object graph serialization framework
- *log4j.jar*: [Log4j 1.2](https://logging.apache.org/log4j/1.2/) is a deprecated logging framework
- *lz4-java.jar* - [LZ4 Java](https://github.com/lz4/lz4) is a library for LZ4 compression and decompression
- *markdown.jar* - [Markdown plugin](https://www.jetbrains.com/help/idea/markdown.html#required_plugin) of IntelliJ IDEA
- *markdownj-core.jar* - [markdownj](https://github.com/myabc/markdownj) is the pure Java port of Markdown (a text-to-html conversion tool written by John Gruber)
- *marketplace-zip-signer.jar* - [Marketplace Zip Signer library](https://github.com/JetBrains/marketplace-zip-signer) can be used to sign and verify JetBrains plugins, but it can be applied to any other zip archive
- *maven-resolver-provider.jar* - [Apache Maven Artifact Resolver](https://maven.apache.org/resolver/index.html) is a library for working with artifact repositories and dependency resolution
- *microba.jar*: [Microba controls](https://github.com/DataGrip/microba) is a set of Java Swing components
- *miglayout-swing.jar*: [MigLayout](https://www.miglayout.com/) is a Java Layout Manager for Swing, SWT, and JavaFX
- *nanoxml.jar*: [nanoxml](https://github.com/saulhidalgoaular/nanoxml) is a non-validating XML parser
- *netty-buffer.jar*: Netty Buffer is an abstraction of a byte buffer, the fundamental data structure to represent a low-level binary and text message [JavaDoc](https://netty.io/4.0/api/io/netty/buffer/package-summary.html)
- *netty-codec-http*: encoder, decoder and their related message types for HTTP ([JavaDoc](https://netty.io/4.0/api/io/netty/handler/codec/http/package-summary.html))
- *netty-handler-proxy.jar* - Netty Handler Proxy library, a library that provides proxy handler implementations for Netty, which is a high-performance, asynchronous, event-driven framework for network applications
- *ngram-slp.jar* - [Ngram SLP](https://github.com/JetBrains/intellij-community/tree/master/plugins/completion-ml-ranking/src/com/intellij/completion/ml/ngram) is a library for n-gram language models
- *objenesis.jar* - [Objenesis](https://github.com/easymock/objenesis) is a library dedicated to bypassing the constructor when creating an object
- *openapi.jar*: an API to interact with the [IntelliJ platform](https://plugins.jetbrains.com/docs/intellij/welcome.html)
- *oro.jar* - [Jakarta ORO](https://jakarta.apache.org/oro/) is a library for regular expressions
- *owasp-java-html-sanitizer.jar* - [OWASP Java HTML Sanitizer](https://github.com/OWASP/java-html-sanitizer) is a library for HTML sanitization
- *platform-api.jar*: public API of the IntelliJ platform SDK
- *platform-impl.jar*: implementation classes of the IntelliJ platform SDK
- *platform-objectSerializer-annotations.jar*: annotations of the [IntelliJ object serializer](https://github.com/JetBrains/intellij-community/tree/master/platform/object-serializer))
- *platform-statistics-devkit.jar*: statistics plugin of the IntelliJ platform ([source](https://github.com/JetBrains/intellij-community/tree/master/platform/statistics/devkit))
- *platform.jar*: [IntelliJ platform SDK](https://plugins.jetbrains.com/docs/intellij/welcome.html)
- *plexus-utils.jar* - [Plexus Common Utils](https://codehaus-plexus.github.io/plexus-utils/) is a collection of various utility classes to ease working with strings, files, command lines, and more.
- *protobuf-java.jar* - the Java implementation of the [Protocol Buffers](https://github.com/protocolbuffers/protobuf/tree/main), Google's data interchange format
- *proxy-vole.jar* - [Proxy Vole](https://github.com/MarkusBernhardt/proxy-vole) is a library to auto-detect the platform network proxy settings
- *qdox.jar* - [QDox](https://github.com/paul-hammant/qdox) is a library for extracting class/interface/method definitions from sources
- *rd-core.jar* - [RD](https://github.com/JetBrains/rd) is a reactive-distributed communication framework
- *rd-framework.jar* - the [RD Framework](https://github.com/JetBrains/rd) is a reactive-distributed communication framework
- *rd-swing.jar* - is the swing integration for [RD Framework](https://github.com/JetBrains/rd)
- *rhino-runtime.jar* - the [runtime](https://p-bakker.github.io/rhino/docs/runtime/) of the [Rhino JavaScript engine](https://github.com/mozilla/rhino)
- *rngom.jar* - [RNGOM](https://linuxsoft.cern.ch/cern/centos/7/updates/x86_64/repoview/rngom.html) is a library for parsing RELAX NG grammars
- *roaringbitmap.jar* - [RoaringBitmap](https://github.com/RoaringBitmap/RoaringBitmap) is a library for roaring bitmaps. These are compressed bitmaps that tend to outperform conventional compressed bitmaps such as WAH, EWAH, or Concise.
- *serviceMessages.jar* - [Service messages](https://www.jetbrains.com/help/teamcity/service-messages.html) are specially constructed pieces of text that pass commands/information about the build from the build script to the TeamCity server.
- *slf4j.jar* - [SLF4J](https://slf4j.org/) serves as a simple facade or abstraction for various logging frameworks
- *snakeyaml.jar* - [SnakeYAML](https://github.com/snakeyaml/snakeyaml) is a library for YAML processing
- *snakeyaml-engine.jar* - [SnakeYAML Engine](https://bitbucket.org/snakeyaml/snakeyaml-engine/src/master/) is a YAML 1.2 processor
- *spellchecker.jar* - the [Spellchecker](https://www.jetbrains.com/help/idea/spellchecking.html) library of the IntelliJ platform
- *stats.jar* - [statistics library](https://github.com/JetBrains/intellij-community/tree/master/platform/statistics) of the IntelliJ platform
- *stax-api.jar* - [StAX API](https://docs.oracle.com/javase/tutorial/jaxp/stax/api.html) is an API that exposes methods for iterative, event-based processing of XML documents
- *streamex.jar* - [StreamEx](https://github.com/amaembo/streamex) is a library for enhancing Java 8 Streams
- *swingx-core.jar* - [SwingX Core](https://github.com/arotenberg/swingx) is a library for Swing extensions
- *testFramework-java.jar* - Java library of the [IntelliJ Test Framework](https://www.jetbrains.com/help/idea/testing.html)
- *testFramework.core.jar* - Java library of the [IntelliJ Test Framework](https://www.jetbrains.com/help/idea/testing.html)
- *testFramework.jar* - Java library of the [IntelliJ Test Framework](https://www.jetbrains.com/help/idea/testing.html)  testing
- *tests_bootstrap.jar* - Java library of the [IntelliJ Test Framework](https://www.jetbrains.com/help/idea/testing.html)
- *trang-core.jar* - [Trang Core](https://relaxng.org/jclark/trang.html) is a multi-format schema converter based on RELAX NG
- *trove4j.jar*: [GNU Trove](https://trove4j.sourceforge.net/html/overview.html) provides primitive type support for the Java collections API
- *uast-tests.jar* - UAST Tests library is a library for testing the [Universal Abstract Syntax Tree](https://plugins.jetbrains.com/docs/intellij/uast.html)
- *util.jar*: [Utility classes](https://github.com/JetBrains/intellij-community/tree/master/platform/util) from the IntelliJ platform
- *velocity.jar* - [Apache Velocity](https://velocity.apache.org/) is a Java-based template engine
- *winp.jar* - [WinP](https://github.com/jenkinsci/winp) is a library for Windows process management
- *xercesImpl.jar* - [XercesImpl](https://xerces.apache.org/xerces2-j/) is a library for XML parsing and validation
- *xml-apis-ext.jar* - [External components](https://xerces.apache.org/xml-commons/components/external/) of Apache XML Commons
- *xml-resolver.jar* - [Apache XML Commons Resolver Component](https://xerces.apache.org/xml-commons/components/resolver/)
- *xmlbeans.jar* - [Apache XMLBeans](https://xmlbeans.apache.org/) is a library for accessing XML by binding it to Java types
- *xmlrpc.jar* - [Apache XML-RPC Client](https://ws.apache.org/xmlrpc/client.html) is the client for [Apache XML-RPC](https://ws.apache.org/xmlrpc/), a Java implementation of XML-RPC, a popular protocol that uses XML over HTTP to implement remote procedure calls
- *xstream.jar*: [XStream](https://x-stream.github.io/index.html) is a simple library to serialize objects to XML and back again
- *xz.jar* - [XZ](https://tukaani.org/xz/java.html) is a library for XZ compression and decompression

## Changes in 2021.2.x

- All third-party jars are now merged into one big jar: *3rd-party.jar*
- Added: *find-action-model.jar* - a library for finding actions in natural language text
- Added: *kotlinx-serialization-json-jvm.jar* - a [Kotlin library](https://kotlinlang.org/docs/serialization.html) for serializing and deserializing JSON data
- Added: *tips-intellij-idea-community.jar* - a jar file containing the Tips plugin for IntelliJ IDEA Community Edition, which is a plugin that shows tips and tricks for using IntelliJ IDEA in a popup window.

## Changes in 2021.3.x

- *3rd-party-rt.jar*: a jar file containing the runtime classes of various third-party libraries that are used by IntelliJ IDEA, such as JNA, ASM, and Log4j.
- *eclipse.jar*: a jar file containing the core classes of the Eclipse platform, such as the runtime, resources, and workspace APIs.
- *annotations.jar* was renamed to *jetbrains-annotations*.
- *kotlinx-metadata-jvm*: the Kotlinx Metadata JVM library, which is a Kotlin library for reading and writing JVM metadata in Kotlin class files and Android DEX files.
- *kotlinx.jar*: [Kotlinx](https://github.com/Kotlin/) is a collection of various Kotlin libraries that provide useful extensions and utilities for various domains, such as coroutines, serialization, collections, and datetime.
- *groovy-json.jar* was renamed from *org_codehaus_groovy_groovy-json.jar*
- *groovy-jsr223.jar* was renamed from *org_codehaus_groovy_groovy-jsr223.jar*
- *groovy-templates.jar* was renamed from *org_codehaus_groovy_groovy-templates.jar*
- *groovy-xml.jar* was renamed from *org_codehaus_groovy_groovy-xml.jar*
- *groovy.jar* was renamed from *org_codehaus_groovy_groovy.jar*

## Changes in 2022.2.x

- *3rd-party.jar* was removed again. That means that some JARs exist as standalone JARs again (e.g. asm libraries)
- *externalProcess-rt.jar*: a jar file containing the external process runtime library, which is a Java library for launching and communicating with external processes in a platform-independent way.
- *groovy.jar*: a jar file for the [Groovy](https://groovy-lang.org/) language, which is a dynamic scripting language for the Java platform that supports multiple paradigms, such as object-oriented, functional, and imperative programming.
- *jffi.jar*: [JFFI](https://github.com/jnr/jffi) is a Java library for interfacing with native code using JNA
- *jffi-native.jar*: Native part of [JFFI](https://github.com/jnr/jffi)
- *jnr-a64asm.jar*: [JNR A64ASM](https://github.com/jnr/jnr-a64asm) is a Java library for generating ARM64 assembly code at runtime
- *jnr-ffi.jar*: [JNR FFI](https://github.com/jnr/jnr-ffi) is a Java library for interfacing with native code using libffi
- *jnr-x86asm.jar*: a jar file containing the [JNR X86ASM](https://github.com/jnr/jnr-x86asm) library, which is a Java library for generating x86 assembly code at runtime.
- *kotlin-compiler-client-embeddable.jar*: a jar file containing an embeddable version of the [Kotlin compiler](https://kotlinlang.org/docs/command-line.html)
- *kotlinx-metadata-jvm.jar*: [Kotlinx Metadata JVM library](https://github.com/JetBrains/kotlin/blob/master/libraries/kotlinx-metadata/jvm/ReadMe.md) provides an API to read and modify metadata of binary files generated by the Kotlin/JVM compiler, namely `.class` and `.kotlin_module` files.
- *lz4-java.jar*: [LZ4 compression library for Java](https://github.com/lz4/lz4-java) is a Java port of the LZ4 compression algorithm that offers fast compression and decompression speeds1.
- *util_rt.jar*: [utility runtime](https://github.com/JetBrains/intellij-community/tree/master/platform/util-rt) is a Java library that provides various utility classes and methods for common tasks, such as logging, configuration, reflection, and concurrency.

## Changes in 2022.3.x

- *ant-imageio.jar*: [Ant ImageIO](https://ant.apache.org/manual/Tasks/imageio.html) is an Ant task that allows reading and writing image files using the Java ImageIO API2.
- *tools-testsBootstrap.jar*: [tools tests bootstrap library](https://www.jetbrains.com/help/idea/testing.html)  is a Java library that provides test utilities and helpers for testing tools and applications.
- *xml-dom-impl.jar*: [XML DOM implementation](https://docs.oracle.com/en/java/javase/17/docs/api/java.xml/org/w3c/dom/package-summary.html) is a library that provides an implementation of the W3C Document Object Model (DOM) API for manipulating XML documents.