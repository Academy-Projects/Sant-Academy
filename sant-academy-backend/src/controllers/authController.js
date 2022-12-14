const dbService = require("../services/databaseService");
const authService = require("../services/authService");

class Auth {
  async createUser(request, response) {
    // Check if the user has an username
    const username = request.body.username;
    if (!username) return response.status(403);

    const newUser = await dbService.createUser({ username });
    // Assure that the user was creared
    if (!newUser) return response.status(403);

    // Creating access token for the new user
    const token = authService.createToken({
      id: newUser._id,
      username: newUser.username
    })
    
    return response
      .status(201)
      .json({
        user: newUser,
        accessToken: token
      })
  }

  async testApi(request, response) {
    // Check if the user has an username
    const username = request.body.username;
    if (!username) return response.status(403);

    const queryUser = await dbService.getUser(username);

    return response
      .status(200)
      .json({
        queryUser
      })
  }
}

module.exports = new Auth();