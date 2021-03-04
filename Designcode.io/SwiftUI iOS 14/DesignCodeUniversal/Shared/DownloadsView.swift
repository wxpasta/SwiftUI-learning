//
//  DownloadsView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 6/30/20.
//

import SwiftUI

struct DownloadsView: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content.listStyle(InsetGroupedListStyle())
        #else
        content.listStyle(PlainListStyle())
        #endif
    }
    
    var content: some View {
        List {
            Section(header: Text("Video Files")) {
                ForEach(downloadVideos) { item in
                    HStack {
                        Image(item.logo)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title).font(.subheadline).bold()
                            Text(item.subtitle).font(.footnote)
                        }
                    }
                    .padding(4)
                }
            }
            
            Section(header: Text("Figma Files")) {
                ForEach(downloadFigma) { item in
                    HStack {
                        Image(item.logo)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title).font(.subheadline).bold()
                            Text(item.subtitle).font(.footnote)
                        }
                    }
                    .padding(4)
                }
            }
        }
        .navigationTitle("Downloads")
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
