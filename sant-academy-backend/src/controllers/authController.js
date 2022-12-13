const jwt = require("jsonwebtoken");

class Auth {
  createUser(request, response) {
    // implentar a geração de token
  }

  testApi(request, response) {
    const { user } = request.body;

    return response
      .status(200)
      .json({
        user
      })
  }
}

module.exports = new Auth();