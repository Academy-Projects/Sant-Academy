class Bingo{
    constructor(){
        this.history = [];

    }

    sortNumber(){
        let sortedNumber = this.history[0];

        while(this.history.includes(sortedNumber) || sortedNumber === undefined){
            sortedNumber = Math.floor(Math.random() * 70) + 1;
        }

        this.history.push(sortedNumber)
        return sortedNumber
    }
}