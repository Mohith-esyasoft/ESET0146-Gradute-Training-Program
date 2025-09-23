function Countes()
{
    console.log(x);
    var x=5;

    const add=(a,b)=>a+b;
    console.log(add(5,6));

    const addMore=(a,b)=>{
        const sum=a+b;
        return sum;
    }
    console.log(addMore(5,60));


    const hello=({name})=><h1>Hello ,{name}</h1>
    // // console(console.log(hello('goapl')))

//   const hello = ({ name }) => `<h1>Hello, ${name}</h1>`; // Returns a string

// console.log(hello({ name: 'Shruti' }));

    // function Greeting({name='Guest',age}) {
    //     return <p>{name} is {age} years old</p>
    // }
    // console.log(Greeting('Shruti',10));

    const user={
    //    userName:'Shruti',
        info:"Bangalore"
     }
    const{name : userName='Akash', info}=user;

    console.log(user)

 
    let a=1,b=2;
    [a,b]=[b,a];
    console.log(a);
    console.log(b);


// two thing rest and spread 



    const prev={name:'Shruti',age:20};
    const next={...prev,age:23,class:"Singhania"}
    console.log(next.age)

    let count=0;
    const increment=()=>{
        count++;
        document.getElementById("c1").innerText=count;
    };
    return (
        <>
            <h1 id="c1">0</h1>
            <button onClick={increment}>INC</button>
        </>
    )
}
export default Countes;


