//
//  ToggleButton.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/9/20.
//

import SwiftUI

struct ToggleButton: View {
    var body: some View {
        Image(systemName: "switch.2")
            .font(.system(size: 15, weight: .regular))
            .foregroundColor(.white)
            .padding(.all, 8)
            .background(Color.black.opacity(0.6))
            .mask(Circle())
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        ToggleButton()
    }
}
