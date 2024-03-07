//
//  StartView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            TextView(text: "MULTIPLICATION\nGAME X", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            
            Spacer()
            Button {
                withAnimation {
                    viewModel.isStarted = true
                    viewModel.newGame()
                }
            } label: {
                PlayButton(title: "START", animationCircleAmount: viewModel.animationCircleAmount)
            }
            
            Spacer()
            Button {
                withAnimation {
                    viewModel.showSettings.toggle()
                }
            } label: {
                if !viewModel.showSettings {
                    FooterButton(imageName: "gearshape")
                } else {
                    FooterButton(imageName: "x.circle")
                }
            }
            
            if viewModel.showSettings {
                SettingsView(rounds: viewModel.rounds, maxTableValue: $viewModel.maxTableValue, roundsNumber: $viewModel.roundsNumber, showSetting: $viewModel.showSettings)
            }
        }
        .onAppear {
            viewModel.animationCircleAmount = 2
        }
    }
}

#Preview {
    @StateObject var viewModel: ViewModel = .init()

    return Group {
        StartView(viewModel: viewModel)
    }
}
