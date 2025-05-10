const { createServer } = require('node:http');

const HOST = process.env.HOST || '0.0.0.0';
const PORT = process.env.PORT || 3000;
const HOST_IP_ADDRESS = process.env.HOST_IP_ADDRESS || 'localhost';
const app = require('./app');
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});