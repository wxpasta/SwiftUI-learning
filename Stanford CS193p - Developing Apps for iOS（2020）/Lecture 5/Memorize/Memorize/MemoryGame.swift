//
//  MemoryGame.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

// Model
import Foundation

// MemoryGame<CardContent>  ：个人理解为泛型，参考 Array<Element>

// 加上content是Equatable的约束，否则下面func choose里"=="无法使用
struct MemoryGame<CardContent> where CardContent: Equatable { // CardContent 相当于 Element
    
    private(set) var cards: Array<Card>
    
    //使用computed var实现
    private var indexOfTheOneAndOnlyFaceUpCard: Int? { // 可以在这里初始化为nil但是不这么做
        get{
            // 简化一
            // Array<Int>()和[Ine]()都是表示Int类型的数组
//            var faceUpCardIndices = [Int]() // 存所有朝上的卡片
//            var faceUpCardIndices = cards.indices.filter { (index) -> Bool in
//                cards[index].isFaceUp
//            }
//            for index in cards.indices{
//                if cards[index].isFaceUp{
//                    faceUpCardIndices.append(index)
//
//                }
//            }
            // 简化二
//            let faceUpCardIndices = cards.indices.filter { index in
//                cards[index].isFaceUp
//            }
//
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            }else{
//                return nil
//            }
            return cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set{
            for index in cards.indices{
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                }else{
//                    cards[index].isFaceUp = false
//                }
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    //这里代码要随着get和set的实现改变
    mutating func choose(_ card: Card){
        //if let后面不可以使用&&连接判断条件，使用逗号连接判断条件，当第一个条件满足再挨个往后判断
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // 两张卡片匹配
            if let potentialMtachIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMtachIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMtachIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true // choose的那张朝上
            }else{ //除了choose的那张其他的都要朝下
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
//            indexOfTheOneAndOnlyFaceUpCard = true
        }
    }

//    // 所有修改自己的func都要加上mutating
//    mutating func choose(card: Card){
//        print("card chosen: \(card)")
//        let chosenIndex: Int = cards.firstIndex(matching: card)! // self.index(of: card)
//        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
//    }

        // 根据id找到点击的card的index，不修改所以不需要加mutating
        // of card 分别是：外部名称和内部名称
//        func index(of card: Card) -> Int{
//            for index in 0..<self.cards.count{
//                if self.cards[index].id == card.id{
//                    return index
//                }
//            }
            // 如果找不到这个card其实返回0是不对的，这个之后再解决
//            return 0 // TODO: bogus!
//        }

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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent  // 不在意卡片上到底有什么，string、image都可以
        var id: Int
    }
}
