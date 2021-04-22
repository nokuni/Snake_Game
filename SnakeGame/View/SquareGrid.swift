//
//  GridView.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 19/04/2021.
//

import SwiftUI

struct SquareGrid: View {
    
    @ObservedObject var viewModel : GameViewModel
    
    let grid = Array(repeating: GridItem(.fixed(15)), count: 15)
    var squares: Range<Int> {
        0..<viewModel.game.grid.count
    }
    
    var body: some View {
        LazyVGrid(columns: grid, alignment: .center, spacing: 2, pinnedViews: []) {
            ForEach(squares, id: \.self) { index in
                SquareItem(viewModel: viewModel, index: index)
            }
        }
        .frame(width: 358, height: 344)
        .border(Color.black, width: 8)
        .background(Color.olivedrab)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        SquareGrid(viewModel: GameViewModel.init())
    }
}
