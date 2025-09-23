import { useState, useMemo, useCallback } from 'react';
import NumberInput from './components/NumberInput';
import NumberList from './components/NumberList';
import CalculationsDisplay from './components/CalculationsDisplay';

function App() {
  const [numbers, setNumbers] = useState([]);

  // Add a new number to the list
  const handleAddNumber = (newNumber) => {
    setNumbers(prevNumbers => [...prevNumbers, newNumber]);
  };

  // Remove a number from the list
  const handleRemoveNumber = useCallback((numberToRemove) => {
    setNumbers(prevNumbers => prevNumbers.filter(num => num !== numberToRemove));
  }, []);

  // Calculate sum of numbers using useMemo
  const sum = useMemo(() => {
    return numbers.reduce((total, current) => total + current, 0);
  }, [numbers]);

  // Find the largest number using useMemo
  const largestNumber = useMemo(() => {
    return numbers.length > 0 ? Math.max(...numbers) : 0;
  }, [numbers]);

  return (
    <div className="app">
      <h1>Number List Analyzer...</h1>
      <NumberInput onAddNumber={handleAddNumber} />
      <NumberList numbers={numbers} onRemoveNumber={handleRemoveNumber} />
      <CalculationsDisplay sum={sum} largestNumber={largestNumber} />
    </div>
  );
}

export default App;
