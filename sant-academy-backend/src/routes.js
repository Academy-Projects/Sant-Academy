const { Router } = require("express");

const authController = require("./controllers/authController");
const gameController = require("./controllers/gameController");

const authMiddleware = require("./middlewares/auth");

const authRoute = Router();
const gameRoute = Router();

// Auth routes (access *)
authRoute.post("/teste", async (request, response) => authController.testApi(request, response));
authRoute.post("/signin", async (request, response) => authController.createUser(request, response));

// Game routes (need a jwt access token)
gameRoute.use(authMiddleware);

// JWT Test route
gameRoute.post("/teste", gameController.authTest);

gameRoute.ws("/room", (ws, request) => {
  console.log(request.tokenData);

  ws.on("message", (data) => {
    console.log(data);
  })
})

module.exports = {
  authRoute,
  gameRoute
}