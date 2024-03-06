//
//  ConfigButton.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 6/3/24.
//

import SwiftUI

struct ConfigButton: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .foregroundStyle(.yellow)
    }
}

#Preview {
    let imageName = "gear"
    return Group {
        ConfigButton(imageName: imageName)        
    }
}
