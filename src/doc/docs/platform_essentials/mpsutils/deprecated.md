# Deprecated languages and solutions

In MPS 2022.2, [this PR](https://github.com/mbeddr/mbeddr.core/pull/2286) removed some deprecated language from the platform.

## Code Completion Menu

> ^^com.mbeddr.mpsutil.ccmenu^^

!!! warning "This language isn't used anymore and is disabled."

This language added support for customizing the code completion menu with tabs and a special tab for creating reference
targets.  Create contributions by creating a [CCMenuExtensions](http://127.0.0.1:63320/node?ref=r%3A3d5b7b5d-2674-4caf-bdca-c100c5a0cb8e%28com.mbeddr.mpsutil.ccmenu.structure%29%2F6243347984996272104) root node in a plugin solution.

## HTTP Support

> ^^com.mbeddr.mpsutil.httpsupport^^

!!! warning "This plugin was the old HTTP support plugin. Please use the language jetbrains.mps.ide.httpsupport instead."


## Icon Char

> ^^com.mbeddr.mpsutil.iconchar^^

!!! warning "This language can create icons programmatically but is deprecated. Please use the official [Icon description](https://www.jetbrains.com/help/mps/icon-description.html) language instead."

## Make

> ^^com.mbeddr.mpsutil.make^^

!!! warning "This plugin contains old fixes for rebuilding models/modules and projects. The fixes are already part of MPS. The plugin will be removed soon."

## Multilingual

!!!warning "This language might be removed in the future."

> ^^com.mbeddr.mpsutil.multilingual^^

The idea behind this language was to store text translations in properties files and load them through the Java [ResourceBundle](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ResourceBundle.html) class. The documentation for the language
can be found [here as a PDF](../../files/multilingual.pdf), and you can find it in the virtual package ^^doc.com.mbeddr.mpsutil^^.

## Var Scope

> ^^com.mbeddr.mpsutil.varscope^^

!!! warning "This language provides the interfaces `IScopeElement` and `IScopeProvider` to provide scopes for nodes but is now deprecated. Please use the official [scopes](https://www.jetbrains.com/help/mps/scopes.html) instead."
