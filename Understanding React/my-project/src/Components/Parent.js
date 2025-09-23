import React from 'react'
import { useState } from 'react';

export default function Parent() {
    const [count,setCount]=useState(0);
     
  return (
    <div>
      welcome to Parent Component
      <Sibling1 count={count} />
      <Sibling2 setCount={setCount} />
    </div>
  )
}
function Sibling1({ count }) {
     return(
        <div>
            {count}
        </div>
     );
}

function Sibling2({setCount}) {
   const Increment=()=>{
        setCount( prev => prev + 1 );
    }
    const Decrement=()=>{
        setCount( prev => prev - 1 );
    }
     return(
        <>
            <button onClick={Increment}>Increment</button>
            <button onClick={Decrement}>Decrement</button>
        </> 
     );
}