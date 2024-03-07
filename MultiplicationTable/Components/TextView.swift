//
//  TextView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 7/3/24.
//

import SwiftUI

struct TextView: View {
    var text: String
    var fontSize: Font
    var fontColor: Color
    
    var body: some View {
        Text("\(text)")
            .multilineTextAlignment(.center)
            .font(fontSize)
            .foregroundStyle(fontColor)
    }
}

#Preview {
    let text: String = "Test"
    let fontSize: Font = .title
    let fontColor: Color = .yellow
    
    return Group {
        TextView(text: text, fontSize: fontSize, fontColor: fontColor)
    }
}
