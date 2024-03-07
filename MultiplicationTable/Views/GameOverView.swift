//
//  GameOverView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct GameOverView: View {
    var userScore: Int
    var roundNumber: Int
    var startNewGame: () -> Void
    
    @Binding var animationCircleAmount: Double
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            
            TextView(text: "Game Over!", fontSize: .system(size: 60, weight: .bold), fontColor: .yellow)
            TextView(text: "Final Score", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            TextView(text: "\(userScore)/\(roundNumber)", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            
            Spacer()
            Button  {
                withAnimation {
                    startNewGame()
                }
            } label: {
                PlayButton(title: "RESET", animationAmount: animationCircleAmount)
            }
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    let userScore: Int = 4
    let roundNumber: Int = 10
    let startNewGame = { print("action") }
    
    let animationCircleAmount = Binding<Double>(get: { 2.0 }, set: {_ in})
    
    return Group {
        GameOverView(userScore: userScore, roundNumber: roundNumber, startNewGame: startNewGame, animationCircleAmount: animationCircleAmount)
    }
}
