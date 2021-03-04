//
//  TutorialDetail.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct TutorialDetail: View {
    var tutorial: Tutorial = tutorials[1]
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .navigationBarTitleDisplayMode(.inline)
        #else
        content.frame(maxWidth: .infinity, minHeight: 600)
        #endif
    }
    
    var content: some View {
        ScrollView {
            TutorialItem(tutorial: tutorial, cornerRadius: 0)
            TutorialContent()
        }
        .navigationTitle(tutorial.title)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDetail()
    }
}
