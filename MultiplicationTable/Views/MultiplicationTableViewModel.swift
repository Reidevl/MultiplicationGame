//
//  MultiplicationTableViewModel.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import Foundation

class ViewModel: ObservableObject {
    //MARK: Parameters
    
    // Constants
    
    let rounds = [5, 10, 15, 20, 30, 40]
    
    
    // Game status flow
    @Published var isStarted = false // Game started?
    @Published var roundsNumber = 0 // Number of round per game
    @Published var roundCount = 1 // Round count
    @Published var maxTableValue = 12 // Max value from the multiplication's table
    
    @Published var correctAnswer = 0 // Correct answer value
    @Published var userSelection = 0 // User answer for the multiplication
    @Published var isCorrected = false
    
    // MARK: METHODS
    func multiplicate(_ number1: Int, _ number2: Int) -> Int {
        return number1 * number2
    }
    
    func question() -> String {
        let number1 = Int.random(in: 2..<maxTableValue)
        let number2 = Int.random(in: 2..<maxTableValue)
        
        return "\(number1) x \(number2)"
    }
}
