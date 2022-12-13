const express = require("express");
const http = require("http");
const cors = require("cors");

const PORT = process.env.PORT || 80;
const app = express();

const _ = require("./database/connection");
const routes = require("./routes");

const server = http.createServer(app);

// Middlewares
app.use(express.json());
app.use(cors());

// Gerenciadores de rotas
app.use(routes.authRoute);
app.use(routes.gameRoute);

// Iniciando servidor
server.listen(PORT, () => {
  console.log(`Server listen at: ${PORT}`);
})