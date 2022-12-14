const server = require("./server");

const PORT = process.env.PORT || 80;

server.listen(PORT, () => {
  console.log(`Server listen at: ${PORT}`);
})