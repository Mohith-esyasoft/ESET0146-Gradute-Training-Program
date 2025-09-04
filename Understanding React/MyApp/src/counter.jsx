import React, { useState } from "react";

function getRandomColor() {
    const letters = "0123456789ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function Counter() {
    const [count, setCount] = useState(0);
    const [pos, setPos] = useState({ top: 100, left: 100 });
    const [color, setColor] = useState("#ffffff");
    const [trail, setTrail] = useState([]);

    const increment = () => {
        setCount(count + 1);
        const top = Math.floor(Math.random() * (window.innerHeight - 100));
        const left = Math.floor(Math.random() * (window.innerWidth - 100));
        const newColor = getRandomColor();
        setTrail([...trail, { top: pos.top, left: pos.left, color }]);
        setPos({ top, left });
        setColor(newColor);
    };

    return (
        <>
            {trail.map((t, idx) => (
                <div
                    key={idx}
                    style={{
                        position: "absolute",
                        top: t.top,
                        left: t.left,
                        width: 120,
                        height: 80,
                        background: t.color,
                        opacity: 0.3,
                        borderRadius: 10,
                        zIndex: 0,
                        transition: "top 0.3s, left 0.3s"
                    }}
                />
            ))}
            <div
                style={{
                    position: "absolute",
                    top: pos.top,
                    left: pos.left,
                    background: color,
                    borderRadius: 10,
                    padding: "20px",
                    boxShadow: "0 0 10px #0002",
                    zIndex: 1,
                    transition: "top 0.3s, left 0.3s, background 0.3s"
                }}
            >
                <h1>{count}</h1>
                <button onClick={increment}>INC</button>
            </div>
        </>
    );
}

export default Counter;