//
//  LivestreamContent.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/9/20.
//

import SwiftUI

struct LivestreamContent: View {
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 240), spacing: 16, alignment: .top)],
            spacing: 0) {
            ForEach(livestreamSections) { section in
                LivestreamRow(section: section)
                    .padding(.all, 8)
                    .frame(maxHeight: 78)
            }
        }
        .padding(16)
    }
}

struct LivestreamContent_Previews: PreviewProvider {
    static var previews: some View {
        LivestreamContent()
    }
}
