//
//  View
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Armind Chahal on 6/15/20.
//  Copyright © 2020 Armind Chahal. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var themeColor: Color {
        return viewModel.theme.accentColor
    }
    
    var body: some View {
        VStack {
            Text(viewModel.theme.name)
                .padding()
                .font(Font.largeTitle)
                .foregroundColor(themeColor)

            Text("Score: \(viewModel.score)")
                .font(Font.title)
                .foregroundColor(themeColor)
            
            
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(themeColor)
            
            
            Button(action: {
                self.viewModel.resetGame()
            }) {
                Text("New Game").foregroundColor(Color.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10.0))
                    .font(Font.title)
            }

        }
    }
    
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader() { geometry in
            self.body(for: geometry.size)
        }
        
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }

    
    //MARK: - Drawing Constants

    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
