const express = require("express");
const http = require("http");
const cors = require("cors");

const app = express();

const _ = require("./database/connection");
const routes = require("./routes");

const server = http.createServer(app);

// Middlewares
app.use(express.json());
app.use(cors());

// Gerenciadores de rotas
app.use("/auth", routes.authRoute);
app.use("/game", routes.gameRoute);

// Iniciando servidor

module.exports = server;