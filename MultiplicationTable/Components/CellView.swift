//
//  CellView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct CellView: View {
    var value: Int
    var correctAnswer: Bool
    
    var body: some View {
        Text("\(value)")
            .font(.title)
            .bold()
            .foregroundStyle(.white)
            .padding(30)
            .frame(width: 300, height: 100)
            .background(correctAnswer ? .green : .red)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    let value: Int = 63
    let correctAnswer: Bool = true
    
    return Group {
        CellView(value: value, correctAnswer: correctAnswer)
    }
}
