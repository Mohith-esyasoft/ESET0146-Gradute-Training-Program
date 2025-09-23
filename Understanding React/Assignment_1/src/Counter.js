const Counter = ({ label, onClick }) => {
  return (
    <button onClick={onClick}>
      {label}
    </button>
  );
};

export default Counter;
