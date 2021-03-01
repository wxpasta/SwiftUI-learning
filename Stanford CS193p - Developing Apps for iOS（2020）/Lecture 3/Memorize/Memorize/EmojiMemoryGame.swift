//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

// ViewModel

import SwiftUI

// class需要手动init，所以在struct MemoryGame<CardContent>写了init

class EmojiMemoryGame: ObservableObject {
    
    // @Published不是keyword，是property wrapper，这样viewmodel就会即时通知view更新
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemeoryGame()

    static func createMemeoryGame() -> MemoryGame<String>{
        //let emojis: Array<String> = ["A", "B"]，Array<String>可以省略
        let emojis = ["👿", "👻", "🍑"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    
//    var objectWillChange: Self.ObjectWillChangePublisher { get }

    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }

    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
//        objectWillChange.send() // 可以这样写来通知view model发生了改变
        model.choose(card: card)
    }
}
