!!! question  "How do I use a list of string properties?"

    Wrap your property into a new concept and use a child collection (myString: MyString[0..n])

!!! question  "Can properties be overridden?"

    No. More info can be found in [this ticket](https://youtrack.jetbrains.com/issue/MPS-17143).

!!! warning  "I implemented `ISuppressErrors` but errors are still shown for my node."

    You have to implement `IDontApplyTypesystemRules`and `ISkipConstraintsChecking`. More information can be found
    in the [official documentation](https://www.jetbrains.com/help/mps/2020.1/suppressing-errors.html).

