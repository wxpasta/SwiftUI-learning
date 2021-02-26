//
//  ContentView.swift
//  Memorize
//
//  Created by 许宝吉 on 2021/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // return 可以省略，只有一个参数也可以省略掉
    
            ForEach(0 ..< 4) { index in
                CardView(isFaceUp: false)
            }
        }
        .padding()
        .foregroundColor(Color.orange) // 属性可以被覆盖
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView: View{
    var isFaceUp: Bool

    var body: some View{
        ZStack { // 甚至()都不需要
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text("X")
            }else{
                //会自动匹配上面的foregroundColor(Color.orange)
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }
        }
    }
}
