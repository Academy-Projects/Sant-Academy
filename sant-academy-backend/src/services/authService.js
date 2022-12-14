const jwt = require("jsonwebtoken");

require("dotenv").config();

class AuthService {
  createToken(user) {
    const token = jwt.sign(
      { 
        id: user.id, 
        username: user.username 
      },
      process.env.AUTH_TOKEN
    )
    return token;
  }
}

module.exports = new AuthService();