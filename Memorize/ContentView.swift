//
//  ContentView.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 11.10.2021.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚀", "🛸", "🚁", "🛰", "🚗", "🚕", "🚙", "🚓", "🚑", "🚒", "🚌", "🚎", "🏎", "🚐", "🛻", "🚚", "🚛", "🚜"]
    @State var cardCount = 6
    var body: some View {
        VStack  {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<cardCount], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding()
    }
    
    var removeButton: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
        } label: { Image(systemName: "minus.circle") }
    }
    
    var addButton: some View {
        Button {
            if cardCount < emojis.count {
                cardCount += 1
            }
        } label: { Image(systemName: "plus.circle") }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
