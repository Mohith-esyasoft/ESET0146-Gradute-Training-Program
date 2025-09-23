import { memo } from 'react';

const NumberList = memo(({ numbers, onRemoveNumber }) => {
  return (
    <div>
      <h2>List of Numbers Added:</h2>
      <ul>
        {numbers.map((number, index) => (
          <li key={index}>
            {number}
            &emsp;
            <button onClick={() => onRemoveNumber(number)}>Remove</button>
          </li>
        ))}
      </ul>
    </div>
  );
});

export default NumberList;
