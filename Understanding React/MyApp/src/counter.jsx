import React, { useState } from "react";

// Counter component with object destructuring for props and spread operator
function Counter({ step = 1 }) {
    const [count, setCount] = useState(0);

    // Example settings object for style
    const settings = {
        textAlign: "center",
        marginTop: "50px",
        background: "#f9f9f9",
        borderRadius: "10px",
        padding: "20px",
        boxShadow: "0 0 10px #0001"
    };

    return (
        <div style={{ ...settings }}>
            <h1>Counter App</h1>
            <h2>{count}</h2>
            <button onClick={() => setCount(count + step)}>Increment by {step}</button>
            <button onClick={() => setCount(count - step)} style={{ marginLeft: "10px" }}>Decrement by {step}</button>
        </div>
    );
}

export default Counter;