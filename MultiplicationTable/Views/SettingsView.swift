//
//  SettingsView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct SettingsView: View {
    var rounds: [Int]
    
    @Binding var tableValue: Int
    @Binding var roundsNumber: Int
    
    var body: some View {
        Form {
            Section ("SETTINGS") {
                Picker("Multiplication table", selection: $tableValue) {
                    ForEach(2..<13) {
                        Text("\($0)")
                    }
                }
            
                Picker("Number of rounds", selection: $roundsNumber) {
                    ForEach(rounds, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .font(.title2)
        }
    }
}

#Preview {
    let tableValue = Binding<Int>( get: {4}, set: {_ in})
    let roundsNumber = Binding<Int>( get: {5}, set: {_ in})
    let rounds = [5, 10, 15]
    
    return Group {
        SettingsView(rounds: rounds, tableValue: tableValue, roundsNumber: roundsNumber)
    }
}
