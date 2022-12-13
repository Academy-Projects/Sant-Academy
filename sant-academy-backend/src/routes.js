const { Router } = require("express");

const authController = require("./controllers/authController");
const gameController = require("./controllers/gameController");

const authMiddleware = require("./middlewares/auth");

const authRoute = Router();
const gameRoute = Router();

// Auth routes (access *)
authRoute.post("/signin", authController.testApi);

// Game routes (need a jwt access token)
gameRoute.use(authMiddleware);

// Test route
gameRoute.get("/game", gameController.authTest);

module.exports = {
  authRoute,
  gameRoute
}