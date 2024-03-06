//
//  PlayView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 6/3/24.
//

import SwiftUI

struct PlayView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Round: \(viewModel.roundCount)/\(viewModel.roundsNumber)")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.white)
            
            Spacer()
            
            Text("\(viewModel.questionTitle)")
                .font(.system(size: 75, weight: .bold))
                .foregroundStyle(.white)

            ForEach (viewModel.answerOptions.indices, id: \.self) { index in
                Button {
                    viewModel.answerMultiplication(answer: viewModel.answerOptions[index])
                    viewModel.userSelection = index
                    
                    withAnimation(.spring(duration: 0.75, bounce: 0.3)) {
                        viewModel.animationAmount += 360
                    }
                } label: {
                    CellView(value: viewModel.answerOptions[index], isSelected: viewModel.userSelection == index, selectionMade: viewModel.selectionMade, isAnswerCorrect: viewModel.isAnswerCorrect, correctAnswer: viewModel.correctAnswer)
                }
                .rotation3DEffect(.degrees(viewModel.userSelection == index ? Double(viewModel.animationAmount) : 0), axis: (x: 1, y: 0, z: 0))
                .animation(.easeOut(duration: 0.5), value: viewModel.isAnswerCorrect)
            }
            
            Spacer()
            Spacer()
        }
        .onAppear{
            print(viewModel.roundsNumber)
            viewModel.animationCircleAmount = 2
            viewModel.newRound()
        }
    }
}

#Preview {
    @StateObject var viewModel: ViewModel = .init()
    
    return Group {
        PlayView(viewModel: viewModel)
    }
}
