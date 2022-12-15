const { Router } = require("express");

const authController = require("./controllers/authController");

const authRoute = Router();

// Auth routes (access *)
authRoute.post("/teste", async (request, response) => authController.testApi(request, response));
authRoute.post("/signin", async (request, response) => authController.createUser(request, response));

module.exports = {
  authRoute
}