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
            LinearGradient(colors: [.blue, .gray, .red, .gray, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Round: \(viewModel.roundCount)/\(viewModel.roundsNumber)")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("\(viewModel.question())")
                    .font(.system(size: 75, weight: .bold))
                    .foregroundStyle(.white)

                ForEach (0..<4) { _ in
                    //TODO: Make a button to select answer
                    CellView(value: 1, correctAnswer: true)
                }
                
                Spacer()
                Spacer()
            }
        }  
    }
}

#Preview {
    MultiplicationTableView()
}
