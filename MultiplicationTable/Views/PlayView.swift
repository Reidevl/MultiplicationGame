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
            TextView(text: "Round: \(viewModel.roundCount)/\(viewModel.roundsNumber)", fontSize: .system(size: 25, weight: .bold), fontColor: .white)
            
            Spacer()
            
            TextView(text: viewModel.questionTitle, fontSize: .system(size: 75, weight: .bold), fontColor: .white)

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
            Spacer()
            
            // Exit game
            Button {
                withAnimation(.bouncy(duration: 1)) {
                    viewModel.goStartView()
                }
            } label: {
                FooterButton(imageName: "x.circle")
            }
        }
        .onAppear{
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
