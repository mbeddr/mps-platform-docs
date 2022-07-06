??? question "How do I make cells in querylists navigatable?"

    > I'm trying to create a list of navigatable cells via querylist from mpsutil.
    >
    > The querylists query collects some nodes from my model, and I'd like to make it so that each cell produced with this querylist navigates to its respective node.
    >
    > Using the `navigatable-node` style attribute (returning `node`, the node from the query) on these cells doesn't seem to work though - ctrl+clicking them doesn't do anything.
    >
    > How can I make the cells in a querylist navigatable to that node?
    
    The `navigatable-node` style attribute won't allow you to point directly to the node from the querylist's query.   
    Instead, you can use the `hyperlink-node` style attribute (also from mpsutil) to make the navigation work, and the `hyperlink-style` attribute to make it look like a regular reference:
    
    ![hyperlink node](hyperlink_node.png)  

    A common workaround to get similar behavior with `navigatable-node` is to point it to a child or parent of the desired node instead of that node itself.

    <sub>Contribution by: [@jonaskraemer](https://github.com/jonaskraemer)<sub>