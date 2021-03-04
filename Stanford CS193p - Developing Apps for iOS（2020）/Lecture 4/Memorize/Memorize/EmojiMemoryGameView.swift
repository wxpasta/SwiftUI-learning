//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // 加上@ObervedObject后，每次观察对象更新了就会重新绘制UI
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        // return 可以省略，只有一个参数也可以省略掉
        HStack { // HStack:水平排列 甚至()都不需要
            Grid(viewModel.cards){ card in    //Array中获取，所以不需要range了
                //onTapGesture(perform: () -> Void)没有参数也没有返回值所以可以省略掉
                //onTapGesture(perform: {viewModel.choose(card: card)})只有一个argument，省略
                CardView(card: card).onTapGesture{
                    self.viewModel.choose(card: card) //要加self否则报错
                }
                .padding(5)
            }
        }
        .padding()
        .foregroundColor(Color.orange) // 属性可以被覆盖
        .font(Font.largeTitle)
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card

    var body: some View{
        GeometryReader{ geometry in
                    self.body(for: geometry.size)
                }
//        ZStack { // 甚至()都不需要
//            if card.isFaceUp{
//                RoundedRectangle(cornerRadius: 10.0)
//                    .fill(Color.white)
//                RoundedRectangle(cornerRadius: 10.0)
//                    .stroke(lineWidth: 3)
//                Text(card.content)
//            }else{
//                //会自动匹配上面的foregroundColor(Color.orange)
//                RoundedRectangle(cornerRadius: 10.0)
//                    .fill()
//            }
//        }
    }
    func body(for size: CGSize) -> some View{
            //现在不是嵌入geometry的所以不需要self.了
            ZStack{
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }else{
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            // 因为没有将整个gemetry传给body只传了size所以这里不需要geometry.
            .font(Font.system(size: customFontSize(for: size)))
        }

        //MARK: - Drawing Constants
        let cornerRadius: CGFloat = 10.0
        let edgeLineWidth: CGFloat = 3
        func customFontSize(for size: CGSize) -> CGFloat{
            min(size.width, size.height) * 0.75
        }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}



