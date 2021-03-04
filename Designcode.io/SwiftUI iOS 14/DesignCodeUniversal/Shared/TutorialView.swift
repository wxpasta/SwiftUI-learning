//
//  TutorialView.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/3/20.
//

import SwiftUI

struct TutorialModal: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                TutorialItem(tutorial: tutorials[0], cornerRadius: 0)
                TutorialContent()
            }
            
            CloseButton()
                .padding(20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialModal()
    }
}
