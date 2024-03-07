//
//  MultiplicationTableView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct MultiplicationTableView: View {
    @StateObject var viewModel: ViewModel = .init()
    @State var showSettings = false
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .gray, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if !viewModel.isFinished {
                if viewModel.isStarted {
                    PlayView(viewModel: viewModel)
                    
                    // Exit game
                    VStack {
                        Spacer()
                        Button {
                            withAnimation {
                                viewModel.isStarted.toggle()
                            }
                        } label: {
                            FooterButton(imageName: "x.circle")
                        }
                    }
                } else {
                    StartView(isStarted: $viewModel.isStarted, showSettings: $showSettings, maxTableValue: $viewModel.maxTableValue, roundsNumber: $viewModel.roundsNumber, rounds: viewModel.rounds, animationCircleAmount: viewModel.animationCircleAmount)
                    .transition(.move(edge: .bottom))
                }
            } else {
                VStack {
                    GameOverView(userScore: viewModel.userScore, roundNumber: viewModel.roundsNumber, startNewGame: viewModel.newGame, animationCircleAmount: $viewModel.animationCircleAmount
                    )
                }
                .transition(.move(edge: .top))
            }
        }
        .onAppear {
            viewModel.animationCircleAmount = 2
        }
    }
}

#Preview {
    MultiplicationTableView()
}
