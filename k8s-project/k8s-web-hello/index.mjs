import express from "express";
import os from "os";

const app = express()
const port = 3000

app.get('/', (req, res) => {
    const helloMessage = `VERSION 2: Hello from ${os.hostname()}!`;
    console.log(helloMessage);
    res.send(helloMessage)
})

app.listen(port, () => {
  console.log(`Web app is listening at http://localhost:${port}`)
})