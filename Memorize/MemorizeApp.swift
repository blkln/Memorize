//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 11.10.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
