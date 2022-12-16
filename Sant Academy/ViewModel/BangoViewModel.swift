//
//  BangoViewModel.swift
//  Sant Academy
//
//  Created by Iago Ramos on 15/12/22.
//

import Foundation

class BangoViewModel: ObservableObject{
    @Published var card: [String: [String]] = [:]
    @Published var selectedRecs: [String: [Bool]] = [:]
    @Published var recsRemaining: Int = 24
    
    init() {
        self.resetBango()
    }
    
    func updateRecs(_ key: String, _ pos: Int){
        selectedRecs[key]![pos].toggle()
        recsRemaining -= selectedRecs[key]![pos] ? 1 : -1
    }
    
    func resetBango(){
        self.card = [
            "b": self.getColumn(1, 5),
            "a": self.getColumn(16, 5),
            "n": self.getColumn(31, 4),
            "g": self.getColumn(46, 5),
            "o": self.getColumn(61, 5)
        ]
        
        let falseArray = [false, false, false, false, false]
        self.selectedRecs = [
            "b": falseArray,
            "a": falseArray,
            "n": falseArray,
            "g": falseArray,
            "o": falseArray
        ]
        
        self.recsRemaining = 24
    }
    
    private func getColumn(_ min: Int, _ quant: Int) -> [String]{
        let numbers = self.getColumnNumbers(min, quant)
        var formattedNumbers: [String] = []
        
        for i in 0..<numbers.count{
            formattedNumbers.append(String(format: "%02d", numbers[i]))
        }
        
        if(quant == 4){
            formattedNumbers.insert("Natal Academy", at: 2)
        }
        
        return formattedNumbers
    }
    
    private func getColumnNumbers(_ min: Int, _ quant: Int) -> [Int]{
        var numbers: [Int] = []
        
        for _ in 0..<quant{
            var randomNumber = numbers.isEmpty ? -1 : numbers[0]
            
            while(randomNumber == -1 || numbers.contains(randomNumber)){
                randomNumber = self.randomNumber(min)
            }
            
            numbers.append(randomNumber)
        }
        
        return numbers
    }
    
    private func randomNumber(_ min: Int) -> Int{
        return Int.random(in: min...(min + 14))
    }
}
