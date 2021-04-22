//
//  ArraySplitting.swift
//  SnakeGame
//
//  Created by Yann Christophe Maertens on 19/04/2021.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
