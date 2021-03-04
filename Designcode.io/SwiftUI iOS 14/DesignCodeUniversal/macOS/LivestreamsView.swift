//
//  LivestreamsView.swift
//  macOS
//
//  Created by Meng To on 7/8/20.
//

import SwiftUI

struct LivestreamsView: View {
    var body: some View {
        ScrollView {
            content
        }
        .frame(minWidth: 500, idealWidth: 700, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
        .navigationTitle("Livestreams")
    }
    var content: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: 16)], spacing: 16) {
            ForEach(livestreams) { livestream in
                LivestreamItem(livestream: livestream)
                    .frame(height: 220)
            }
        }
        .padding()
    }
}

struct LivestreamsView_Previews: PreviewProvider {
    static var previews: some View {
        LivestreamsView()
    }
}
