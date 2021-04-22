//
//  SquareItem.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 22/04/2021.
//

import SwiftUI

struct SquareItem: View {
    @ObservedObject var viewModel : GameViewModel
    var index: Int
    var body: some View {
        ZStack {
            viewModel.game.grid[index]
                .background(viewModel.game.snake.snakePosition.contains(index) ? Color.black : viewModel.game.grid[index])
                .frame(width: 20, height: 20)
        }
    }
}

struct SquareItem_Previews: PreviewProvider {
    static var previews: some View {
        SquareItem(viewModel: GameViewModel.init(), index: 0)
    }
}
