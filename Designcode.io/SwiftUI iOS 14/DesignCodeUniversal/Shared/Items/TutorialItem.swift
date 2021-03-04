//
//  TutorialItem.swift
//  iOS
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct TutorialItem: View {
    var tutorial: Tutorial = tutorials[1]
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(tutorial.image)
                    .renderingMode(.original)
                    .padding(.all, 5)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
                    .padding(.all, 1)
                Spacer()
            }
            Text(tutorial.title)
                .bold()
                .foregroundColor(.white)
            Text(tutorial.subtitle)
                .font(.footnote)
                .foregroundColor(Color.white.opacity(0.8))
            Spacer()
            ProgressView(progress: tutorial.progress)
        }
        .padding(16)
        .background(tutorial.color)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: tutorial.color.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct TutorialItem_Previews: PreviewProvider {
    static var previews: some View {
        TutorialItem()
    }
}
