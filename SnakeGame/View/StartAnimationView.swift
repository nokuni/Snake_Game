//
//  StartAnimationView.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 19/04/2021.
//

import SwiftUI

struct StartAnimationView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var number : Int
    @Binding var isStarted: Bool
    
    var countdown: some View {
        Text("\(number)")
            .foregroundColor(.white)
            .opacity(number == 0 ? 0 : 1)
            .font(Font.custom("Minecraft", size: 150))
            .onReceive(timer) { _ in
                if number > 0 {
                    number -= 1
                }
            }
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
            countdown
        }
    }
}

struct StartAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        StartAnimationView(number: .constant(3), isStarted: .constant(false))
    }
}
