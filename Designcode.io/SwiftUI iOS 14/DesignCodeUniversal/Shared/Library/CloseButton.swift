//
//  CloseButton.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/8/20.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.black.opacity(0.6))
            .mask(Circle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
