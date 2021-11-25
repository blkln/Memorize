//
//  MemoryGame.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 25.11.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    func choose(_ card: Card) {

    }

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(contents: content))
            cards.append(Card(contents: content))
        }
    }

    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var contents: CardContent
    }
}
