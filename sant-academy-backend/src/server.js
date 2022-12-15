const express = require("express");
const http = require("http");
const cors = require("cors");
const { WebSocketServer } = require("ws");

const app = express();
const server = http.createServer(app);
const socket = new WebSocketServer({ server });

const _ = require("./database/connection");
const routes = require("./routes");
const socketController = require("./controllers/socketController");

// Middlewares
app.use(express.json());
app.use(cors());

// Gerenciadores de rotas
app.use("/auth", routes.authRoute);
socket.on("connection", socketController.connection);

module.exports = {
  server: server
};