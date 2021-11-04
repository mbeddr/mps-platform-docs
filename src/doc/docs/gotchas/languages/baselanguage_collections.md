!!! question "How do I create a sequence with one element?"

    Use the singleton constructor: `#!java new singleton<string>("single")`

!!! question "How do convert from a Java ArrayList to a Base Language list?"

    Use the copy constructor: `#!java new arraylist<string>(copy: yourArrayList)`

!!! question "How do I convert base language collections to a Java Stream"

    First convert your collection to a list that you downcast to a Java List.
    Then you can convert it into a stream `#!java StreamSupport.stream(list/.spliterator(), false)`
