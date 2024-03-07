//
//  StartView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct StartView: View {
    @Binding var isStarted: Bool
    @Binding var showSettings: Bool
    @Binding var maxTableValue: Int
    @Binding var roundsNumber: Int
    
    var rounds: [Int]
    var animationCircleAmount: Double
    
    var body: some View {
        VStack {
            TextView(text: "MULTIPLICATION\nGAME X", fontSize: .system(size: 35, weight: .bold), fontColor: .yellow)
            
            Spacer()
            Button  {
                withAnimation {
                    isStarted.toggle()
                }
            } label: {
                PlayButton(title: "START", animationAmount: animationCircleAmount)
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
                SettingsView(rounds: rounds, maxTableValue: $maxTableValue, roundsNumber: $roundsNumber, showSetting: $showSettings)
            }
        }
    }
}

#Preview {
    let isStarted =  Binding<Bool>(get: { false }, set: { _ in})
    let showSettings =  Binding<Bool>(get: { false }, set: { _ in})
    let maxTableValue =  Binding<Int>(get: { 5 }, set: { _ in})
    let roundsNumber =  Binding<Int>(get: { 10 }, set: { _ in})

    var rounds: [Int] = [5, 10, 15]
    var animationCircleAmount: Double = 2.0
    
    return Group {
        StartView(isStarted: isStarted, showSettings: showSettings, maxTableValue: maxTableValue, roundsNumber: roundsNumber, rounds: rounds, animationCircleAmount: animationCircleAmount)
    }
}
