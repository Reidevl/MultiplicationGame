//
//  SettingsView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct SettingsView: View {
    var rounds: [Int]
    
    @Binding var maxTableValue: Int
    @Binding var roundsNumber: Int
    @Binding var showSetting: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header:
                    Text("Settings")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                ) {
                    SelectPicker(selection: $maxTableValue, title: "Multiplication table", values: Array(2...12))
                        .font(.title3)
                    
                    SelectPicker(selection: $roundsNumber, title: "Number of rounds", values: rounds)
                        .font(.title3)
                }
            }
        }
    }
}

#Preview {
    let maxTableValue = Binding<Int>( get: {12}, set: {_ in})
    let roundsNumber = Binding<Int>( get: {5}, set: {_ in})
    let showSettings = Binding<Bool>( get: {false}, set: {_ in})
    let rounds = [5, 10, 15]
    
    return Group {
        SettingsView(rounds: rounds, maxTableValue: maxTableValue, roundsNumber: roundsNumber, showSetting: showSettings)
    }
}
