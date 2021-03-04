//
//  LivestreamItem.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/7/20.
//

import SwiftUI

struct LivestreamItem: View {
    var livestream: Livestream = livestreams[0]
    #if os(iOS)
    var cornerRadius: CGFloat = 22
    #else
    var cornerRadius: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(livestream.logo)
                    .renderingMode(.original)
                    .padding(.all, 3)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
                    .padding(.all, 1)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 12) {
                Text(livestream.title)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                Text(livestream.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
            Spacer()
            Text(livestream.text)
                .font(Font.subheadline.smallCaps())
                .foregroundColor(.black)
        }
        .padding(.top, 20)
        .padding(.all, 20)
        .background(
            Image(livestream.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
    }
}

struct LivestreamItem_Previews: PreviewProvider {
    static var previews: some View {
        LivestreamItem()
    }
}
