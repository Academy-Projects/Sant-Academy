class BingoCard{
    constructor(){
        this.numbers = {
            b: this.#getColumnNumbers(1, 5),
            i: this.#getColumnNumbers(16, 5),
            n: this.#getColumnNumbers(31, 4),
            g: this.#getColumnNumbers(46, 5),
            o: this.#getColumnNumbers(61, 5)
        };
    }

    #getRandomNumber = (min) => {
        min = Math.ceil(min);
        let max = Math.floor(min + 14);

        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    #getColumnNumbers = (min, quant) => {
        let numbers = [];

        for(let i = 0; i < quant; i++){
            let randomNumber = numbers[0];

            while(numbers.includes(randomNumber) || randomNumber === undefined){
                randomNumber = this.#getRandomNumber(min);
            }

            numbers.push(randomNumber);
        }

        return numbers;
    }
}

const generateCard = () => {
    let card = new BingoCard();
    return card.numbers;
}

module.exports = {
    generateCard
};