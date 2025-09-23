import React, { useRef } from 'react';

const ColorBoxHighlighter = () => {
  const boxRefs = [useRef(null), useRef(null), useRef(null)];
  const highlightIndex = useRef(0);

  // Define the base styles for the boxes
  const baseBoxStyle = {
    width: '100px',
    height: '100px',
    border: '1px solid black',
    transition: 'border 0.3s ease-in-out',
  };

  const containerStyle = {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    gap: '20px',
    padding: '40px',
  };

  const boxesContainerStyle = {
    display: 'flex',
    gap: '20px',
  };

  const buttonStyle = {
    padding: '10px 20px',
    fontSize: '16px',
    cursor: 'pointer',
  };

  const handleHighlightNext = () => {
    // Remove the highlight from the previous box
    const prevIndex = highlightIndex.current;
    if (boxRefs[prevIndex].current) {
      boxRefs[prevIndex].current.style.border = baseBoxStyle.border;
    }

    // Determine the index of the next box to highlight
    const nextIndex = (prevIndex + 1) % boxRefs.length;
    
    // Add the highlight to the next box
    if (boxRefs[nextIndex].current) {
      boxRefs[nextIndex].current.style.border = '3px solid yellow';
    }

    // Update the ref to point to the new highlighted index
    highlightIndex.current = nextIndex;
  };

  return (
    <div style={containerStyle}>
      <div style={boxesContainerStyle}>
        <div ref={boxRefs[0]} style={{ ...baseBoxStyle, backgroundColor: 'red' }}></div>
        <div ref={boxRefs[1]} style={{ ...baseBoxStyle, backgroundColor: 'green'}}></div>
        <div ref={boxRefs[2]} style={{ ...baseBoxStyle, backgroundColor: 'skyblue' }}></div>
      </div>
      <button onClick={handleHighlightNext} style={buttonStyle}>
        Highlight Next Box
      </button>
    </div>
  );
};

export default ColorBoxHighlighter;
