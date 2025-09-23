function EventComponent() {
  function EventHandler(e){
    if(e.target.value==='Shruti')
    {
      console.log("Welcome Shruti");
    }
    else{
      console.log("you are not Shruti");
    }
  }

  // const a=()=>
  return (
    <div>
      <p>Welcome to formf</p>

      <button
        onClick={() => {
          console.log("button is clicked");
        }}
      >
        click me
      </button>
      <div style={{background : 'blue',padding : '50px' }} onMouseLeave={()=>{console.log("mouse is entered")}} >
        this id dev
      </div>

    {/* <div style={{background : 'blue',padding : '50px' }} onMouseMove={()=>{console.log("mouse is moved")}} >
        this id dev
    </div> */}

    <input type='date'  onChange={(myobj)=>{console.log(myobj.target.valueAsDate)}}></input>
    <input type='text' onChange={(myobj)=>{EventHandler(myobj)}}></input>
    

    </div>
  );
}
export default EventComponent;
