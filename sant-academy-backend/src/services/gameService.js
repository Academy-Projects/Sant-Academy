const { Game } = require("../database/models");
const { createGame } = require("../logic/models/Game.js")

class GameService{
    async createGame(){
        const game = createGame();
        game.

        try{
            await Game.create({
                sortedNumbers: []
            })
        } catch(err){
            console.log(err);
        }
    }
}