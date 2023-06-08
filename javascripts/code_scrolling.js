(function () {
    document.querySelectorAll('pre>code').forEach(function (code) {
        code.addEventListener("mousedown", function (downEv) {
            if (downEv.target !== code) return; // disable dragging on selecting
            downEv.preventDefault(); // disable selecting on dragging
            let X = downEv.clientX;
            let move = (moveEv) => {
                code.scrollLeft -= 2 * (moveEv.clientX - X);
                X = moveEv.clientX;
            };
            document.addEventListener("mousemove", move);
            let dispose = () => {
                document.removeEventListener("mousemove", move);
                document.removeEventListener("mouseup", dispose);
            };
            document.addEventListener("mouseup", dispose);
        });
    });
})();