//
//  ProgressView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct ProgressView: View {
    let randomCGFloat = CGFloat.random(in: 1...100)
    var progress: CGFloat = 50.0
    var color: Color = Color("Primary")
    var background: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3))
    var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(maxWidth: randomCGFloat, maxHeight: 4)
            .foregroundColor(color)
            .mask(RoundedRectangle(cornerRadius: 3, style: .continuous))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.all, 1)
            .background(background)
            .mask(RoundedRectangle(cornerRadius: 4, style: .continuous))
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
