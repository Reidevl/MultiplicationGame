//
//  MultiplicationTableView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct MultiplicationTableView: View {
    @StateObject var viewModel: ViewModel = .init()
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .gray, .red, .gray, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
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
                    } label: {
                        CellView(value: viewModel.answerOptions[index], isAnswerCorrect: viewModel.isAnswerCorrect)
                    }
                }
                
                Spacer()
                Spacer()
            }
        }
        .onAppear{ viewModel.newRound() }
    }
}

#Preview {
    MultiplicationTableView()
}
