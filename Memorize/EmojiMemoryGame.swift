//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 25.11.2021.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚀", "🛸", "🚁", "🛰", "🚗", "🚕", "🚙", "🚓", "🚑", "🚒", "🚌", "🚎", "🏎", "🚐", "🛻", "🚚", "🚛", "🚜"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    var cards: [MemoryGame<String>.Card] { model.cards }

    private var model: MemoryGame<String> = createMemoryGame()
}
