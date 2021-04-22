//
//  CustomAlertView.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 19/04/2021.
//

import SwiftUI
import Combine

struct CustomAlertView: View {
    
    @ObservedObject var viewModel : GameViewModel
    
    @Binding var isPresented : Bool
    @Binding var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    var retryButton: some View {
        Button(action: retry) {
            Text("Retry")
                .foregroundColor(.white)
                .font(Font.custom("Minecraft", size: 40))
        }
        .buttonStyle(CustomButtonStyle(scale: 0.9))
    }
    var alertMessage: some View {
        Text(viewModel.game.gameState == .win ? "You Won" : "You Lost")
            .font(Font.custom("Minecraft", size: 50))
            .padding(30)
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
            Color.olivedrab
                .frame(width: 320, height: 200)
                .border(Color.black, width: 8)
            VStack {
                alertMessage
                HStack {
                    retryButton
                }
            }
        }
    }
    func retry() {
        viewModel.restart()
        isPresented = false
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(viewModel: GameViewModel.init(), isPresented: .constant(false), timer: .constant(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()))
    }
}
