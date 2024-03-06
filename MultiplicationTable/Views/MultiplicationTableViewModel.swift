//
//  MultiplicationTableViewModel.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import Foundation

class ViewModel: ObservableObject {
    //MARK: Parameters
    // Game status flow
    @Published var isStarted = false // Game started?
    @Published var roundsNumber = 20 // Number of round per game
    @Published var roundCount = 1 // Round count
    @Published var maxTableValue = 12 // Max value from the multiplication's
    @Published var questionTitle = "" // Title
    
    @Published var correctAnswer = 0 // Correct answer value
    @Published var userSelection = 0 // User answer for the multiplication
    @Published var answerOptions: [Int] = [] // User answer for the multiplication
    @Published var isAnswerCorrect: Bool?
    @Published var userScore = 0
    
    // Constants
    let rounds = [5, 10, 15, 20]
    
    // Variables
    private var number1 = 0
    private var number2 = 0
    
    
    // MARK: METHODS
    func initializeNumbers() {
        number1 = Int.random(in: 2..<maxTableValue)
        number2 = Int.random(in: 2..<maxTableValue)
    }
    
    // Start a new game
    func newGame() {
        // Make some change to show the play view
        // ...
        newRound()
    }
    
    // Start a new Round
    func newRound() {
        initializeNumbers()
        // Create title and correct answer
        correctAnswer = number1 * number2
        questionTitle = "\(number1) x \(number2)"
        isAnswerCorrect = nil
        
        // Generate array of answers
        answerOptions = generateArrayAnswer(correctAnswer)
    }
    
    // Validate the user answer
    func answerMultiplication(answer userAnswer: Int) {
        let isCorrected = userAnswer == correctAnswer
        
        if isCorrected {
            isAnswerCorrect = true
            print("Great it was corrected: \(correctAnswer)")
            userScore += 1
        
        } else {
            isAnswerCorrect = false
            print("Your answer was \(userAnswer) but the correct is \(correctAnswer)")
        }
        
        newRound() // Make a new round
    }
    
    // Generate an array with all the options to be shown
    func generateArrayAnswer(_ answer: Int) -> [Int] {
        var options: [Int] = []
        let minValue = answer - 10
        let maxValue = answer + 10
        
        options.append(answer)
        
        for _ in 0..<3 {
            guard let option = (minValue..<maxValue).shuffled().first(where: { !options.contains($0) }) else {
                continue
            }
            options.append(option)
        }
        
        return options.shuffled()
    }
    

}
