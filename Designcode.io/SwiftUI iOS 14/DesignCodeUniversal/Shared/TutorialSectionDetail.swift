//
//  TutorialSectionDetail.swift
//  DesignCodeUniversal
//
//  Created by Meng To on 7/5/20.
//

import SwiftUI

struct TutorialSectionDetail: View {
    var section: TutorialSection = tutorialSections[0]
    @Environment(\.presentationMode) var presentationMode
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .navigationTitle(section.title)
            .navigationBarTitleDisplayMode(.inline)
        #else
        ZStack(alignment: .topTrailing) {
            content
                .frame(maxWidth: 800, maxHeight: 600)
            CloseButton()
                .padding(20)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        #endif
    }
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(section.logo)
                        .renderingMode(.original)
                        .padding(.all, 3)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Circle())
                        .padding(.all, 1)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(section.title)
                        .font(.title3).bold()
                        .foregroundColor(.white)
                    Text(section.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
            }
            .padding(.all, 20)
            .background(
                Image("Livestream 2")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            
            CourseSectionContent()
        }
    }
}

struct TutorialSectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSectionDetail()
    }
}
