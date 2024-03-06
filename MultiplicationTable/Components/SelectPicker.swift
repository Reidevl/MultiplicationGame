//
//  SelectPicker.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 6/3/24.
//

import SwiftUI

struct SelectPicker: View {
    @Binding var selection: Int {
        didSet {
            print("select picker \(selection)")
        }
    }
    
    var title: String
    var values: [Int]
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(values, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

#Preview {
    let selection = Binding<Int>(get: { 1 }, set: { _ in })
    let title: String = "Test"
    let values: [Int] = Array(0...3)
    
    return Group {
        SelectPicker(selection: selection, title: title, values: values)
    }
}
