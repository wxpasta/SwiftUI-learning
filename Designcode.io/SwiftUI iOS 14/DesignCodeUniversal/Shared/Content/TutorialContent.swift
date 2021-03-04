//
//  TutorialContent.swift
//  iOS
//
//  Created by Meng To on 7/8/20.
//

import SwiftUI

struct TutorialContent: View {
    @State var show = false
    
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 240), spacing: 16, alignment: .top)],
            spacing: 0) {
            ForEach(tutorialSections) { section in
                #if os(iOS)
                NavigationLink(destination: TutorialSectionDetail(section: section)) {
                    TutorialSectionRow(section: section)
                        .padding(.all, 8)
                        .frame(maxHeight: 78)
                }
                #else
                TutorialSectionRow(section: section)
                    .padding(.all, 8)
                    .frame(maxHeight: 78)
                    .onTapGesture {
                        show.toggle()
                    }
                    .sheet(isPresented: $show) {
                        TutorialSectionDetail(section: section)
                    }
                #endif
            }
        }
        .padding(16)
    }
}

struct TutorialContent_Previews: PreviewProvider {
    static var previews: some View {
        TutorialContent()
    }
}
