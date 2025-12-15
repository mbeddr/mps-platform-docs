**Ecore transformation tools** is a set of plugins and APIs that permit the transformation of EMF metamodels (Ecore/Xcore files) into MPS language structures, and the transformation of models from EMF into MPS and vice versa.

# User- Perspective

From the user's perspective, the Ecore transformation tools are available as a pop-up menu within the respective contexts.


1. Upon right-clicking the "Structure" aspect of a new Language, the "Import Ecore metamodel into MPS" is available as an option. The user chooses the corresponding metamodel file, which will be imported as concepts(class, interface, and enums) inside the language.
2. Upon right-clicking a "Model", it is possible to either import an existing emf model instance or export the model as an XML file. The difference lies in the file choosers that follow.

*  For the model exporter, the user begins with an existing model instance of a known metamodel (mps language), right-clicks on the model instance, and chooses the metamodel in EMF. The exported model instance is stored as a XML file in the file system (same location as the emf metamodel file).

* For the model importer, the user begins with an empty model where he intends to import the instance(in MPS), chooses the xml model instance and the corresponding EMF metamodel. He also needs to choose the metamodel in MPS (language structure) that corresponds to the EMF metamodel. This import is a step that needs to take place after the metamodel importer has been used. The imported model instance is available as nodes in the picked model.

# Developer perspective

From the developer perspective, the Ecore transformation tools are all in the _mbeddr.mpsutil_ languages within the _ecore_ virtual folder. There are two virtual sub-folders _impl_ and _tests_. The impl contains the plugins and runtime API, and the tests contain the tests. The plugin code is available inside the solution suffixed with _.ui_. The rest of the folder comprises runtime solutions and languages used internally by the model transformer and testing framework. These languages will be explained in the Design Decision section.

# Design decisions

Metamodel importer

The metamodel importer gets as input an Ecore/Xcore file representing an EMF metamodel. Both Ecore and Xcore files can represent the same EMF metamodel in different ways. The ecore file uses an XML representation, whereas an XCORE file uses a Java interface-like representation. Thanks to the EMF API and resource loaders, our importer is able to process both types of files without issues. The metamodel performs the following (on a high level):

* Import all non-abstract classes as concepts.
* Import all abstract classes as interface concepts.
* Import all enums as enumeration concepts. EMF permits enums with non-unique representations, which is not permitted in MPS. To handle this issue, our importer simply generates unique values starting from 0 with increments of 1 for enums which donot have unique values.
* Import all properties of classes as attributes. The properties of type int, char, and string are imported as is with the corresponding EMF primitive types. The properties of enum types are also mapped accordingly. The properties of any EMF type that is not one of the previously explained types are mapped to a string type with an annotation _EMFDatatype_. The value of this annotation is set to a _concept_ from the _ecore_ language, which contains a concept for each EMF data type permissible. We acquired this list of data types from the EMF api.

  ![enum import](images/ecore_enum import.png)

* Import all sub-class -> super-class/interface relationship as is, except for cases of multiple inheritance. Whenever there is a case of multiple inheritance, our importer creates interfaces that correspond to the superclasses and maps the subclass to the corresponding generated superclass. This is a popular method of mapping multiple inheritance to single inheritance systems.

  ![multiple inheritance import](ecore_multiple inheritance import.png)

In addition to the above-mentioned steps, the metamodel importer also creates a copy of the imported Ecore/Xcore file into the folder of the imported language and creates a new node called EcoreFileInfo, which points to the copied file.

The metamodel importer uses a lazy-resolving approach to efficiently resolve reference relationships. For every concept that has a reference relationship, the metamodel importer creates a lazy reference to the desired concept. At the end of the importing phase 1,

The Model Importer/Exporter

Both the model importer and exporter work similarly. The model exporter exports the model instance of MPS metamodels as XML, and the model importer uses the xml file to generate model instances. Both the model importer and exporter use the SModel API (MPS) and EMF API(EMF) to create nodes, parse the xml files, and so on. The implementation is pretty straightforward.

* The model importer parses the xml file, and for every node in the XML it searches for the corresponding class in the metamodel and creates an instance of the corresponding concept in MPS. The mapping between the class in EMF and the concept in MPS is performed using a simple class name search, and this assumes that the imported metamodels in EMF and MPS share the same class names. This is currently ensured by the metamodel importer.
* The model exporter parses the nodes in the root of the chosen MPS model, gets the concept of each of these nodes, and uses the EMF api to create nodes in the output xml file.

Both the importer and exporter use a multiple-phase approach to handle the resolution of children and references.

# The Testing framework

The testing framework includes a runtime and two language extensions.

1. The first language extension allows testers to specify the metamodel file in EMF(ecore/xcore file) and the expected metamodel. These are then used by the testing runtime to invoke the metamodel importer and assert if the imported metamodel and the expected metamodel are equal. This internally uses the MPS Node Comparator framework.

![meta model test](images/ecore_meta model test.png)

2. The second language extension allows testers to simultaneously test the model-importer and model-exporter. The tester simply needs to specify the two metamodels (MPS language and EMF ecore file) and the model instance to be tested. The testing framework internally uses the model-exporter to export this model as an XML file, store it in a temporary location, then use the model-importer to import this xml file as a temporary model and finally assert if the imported model and the original model are equal using the MPS Node Comparator.

![model test](images/ecore_model test.png)

Future directions:

The following tasks/features could be developed in the future:

1. Use the stored ecore file in the imported language (from the metamodel importer) to simplify the model export/import process. This feature would make sure the user does not have to choose both the metamodels (EMF and MPS) when importing model instances
2. Use annotations to compare the classes in MPS and EMF (for model import/export). This will make sure the model importer/exporter function is independent of the implementation choices taken by the metamodel importer.
3. Support versioning for the metamodel importer. The details of this feature are beyond the scope of this document. But a typical versioning system would be able to import only 'updated' parts of a previously imported metamodel and maintain links accordingly so that model import/exports remain unbroken after a metamodel upgrade.