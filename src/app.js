const express = require("express");
const { add } = require("./utils");

const app = express();
const PORT = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.send("Welcome to My App!");
});

app.get("/add", (req, res) => {
  const result = add(2, 3);
  res.json({ result });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
