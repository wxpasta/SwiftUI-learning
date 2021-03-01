//
//  ContentView.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame //就是EmojiMemoryGame这个class
    var body: some View {
        // return 可以省略，只有一个参数也可以省略掉
        HStack { // HStack:水平排列 甚至()都不需要
            ForEach(viewModel.cards){ card in    //Array中获取，所以不需要range了
                            //onTapGesture(perform: () -> Void)没有参数也没有返回值所以可以省略掉
                            //onTapGesture(perform: {viewModel.choose(card: card)})只有一个argument，省略
                            CardView(card: card).onTapGesture{
                                self.viewModel.choose(card: card) //要加self否则报错
                            }
                        }
        }
        .padding()
        .foregroundColor(Color.orange) // 属性可以被覆盖
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}


struct CardView: View{
    var card: MemoryGame<String>.Card

    var body: some View{
        ZStack { // 甚至()都不需要
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            }else{
                //会自动匹配上面的foregroundColor(Color.orange)
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}
