import React from 'react';
import PropTypes from 'prop-types'; // ✅ Import PropTypes

// ✅ Define the component
function PropTypeComponent({ name, age, isStudent }) {
  return (
    <div style={{ border: '1px solid #ccc', padding: '10px', marginBottom: '10px' }}>
      <p><strong>Name:</strong> {name}</p>
      <p><strong>Age:</strong> {age}</p>
      <p><strong>Student:</strong> {isStudent ? 'Yes' : 'No'}</p>
    </div>
  );
}

// ✅ Define prop types for validation
PropTypeComponent.propTypes = {
  name: PropTypes.string.isRequired,
  age: PropTypes.number.isRequired,
  isStudent: PropTypes.bool.isRequired,
};

// ✅ Main component
export default function Proptype() {
  return (
    <div>
      <h1>PropTypes Example</h1>
      <PropTypeComponent name="John Doe" age={25} isStudent={true} />
      <PropTypeComponent name="Jane Smith" age={30} isStudent={false} />
    </div>
  );
}
    