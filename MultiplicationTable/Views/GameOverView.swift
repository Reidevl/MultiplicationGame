//
//  GameOverView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Spacer()
            
            TextView(text: "Game Over!", fontSize: .system(size: 60, weight: .bold), fontColor: .yellow)
            TextView(text: "Final Score", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            TextView(text: "\(viewModel.userScore)/\(viewModel.roundsNumber)", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            
            Spacer()
            Button  {
                withAnimation {
                    viewModel.newGame()
                }
            } label: {
                PlayButton(title: "RESET", animationCircleAmount: viewModel.animationCircleAmount)
            }
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    @StateObject var viewModel: ViewModel = .init()
    
    return Group {
        GameOverView(viewModel: viewModel)
    }
}
