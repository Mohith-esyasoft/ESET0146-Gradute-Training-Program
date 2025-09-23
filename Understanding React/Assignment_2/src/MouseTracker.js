import { useState, useEffect } from 'react';

const MouseTracker = () => {
  // State to store mouse coordinates
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 });

  // Effect to handle mouse movement
  useEffect(() => {
    // Event handler to update mouse position
    const handleMouseMove = (event) => {
      setMousePosition({ x: event.clientX, y: event.clientY });
    };

    // Add event listener for mouse movement
    window.addEventListener('mousemove', handleMouseMove);

    // Cleanup function to remove the event listener
    return () => {
      window.removeEventListener('mousemove', handleMouseMove);
    };
  }, []); // Empty dependency array means this effect runs once on mount and cleanup on unmount

  return (
    <div style={{ textAlign: 'center' }}>
      <h1>Mouse Tracker</h1>
      <p>
        Current Mouse Position: X: {mousePosition.x}, Y: {mousePosition.y}
      </p>
    </div>
  );
};

export default MouseTracker;
