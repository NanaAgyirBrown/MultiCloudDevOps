import express from "express";
import fetch from "node-fetch";
import os from "os";

const app = express()
const port = 3000

app.get('/', (req, res) => {
    const helloMessage = `VERSION 3: Hello from ${os.hostname()}!`;
    console.log(helloMessage);
    res.send(helloMessage)
})

app.get('/health', async (req, res) => {  
  const url = 'http://nginx';
  const response = await fetch(url);
  const body = await response.text();

  if (body.includes('Welcome to nginx!')) {
    res.send(body);
  } else {
    res.status(500).send('NOK');  
  }
});

app.listen(port, () => {
  console.log(`Web app is listening at http://localhost:${port}`)
})