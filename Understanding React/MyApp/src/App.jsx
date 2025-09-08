import React from "react";
import Counter from "./counter";

function App() {
    return (
        <div>
            {/* Pass step prop to Counter to demonstrate object destructuring */}
            <Counter step={1} />
        </div>
    );
}

export default App;