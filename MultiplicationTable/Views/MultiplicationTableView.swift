//
//  MultiplicationTableView.swift
//  MultiplicationTable
//
//  Created by Reiwil Lugo on 5/3/24.
//

import SwiftUI

struct MultiplicationTableView: View {
    @StateObject var viewModel: ViewModel = .init()
    @State var showSettings = false
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .gray, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if !viewModel.isFinished {
                if viewModel.isStarted {
                    PlayView(viewModel: viewModel)
                } else {
                    StartView(viewModel: viewModel, showSettings: $showSettings)
                    .transition(.move(edge: .bottom))
                }
            } else {
                VStack {
                    GameOverView(viewModel: viewModel)
                }
                .transition(.move(edge: .top))
            }
        }
        .onAppear {
            viewModel.animationCircleAmount = 2
        }
    }
}

#Preview {
    MultiplicationTableView()
}
