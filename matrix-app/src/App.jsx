import React, { useState } from "react";
import logo from "./logo.svg";
import "./App.css";
import { Matrix } from "./components/Matrix/Matrix";

function App() {
  const [counter, setCounter] = useState(0);

  return (
    <div className="container">
      <Matrix></Matrix>

      {/* <p>{counter}</p>
      <button
        className="btn btn-primary"
        onClick={() => setCounter(counter + 1)}
      >
        Hola soy un boton
      </button> */}
    </div>
  );
}

export default App;
