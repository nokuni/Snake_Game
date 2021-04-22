//
//  SnakeModel.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 19/04/2021.
//

import SwiftUI

struct Snake {
    var snakePosition : [Int]
    var row : Int
    var column: Int
    var snakeDirection: SnakeDirection
}

enum SnakeDirection {
    case right
    case left
    case up
    case down
}

var defaultSnake : Snake = Snake(snakePosition: [1, 0], row: 0, column: 1, snakeDirection: .right)
