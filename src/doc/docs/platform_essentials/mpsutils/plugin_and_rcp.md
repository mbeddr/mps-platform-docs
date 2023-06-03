---
alias: mpsutils_plugin_rcp
---

# Plugin and RCP

## Actions filter

> ^^com.mbeddr.mpsutil.actionsfilter^^

MPS contains a lot of actions that might be not needed by end users such as actions for language development and actions of the IDE platform. This language allows disabling
actions inside an MPS plugin solution by defining an actions profile. **Active by default** can
be set including an activation condition to make this profile the active profile when opening the project or RCP. All actions are disabled in a tree view and can be selected to disable them. To allow actions instead of filtering them use the intention `Use allow actions` on the
actions profile. Actions in the section `specify toolbar` are displayed in the main toolbar
that's located at the top left of the window.

![example: actions filter](actionsfilter_example.png)

!!! note "To use the language, not only the language has to be installed but also the corresponding Intellij plugin. `./gradlew install` can install this plugin. Without the plugin the language won't load at all."

!!! tip "Development tip: when making changes to the language, make sure to disable the plugin in the preferences, so that the model is not readonly. Execute `./gradlew install` to install the plugin after making a change and restart MPS to test it."

The predefined actions profiles can be customized by the user in *preferences* --> *Appearance & Behavior* --> *Actions*. New profiles can be created by clicking the *+* button and deleted by clicking the *-* button.

![actions filter preferences](actionsfilter_preferences.png)

## Preference form

> ^^com.mbeddr.mpsutil.preferenceform^^

This language allows adding new preference pages to *Preferences*-->*Other Settings*. The language uses the IntelliJ platform
mechanism for adding preference pages ([documentation](https://plugins.jetbrains.com/docs/intellij/settings-guide.html)).

Example:

![example: preference form](preferenceform_example.png)

It supports the following options:

- **scope**: save the preferences on application or project level
- **help topic**: The help topic is an internal identifier that can link a page in the MPS documentation.
  Example: `preferences.intentionPowerPack` links to https://www.jetbrains.com/mps/webhelp/?preferences.intentionPowerPack which redirects to https://www.jetbrains.com/help/mps/intentions-settings.html. The base URL in MPS is defined the [XML configuration](https://github.com/JetBrains/MPS/search?q=webhelp-url) of a few plugins. To get the other internal names search for `getHelpTopic` in the [MPS repository](https://github.com/JetBrains/MPS/search?q=getHelpTopic) and/or the [IntelliJ Community repository](https://github.com/JetBrains/intellij-community/search?q=getHelpTopic).

The preference form supports a few different input elements:

- password field
- checkbox
- dynamic combo box
- integer field
- predefined combo box
- text field

The *before write* method is called, when the button *Apply* or *OK* is pressed. This method should update all tools or classes
that reference the values of the preference form. The input fields can be accessed through *this*. Example:

```java
final HttpServerConfig config = new HttpServerConfig(((int) this.port), this.enabled); 
HttpServerConfig.setCurrentConfig(config); 
extensionPoint/HttpServerConfigChangeListener/.objects.forEach({~it => it.serverChanged(config); });
```

The *after read* method is called, after the state is loaded (for example: when the preference form is opened).

## Wizard (process)

> ^^com.mbeddr.mpsutil.process^^

This language allows creating wizards with multiple steps:

![example: single step of a custom wizard](wizard_step_example.png)

Create a new node of instance [Process](http://127.0.0.1:63320/node?ref=r%3A2ffefd76-4fe0-43c2-9fbd-203c67a47b34%28com.mbeddr.mpsutil.process.structure%29%2F4724180912012603068). The wizard can have input parameters and produces one output. After defining
the wizard it can be invoked from an action. Example:

```
wizard<theProcess> wiz = createWizard<theProcess>("This is my testdata");
boolean b = wiz.show;
System.out.println("show == " + b);
wiz.finish;
```

The *show* method shows the modal dialog and checks if it was closed with the exit code *OK*. The *finish* method
executed the *onFinish* callback of every step. For more information, have at look the [example](http://127.0.0.1:63320/node?ref=r%3A9aef0d3c-87c9-4ce3-ad67-def9817c1ab4%28com.mbeddr.mpsutil.process.sandbox.plugin%29%2F4724180912013515813).


## New Model (RCP)

> ^^com.mbeddr.mpsutil.rcp^^

This language allows creating a new action for creating models like the action [New model](http://127.0.0.1:63320/node?ref=r%3A0a882e21-5553-485b-8777-3b0ace5a0d84%28com.mbeddr.core.base.pluginSolution.plugin%29%2F1268036453389576693) of mbeddr.
Create an instance of [NewModelDialogConfig](http://127.0.0.1:63320/node?ref=r%3A3f408a86-cd9f-4c3c-80d9-d614915b49c9%28com.mbeddr.mpsutil.rcp.structure%29%2F8503127430094868034). The following settings are supported:

- **name**: the name of the new action
- **caption**: the text that's shown for the action
- **user can change persistence**: boolean flag that decides if the user can change the model's persistence type.
- **default persistence**: the type of model persistence that's used when the model is created
- **optional devkits**: devkits that are automatically added when the model is created
- **show model properties**: open the model properties after the model was created

## SPreferences

> ^^com.mbeddr.mpsutil.spreferences^^

This extension allows the definition of preference pages by using MPS models; so in the preference page you get a normal MPS editor, as exemplified by mbeddr's platform templates preference page:

![example: spreferences](spreference_example.png)

Such pages are defined using an instance of [PreferencePageDescription](http://127.0.0.1:63320/node?ref=c3bfea76-7bba-4f0e-b5a2-ff4e7a8d7cf1%2Fr%3A8d0fa52a-32d1-4359-892e-669a9b66600c%28com.mbeddr.mpsutil.spreferences%2Fcom.mbeddr.mpsutil.spreferences.structure%29%2F6547806146467473938) (check out the root "Platform Templates" as an example). This instance must reside in a plugin solution. The data, i.e., the respective MPS model, is stored as part of the respective project or in MPS globally (this is configurable). It is possible to access the model that contains the preferences via code:

![spreferences: query](spreferences_query.png)