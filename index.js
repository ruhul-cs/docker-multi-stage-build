const express = require('express');
const app = express();
const myName = 'ruhul amin';
app.get('/', (req, res) => res.send('Hello from Docker!'));
app.listen(5000, () => console.log('Server running on port 5000'));