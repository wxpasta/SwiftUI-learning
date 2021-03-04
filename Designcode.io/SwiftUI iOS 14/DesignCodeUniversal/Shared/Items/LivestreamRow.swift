//
//  LivestreamRow.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/9/20.
//

import SwiftUI

struct LivestreamRow: View {
    var section: LivestreamSection = livestreamSections[0]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(section.logo)
                .renderingMode(.original)
                .frame(width: 48, height: 48)
                .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(section.color))
            VStack(alignment: .leading, spacing: 4) {
                Text(section.title)
                    .font(.subheadline).bold()
                    .foregroundColor(Color.primary)
                Text(section.subtitle)
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

struct LivestreamRow_Previews: PreviewProvider {
    static var previews: some View {
        LivestreamRow()
    }
}
