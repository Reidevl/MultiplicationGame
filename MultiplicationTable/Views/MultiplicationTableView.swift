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
            
            if viewModel.isStarted {
                PlayView(viewModel: viewModel)
                
                // Exit game
                VStack {
                    Spacer()
                    Button {
                        withAnimation {
                            // TODO: Reset variables
                            viewModel.isStarted.toggle()
                        }
                    } label: {
                        ConfigButton(imageName: "x.circle")
                    }
                }
            } else {
                VStack {
                    Text("MULTIPLICATION\nGAME X")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 35, weight: .bold))
                        .foregroundStyle(.yellow)
                    
                    Spacer()
                    Button  {
                        withAnimation {
                            viewModel.isStarted.toggle()
                        }
                    } label: {
                        PlayButton(animationAmount: viewModel.animationCircleAmount)
                    }
                    
                    Spacer()
                    Button {
                        withAnimation {
                            showSettings.toggle()
                        }
                    } label: {
                        if !showSettings {
                            ConfigButton(imageName: "gearshape")
                        } else {
                            ConfigButton(imageName: "x.circle")
                        }
                    }
                    
                    if showSettings {
                        SettingsView(rounds: viewModel.rounds, maxTableValue: $viewModel.maxTableValue, roundsNumber: $viewModel.roundsNumber, showSetting: $showSettings)
                    }
                }
                .transition(.move(edge: .bottom))
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
