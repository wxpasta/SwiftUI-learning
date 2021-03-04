//
//  DownloadView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 6/30/20.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
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
    }
}

struct Download: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var logo: String
}

var downloadVideos = [
    Download(title: "UI Design for iOS 14.zip", subtitle: "10 MB", logo: "Logo UI Design"),
    Download(title: "UI Design for developers.zip", subtitle: "32 MB", logo: "Logo UI Design"),
    Download(title: "SwiftUI Part 1.zip", subtitle: "62 MB", logo: "Logo SwiftUI"),
    Download(title: "SwiftUI Part 2.zip", subtitle: "29 MB", logo: "Logo SwiftUI")
]

var downloadFigma = [
    Download(title: "Angle Free.zip", subtitle: "10 MB", logo: "Logo Figma"),
    Download(title: "Shape Icons Free.zip", subtitle: "32 MB", logo: "Logo Figma"),
    Download(title: "Shape Illustrations Free.zip", subtitle: "62 MB", logo: "Logo Figma"),
    Download(title: "Design+Code 4 UI Kit.zip", subtitle: "29 MB", logo: "Logo Figma")
]

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadsView()
    }
}
