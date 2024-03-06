//
//  CellView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct CellView: View {
    var value: Int
    var isAnswerCorrect: Bool?
    
    var body: some View {
        Text("\(value)")
            .font(.title)
            .bold()
            .foregroundStyle(.white)
            .padding(30)
            .frame(width: 300, height: 100)
            .background(isAnswerCorrect == true ? .green : isAnswerCorrect == false  ? .red : .yellow)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    let value: Int = 63
    let isAnswerCorrect: Bool? = nil
    
    return Group {
        CellView(value: value, isAnswerCorrect: isAnswerCorrect)
    }
}
