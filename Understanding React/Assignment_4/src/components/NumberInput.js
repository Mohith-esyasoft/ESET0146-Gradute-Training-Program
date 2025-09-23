import React, { useState } from 'react';

function NumberInput({ onAddNumber }) {
  const [input, setInput] = useState('');

  const handleInputChange = (e) => {
    const value = e.target.value;
    // Allow only valid number input
    if (value === '' || /^-?\d*\.?\d*$/.test(value)) {
      setInput(value);
    }
  };

  const handleAddClick = () => {
    const number = parseFloat(input);
    if (!isNaN(number)) {
      onAddNumber(number);
      setInput('');
    }
  };

  return (
    <div>
      <input
        type="text"
        value={input}
        onChange={handleInputChange}
        placeholder="Enter a number"
      />
      <button onClick={handleAddClick}>Add Number</button>
    </div>
  );
}

export default NumberInput;
