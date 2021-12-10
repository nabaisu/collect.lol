import React, { useState } from "react";
import axios from "axios";
import logo from "./logo.svg";
import "./App.css";

function App() {
  const [message, setMessage] = useState();
  const fetchData = () => {
    axios
      .get("/api/data")
      .then(({ data }) => {
        const { message } = data;
        setMessage(message);
      })
      .catch((error) => {
        console.log(error);
        setMessage(error?.message || "there was an error");
      });
  };

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <h1>{message}</h1>
        <button onClick={fetchData}>Fetch Data</button>
      </header>
    </div>
  );
}

export default App;
