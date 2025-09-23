import React from 'react'
import { useState, useMemo } from 'react';
export default function Usememo() {
  const [count, setCount] = useState(0);
  const [name, setName] = useState('');

  const expensiveComputation = (num) => {
    console.log('Computing...');
    for (let i = 0; i < 1000000000; i++) {} // Simulate expensive computation
    return num * 2;
  };

  const memoizedValue = useMemo(() => expensiveComputation(count), [count]);

  return (
    <div>
      <h1>useMemo Example</h1>
      <p><strong>Count:</strong> {count}</p>
      <p><strong>Name:</strong> {name}</p>
      <p><strong>Computed Value:</strong> {memoizedValue}</p>
      <button onClick={() => setCount(count + 1)}>Increment Count</button>
      <button onClick={() => setName(name === 'John' ? 'Jane' : 'John')}>Toggle Name</button>
    </div>
  )
}
