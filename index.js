'use strict';
import express from 'express';
const app = express();
app.get('/', (req, res) => res.send('Hello from Docker!'));
app.listen(5000, () => console.log('Server running on port 5000'));
