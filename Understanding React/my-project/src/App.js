// import logo from './logo.svg';
import './App.css';
import React from 'react';
import Useref from './Useref';

import Parent from './Components/Parent';
import Proptype from './Components/Proptype';
import Usememo from './Components/Usememo';
function App() {
  return (
    <div>
      <Useref />
    <Proptype />
    <Parent />
    <Usememo />
    </div>
  );
}

export default App;
