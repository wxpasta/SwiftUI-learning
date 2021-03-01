//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

// ViewModel

import SwiftUI
import Foundation

class EmojiMemoryGame{
    //class需要手动init，所以在struct MemoryGame<CardContent>写了init
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemeoryGame()

    static func createMemeoryGame() -> MemoryGame<String>{
        //let emojis: Array<String> = ["A", "B"]，Array<String>可以省略
        let emojis = ["👿", "👻", "🍑"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }

    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
