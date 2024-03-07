//
//  PlayButton.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 6/3/24.
//

import SwiftUI

struct PlayButton: View {
    var title: String
    var animationAmount: Double
    
    var body: some View {
        TextView(text: title, fontSize: .title, fontColor: .blue)
            .bold()
            .padding(30)
            .frame(width: 300, height: 100)
            .background(.yellow)
            .clipShape(.capsule)
            .shadow(color: .blue, radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.yellow)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
    }
}

#Preview {
    let title: String = "Test"
    let animationAmount: Double = 2.0
    
    return Group {
        PlayButton(title: title, animationAmount: animationAmount)
    }
}
