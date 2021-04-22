//
//  GameModel.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 17/04/2021.
//

import SwiftUI

struct Game {
    var score: Int
    var grid: [Color]
    var snake: Snake
    var foodPosition: Int?
    var gameState: GameState
}

enum GameState {
    case win
    case loose
    case unknown
}
