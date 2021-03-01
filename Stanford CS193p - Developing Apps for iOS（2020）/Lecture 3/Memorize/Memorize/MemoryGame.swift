//
//  MemoryGame.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

// Model
import Foundation

// MemoryGame<CardContent>  ：个人理解为泛型，参考 Array<Element>

struct MemoryGame<CardContent> { //宣告CardContent是通用类型
    var cards: Array<Card>

    // 所有修改自己的func都要加上mutating
        mutating func choose(card: Card){
            print("card chosen: \(card)")
            let chosenIndex: Int = self.index(of: card)
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }

        // 根据id找到点击的card的index，不修改所以不需要加mutating
        // of card 分别是：外部名称和内部名称
        func index(of card: Card) -> Int{
            for index in 0..<self.cards.count{
                if self.cards[index].id == card.id{
                    return index
                }
            }
            // 如果找不到这个card其实返回0是不对的，这个之后再解决
            return 0 // TODO: bogus!
        }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()  // 创建一个卡片组
        for pairIndex in 0..<numberOfPairsOfCards {
            // model知道content具体是什么，用函数cardContentFactory获取content
            // content不是变量所以改用常量，swift自动识别type，所以不需要写成let content： CardContent =
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent  // 不在意卡片上到底有什么，string、image都可以
        var id: Int
    }
}
