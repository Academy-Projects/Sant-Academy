const express = require("express");
const cors = require("cors");
const ws = require("express-ws");

const app = express();
const wsInstance = ws(app);

const _ = require("./database/connection");
const routes = require("./routes");

// Middlewares
app.use(express.json());
app.use(cors());

// Gerenciadores de rotas
app.use("/auth", routes.authRoute);
app.use("/game", routes.gameRoute);

// websocket teste
app.ws("/socketteste", (ws, _) => {
  ws.on("message", console.log);
})

module.exports = {
  server: app,
  socket: wsInstance.getWss()
};