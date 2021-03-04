//
//  TutorialRow.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct TutorialRow: View {
    var tutorial: Tutorial = tutorials[0]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(tutorial.image)
                .renderingMode(.original)
                .frame(width: 48, height: 48)
                .background(Circle().fill(Color("Background 1")))
            VStack(alignment: .leading, spacing: 4) {
                Text(tutorial.title)
                    .font(.subheadline).bold()
                    .foregroundColor(Color.primary)
                Text(tutorial.subtitle)
                    .font(.footnote).foregroundColor(.secondary)
                    .padding(.bottom, 2)
                ProgressView(progress: 50, color: Color.white, background: Color("Background 4"))
                    .frame(maxWidth: 200)
                Spacer()
            }
            Spacer()
        }
    }
}

struct SectionItem_Previews: PreviewProvider {
    static var previews: some View {
        TutorialRow()
    }
}
