const { Room } = require("../database/models");
const { createRoom } = require("../logic/models/room");

class RoomService{
    async createRoom(master){
        try{
            let room = createRoom(master);

            let createdRoom = await Room.create({
                roomCode: room.roomCode,
                master: room.master,
                players: room.players,
                isGameRunning: room.isGameRunning,
                currentGame: room.currentGame
            })

            return createdRoom;
        } catch(err){
            console.log(err);
        }
    }

    async #getRoom(code){
        let room = await Room
            .where("roomCode")
            .equals(code)

        return room
    }

    async addPlayer(roomCode, playerId){
        try{
            const [room] = await this.getRoom(roomCode);
            Room.updateOne(room, { players: room.players.push(playerId) });
        } catch(err){
            console.log(err);
        }
    }

    async removePlayer(roomCode, playerId){
        try{
            const [room] = await this.getRoom(roomCode);
            const players = room.players;

            Room.updateOne(room, { players: players[players.indexOf(playerId)] });
        } catch(err){
            console.log(err);
        }
    }

    async startGame(roomCode, currentGame){
        try{
            const [room] = await this.getRoom(roomCode);

            Room.updateOne(room, { isGameRunning: true });
            Room.updateOne(room, { currentGame: currentGame });
        } catch(err){
            console.log(err);
        }
    }

    async stopGame(roomCode){
        try{
            const [room] = await this.getRoom(roomCode);

            Room.updateOne(room, { isGameRunning: false });
            Room.updateOne(room, { currentGame: null });
        } catch(err){
            console.log(err);
        }
    }
}