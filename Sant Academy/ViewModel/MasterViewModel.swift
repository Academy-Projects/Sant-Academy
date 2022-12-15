//
//  MasterViewModel.swift
//  Sant Academy
//
//  Created by Afonso Lucas on 15/12/22.
//

import Foundation


extension MasterView {
    class ViewModel: ObservableObject {
        
        @Published private(set) var drawNumbers: [String] = []
        @Published private(set) var isGameCompleted: Bool = false
        
        var lastResult: String {
            drawNumbers[drawNumbers.count - 1]
        }
        
        private var allNumbers: [Int] = Array(1...75) {
            didSet {
                if allNumbers.count == 0 {
                    self.isGameCompleted = true
                }
            }
        }
        
        func raffle() {
            guard !isGameCompleted else { return }
            let number = allNumbers.remove(at: Int.random(in: 0...(allNumbers.count-1)))
            
            switch number {
            case 1...15:
                drawNumbers.append("B\(number)")
            case 16...30:
                drawNumbers.append("I\(number)")
            case 31...45:
                drawNumbers.append("N\(number)")
            case 46...65:
                drawNumbers.append("G\(number)")
            case 66...75:
                drawNumbers.append("O\(number)")
            default:
                return
            }
        }
    }
}
