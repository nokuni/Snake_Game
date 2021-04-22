//
//  GameViewModel.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 16/04/2021.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var game = Game(score: 0, grid: Array(repeating: .clear, count: 225), snake: defaultSnake, foodPosition: nil, gameState: .unknown)
    
    func moveRight() {
        let chunkedGrid = Array(0..<game.grid.count).chunked(into: 15)
        
        guard let lastRowPosition = chunkedGrid[game.snake.row].last else { return }
        
        if game.snake.snakePosition[0] < lastRowPosition {
            moveCoordinate(currentIndex: 1, nextIndex: 2)
            game.snake.snakePosition[0] += 1
            game.snake.column += 1
        } else {
            game.gameState = .loose
        }
    }
    func moveLeft() {
        let chunkedGrid = Array(0..<game.grid.count).chunked(into: 15)
        
        guard let firstRowPosition = chunkedGrid[game.snake.row].first else { return }
        
        if game.snake.snakePosition[0] > firstRowPosition {
            moveCoordinate(currentIndex: 1, nextIndex: 2)
            game.snake.snakePosition[0] -= 1
            game.snake.column -= 1
        } else {
            game.gameState = .loose
        }
    }
    func moveDown() {
        let columns = Array(0..<game.grid.count).filter { $0 % 15 == game.snake.column }
        
        guard let lastColumnPosition = columns.last else { return }
        
        if game.snake.snakePosition[0] < lastColumnPosition {
            
            moveCoordinate(currentIndex: 1, nextIndex: 2)
            game.snake.snakePosition[0] += 15
            game.snake.row += 1
        } else {
            game.gameState = .loose
        }
    }
    func moveUp() {
        let columns = Array(0..<game.grid.count).filter { $0 % 15 == game.snake.column }
        
        guard let firstColumnPosition = columns.first else { return }
        
        if game.snake.snakePosition[0] > firstColumnPosition {
            moveCoordinate(currentIndex: 1, nextIndex: 2)
            game.snake.snakePosition[0] -= 15
            game.snake.row -= 1
        } else {
            game.gameState = .loose
        }
    }
    
    func moveCoordinate(currentIndex: Int, nextIndex: Int) {
        var current = currentIndex
        var next = nextIndex
        for _ in 0..<game.snake.snakePosition.count - 1 {
            game.snake.snakePosition[game.snake.snakePosition.endIndex - current] = game.snake.snakePosition[game.snake.snakePosition.endIndex - next]
            current += 1
            next += 1
        }
    }
    
    func move(direction: SnakeDirection) {
        switch direction {
        case .right:
            return moveRight()
        case .left:
            return moveLeft()
        case .down:
            return moveDown()
        case .up:
            return moveUp()
        }
    }
    
    func createFood() {
        game.foodPosition = nil
        
        game.foodPosition = Int.random(in: 0..<game.grid.count)
        if let random = game.foodPosition {
            game.grid[random] = .black
        }
    }
    func eat() {
        if let random = game.foodPosition {
            if game.snake.snakePosition[0] == random {
                game.grid[random] = .clear
                game.snake.snakePosition.append(random)
                game.score += 1
                createFood()
            }
        }
    }
    
    func restart() {
        game = Game(score: 0, grid: Array(repeating: .clear, count: 225), snake: defaultSnake, foodPosition: nil, gameState: .unknown)
        createFood()
    }
    
    init() {
        restart()
    }
}
