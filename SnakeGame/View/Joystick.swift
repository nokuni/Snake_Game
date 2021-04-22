//
//  JoystickView.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 16/04/2021.
//

import SwiftUI

struct Joystick: View {
    
    @ObservedObject var viewModel : GameViewModel
    
    var buttonUp: some View {
        Button(action: moveUp) {
            Image(systemName: "arrowtriangle.up.fill")
                .padModifier(snake: viewModel.game.snake, direction: .up)
        }
        .padding(5)
    }
    var buttonLeft: some View {
        Button(action: moveLeft) {
            Image(systemName: "arrowtriangle.backward.fill")
                .padModifier(snake: viewModel.game.snake, direction: .left)
        }
        .padding(5)
    }
    var buttonRight: some View {
        Button(action: moveRight) {
            Image(systemName: "arrowtriangle.right.fill")
                .padModifier(snake: viewModel.game.snake, direction: .right)
        }
        .padding(5)
    }
    var buttonDown: some View {
        Button(action: moveDown) {
            Image(systemName: "arrowtriangle.down.fill")
                .padModifier(snake: viewModel.game.snake, direction: .down)
        }
        .padding(5)
    }
    var padCircle: some View {
        Circle()
            .frame(width: 60, height: 60)
            .padding(20)
            .shadow(color: .gray, radius: 0, x: 3, y: 3)
    }
    
    var body: some View {
        VStack {
            
            buttonUp
            
            HStack {
                
                buttonLeft
                
                padCircle
                
                buttonRight
            }
            
            buttonDown
        }
        .buttonStyle(CustomButtonStyle(scale: 0.95))
    }
    func moveUp() {
        if viewModel.game.snake.snakeDirection != .down {
            viewModel.game.snake.snakeDirection = .up
        }
    }
    func moveDown() {
        if viewModel.game.snake.snakeDirection != .up {
            viewModel.game.snake.snakeDirection = .down
        }
    }
    func moveRight() {
        if viewModel.game.snake.snakeDirection != .left {
            viewModel.game.snake.snakeDirection = .right
        }
    }
    func moveLeft() {
        if viewModel.game.snake.snakeDirection != .right {
            viewModel.game.snake.snakeDirection = .left
        }
    }
}

struct JoystickView_Previews: PreviewProvider {
    static var previews: some View {
        Joystick(viewModel: GameViewModel.init())
    }
}

struct CustomButtonStyle: ButtonStyle {
    var scale: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
    }
}

struct PadModifier: ViewModifier {
    var snake: Snake
    var direction: SnakeDirection
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(snake.snakeDirection == direction ? Color.black : Color.olivedrab)
            .font(.system(size: 65))
            .shadow(color: snake.snakeDirection == direction ? .gray : .black, radius: 0, x: 4, y: 4)
    }
}

extension View {
    func padModifier(snake: Snake, direction: SnakeDirection) -> some View {
        self.modifier(PadModifier(snake: snake, direction: direction))
    }
}
