---
alias: mpsutils_common
---

# Common

> ^^com.mbeddr.mpsutil.common^^

## Graph

The graph model contains classes for working with [graphs](https://en.wikipedia.org/wiki/Graph_theory) and an implementation for the [AVL tree](https://en.wikipedia.org/wiki/AVL_tree) data structure, a [self-balancing binary search tree](https://en.wikipedia.org/wiki/Self-balancing_binary_search_tree).
You can use the [Graph](http://127.0.0.1:63320/node?ref=r%3A007d0985-20e2-4d70-80f1-d0de1aff1076%28com.mbeddr.mpsutil.common.graph%29%2F176714188933282830) class together with [GraphUtil](http://127.0.0.1:63320/node?ref=r%3A007d0985-20e2-4d70-80f1-d0de1aff1076%28com.mbeddr.mpsutil.common.graph%29%2F5943598111404841931), which provides the following methods:

- *computeSCC(Graph)*: computes the strongly connected components of the given graph
- *isConnected(Graph, T initial)*: determines whether the given directed graph corresponds to a connected graph
- *computeSCCSingle(T sought, graph)*: returns the set of nodes in the [strongly connected component](https://en.wikipedia.org/wiki/Strongly_connected_component) that the node to find is in
- *computeTopologicalSorting(Graph, boolean silent)*: returns the [topological sorting](https://en.wikipedia.org/wiki/Topological_sorting) of the nodes of the given graph.

## Model

The class [ConceptInstanceFinder](http://127.0.0.1:63320/node?ref=r%3A72bc3a97-6a66-47f6-8cf2-f88ab2ada651%28com.mbeddr.mpsutil.common.model%29%2F6573709714620204463) contains a few methods for finding instances (= nodes) of a concept:

- **findAllVisibleInstances(context, conceptToFind)**: find instances of a concept in the used languages of the model. The context node's model is the starting point.

- **findAllInstances(conceptToFind)**: searches for nodes of the given concept in all user models from the global scope (not including transient and temporary models)

## Util

The class [ApplicationHelper](http://127.0.0.1:63320/node?ref=c7a315e6-1d93-4186-85bc-2dfafd1ccc21%2Fr%3Afb1c47d7-a72e-4e01-92dc-1e9f2ba4a118%28com.mbeddr.mpsutil.common%2Fcom.mbeddr.mpsutil.common.util%29%2F4815130854730761782) contains a method for running a Runnable object inside a progress window that optionally can be canceled. The class [ModelComparator](http://127.0.0.1:63320/node?ref=c7a315e6-1d93-4186-85bc-2dfafd1ccc21%2Fr%3Afb1c47d7-a72e-4e01-92dc-1e9f2ba4a118%28com.mbeddr.mpsutil.common%2Fcom.mbeddr.mpsutil.common.util%29%2F4319749102858900393) can compare two models programmatically and report the mismatches between them. [SNodeIdentityWrapper](http://127.0.0.1:63320/node?ref=c7a315e6-1d93-4186-85bc-2dfafd1ccc21%2Fr%3Afb1c47d7-a72e-4e01-92dc-1e9f2ba4a118%28com.mbeddr.mpsutil.common%2Fcom.mbeddr.mpsutil.common.util%29%2F7967869439934824295) is used to preserve node identity across model boundaries and is helpful in generator scenarios where you copy nodes between the different phases.

## Comparator

> ^^com.mbeddr.mpsutil.comparator^^

You can compare two nodes programmatically with the class [MPSNodeComparator](http://127.0.0.1:63320/node?ref=r%3Aec874b45-e888-42e6-995a-a298cefdff55%28com.mbeddr.mpsutil.comparator.code%29%2F3873779224823864369). Overloaded methods
for ignoring properties, ignored references, and some more settings exist. The returned object of class [MPSNodeComparison](http://127.0.0.1:63320/node?ref=r%3Aec874b45-e888-42e6-995a-a298cefdff55%28com.mbeddr.mpsutil.comparator.code%29%2F4775189917183996595) contains the list of differences and can also pre pretty printed by calling the method `getDescription()`.
