const authMiddleware = require("../middlewares/auth");

class WebSocket {
  connection(ws, request) {
    const credentials = authMiddleware(request.headers);

    if (!credentials) {
      return ws.close();
    }

    ws.on('message', data => {
      console.log(`${credentials.username}: ${data}`);
    });
  }
}

module.exports = new WebSocket();