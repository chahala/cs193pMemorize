//
//  ViewModel
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Armind Chahal on 6/20/20.
//  Copyright © 2020 Armind Chahal. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // only EmojiMemoryGame can modify and see the model
    @Published private var model: MemoryGame<String>
    
    var theme: Theme
    
    var score: Int {
        model.score
    }
    
    init() {
        self.theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.emojis
        return MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func resetGame() {
        self.theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
        
    
    //MARK: - Public access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
