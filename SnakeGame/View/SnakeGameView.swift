//
//  ContentView.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 16/04/2021.
//

import SwiftUI

struct SnakeGameView: View {
    @StateObject var viewModel = GameViewModel()
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isPresented = false
    @State private var isCountedDown = true
    @State private var countdown = 3
    
    private var score: some View {
        Text("Score: \(viewModel.game.score)")
            .font(Font.custom("Minecraft", size: 40))
    }
    
    var body: some View {
        ZStack {
            Color.olive.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                score
                
                Spacer()
                
                GridView(viewModel: viewModel)
                
                Spacer()
                
                JoystickView(viewModel: viewModel)
                    .onReceive(timer) { _ in
                        if countdown < 1 {
                            start()
                            moveSnake()
                            gameOver()
                        }
                    }
                
                Spacer()
            }
            if isPresented {
                CustomAlertView(viewModel: viewModel, isPresented: $isPresented, timer: $timer)
            }
            if isCountedDown {
                StartAnimationView(number: $countdown, isStarted: $isCountedDown)
            }
        }
        .onAppear {
            isCountedDown = true
        }
    }
    func moveSnake() {
        viewModel.move(direction: viewModel.game.snake.snakeDirection)
        viewModel.eat()
    }
    func gameOver() {
        if viewModel.game.gameState == .loose || viewModel.game.gameState == .win {
            isPresented = true
            timer.upstream.connect().cancel()
        }
    }
    func start() {
        isCountedDown = false
    }
}

struct SnakeGameView_Previews: PreviewProvider {
    static var previews: some View {
        SnakeGameView().environmentObject(GameViewModel())
    }
}

// how to loose
// reset the food correctly
