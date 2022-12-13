const { Router } = require("express");

const authRoute = Router();
const gameRoute = Router();

authRoute.post("/signin", (request, response) => {
  const { user } = request.body;

  return response.status(200).json(user)
})

module.exports = {
  authRoute,
  gameRoute
}