import React, { useState } from 'react';
import logo from './logo.svg';
import './App.css';
import { createConnectTransport, createPromiseClient, PromiseClient, Transport } from "@bufbuild/connect-web";
import { HelloRequest, HelloResponse } from './connect-web/hello_pb';
import { GreetingService } from './connect-web/hello_connectweb';

const transport = createConnectTransport({
  baseUrl: "http://localhost:8080",
});

const client = createPromiseClient(GreetingService, transport);

function App() {
  const [msg, setMsg] = useState("");

  async function Greeting() {
    const response = await client.hello({ name: "MochiMochi" });
    console.log(response);
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
      <button onClick={async () => Greeting()}>こんにちは、サーバーさん</button>
      <div>
        {msg}
      </div>
    </div>
  );
}

export default App;
