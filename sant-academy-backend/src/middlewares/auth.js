const jwt = require("jsonwebtoken");

require("dotenv").config();

// Function to verify access token
function authMiddleware(request, response, next) {
  const authHeader = request.headers.authorization;
  
  if (!authHeader) 
    return response.status(401).send({ error: "Token not found" });

  const tokenParts = authHeader.split(" ");
  
  if (!tokenParts.length === 2) 
    return response.status(401).send({ error: "Token error" });
  
  const [ scheme, token ] = tokenParts;

  if (scheme !== "Bearer")
    return response.status(401).send({ error: "Token malformatted" });
  
  jwt.verify(token, process.env.AUTH_TOKEN, (error, decoded) => {
    if (error)
      return response.status(401).send({ error: "Invalid token" });
    
    request.tokenData = decoded;
    return next();
  })
}

module.exports = authMiddleware;