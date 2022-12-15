class Game{
    constructor(){
        this.sortedNumbers = [];
        this.cards = [];
        this.userEntries = [];
        this.winners = [];
    }
}

const createGame = () => {
    return new Game();
}