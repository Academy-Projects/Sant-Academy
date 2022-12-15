const generate = require("nanoid-generate");

class Room{
    constructor(master){
        this.roomCode = generate.alphanumeric(4);
        this.master = master;
        this.players = [master];
        this.currentGame = null;
        this.isGameRunning = false;
    }
}

const createRoom = (master) => {
    return new Room(master);
}

module.exports = {
    createRoom
}