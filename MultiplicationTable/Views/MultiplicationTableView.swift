//
//  MultiplicationTableView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct MultiplicationTableView: View {
    @StateObject var viewModel: ViewModel = .init()
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .gray, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if !viewModel.isFinished {
                if viewModel.isStarted {
                    PlayView(viewModel: viewModel)
                } else {
                    StartView(viewModel: viewModel)
                }
            } else {
                VStack {
                    GameOverView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    MultiplicationTableView()
}
