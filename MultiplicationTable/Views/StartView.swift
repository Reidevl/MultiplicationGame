//
//  StartView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var showSettings: Bool

    var body: some View {
        VStack {
            TextView(text: "MULTIPLICATION\nGAME X", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            
            Spacer()
            Button {
                withAnimation {
                    viewModel.isStarted.toggle()
                }
            } label: {
                PlayButton(title: "START", animationAmount: viewModel.animationCircleAmount)
            }
            
            Spacer()
            Button {
                withAnimation {
                    showSettings.toggle()
                }
            } label: {
                if !showSettings {
                    FooterButton(imageName: "gearshape")
                } else {
                    FooterButton(imageName: "x.circle")
                }
            }
            
            if showSettings {
                SettingsView(rounds: viewModel.rounds, maxTableValue: $viewModel.maxTableValue, roundsNumber: $viewModel.roundsNumber, showSetting: $showSettings)
            }
        }
    }
}

#Preview {
    @StateObject var viewModel: ViewModel = .init()
    let showSettings =  Binding<Bool>(get: { false }, set: { _ in})

    return Group {
        StartView(viewModel: viewModel, showSettings: showSettings)
    }
}
