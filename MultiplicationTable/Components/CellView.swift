//
//  CellView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct CellView: View {
    var value: Int
    var isSelected: Bool
    var selectionMade: Bool
    var isAnswerCorrect: Bool
    var correctAnswer: Int
    
    var body: some View {
        let backgroundColor: Color
        if selectionMade {
            if isSelected {
                backgroundColor = isAnswerCorrect ? .green : .red
            } else {
                backgroundColor = correctAnswer == value ? .green : .yellow
            }
        } else {
            backgroundColor = .yellow
        }

        return Text("\(value)")
            .font(.title)
            .bold()
            .foregroundStyle(.white)
            .padding(30)
            .frame(width: 300, height: 100)
            .background(backgroundColor)
            .clipShape(.capsule)
            .shadow(radius: 5)
            .animation(.easeIn(duration: 0.3), value: true)
            .overlay(
                content: {
                    if value == correctAnswer {
                        Text("+ 1 score")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                            .shadow(color: .gray, radius: 6, x: 0, y: 1)
                            .scaleEffect(isAnswerCorrect ? CGSize(width: 1, height: 1) : CGSize(width: 0, height: 0))
                            .animation(.easeIn(duration: 1), value: isAnswerCorrect)
                            .opacity( isAnswerCorrect ? 1 : 0)
                            .animation(.easeOut(duration: 1), value: isAnswerCorrect)
                    }
                }
            )
    }
}

#Preview {
    let value: Int = 63
    let isAnswerCorrect: Bool = false
    let isSelected: Bool = false
    let correctAnswer: Int? = 52
    let selectionMade = false
    
    return Group {
        CellView(value: value, isSelected: isSelected, selectionMade: selectionMade, isAnswerCorrect: isAnswerCorrect, correctAnswer: correctAnswer!)
    }
}
