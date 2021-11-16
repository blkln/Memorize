//
//  ContentView.swift
//  Memorize
//
//  Created by Serhii Kovtunenko on 11.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = Themes.vehicles.emojis

    var body: some View {
        VStack  {
            header
                .font(.largeTitle)
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesButton
                Spacer()
                sportsButton
                Spacer()
                fruitsButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding()
    }
    
    var header: some View {
        Text( "Memorize!" )
    }
    
    var vehiclesButton: some View {
        let vehicles = Themes.vehicles
        return ThemeButton(theme: vehicles) {
            emojis = vehicles.emojis.shuffled()
        }
    }
    
    var sportsButton: some View {
        let sports = Themes.sports
        return ThemeButton(theme: sports) {
            emojis = sports.emojis.shuffled()
        }
    }
    
    var fruitsButton: some View {
        let fruits = Themes.fruits
        return ThemeButton(theme: fruits) {
            emojis = fruits.emojis.shuffled()
        }
    }
}

struct Theme {
    let title: String
    let name: String
    let emojis: [String]
}

struct ThemeButton: View {
    let theme: Theme
    var action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: theme.title)
                .font(.largeTitle)
            Text(theme.name)
                .font(.system(size: 14))
        }
        .foregroundColor(.blue)
        .onTapGesture(perform: action)
    }
}

enum Themes {
    static let vehicles = Theme(
        title: "car.circle",
        name: "Vehicles",
        emojis: [
            "🚗", "🚕", "🚙", "🚓", "🚑", "🚒", "🚌",
            "🚎", "🏎", "🚐", "🛻", "🚚", "🚛", "🚜"
        ]
    )
    
    static let sports = Theme(
        title: "heart.circle",
        name: "Sports",
        emojis: [
            "⚽️", "🏀", "🏈", "⚾️", "🥎",
            "🎾", "🏐", "🏉", "🎱", "🏓"
        ]
    )
    
    static let fruits = Theme(
        title: "fork.knife.circle",
        name: "Fruits",
        emojis: [
            "🍏", "🍎", "🍐", "🍊", "🍋", "🍌",
            "🍉", "🍇", "🍓", "🫐", "🍈", "🍒"
        ]
    )
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
