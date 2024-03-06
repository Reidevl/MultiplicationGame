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
    @Published var isStarted: Bool = false // Game started?
    @Published var roundsNumber: Int = 20 // Number of round per game
    @Published var roundCount: Int = 1 // Round count
    @Published var maxTableValue: Int = 12 // Max value from the multiplication's
    @Published var questionTitle: String = "" // Title
    
    @Published var answerOptions: [Int] = [] // User answer for the multiplication
    @Published var userSelection: Int? // User answer for the multiplication
    @Published var selectionMade: Bool = false // The selection was made?
    @Published var isAnswerCorrect: Bool = false
    @Published var correctAnswer: Int = 0 // Correct answer value
    @Published var userScore: Int = 0
    
    //Animations
    @Published var animationAmount: Int = 0
    @Published var animationCircleAmount: Double = 1.0
    
    // Constants
    let rounds = [5, 10, 15, 20]
    
    // Variables
    private var number1 = 0
    private var number2 = 0
    
    
    // MARK: METHODS
    func initializeNumbers() {
        number1 = Int.random(in: 2..<(maxTableValue + 1))
        number2 = Int.random(in: 2..<13)
    }
    
    // Start a new game
    func newGame() {
        // Make some change to show the play view
        // ...
        newRound()
        roundCount = 0
    }
    
    // Start a new Round
    func newRound() {
        initializeNumbers()
        // Create title and correct answer
        correctAnswer = number1 * number2
        questionTitle = "\(number1) x \(number2)"
        
        // Reset values
        isAnswerCorrect = false
        userSelection = nil
        selectionMade = false
        
        // Generate array of answers
        answerOptions = generateArrayAnswer(correctAnswer)
    }
    
    // Validate the user answer
    func answerMultiplication(answer userAnswer: Int) {
        selectionMade = true
        roundCount += 1 // TODO: validate roundCount Maximum
        
        let isCorrected = userAnswer == correctAnswer
        
        if isCorrected {
            isAnswerCorrect = true
            print("Great it was corrected: \(correctAnswer)")
            userScore += 1
        
        } else {
            isAnswerCorrect = false
            print("Your answer was \(userAnswer) but the correct is \(correctAnswer)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.newRound() // Make a new round after a brief delay
            if self.animationAmount == 0 {
                self.animationAmount = 360
            } else {
                self.animationAmount = 0
            }
        }
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
