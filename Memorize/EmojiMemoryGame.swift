//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 25.11.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚀", "🛸", "🚁", "🛰", "🚗", "🚕", "🚙", "🚓", "🚑", "🚒", "🚌", "🚎", "🏎", "🚐", "🛻", "🚚", "🚛", "🚜"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }

    var cards: [MemoryGame<String>.Card] { model.cards }

    @Published private var model: MemoryGame<String> = createMemoryGame()

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
