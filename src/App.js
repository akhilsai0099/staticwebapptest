import "./App.css";
import { useEffect, useState } from "react";

function App() {
  const [data, setData] = useState("");

  useEffect(() => {
    (async function () {
      const { text } = await (await fetch(`/api/message`)).json();
      setData(text);
    })();
  });

  return (
    <>
      <div>hello from client:{data}</div>
      <h1>Changes pushed to git</h1>
    </>
  );
}

export default App;
