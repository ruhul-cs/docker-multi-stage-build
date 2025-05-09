const { createServer } = require('node:http');

const HOST = process.env.HOST || '0.0.0.0';
const PORT = process.env.PORT || 3000;
const HOST_IP_ADDRESS = process.env.HOST_IP_ADDRESS || 'localhost';

const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello World!\n');
});

server.listen(PORT, HOST, () => {
  console.log(`Server running at http://${HOST_IP_ADDRESS}:${PORT}/`);
});
