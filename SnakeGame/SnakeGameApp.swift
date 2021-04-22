//
//  SnakeGameApp.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 16/04/2021.
//

import SwiftUI

@main
struct SnakeGameApp: App {
    var body: some Scene {
        WindowGroup {
            SnakeGameView().environmentObject(GameViewModel())
        }
    }
}
