!!! warning "The editor shows type system errors in the inspectors that shouldn't be there."

    Known bug. Pressing F5 helps.

!!! hint  "I need to delete non existing children, references or properties from a node._"

    Switch to the reflective editor and remove the offending parts. There is also an enhancement script that can remove properties.

!!! question  "I want to include non child relations in Editor."
    Use querylist from mbeddr.platform

!!! hint "I want to open the inspector."

    Call `editorContext.openInspector()`.

!!! hint "I want to open the editor for an node"

    Call `NavigationSupport.getInstance().openNode()`.

!!! hint "I want to set editor hints"

    Call `editorContext.getEditorComponent().getUpdater().addExplicitEditorHintsForNode()`.

!!! question "Is there a disadvantage by using the indent layout instead of the indent cell mode?"

    No. There used to be performance issues with bigger models that were fixed in MPS 2021.1

!!! question "How to find out where a substitute menu entry is coming from?"

    Use the Menu Trace Tool Window. More information can be found in the [official documentation](https://www.jetbrains.com/help/mps/menu-trace-tool-window.html).

!!! hint "I want to override an arbitrary editor."

    Use the language `de.slisson.mps.conditionalEditor` from mps-extensions.
    