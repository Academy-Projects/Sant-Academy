class Game {
  createGameRoom(resquest, response) {}
  
  authTest(request, response) {
    return response.json({
      message: "you're authenticated",
      id: request.tokenData
    })
  }
}

module.exports = new Game();