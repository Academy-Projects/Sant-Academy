const jwt = require("jsonwebtoken");

require("dotenv").config();

// Function to verify access token
function authMiddleware(headers) {
  const authHeader = headers.authorization;
  
  if (!authHeader) return false;
    // return response.status(401).send({ error: "Token not found" });

  const tokenParts = authHeader.split(" ");
  
  if (!tokenParts.length === 2) return false;
    // return response.status(401).send({ error: "Token error" });
  
  const [ scheme, token ] = tokenParts;

  if (scheme !== "Bearer") return false;
    // return response.status(401).send({ error: "Token malformatted" });
  
  return jwt.verify(token, process.env.AUTH_TOKEN, (error, decoded) => {
    if (error) return false;
      // return response.status(401).send({ error: "Invalid token" });
    const credentials = Object.assign({}, decoded);

    return credentials
  })
}

module.exports = authMiddleware;